using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsProApplication
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             bool val1 = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
             if (val1 == true)
             {
                lbRegister.Text = "Manage your account";
                



             } else

                lbRegister.Text = "Register"; 


        } 

        /*protected void btnLogin_Click(object sender, EventArgs e)
         {


                bool val1 = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
             if (val1 == true)
             {

                 Session.Abandon();
                 Session.Clear();
                 Response.Cookies.Clear();
                 Response.Redirect("Default.aspx");


             } else

             Response.Redirect("~/Account/Login.aspx");





         } */

         protected void btnRegister_Click(object sender, EventArgs e)
         {

             

         } 

            protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void lbRegister_Click(object sender, EventArgs e)
        {
            bool val1 = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (val1 == true)
            {
                Response.Redirect("~/Account/Manage.aspx");

            }
            else
                Response.Redirect("~/Account/Register.aspx");
        }
    }
}