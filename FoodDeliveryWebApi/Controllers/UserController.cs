using FoodDeliveryWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FoodDeliveryWebApi.Controllers
{
    public class UserController : ApiController
    {
        public string Get()
        {
            var con = new System.Data.SqlClient.SqlConnection();
            try
            {
                
                con.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Sample_Apps\Web_Apps\FoodDeliveryWebApi\App_Data\fooddelivery_db.mdf;Integrated Security=True";
                con.Open();

                con.Close();
            }
            catch(Exception ex)
            {

            }
            finally
            {
                if(con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }




            return "Welcome To Web API";
        }

        // GET api/values/5
        public User Get(string emailId, string passwrd)
        {
            User usr = new User();
            using (fooddelivery_dbEntities context = new fooddelivery_dbEntities())
            {
                context.Configuration.ProxyCreationEnabled = false;
                usr = context.Users.Where(a => a.Email.Equals(emailId) && a.Password.Equals(passwrd)).FirstOrDefault();
            }

            return usr;
        }


        // POST api/values
        public void Post([FromBody] User value)
        {
            using (fooddelivery_dbEntities context  = new fooddelivery_dbEntities() )
            {
                context.Users.Add(value);
                context.SaveChanges();
            }
        }


    }
}
