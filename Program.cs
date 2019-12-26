using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Telegram.Bot;
using MihaZupan;
using Telegram.Bot.Args;
using Telegram.Bot.Types.Enums;
using AIMLbot;
using System.Drawing;

namespace tgBot
{
    class Program
    {//*
        const string apiKey = "";
        const string chatId = "725729553";
        const string proxyName = "ns377475.ip-91-121-109.eu";
        static HttpToSocks5Proxy proxy = new HttpToSocks5Proxy(proxyName, 1080);
        static TelegramBotClient Bot = new TelegramBotClient(apiKey, proxy);
        static AIMLbot.Bot AimlBot = new AIMLbot.Bot();
        static User AimlUser;
        static Clips clips;
        static bool isYear = false;

        static void Main(string[] args)
        {
            proxy.ResolveHostnamesLocally = true;
            var me = Bot.GetMeAsync().Result;//Получаем имя бота, чтобы обозвать окошко консоли(когда ботов несколько, то так проще)
            Console.Title = me.Username;
            AimlUser = new User(me.Id.ToString(), AimlBot);
            clips = new Clips();

            AimlBot.loadSettings();
            AimlBot.isAcceptingUserInput = false;
            AimlBot.loadAIMLFromFiles();
            AimlBot.isAcceptingUserInput = true;

            //*/
            //Создаем обработчики событий
            Bot.OnMessage += BotOnMessageReceived;
            Bot.OnCallbackQuery += BotOnCallbackQueryReceived;
            Bot.OnReceiveError += BotOnReceiveError;

            //Начинаем проверять обновления
            Bot.StartReceiving();// Array.Empty<UpdateType>());
            Console.WriteLine($"Start listening for @{me.Username}");
            Console.ReadLine();
            Bot.StopReceiving();
        }//*/

        private static void BotOnReceiveError(object sender, ReceiveErrorEventArgs e)
        {
            throw new NotImplementedException();
        }

        private static void BotOnCallbackQueryReceived(object sender, CallbackQueryEventArgs e)
        {
            throw new NotImplementedException();
        }

        private static void BotOnMessageReceived(object sender, MessageEventArgs e)
        {
            var message = e.Message;
            if (message.Type == MessageType.Text)
            {
                if (message.Text == "/start" || message.Text == "/help")
                {
                    var str = "Олечка самая лучшая!!!"; // TODO Описание бота, его функциональность!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Bot.SendTextMessageAsync(message.Chat.Id, str);//, replyMarkup: inlineKeyboard);
                    return;
                }

                Result res = AimlBot.Chat(message.Text, AimlUser.UserID);
                int from = res.RawOutput.IndexOf("help");
                if (from != -1)
                {
                    int to = res.Output.IndexOf("/help");
                    var newRes = res.Output.Substring(from + 4, to - from - 4);
                    clips = new Clips();
                    ClipsConnect(newRes);
                    if (clips.currentSinger != "" && clips.currentYear == "")
                    {
                        // Ввод года
                        Bot.SendTextMessageAsync(message.Chat.Id, "Какой год выбираешь? Если не знаешь, напиши \"На твой выбор\", и все будет решено!");
                        isYear = true;
                        return;
                    }
                    clips.start();
                    Bot.SendTextMessageAsync(message.Chat.Id, clips.res);
                }
                else if (isYear && (message.Text == "1995" || message.Text == "1996" || message.Text == "1997" || message.Text == "1998" || message.Text == "1999" ||
                                    message.Text == "2000" || message.Text == "2001" || message.Text == "2002" || message.Text == "2003" || message.Text == "2004" || message.Text == "2005"))
                {
                    clips.currentYear = message.Text;
                    clips.start();
                    Bot.SendTextMessageAsync(message.Chat.Id, "Прекрасный выбор! Могу предложить следующие альбомы этого исполнителя:\n" + clips.res + "\nКакой выберешь?");
                }
                else
                    Bot.SendTextMessageAsync(message.Chat.Id, res.Output);
                isYear = false;
                return;
            }
            else if (message.Type == MessageType.Photo)
            {
                string str = "../../photos/001.jpg";
                System.IO.Stream file = new System.IO.FileStream(str, System.IO.FileMode.OpenOrCreate);
                Bot.GetInfoAndDownloadFileAsync(message.Photo[0].FileId, file);
                file.Close();

                //Bitmap currentImage = Image.FromFile(str) as Bitmap;
                //Bitmap image = ImageProcessing.PrepeareImage(currentImage, 56);
               // Telegram.Bot.Types.InputFiles.InputOnlineFile f = new Telegram.Bot.Types.InputFiles.InputOnlineFile(str);
                //Bot.SendPhotoAsync(message.Chat.Id, f);
                Bot.SendTextMessageAsync(message.Chat.Id, "Прекрасный выбор!");
                
            }
        }

        static public void ClipsConnect(string message)
        {
            var temp = message.Split('!');
            foreach (var t in temp)
            {
                var id = t.Trim()[0];
                var str = t.Trim().Substring(2).Trim();
                str = str.Replace(' ', '_');
                switch (id)
                {
                    case 'Ж': //жанр
                        clips.currentGanr = str;
                        break;
                    case 'И': // исполнитель
                        clips.currentSinger = str;
                        break;
                    /*                case 'П': //песни
                                            clips.
                                        break;//*/
                    case 'Г': //года
                        clips.currentYear = str;
                        break;
                    case 'А': // альбом
                        clips.currentAlbum = str;
                        break;
                }
            }
        }
    }
}
