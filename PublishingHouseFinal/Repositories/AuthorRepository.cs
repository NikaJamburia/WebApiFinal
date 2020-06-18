using PublishingHouseFinal.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace PublishingHouseFinal.Repositories
{
    public class AuthorRepository : CrudRepository<Author>
    {
        private PublishingHouseDatabase Database;

        public AuthorRepository(PublishingHouseDatabase db)
        {
            Database = db;
        }

        public bool delete(int id)
        {
            try
            {
                Database.Authors.Remove(getById(id));
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
            if (Database.Authors.Find(id) == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public List<Author> getAll()
        {
            List<Author> authors = Database.Authors.ToList();
            foreach (Author author in authors)
            {
                Database.Entry(author).Collection(a => a.Products).Load();
                Database.Entry(author).Reference(a => a.City).Load();
                Database.Entry(author).Reference(a => a.Country).Load();
            }

            return authors;
        }

        public Author getById(int id)
        {
            try
            {
                Author author = Database.Authors.Find(id);
                Database.Entry(author).Collection(a => a.Products).Load();
                Database.Entry(author).Reference(a => a.City).Load();
                Database.Entry(author).Reference(a => a.Country).Load();
                return author;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public Author save(Author entity)
        {
            City city = Database.Cities.Find(entity.City.Id);
            Country country = Database.Countries.Find(entity.Country.Id);

            if (city != null && country != null)
            {
                entity.City = city;
                entity.Country = country;
                Author newAuthor = Database.Authors.Add(entity);
                Database.SaveChanges();
                return newAuthor;
            }
            else
            {
                throw new Exception("city or country not found");
            }

        }

        public Author update(Author updatedEntity, int id)
        {
            Author authorToUpdate = getById(id);
            try
            {
                Database.Entry(authorToUpdate).CurrentValues.SetValues(updatedEntity);
                Database.SaveChanges();
            }
            catch(Exception e)
            {
                throw e;
            }
            return updatedEntity;
        }
    }
}