using PublishingHouseFinal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.ModelBinding;

namespace PublishingHouseFinal.Validators
{
    public class AuthorAgeValidator : AdditionalValidator<Author>
    {
        public ModelStateDictionary check(Author entity, ModelStateDictionary modelState)
        {
            if(DateTime.Now.AddYears(-18) > entity.BirthDate)
            {
                return modelState;
            }
            else
            {
                modelState.AddModelError("BirthDate", "Author must be older then 18");
                return modelState;
            }
        }
    }
}