using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodDeliveryApp
{
    public partial class MemberHome : System.Web.UI.Page
    {
        int usrID = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["username"] != null)
                {
                    userName.InnerText = "Welcome " + Session["username"] + " !!";
                }
                BindProducts();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            List<FoodDeliveryWebApi.Product> products = new List<FoodDeliveryWebApi.Product>();

            using (var client = new HttpClient())
            {
                FoodDeliveryWebApi.Product productObj = new FoodDeliveryWebApi.Product
                {
                    PName = txtName.Text,
                    Price = Convert.ToDouble(txtPrice.Text),
                    Detail = txtDetail.Text,
                    Image = "Images/sample_image.jpg",//txtImage.Text,
                    UserID = 1,
                    Status =0,
                 };
                client.BaseAddress = new Uri("http://localhost:58374/");


                var json = new JavaScriptSerializer().Serialize(productObj);
                var content = new StringContent(json, Encoding.UTF8, "application/json");



                var response = client.PostAsync("api/Product", content).Result;
                if (response.IsSuccessStatusCode)
                {
                    BindProducts();
                }
                else
                {
                    //Console.Write("Error");
                }

            }


        }

        private void BindProducts()
        {
            List<FoodDeliveryWebApi.Product> products = new List<FoodDeliveryWebApi.Product>();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:58374/");
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var response = client.GetAsync(string.Format("api/Product?UId={0}", usrID)).Result;
                if (response.IsSuccessStatusCode)
                {
                    var result = response.Content.ReadAsStringAsync().Result;

                    if (result != "null")
                    {
                        var json = new JavaScriptSerializer();
                        products = json.Deserialize<List<FoodDeliveryWebApi.Product>>(result);
                        
                        if (products != null)
                        {
                            gvProducts.DataSource = CreateDataTable(products.ToList());
                            gvProducts.DataBind();
                        }
                        else
                        {
                            Response.Redirect("UserHome.aspx");

                        }
                    }
                    else
                    {
                        //lblmsg.Text = "Invalid username or password";

                    }
                }
            }
        }

        private DataTable CreateDataTable(IList<FoodDeliveryWebApi.Product> item)
        {
            Type type = typeof(FoodDeliveryWebApi.Product);
            var properties = type.GetProperties();

            DataTable dataTable = new DataTable();
            foreach (PropertyInfo info in properties)
            {
                dataTable.Columns.Add(new DataColumn(info.Name, Nullable.GetUnderlyingType(info.PropertyType) ?? info.PropertyType));
            }

            foreach (FoodDeliveryWebApi.Product entity in item)
            {
                object[] values = new object[properties.Length];
                for (int i = 0; i < properties.Length; i++)
                {
                    values[i] = properties[i].GetValue(entity);
                }

                dataTable.Rows.Add(values);
            }
            return dataTable;
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            LinkButton cmdDel = sender as LinkButton;
            GridViewRow gRow = cmdDel.NamingContainer as GridViewRow;
            int? pID = gvProducts.DataKeys[gRow.RowIndex]["PID"] as int?;

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:58374/");
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var response = client.DeleteAsync(string.Format("api/Product?id={0}", pID)).Result;
                if (response.IsSuccessStatusCode)
                {
                    var result = response.Content.ReadAsStringAsync().Result;

                    if (result != "null")
                    {
                        BindProducts();
                    }
                    else
                    {
                        //lblmsg.Text = "Invalid username or password";
                    }
                }
            }

        }
    }
}