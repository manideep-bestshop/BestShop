using SendGrid;
using SendGrid.Helpers.Mail;

namespace BestShop.Myhelper
{
    public class EmailSender
    {
        public static async Task SendEmail(string toEmail,string username,string subject
            ,string message)
        {
            string apiKey = "";
            var client=new SendGridClient(apiKey);

            var from=new EmailAddress("manideep.n15@gmail.com","BestShop.com");
            var to = new EmailAddress(toEmail, username);
            var plainTextContent = message;
            var htmlContent = "";

            var msg = MailHelper.CreateSingleEmail(from,to,subject,plainTextContent,htmlContent);
            var response = await client.SendEmailAsync(msg);
        }
    }
}
