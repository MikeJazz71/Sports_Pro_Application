using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;


using Owin;
using System.Security;
using SportsProApplication;

using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;



/*

namespace SportsProApplication
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationUserManager>();
            var user = new ApplicationUserManager() { UserName = Email.Text, Email = Email.Text }; 
            IdentityResult result manager.Create(user, Password.Text);

            if (result.Succeeded)
            {

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl", Response]); 

            } else
            {
                ModelErrorMessage.Text = result.Errors.FirstOrDefault(); 
            }
            
        }
    }
}
*/