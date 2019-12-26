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
using System.Net;
using System.IO;

namespace tgBot
{
    class Program
    {//*
        const string apiKey = "";
        const string chatId = "725729553";
        //const string proxyName = "ns377475.ip-91-121-109.eu"; static int port = 1080
        //const string proxyName = "96.44.183.149.static.quadranet.com"; static int port = 55225
        const string proxyName = "ns557216.ip-54-39-16.net"; static int port = 35545;
        static HttpToSocks5Proxy proxy = new HttpToSocks5Proxy(proxyName, port);
        static TelegramBotClient Bot = new TelegramBotClient(apiKey, proxy);
        static AIMLbot.Bot AimlBot = new AIMLbot.Bot();
        static User AimlUser;
        static Clips clips;
        static bool isYear = false;

        static void Main(string[] args)
        {
            AimlUser = new User("001", AimlBot);
            //clips = new Clips();

            AimlBot.loadSettings();
            AimlBot.isAcceptingUserInput = false;
            AimlBot.loadAIMLFromFiles();
            AimlBot.isAcceptingUserInput = true;

            while (true)
            {
                Console.Write("Вы: ");
                string messageText = Console.ReadLine();
                var res = AimlBot.Chat(new Request(messageText, AimlUser, AimlBot));
                //string answer = myBot.GetAIMLAnswer(messageText);
                Console.Write("Бот: ");
                Console.WriteLine(res.Output);
            }
            /*
            proxy.ResolveHostnamesLocally = true;
            var me = Bot.GetMeAsync().Result;//Получаем имя бота, чтобы обозвать окошко консоли(когда ботов несколько, то так проще)
            Console.Title = me.Username;
            AimlUser = new User(me.Id.ToString(), AimlBot);
            //clips = new Clips();

            AimlBot.loadSettings();
            AimlBot.isAcceptingUserInput = false;
            AimlBot.loadAIMLFromFiles();
            AimlBot.isAcceptingUserInput = true;

            //*
            //Создаем обработчики событий
            Bot.OnMessage += BotOnMessageReceived;
            Bot.OnCallbackQuery += BotOnCallbackQueryReceived;
            Bot.OnReceiveError += BotOnReceiveError;

            //Начинаем проверять обновления
            Bot.StartReceiving();// Array.Empty<UpdateType>());
            Console.WriteLine($"Start listening for @{me.Username}");
            Console.ReadLine();
            Bot.StopReceiving();//*/
        }

        private static void BotOnReceiveError(object sender, ReceiveErrorEventArgs e)
        {
            throw new NotImplementedException();
        }

        private static void BotOnCallbackQueryReceived(object sender, CallbackQueryEventArgs e)
        {
            throw new NotImplementedException();
        }

        private static async void BotOnMessageReceived(object sender, MessageEventArgs e)
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
                var res = AimlBot.Chat(new Request(message.Text, AimlUser, AimlBot));
                //Result res = AimlBot.Chat(message.Text, AimlUser.UserID);
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
                var file = await Bot.GetFileAsync(message.Photo.Last().FileId);
                string filename = "../../" + file.FilePath;
                using (var saveImageStream = new System.IO.FileStream(filename, FileMode.Create))
                {
                    await Bot.DownloadFileAsync(file.FilePath, saveImageStream);
                }

                Bitmap currentImage = Image.FromFile(filename) as Bitmap;
                Bitmap image = ImageProcessing.PrepeareImage(currentImage, 56);
                var file2 = new FileStream("../../photos/002.jpg", FileMode.Create);
                image.Save(file2, System.Drawing.Imaging.ImageFormat.Jpeg);
               // file2.Close();

//                var s = System.IO.File.OpenRead("../../photos/001.jpg");
                Bot.SendPhotoAsync(e.Message.Chat.Id, new Telegram.Bot.Types.InputFiles.InputOnlineFile(file2));
                

                //Bot.SendPhotoAsync(message.Chat.Id, new Telegram.Bot.Types.InputFiles.InputOnlineFile(file2));
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
