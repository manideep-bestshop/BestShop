using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace BestShop.Pages.Auth
{
    public class RegisterModel : PageModel
    {
        [Required(ErrorMessage ="The First Name is required")]
        public string FirstName { get; set; } = "";

        [Required(ErrorMessage = "The Last Name is required")]
        public string LastName { get; set; } = "";

        [Required(ErrorMessage = "The Email is required")]
        public string Email { get; set; } = "";

        [Required(ErrorMessage = "The Phone is required")]
        public string? Phone { get; set; } = "";

        [Required(ErrorMessage = "The Address is required")]
        public string Address { get; set; } = "";

        [Required(ErrorMessage = " Password is required")]
        [StringLength(50,ErrorMessage ="Password must be between 5 and 50 characters",MinimumLength =5)]
        public string Password { get; set; } = "";

        [Required(ErrorMessage = " Confirm password is required")]
        [Compare("Password",ErrorMessage ="Password and confirm password do not match")]
        public string ConfirmPassword { get; set; } = "";

        public string errorMessage = "";
        public string successMessage = "";
        public void OnGet()
        {
        }

        public void OnPost() 
        { 
           if(!ModelState.IsValid)
            {
                errorMessage = "Data validation failed";
                return;
            }

            //successfull data validation
            if (Phone == null) Phone = "";

            //add the user details to the database

            //send confirmation email to the user

            //initiate the authenticated session=> add the user details to the session data

            successMessage = "Account created successfully..";

        }
    }
}
