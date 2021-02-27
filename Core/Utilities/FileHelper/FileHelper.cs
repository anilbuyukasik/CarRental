using Core.Utilities.Results;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Core.Utilities.FileHelper
{
    public class FileHelper
    {
        public static string AddAsync(IFormFile file)
        {
            var sourcePath = Path.GetTempFileName();
            if (file.Length > 0)
            {
                using (var stream = new FileStream(sourcePath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
            }
            var result = NewPath(file);
            File.Move(sourcePath, result);
            return result;
        }
        public static string UpdateAsync(string sourcePath, IFormFile file)
        {
            var result = NewPath(file);
            File.Copy(sourcePath, result);
            File.Delete(sourcePath);
            return result;
        }
        public static IResult DeleteAsync(string path)
        {
            try
            {
                File.Delete(path);
            }
            catch (Exception exception)
            {

                return new ErrorResult(exception.Message);
            }
            return new SuccessResult();
        }
        public static string NewPath(IFormFile file)
        {
            System.IO.FileInfo fileInfo = new System.IO.FileInfo(file.FileName);
            string fileExtension = fileInfo.Extension;

            var newUniqueFileName = Guid.NewGuid().ToString("N")
                + "-" + DateTime.Now.Month + "-"
               + DateTime.Now.Day + "-"
               + DateTime.Now.Year + fileExtension;

            string path = Path.Combine(Directory.GetParent(System.IO.Directory.GetCurrentDirectory()).FullName + @"\Images");
            string result = $@"{path}\{newUniqueFileName}";
            return result;
        }
    }
}
