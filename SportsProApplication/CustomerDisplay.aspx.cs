using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsProApplication
{
    public partial class CustomerDisplay : Page
    {
        private Customer selectedCustomer;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) ddlSelectCustomer.DataBind();
            selectedCustomer = GetSelectedCustomer();
            lblDisplayAddress.Text = selectedCustomer.Address;
            lblDisplayCity.Text = selectedCustomer.CityStateZipDisplay();

            lblDisplayPhone.Text = selectedCustomer.Phone;
            lblDisplayEmail.Text = selectedCustomer.Email;



        }
        private Customer GetSelectedCustomer()
        {
            DataView customerTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter =
                "Name = '" + ddlSelectCustomer.SelectedValue + "'";
            DataRowView row = (DataRowView)customerTable[0];

            Customer cust = new Customer();

            cust.Name = row["Name"].ToString();
            cust.Address = row["Address"].ToString();
            cust.City = row["City"].ToString();
            cust.State = row["State"].ToString();
            cust.ZipCode = row["ZipCode"].ToString();
            cust.Phone = row["Phone"].ToString();
            cust.Email = row["Email"].ToString();
            return cust;
        }

        protected void btnAddCustomer_Click(object sender, EventArgs e)
        {
            {
                CustomerList customerDetails;
                customerDetails = CustomerList.GetCustomers();
                selectedCustomer = GetSelectedCustomer();
                if (customerDetails.Count != 0 && customerDetails[selectedCustomer.Name] != null)
                {
                    if (customerDetails[selectedCustomer.Name].Name != selectedCustomer.Name)
                    {
                        customerDetails.AddItem(selectedCustomer);
                        Response.Redirect("ContactDisplay.aspx");
                    }
                    else
                    {
                        lblMessage.Visible = true;
                    }
                }
                else
                {
                    customerDetails.AddItem(selectedCustomer);
                    Response.Redirect("ContactDisplay.aspx");
                }
            }
        }

        protected void btnGoContactDisplay_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactDisplay.aspx");
        }

        protected void btnAddCustomer_Click1(object sender, EventArgs e)
        {
            {
                CustomerList customerDetails;
                customerDetails = CustomerList.GetCustomers();
                selectedCustomer = GetSelectedCustomer();
                if (customerDetails.Count != 0 && customerDetails[selectedCustomer.Name] != null)
                {
                    if (customerDetails[selectedCustomer.Name].Name != selectedCustomer.Name)
                    {
                        customerDetails.AddItem(selectedCustomer);
                        Response.Redirect("ContactDisplay.aspx");
                    }
                    else
                    {
                        lblMessage.Visible = true;
                    }
                }
                else
                {
                    customerDetails.AddItem(selectedCustomer);
                    Response.Redirect("ContactDisplay.aspx");
                }
            }
        }

        protected void btnGoContactDisplay_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ContactDisplay.aspx");
        }
    }
}

