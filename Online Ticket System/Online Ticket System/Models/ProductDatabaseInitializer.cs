using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Online_Ticket_System.Models
{
    public class ProductDatabaseInitializer : DropCreateDatabaseIfModelChanges<ProductContext>
    {

        protected override void Seed(ProductContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetProducts().ForEach(p => context.Products.Add(p));
        }

        private static List<Category> GetCategories()
        {
            var categories = new List<Category> {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Concert"
                },

                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Sport"
                },

                new Category
                {
                    CategoryID = 3,
                    CategoryName = "Movies"
                },
            };

            return categories;
        }


        private static List<Product> GetProducts()
        {
            var products = new List<Product> {
                 new Product
                {
                    ProductID = 1, 
                    ProductName = "Justin Timberlake",
                    Description = "Justin Timberlake will be performed on 1/31/15",
                    UnitPrice = 100,
                    CategoryID = 1

                },

                 new Product
                {
                    ProductID = 2, 
                    ProductName = "Katie Perry",
                    Description = "Katie will be performed on 2/2/15",
                    UnitPrice = 100,
                    CategoryID = 1
                },

                 new Product
                {
                    ProductID = 3, 
                    ProductName = "Lady Gaga",
                    Description = "Lady Gaga will be performed on 3/2/15",
                    UnitPrice = 100,
                    CategoryID = 1
                },

                 new Product
                {
                    ProductID = 4, 
                    ProductName = "Maroon 5",
                    Description = "Adam Levine will be performed on 4/2/15",
                    UnitPrice = 100,
                    CategoryID = 1
                },

                

                 new Product
                {
                    ProductID = 5, 
                    ProductName = "Green Bay vs SeaHawks",
                    Description = " will be performed on 1/18/15",
                    UnitPrice = 200,
                    CategoryID = 2
                },


                  new Product
                {
                    ProductID = 6, 
                    ProductName = "Night at the museum",
                    Description = "This movie is coming out on 12/20/15",
                    UnitPrice = 11.50,
                    CategoryID = 3
                },

                 new Product
                {
                    ProductID = 7, 
                    ProductName = "The Hobbit",
                    Description = "This movie is coming out on 12/14/14",
                    UnitPrice = 11.50,
                    CategoryID = 3
                }, 

            };

            return products;
        }
    }
}