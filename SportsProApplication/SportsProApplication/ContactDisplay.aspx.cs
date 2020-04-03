using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsProApplication
{
    public partial class ContactDisplay : System.Web.UI.Page


    {
        private CustomerList customerDetails;
        Customer customer_obj = new Customer();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblSelectContactRemove.Visible = false;
            lblContactListEmpty.Visible = false;
            if (!IsPostBack)
            {
                if (Session["SessionCustomer"] != null)
                {
                    customerDetails = (CustomerList)Session["SessionCustomer"];
                    lstbxContacts.Items.Clear();
                    for (int i = 0; i < customerDetails.Count; i++)
                    {
                        customer_obj = customerDetails[i];
                        lstbxContacts.Items.Add(customer_obj.ContactDisplay());
                    }
                }
            }
        }

        protected void btnRemoveContact_Click(object sender, EventArgs e)
        {
            customerDetails = CustomerList.GetCustomers();

            if (customerDetails.Count > 0)
            {
                if (lstbxContacts.SelectedIndex > -1)
                {
                    customerDetails.RemoveAt(lstbxContacts.SelectedIndex);
                    lstbxContacts.Items.Clear();
                    for (int i = 0; i < customerDetails.Count; i++)
                    {
                        customer_obj = customerDetails[i];
                        lstbxContacts.Items.Add(customer_obj.ContactDisplay());
                    }
                }
                else
                {
                    lblSelectContactRemove.Visible = true;
                }
            }
            else
            {
                lblContactListEmpty.Visible = true;
            }
        }

        protected void btnEmptyList_Click(object sender, EventArgs e)
        {
            customerDetails = CustomerList.GetCustomers();
            if (customerDetails.Count > 0)
            {
                customerDetails.Clear();
                lstbxContacts.Items.Clear();
            }
            else
            {
                lblContactListEmpty.Visible = true;
            }
        }

        protected void btnSelectAddCust_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerDisplay.aspx");
        }
    }
}