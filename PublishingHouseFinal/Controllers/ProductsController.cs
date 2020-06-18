using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.ModelBinding;
using PublishingHouseFinal.Models;
using PublishingHouseFinal.Repositories;
using PublishingHouseFinal.Validators;

namespace PublishingHouseFinal.Controllers
{
    public class ProductsController : ApiController
    {
        private PublishingHouseDatabase db = new PublishingHouseDatabase();
        private CrudRepository<Product> repository;
        private List<AdditionalValidator<Product>> additionalValidators;

        public ProductsController()
        {
            repository = new ProductRepository(db);

            additionalValidators = new List<AdditionalValidator<Product>>
            {
                new ProductAddressValidator(),
                new ProductPublisherValidator(db.Publishers)
            };
        }

        // GET: api/Products
        public List<Product> GetProducts()
        {
            return repository.getAll();
        }

        // GET: api/Products/5
        [ResponseType(typeof(Product))]
        public IHttpActionResult GetProduct(int id)
        {
            try
            {
                return Ok(repository.getById(id));
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        // PUT: api/Products/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProduct(int id, Product product)
        {
            performAdditionalValidation(ModelState, product);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                return Ok(repository.update(product, id));
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        // POST: api/Products
        [ResponseType(typeof(Product))]
        public IHttpActionResult PostProduct(Product product)
        {
            performAdditionalValidation(ModelState, product);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(repository.save(product));
        }

        // DELETE: api/Products/5
        [ResponseType(typeof(Product))]
        public IHttpActionResult DeleteProduct(int id)
        {
            try
            {
                return Ok(repository.delete(id));
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        [Route("api/products/{id}/authors")]
        [HttpGet]
        public IHttpActionResult Authors(int id)
        {
            return Ok(repository.getById(id).Authors);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private void performAdditionalValidation(ModelStateDictionary modelState, Product product)
        {
            foreach(AdditionalValidator<Product> validator in additionalValidators)
            {
                modelState = validator.check(product, modelState);
            }
        }

    }
}