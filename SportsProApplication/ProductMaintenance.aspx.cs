using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsProApplication
{
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvProducts_PreRender(object sender, EventArgs e)
        {
            gvProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
        }


        protected void btnAddProduct_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                var parameters = gridvProducts.InsertParameters;
                parameters["ProductCode"].DefaultValue = txtAddProductCode.Text;
                parameters["Name"].DefaultValue = txtAddProductName.Text;
                parameters["Version"].DefaultValue = txtAddVersion.Text;
                parameters["ReleaseDate"].DefaultValue = txtAddReleaseDate.Text;
            }

            try
            {
                gridvProducts.Insert();

                txtAddProductCode.Text = "";
                txtAddProductName.Text = "";
                txtAddVersion.Text = "";
                txtAddReleaseDate.Text = ""; 
            }

            catch (Exception ex)
            {
                lblDBError.Text = DatabaseErrorMessage(ex.Message);
            }


        }

        protected void gvProducts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

            if (e.Exception != null)
            {
                lblDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblDBError.Text = ConcurrencyErrorMessage();
            }
            

        }

        protected void gvProducts_RowDeleted(object sender, GridViewUpdatedEventArgs e)
        {

            if (e.Exception != null)
            {

                lblDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true; 

            }

            else if (e.AffectedRows == 0)
            {

                lblDBError.Text = ConcurrencyErrorMessage(); 
            }
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