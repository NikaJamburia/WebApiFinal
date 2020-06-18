using PublishingHouseFinal.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding;

namespace PublishingHouseFinal.Validators
{
    public class AuthorLocationvalidator : AdditionalValidator<Author>
    {
        private DbSet<City> Cities;
        private DbSet<Country> Countries;

        public AuthorLocationvalidator(DbSet<City> cities, DbSet<Country> countries)
        {
            Cities = cities;
            Countries = countries;
        }

        public ModelStateDictionary check(Author entity, ModelStateDictionary modelState)
        {
            if (Cities.Find(entity.City.Id) != null && Countries.Find(entity.Country.Id) != null)
            {
                return modelState;
            }
            else
            {
                modelState.AddModelError("City or Country", "City or Country does not exist");
                return modelState;
            }
        }

    }
}