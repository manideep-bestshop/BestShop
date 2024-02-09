using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.IdentityModel.Tokens;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Net;
using System.Net.Mail;

namespace BestShop.Myhelper
{
    public class EmailSender
    {
        public static void SendEmail(string toEmail, string username, string subject
            , string message)
        {
            string fromMail = "nmanideep1015@gmail.com";
            string fromPassword = "iwzfhxfrmjahomcu";

            MailMessage msg=new MailMessage();
            msg.From = new MailAddress(fromMail);
            msg.Subject = subject;
            msg.To.Add(new MailAddress(toEmail));
            msg.Body = message;
            msg.IsBodyHtml=true;

            var smtpClient = new SmtpClient("smtp.gmail.com")
            {
                Port = 587,
                Credentials = new NetworkCredential(fromMail, fromPassword),
                EnableSsl = true,
            };

            smtpClient.Send(msg);
        }
    }
}
