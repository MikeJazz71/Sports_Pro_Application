using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportsProApplication
{
    public class CustomerList
    {


        private List<Customer> customerDetails;
        public CustomerList()
        {
            customerDetails = new List<Customer>();
        }

        public int Count
        {
            get { return customerDetails.Count; }
        }

        public Customer this[int index]
        {
            get { return customerDetails[index]; }
            set { customerDetails[index] = value; }
        }

        public Customer this[string name]
        {
            get
            {
                foreach (Customer c in customerDetails)
                    if (c.Name == name) return c;
                return null;
            }
        }

        public static CustomerList GetCustomers()
        {
            CustomerList customer = (CustomerList)HttpContext.Current.Session["SessionCustomer"]; ;
            if (customer == null)
                HttpContext.Current.Session["SessionCustomer"] = new CustomerList();
            else
                customer = (CustomerList)HttpContext.Current.Session["SessionCustomer"];
            return (CustomerList)HttpContext.Current.Session["SessionCustomer"];
        }

        public void AddItem(Customer customer)
        {
            customerDetails.Add(customer);
        }

        public void RemoveAt(int index)
        {
            customerDetails.RemoveAt(index);
        }

        public void Clear()
        {
            customerDetails.Clear();
        }

    }
}
