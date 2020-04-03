using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SportsProApplication.Startup))]
namespace SportsProApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
