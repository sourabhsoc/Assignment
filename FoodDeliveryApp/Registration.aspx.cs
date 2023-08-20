using FoodDeliveryWebApi.Models;
using System.Web.Script.Serialization;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodDeliveryApp
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
            else
            {
                //SelectedDoc = docList.SelectedValue; //this will be set on postback and will contain the selected value.
            }
        }

        protected void ddlRole_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<string> DDLlist = new List<string>();
                DDLlist.Add("User");
                DDLlist.Add("Member");
                ddlRole.DataSource = DDLlist;
                ddlRole.SelectedValue = "User";
                ddlRole.DataBind();
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (var client = new HttpClient())
            {
                FoodDeliveryWebApi.User userObj = new FoodDeliveryWebApi.User
                { UID = 0,
                    Fname = txtfname.Text,
                    Lname = txtlname.Text,
                    Mobile = txtmobile.Text,
                    Gender = (rdomale.Checked == true ? "1" : "2"),
                    Address = txtadd.Text,
                    City = txtcity.Text,
                    Pincode = txtpincode.Text,
                    Email = txtemail.Text,
                    Password = txtpass.Text,
                    Role = ddlRole.SelectedIndex,
                    Edate= DateTime.Now };
                client.BaseAddress = new Uri("http://localhost:58374/");


                var json = new JavaScriptSerializer().Serialize(userObj);
                var content = new StringContent(json, Encoding.UTF8, "application/json");



                var response = client.PostAsync("api/User", content).Result;
                if (response.IsSuccessStatusCode)
                {
                    //Console.Write("Success");
                }
                else
                {
                    //Console.Write("Error");
                }

            }
        }
    }
}