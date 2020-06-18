using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http.ModelBinding;

namespace PublishingHouseFinal.Validators
{
    interface AdditionalValidator<T>
    {
        ModelStateDictionary check(T entity, ModelStateDictionary modelState);
    }
}
