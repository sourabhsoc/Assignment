using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FoodDeliveryWebApi.Controllers
{
    public class ProductController : ApiController
    {
        // GET api/<controller>
        public List<Product> Get()
        {
            List<Product> products = new List<Product>();
            using (fooddelivery_dbEntities context = new fooddelivery_dbEntities())
            {
                context.Configuration.ProxyCreationEnabled = false;
                products = context.Products.ToList();
            }

            return products;
        }

        // GET api/<controller>/5
        public List<Product> Get(int UId)
        {
            List<Product> products = new List<Product>();
            using (fooddelivery_dbEntities context = new fooddelivery_dbEntities())
            {
                context.Configuration.ProxyCreationEnabled = false;
                products = context.Products.Where(a => a.UserID == UId).ToList();
            }

            return products;
        }

        // POST api/<controller>
        public void Post([FromBody] Product value)
        {
            using (fooddelivery_dbEntities context = new fooddelivery_dbEntities())
            {
                context.Products.Add(value);
                context.SaveChanges();
            }
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
            using (fooddelivery_dbEntities context = new fooddelivery_dbEntities())
            {
                var product = context.Products.Where(a => a.PID == id).FirstOrDefault();
                if(product!= null)
                {
                    context.Products.Remove(product);
                    context.SaveChanges();
                }
            }
        }
    }
}