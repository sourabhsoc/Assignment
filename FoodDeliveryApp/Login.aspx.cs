using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodDeliveryApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Text = "";
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            string usrName = txtusername.Text.Trim();
            string usrPswrd = txtpassword.Text.Trim();

            FoodDeliveryWebApi.User user = new FoodDeliveryWebApi.User();
            using (var client = new HttpClient())
            {
               // client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //client.DefaultRequestHeaders.Add("x-api-key", secretValue);


                client.BaseAddress = new Uri("http://localhost:58374/");

                
                client.DefaultRequestHeaders.Clear();

                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));


                var response = client.GetAsync(string.Format("api/User?emailId={0}&passwrd={1}", usrName, usrPswrd)).Result;
                if (response.IsSuccessStatusCode)
                {
                    var result = response.Content.ReadAsStringAsync().Result;

                    if(result != "null")
                    {
                        var json = new JavaScriptSerializer();
                        user = json.Deserialize<FoodDeliveryWebApi.User>(result);

                        Session["username"] = user.Fname + " " + user.Lname;
                        Session["userid"] = user.UID;
                        if (user.Role == 1)
                        {

                            Response.Redirect("MemberHome.aspx");

                        }
                        else
                        {
                            Response.Redirect("UserHome.aspx");

                        }
                        

                    }
                    else
                    {
                        lblmsg.Text = "Invalid username or password";

                    }

                }

            }




            

        }
    }
}