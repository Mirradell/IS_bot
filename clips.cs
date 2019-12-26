using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CLIPSNET;
using System.IO;

namespace tgBot
{
    public class Clips
    {
        private CLIPSNET.Environment clips = new CLIPSNET.Environment();
        List<string> ganres;
        List<string> years;
        List<string> songs;
        List<string> singers;
        List<string> albums;
        List<List<string>> rules; // rules = facts, следствие

        public string currentGanr = "";
        public string currentYear = "";
        public string currentSinger = "";
        public string currentAlbum = "";
        public string res;

        public Clips()
        {
            ganres = new List<string>();
            years = new List<string>();
            songs = new List<string>();
            singers = new List<string>();
            albums = new List<string>();
            rules = new List<List<string>>();
            Read("../../DB_Music.txt");
        }

        void Read(string fname)
        {
            FileStream file1 = new FileStream(fname, FileMode.Open);
            StreamReader reader = new StreamReader(file1, Encoding.Default);
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();
                if (line == "%%")
                    break;
                else
                    ReadRules(line);
            }
            file1.Close();
        }

        void ReadRules(string line)
        {
            int i = 0;
            string temp = "";
            List<string> conditions = new List<string>();
            while (i < line.Count() - 1 && line[i] != '>')
            {
                if (line[i] == '\t' && temp != "" || line[i] == '=' && temp != "" || line[i] == ' ' && line[i + 1] == ' ') //записать правило
                {
                    while (line[i] == ' ')
                        i++;

                    i--;
                    char what1 = temp[0];
                    temp = temp.Substring(2).Trim();
                    switch (what1)
                    {
                        case 'Ж': //жанр
                            if (!ganres.Contains(temp))
                            {
                                ganres.Add(temp);
                            }
                            break;
                        case 'И': // исполнитель
                            if (!singers.Contains(temp))
                            {
                                singers.Add(temp);
                            }
                            break;
                        case 'П': //песни
                            if (!songs.Contains(temp))
                                songs.Add(temp);
                            break;
                        case 'Г': //года
                            if (!years.Contains(temp))
                            {
                                years.Add(temp);
                            }
                            break;
                        case 'А': // альбом
                            if (!albums.Contains(temp))
                            {
                                albums.Add(temp);
                            }
                            break;
                    }
                    conditions.Add(temp);
                    temp = "";
                }
                else
                    temp += line[i];
                i++;
            }

            i++;
            temp = line.Substring(i);
            char what = temp[0];
            temp = temp.Substring(2).Trim();
            switch (what)
            {
                case 'Ж': //жанр
                    if (!ganres.Contains(temp))
                    {
                        ganres.Add(temp);
                    }
                    break;
                case 'И': // исполнитель
                    if (!singers.Contains(temp))
                    {
                        singers.Add(temp);
                    }
                    break;
                case 'П': //песни
                    if (!songs.Contains(temp))
                        songs.Add(temp);
                    break;
                case 'Г': //года
                    if (!years.Contains(temp))
                    {
                        years.Add(temp);
                    }
                    break;
                case 'А': // альбом
                    if (!albums.Contains(temp))
                    {
                        albums.Add(temp);
                    }
                    break;
            }
            conditions.Add(temp);
            rules.Add(conditions);
        }
        
        /// <summary>
        /// Добавить заданные факты в CLIPS
        /// </summary>
        private void addStartFacts()
        {
            string factName, factType = "name", factValue;
            if (currentYear != "")
            {
                factName = currentYear;
                factValue = $"year ({factType} {factName})";
                clips.Eval($"(assert ({factValue}) )");
            }
            if (currentSinger != "" && currentAlbum == "")
            {
                factName = currentSinger;
                factValue = $"singer ({factType} {factName})";
                clips.Eval($"(assert ({factValue}) )");
            }
            if (currentAlbum != "")
            {
                factName = currentAlbum;
                factValue = $"album ({factType} {factName})";
                clips.Eval($"(assert ({factValue}) )");
                return;
            }
            if (currentGanr != "" && currentSinger == "")
            {
                factName = currentGanr;
                factValue = $"ganre ({factType} {factName})";
                clips.Eval($"(assert ({factValue}) )");
            }
        }

        public void start()
        {
            clips.Clear();
            clips.LoadFromString(File.ReadAllText("../../clips_DB.clp", Encoding.UTF8));
            addStartFacts();
            clips.Run();

            var facts = clips.GetFactList();
            var fact = facts.FindAll(f => f.RelationName == "sendmessagehalt");
            if (fact.Count != 0)
            {
                foreach (var f in fact)
                {
                    var factValue = f.GetSlotValues()[0].Contents.Replace("\"", "");
                    factValue = factValue.Substring(1, factValue.Length - 2);
                    handleMessage(factValue);
                }
            }
            else if (currentYear != "" && (currentSinger != "" || currentGanr != "" || currentAlbum != ""))
            {
                res = "Вывод затруднен или невозможен. Измените данные или введите новые!";
            }
            else if (currentSinger == "")
                res = "Выберите исполнителя песни из возможных";
            else if (currentYear == "")
                res = "Выберите год песни из возможных";
            else if (currentAlbum == "")
                res = "Выберите альбом песни из возможных";
            else if (currentGanr == "")
                res = "Выберите жанр песни из возможных";


            clips.Eval("(assert (clearmessage))");
        }

        void clean()
        {
            currentAlbum = "";
            currentGanr = "";
            currentSinger = "";
            currentYear = "";
            res = "";
        }
        /// <summary>
        /// Обработать полученное сообщение от CLIPS
        /// </summary>
        private void handleMessage(string message)
        {
            if (message.StartsWith("[Service]"))
            {
                res += message.Replace("[Service]", "").Replace("_", " ") + ", " + System.Environment.NewLine;
            }
            else if (message.StartsWith("[Finish]") && currentAlbum != "")
            {
                if (res == null)
                    res += "У тебя великолепный вкус! Можешь смело включать ";
                res +=  message.Replace("[Finish]", "").Replace("_", " ") + ", " + System.Environment.NewLine;
                //MessageBox.Show(message.Replace("[Finish]", ""), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
