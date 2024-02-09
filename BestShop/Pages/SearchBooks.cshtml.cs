using BestShop.Pages.Admin.books;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;

namespace BestShop.Pages
{
    [BindProperties(SupportsGet =true)]
    public class SearchBooksModel : PageModel
    {
        private readonly string connectionString;

        public SearchBooksModel(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public string? Search { get; set; }
        public string PriceRange { get; set; } = "any";
        public string PageRange { get; set; }= "any";
        public string Category { get; set; } = "any";

        public List<BookInfo> listBooks = new List<BookInfo>();

        public int page = 1;
        public int totalPages = 0;
        public int pageSize = 3;
        public void OnGet()
        {
            page = 1;
            string requestPage = Request.Query["page"]; 
            if(requestPage!=null)
            {
                try
                {
                    page = int.Parse(requestPage);

                }
                catch (Exception ex)
                {
                    page = 1;
                }
            }
            try
            {
              //  string connectionString = "Data Source=DESKTOP-7T0EOMO;database=bestshop;Integrated Security=True;";

                using(SqlConnection connection=new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlCount = "SELECT COUNT(*) FROM books";
                    sqlCount += " WHERE (title LIKE @search OR authors LIKE @search)";

                    // searching based price
                    if (PriceRange.Equals("0_199"))
                    {
                        sqlCount += " AND price<=199";
                    }
                    else if (PriceRange.Equals("200_499"))
                    {
                        sqlCount += " AND price>=200 AND price<=499";
                    }
                    else if (PriceRange.Equals("above500"))
                    {
                        sqlCount += " AND price>=500";
                    }

                    // searching based on Pages
                    if (PageRange.Equals("0_99"))
                    {
                        sqlCount += " AND price<=99";
                    }
                    else if (PageRange.Equals("100_399"))
                    {
                        sqlCount += " AND price>=100 AND price<=399";
                    }
                    else if (PageRange.Equals("above400"))
                    {
                        sqlCount += " AND price>=400";
                    }

                    //searching based on Category
                    if (!Category.Equals("any"))
                    {
                        sqlCount += " AND category=@category";
                    }

                    using(SqlCommand command=new SqlCommand(sqlCount,connection))
                    {
                        command.Parameters.AddWithValue("@search", "%" + Search + "%");
                        command.Parameters.AddWithValue("@category", Category);

                        decimal count=(int)command.ExecuteScalar();
                        totalPages =(int)Math.Ceiling(count/pageSize);
                    }

                    string sql = "SELECT * FROM books";
                    sql += " WHERE (title LIKE @search OR authors LIKE @search)";

                     // searching based price
                    if(PriceRange.Equals("0_199"))
                    {
                        sql += " AND price<=199";
                    }
                    else if(PriceRange.Equals("200_499"))
                    {
                        sql += " AND price>=200 AND price<=499";
                    }
                    else if(PriceRange.Equals("above500"))
                    {
                        sql += " AND price>=500";
                    }

                    // searching based on Pages
                    if (PageRange.Equals("0_99"))
                    {
                        sql += " AND price<=99";
                    }
                    else if (PageRange.Equals("100_399"))
                    {
                        sql += " AND price>=100 AND price<=399";
                    }
                    else if (PageRange.Equals("above400"))
                    {
                        sql += " AND price>=400";
                    }

                    //searching based on Category
                    if(!Category.Equals("any"))
                    {
                        sql += " AND category=@category";
                    }

                    sql += " ORDER BY id DESC";
                    sql += " OFFSET @skip ROWS FETCH NEXT @pageSize ROWS ONLY";

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        command.Parameters.AddWithValue("@search", "%" + Search + "%");
                        command.Parameters.AddWithValue("@category", Category);
                        command.Parameters.AddWithValue("@skip", (page - 1) * pageSize);
                        command.Parameters.AddWithValue("@pageSize", pageSize);

                        using(SqlDataReader reader= command.ExecuteReader()) 
                        {
                            while(reader.Read())
                            {
                                BookInfo bookInfo=new BookInfo();

                                bookInfo.Id = reader.GetInt32(0);
                                bookInfo.Title=reader.GetString(1);
                                bookInfo.Authors=reader.GetString(2);   
                                bookInfo.Isbn=reader.GetString(3);  
                                bookInfo.NumPages=reader.GetInt32(4);
                                bookInfo.Price = reader.GetDecimal(5);
                                bookInfo.Category = reader.GetString(6);    
                                bookInfo.Description=reader.GetString(7);   
                                bookInfo.ImageFileName=reader.GetString(8);
                                bookInfo.CreatedAt = reader.GetDateTime(9).ToString("MM/dd/yyyy");

                                listBooks.Add(bookInfo);
                            }
                        }
                    }

                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
