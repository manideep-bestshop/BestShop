using BestShop.Pages.Admin.books;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace BestShop.Pages
{
    public class IndexModel : PageModel
    {


        private readonly string connectionString;
        private readonly ILogger<IndexModel> _logger;    

        public IndexModel(IConfiguration configuration,ILogger<IndexModel> logger)
        {
            _logger = logger;

			_logger.LogDebug("Hey, this is a DEBUG message.");
			_logger.LogInformation("Hey, this is an INFO message.");
			_logger.LogWarning("Hey, this is a WARNING message.");
			_logger.LogError("Hey, this is an ERROR message.");


			connectionString = configuration.GetConnectionString("DefaultConnection");
        }


        public List<BookInfo> listNewestBooks = new List<BookInfo>();
        public List<BookInfo> listTopSales = new List<BookInfo>();

        public void OnGet()
        {
            try
            {
               // string connectionString = "Data Source=DESKTOP-7T0EOMO;database=bestshop;Integrated Security=True;";
            
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sql = "SELECT TOP 4 * FROM books ORDER BY created_at DESC";
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                BookInfo bookInfo = new BookInfo();
                                bookInfo.Id = reader.GetInt32(0);
                                bookInfo.Title = reader.GetString(1);
                                bookInfo.Authors = reader.GetString(2);
                                bookInfo.Isbn = reader.GetString(3);
                                bookInfo.NumPages = reader.GetInt32(4);
                                bookInfo.Price = reader.GetDecimal(5);
                                bookInfo.Category = reader.GetString(6);
                                bookInfo.Description = reader.GetString(7);
                                bookInfo.ImageFileName = reader.GetString(8);
                                bookInfo.CreatedAt = reader.GetDateTime(9).ToString("MM/dd/yyyy");

                                listNewestBooks.Add(bookInfo);
                            }
                        }
                    }

                    sql = "SELECT TOP 4 books.*, (" +
                       "SELECT SUM(order_items.quantity) FROM order_items WHERE books.id = order_items.book_id" +
                       ") AS total_sales " +
                       "FROM books " +
                       "ORDER BY total_sales DESC";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                BookInfo bookInfo = new BookInfo();
                                bookInfo.Id = reader.GetInt32(0);
                                bookInfo.Title = reader.GetString(1);
                                bookInfo.Authors = reader.GetString(2);
                                bookInfo.Isbn = reader.GetString(3);
                                bookInfo.NumPages = reader.GetInt32(4);
                                bookInfo.Price = reader.GetDecimal(5);
                                bookInfo.Category = reader.GetString(6);
                                bookInfo.Description = reader.GetString(7);
                                bookInfo.ImageFileName = reader.GetString(8);
                                bookInfo.CreatedAt = reader.GetDateTime(9).ToString("MM/dd/yyyy");

                                listTopSales.Add(bookInfo);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }
}
