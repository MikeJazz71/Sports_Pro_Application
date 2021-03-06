﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsProApplication
{
    public partial class CustomerMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void dvCustomerMaintenance_ItemUpdated(object sender,  DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception !=null)
            {

                lblCustomerMainDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblCustomerMainDBError.Text = ConcurrencyErrorMessage();
            }

        }


        protected void dvCustomerMaintenance_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {

            if (e.Exception !=null)
            {

                lblCustomerMainDBError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            } 
            else if  (e.AffectedRows == 0)
            {
                lblCustomerMainDBError.Text = ConcurrencyErrorMessage();
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