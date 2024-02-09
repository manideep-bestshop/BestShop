using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BestShop.Pages
{
    public class CheckoutModel : PageModel
    {

        public string PaypalClientId { get; set; } = "";
        public string PaypalSecret { get; set; } = "";
        public string PaypalUrl { get; set; } = "";

        public string DeliveryAddress { get; set; } = "";
        public string Total { get; set; } = "";
        public string ProductIdentifiers { get; set; } = "";

        public CheckoutModel(IConfiguration configuration) 
        {
            PaypalClientId = configuration["PaypalSettings:ClientId"]!;
            PaypalSecret = configuration["PaypalSettings:Secret"]!;
            PaypalUrl = configuration["PaypalSettings:Url"]!;
        }

        public void OnGet()
        {
            DeliveryAddress = TempData["DeliveryAddress"]?.ToString()??"";
            Total = TempData["Total"]?.ToString() ?? "";
            ProductIdentifiers = TempData["ProductIdentifiers"]?.ToString() ?? "";

            TempData.Keep();

            if(DeliveryAddress=="" || Total=="" || ProductIdentifiers=="")
            {
                Response.Redirect("/");
                return;
            }
        }
    }
}
