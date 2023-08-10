using System;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using System.Net.Mail;


namespace SipayBussiness
{
    public class UserManager
    {
        private readonly Random _random = new Random();

        public async Task<string> CreateUserWithRandomPasswordAndSendEmail(string email)
        {
            // Rastgele 8 karakterli şifre oluştur
            string randomPassword = GenerateRandomPassword(8);

            // Şifreyi MD5 ile şifrele
            string encryptedPassword = CalculateMD5Hash(randomPassword);

            // Kullanıcıya mail gönder
            await SendEmailAsync(email, "Yeni Şifreniz", $"Yeni şifreniz: {randomPassword}");

            return encryptedPassword; // Şifrelenmiş şifreyi döndür
        }

        private string GenerateRandomPassword(int length)
        {
            const string validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder randomPassword = new StringBuilder();
            while (randomPassword.Length < length)
            {
                randomPassword.Append(validChars[_random.Next(validChars.Length)]);
            }
            return randomPassword.ToString();
        }

        private string CalculateMD5Hash(string input)
        {
            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = Encoding.UTF8.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }

                return sb.ToString();
            }
        }

        private async Task SendEmailAsync(string toEmail, string subject, string body)
        {
            string smtpServer = "smtp.example.com"; // SMTP sunucu adresi
            int smtpPort = 587; // SMTP port numarası
            string smtpUsername = "yourusername"; // SMTP kullanıcı adı
            string smtpPassword = "yourpassword"; // SMTP şifre

            using (SmtpClient client = new SmtpClient(smtpServer, smtpPort))
            {
                client.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
                client.EnableSsl = true;
                await client.SendMailAsync("your@example.com", toEmail, subject, body);
            }
        }
    }

}
