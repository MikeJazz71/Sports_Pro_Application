using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsProApplication
{
    public partial class TechnicianMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fvTechMain_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            
            

                if (e.Exception != null)
                {
                    lblTechMainDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                    e.ExceptionHandled = true;
                    e.KeepInEditMode = true;
                }
                else if (e.AffectedRows == 0)
                {
                    lblTechMainDBError.Text = ConcurrencyErrorMessage();
                }
                else
                    ddlSelectTech.DataBind();

            
        }

        protected void fvTechMain_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblTechMainDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;


            }
            else if (e.AffectedRows == 0)
            {
                lblTechMainDBError.Text = ConcurrencyErrorMessage();

            }
            else
                ddlSelectTech.DataBind(); 

        }

        protected void fvTechMain_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {

            if (e.Exception != null)
            {
                lblTechMainDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;

            } else
                ddlSelectTech.DataBind();

        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        private string ConcurrencyErrorMessage()
        {

            return "Another user may have updated that catagory. " + "Please try again";
        }


    }
}