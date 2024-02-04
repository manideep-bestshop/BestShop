using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace BestShop.Pages
{
    [BindProperties]
    public class SearchBooksModel : PageModel
    {
        public string? Search { get; set; }
        public string PriceRange { get; set; } = "any";
        public string PageRange { get; set; }= "any";
        public string Category { get; set; } = "any";   
        public void OnGet()
        {
        }
    }
}
