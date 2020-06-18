using PublishingHouseFinal.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding;

namespace PublishingHouseFinal.Validators
{
    public class ProductPublisherValidator : AdditionalValidator<Product>
    {
        private DbSet<Publisher> Publishers;

        public ProductPublisherValidator(DbSet<Publisher> publishers)
        {
            Publishers = publishers;
        }

        public ModelStateDictionary check(Product entity, ModelStateDictionary modelState)
        {
            if (Publishers.Find(entity.Publisher.Id) != null)
            {
                return modelState;
            }
            else
            {
                modelState.AddModelError("Publisher", "Publisher does not exist");
                return modelState;
            }
        }

    }
}