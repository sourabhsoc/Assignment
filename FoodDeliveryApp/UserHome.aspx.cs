using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodDeliveryApp
{
    public partial class UserHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                if (Session["username"] != null)
                {
                    userName.InnerText = "Welcome "+ Session["username"] + " !!";
                }
                BindProducts();

                if(Session["cart"] == null)
                {
                    btnCart.ForeColor = System.Drawing.Color.White;
                    List<int> carList = new List<int>();
                    Session["cart"] = carList;
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

                var response = client.GetAsync(string.Format("api/Product")).Result;
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Button cmdAdd = sender as Button;
            GridViewRow gRow = cmdAdd.NamingContainer as GridViewRow;
            int? pID = gvProducts.DataKeys[gRow.RowIndex]["PID"] as int?;

            if (Session["cart"] != null)
            {
                List<int> objlt = (List<int>)Session["cart"];
                objlt.Add((int)pID);
                Session["cart"] = objlt;

                btnCart.ForeColor = System.Drawing.Color.Red;
                btnCart.Text = "Cart " + objlt.Count;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}