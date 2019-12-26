using Accord.Imaging;
using Accord.Imaging.Filters;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;

namespace tgBot
{
    static class ImageProcessing
    {
        public const int RESULT_IMAGE_SIZE = 56;
        public static Bitmap PrepeareImage(Bitmap sourceImage, int imageSize)
        {
            Crop crop_filter = new Crop(new Rectangle((sourceImage.Width - imageSize) / 2, (sourceImage.Height - imageSize) / 2, imageSize, imageSize));
            Bitmap croppedImage = crop_filter.Apply(sourceImage);

            Grayscale gray_filter = new Grayscale(0.2125, 0.7154, 0.0721);
            Bitmap grayImage = gray_filter.Apply(croppedImage);

            BradleyLocalThresholding threshold_filter = new BradleyLocalThresholding();
            threshold_filter.PixelBrightnessDifferenceLimit = 0.2f;
            Bitmap thresholdImage = threshold_filter.Apply(grayImage);

            //pictureBox1.Image = thresholdImage;

            
            return new Bitmap(thresholdImage, new Size(RESULT_IMAGE_SIZE, RESULT_IMAGE_SIZE));
        } 

        public static double[] GetImageVector(Bitmap bmp)
        {
            int w = bmp.Width;
            int h = bmp.Height;

            System.Drawing.Imaging.BitmapData imdata = bmp.LockBits(
                new Rectangle(0, 0, w, h),
                System.Drawing.Imaging.ImageLockMode.ReadWrite, bmp.PixelFormat
            );

            UnmanagedImage unmImg = new UnmanagedImage(imdata);

            double[] res = new double[w + h];

            for (int j = 0; j < h; ++j)
                for (int i = 0; i < w; ++i)
                {
                    double c = unmImg.GetPixel(i, j).GetBrightness() == 0 ? 1 : 0;
                    res[j] += c;
                    res[w + i] += c;
                }

            bmp.UnlockBits(imdata);
            unmImg.Dispose();
            return res;
        }

        public static double[] GetImageVector(int[] imgValues)
        {
            int w = RESULT_IMAGE_SIZE;
            int h = RESULT_IMAGE_SIZE;

            double[] res = new double[w + h];
            //Bitmap bitmap = new Bitmap(w, h);

            for (int j = 0; j < h; ++j)
                for (int i = 0; i < w; ++i)
                {
                    int c = imgValues[j * w + i + 1] == 0 ? 0 : 1;
                    //bitmap.SetPixel(i, j, Color.FromArgb((1 - c) * 255, (1 - c) * 255, (1 - c) * 255));
                    res[j] += c;
                    res[w + i] += c;
                }

            //bitmap.Save("test22.png");
            return res;
        }
    }
}
