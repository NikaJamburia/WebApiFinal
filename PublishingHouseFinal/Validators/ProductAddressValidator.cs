using PublishingHouseFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding;

namespace PublishingHouseFinal.Validators
{
    public class ProductAddressValidator : AdditionalValidator<Product>
    {
        public ModelStateDictionary check(Product entity, ModelStateDictionary modelState)
        {
            bool isValidAddress;
            string errorText;
            if (entity.ProductType == ProductType.BOOK)
            {
                isValidAddress = entity.Address.Contains("rigi") && entity.Address.Contains("taro");
                errorText = "Book should have physical address";
            }
            else
            {
                isValidAddress = entity.Address.StartsWith("http://") || entity.Address.StartsWith("https://");
                errorText = "Article and resource should have URL address";
            }

            if(isValidAddress)
            {
                return modelState;
            }
            else
            {
                modelState.AddModelError("Address", errorText);
                return modelState;
            }
        }

    }
}