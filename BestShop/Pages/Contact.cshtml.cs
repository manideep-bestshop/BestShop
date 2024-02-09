using BestShop.Myhelper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Diagnostics.SymbolStore;

namespace BestShop.Pages
{
    public class ContactModel : PageModel
    {
        private readonly string connectionString;

        public ContactModel(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }
        public void OnGet()
        {
        }
       
        [Required(ErrorMessage="The First Name is required")]
        [Display(Name ="First Name")]
        public string FirstName { get; set; } = "";

        [BindProperty,Required(ErrorMessage="The Last Name is required")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; } = "";

        [BindProperty,Required(ErrorMessage="The Email is required")]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; } = "";

        [BindProperty]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers allowed.")]
        public string Phone { get; set; } = "";

        [BindProperty,Required]
        [Display(Name = "Subject")]
        public string Subject { get; set; } = "";


        [BindProperty,Required(ErrorMessage="The Message is required")]
        [MinLength(5,ErrorMessage="the Message should be at least 5 characters")]
        [MaxLength(1024,ErrorMessage="the Message should be less 1024 characters")]
        [Display(Name ="Message")]
        public string Message { get; set; } = "";

        public List<SelectListItem> SubjectList { get; }=new List<SelectListItem>
        {
            new SelectListItem{Value="Order Status",Text="Order Status"},
            new SelectListItem{Value="Refund Request",Text="Refund Request"},
            new SelectListItem{Value="Job Application",Text="Job Application"},
            new SelectListItem{Value="Other",Text="Other"},
         };  

        public string SuccessMessage { get; set; } = "";
        public string ErrorMessage { get; set; } = "";
        public void OnPost()
        {


            //check if any required field is empty
            if (!ModelState.IsValid)
            {
                //error
                ErrorMessage = "Please fill all required fields";
                return; 
            }
            if (Phone == null) Phone = "";

            // add this message to database
            try
            {
               // string connectionString = "Data Source=DESKTOP-7T0EOMO;Initial Catalog=bestshop;Integrated Security=True;";
                using(SqlConnection connection=new SqlConnection(connectionString))
                {
                    connection.Open();
                    string sql = "INSERT INTO messages " +
                        "(firstname,lastname,email,phone,subject,message) VALUES " +
                        "(@firstname,@lastname,@email,@phone,@subject,@message);";
                    using(SqlCommand cmd=new SqlCommand(sql,connection))
                    {
                        cmd.Parameters.AddWithValue("@firstname",FirstName);
                        cmd.Parameters.AddWithValue("@lastname", LastName);
                        cmd.Parameters.AddWithValue("@email", Email);
                        cmd.Parameters.AddWithValue("@phone", Phone);
                        cmd.Parameters.AddWithValue("@subject", Subject);
                        cmd.Parameters.AddWithValue("@message", Message);

                        cmd.ExecuteNonQuery();
                    }
                }
             }
            catch(Exception ex)
            {
                ErrorMessage=ex.Message;
                return;    
            }

            //send confirmation message to client
            string username = FirstName + " " + LastName;
            string emailSubject = "BestShop App";
            string emailMessage = "Dear " + username + ",</br>" +
                "We received your message.Thank you for contacting us..</br>" +
                "our team will contact you soon.\n" +
                "Best Regards\n\n" +
                "Your message:\n" + Message;

            EmailSender.SendEmail(Email, username, emailSubject, emailMessage);
     
            SuccessMessage = "Your message has been recieved correctly..";

            FirstName = "";
            LastName = "";
            Email = "";
            Phone = "";
            Subject = "";
            Message = "";

            ModelState.Clear();
        }
    }
}
