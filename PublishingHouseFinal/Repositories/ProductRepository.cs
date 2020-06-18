using PublishingHouseFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PublishingHouseFinal.Repositories
{
    public class ProductRepository : CrudRepository<Product>
    {

        private PublishingHouseDatabase Database;

        public ProductRepository(PublishingHouseDatabase db)
        {
            Database = db;
        }
        public bool delete(int id)
        {
            try
            {
                Database.Products.Remove(getById(id));
                Database.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool exists(int id)
        {
            if (Database.Products.Find(id) == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public List<Product> getAll()
        {
            List<Product> products = Database.Products.ToList();
            foreach (Product product in products)
            {
                Database.Entry(product).Collection(p => p.Authors).Load();
                Database.Entry(product).Reference(p => p.Publisher).Load();
            }

            return products;
        }

        public Product getById(int id)
        {
            try
            {
                Product product = Database.Products.Find(id);
                Database.Entry(product).Collection(p => p.Authors).Load();
                Database.Entry(product).Reference(p => p.Publisher).Load();
                return product;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public Product save(Product entity)
        {
            Publisher publisher = Database.Publishers.Find(entity.Publisher.Id);
            if (publisher != null)
            {
                entity.Publisher = publisher;
                Product newProduct = Database.Products.Add(entity);
                Database.SaveChanges();
                return newProduct;
            }
            else
            {
                throw new Exception("Publisher does not exist");
            }

        }

        public Product update(Product updatedEntity, int id)
        {
            Product productToUpdate = getById(id);
            try
            {
                Database.Entry(productToUpdate).CurrentValues.SetValues(updatedEntity);
                Database.SaveChanges();
            }
            catch (Exception e)
            {
                throw e;
            }
            return updatedEntity;
        }
    }
}