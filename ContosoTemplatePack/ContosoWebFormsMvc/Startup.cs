using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ContosoWebFormsMvc.Startup))]
namespace ContosoWebFormsMvc
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
