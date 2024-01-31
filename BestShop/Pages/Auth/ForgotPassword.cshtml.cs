using BestShop.Myhelper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Globalization;

namespace BestShop.Pages.Auth
{
    [RequireNoAuth]
    public class ForgotPasswordModel : PageModel
    {
        [BindProperty, Required(ErrorMessage = "The Email is required"), EmailAddress]
        public string Email { get; set; } = "";

        public string errorMessage = "";
        public string successMessage = "";

        public void OnGet()
        {
        }

        public void OnPost()
        {
            if(!ModelState.IsValid) 
            {
                errorMessage = "Data validation Failed";
                return;
            }
            // 1)craete token,2)save token in the database 3) send token by email to the user
            try
            {
                string connectionString = "Data Source=DESKTOP-7T0EOMO;database=bestshop;Integrated Security=True;";
                using(SqlConnection connection = new SqlConnection(connectionString)) 
                {
                    connection.Open();
                    string sql = "SELECT * FROM users WHERE email=@email";
                    using(SqlCommand command=new SqlCommand(sql,connection))
                    {
                        command.Parameters.AddWithValue("@email", Email);
                        using(SqlDataReader reader=command.ExecuteReader())
                        {
                            if(reader.Read())
                            {
                                string firstname=reader.GetString(0);
                                string lastname = reader.GetString(1);

                                string token=Guid.NewGuid().ToString();

                                //save the token in the database
                                SaveToken(Email, token);

                                //send the token by email to user
                                string resetUrl = Url.PageLink("/Auth/ResetPassword") + "?token=" + token;
                                string username = firstname + " " + lastname;
                                string subject= "Password reset";
                                string message = "Dear " + username + ",\n\n" +
                                    "You can reset your password using the following Link:\n\n" +
                                    resetUrl + "\n\n" +
                                    "Best Regards";

                                EmailSender.SendEmail(Email, username, subject, message).Wait();
                            }
                            else
                            {
                                errorMessage = "We have no user with this email address";
                                return;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
            successMessage = "Please check the email and click on the link";
        }
        private void SaveToken(string email,string token)
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-7T0EOMO;database=bestshop;Integrated Security=True;";
                
                using(SqlConnection connection=new SqlConnection(connectionString))
                {
                    connection.Open();

                    //delete any old token for this email address from the database
                    string sql = "DELETE FROM paaswor_resets WHERE email=@email";
                    using(SqlCommand command=new SqlCommand(sql,connection))
                    {
                        command.Parameters.AddWithValue("@email",email);
                        command.ExecuteNonQuery();
                    }

                    //add token to database
                    sql = "INSERT INTO password_resets(email,token) VALUES (@email,@token)";
                    using(SqlCommand command=new SqlCommand(sql,connection))
                    {
                        command.Parameters.AddWithValue("@email", email);
                        command.Parameters.AddWithValue("@token", token);

                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return;
            }
        }
    }
}
