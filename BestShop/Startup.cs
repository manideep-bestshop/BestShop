using Microsoft.AspNetCore.Hosting;
namespace BestShop
{
	public class Startup
	{
		private IWebHostEnvironment webHostEnvironment;
		public Startup(IWebHostEnvironment env)
		{
			webHostEnvironment = env;
		}
		public void Configure(IApplicationBuilder app,
	IHostingEnvironment env, ILoggerFactory loggerFactory)
		{
			loggerFactory.AddLog4Net();
		}
	}
}
