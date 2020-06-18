using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Runtime.Serialization;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.ModelBinding;
using System.Xml.Serialization;
using PublishingHouseFinal.Models;
using PublishingHouseFinal.Repositories;
using PublishingHouseFinal.Validators;

namespace PublishingHouseFinal.Controllers
{
    public class AuthorsController : ApiController
    {
        private PublishingHouseDatabase db = new PublishingHouseDatabase();
        private CrudRepository<Author> authorRepository;
        private CrudRepository<Product> productRepository;

        private List<AdditionalValidator<Author>> additionalValidators;

        public AuthorsController()
        {
            authorRepository = new AuthorRepository(db);
            productRepository = new ProductRepository(db);

            additionalValidators = new List<AdditionalValidator<Author>>
            {
                new AuthorAgeValidator(),
                new AuthorLocationvalidator(db.Cities, db.Countries)
            };
        }

        // GET: api/Authors
        public ICollection<Author> GetAuthors()
        {
            return authorRepository.getAll();
        }

        // GET: api/Authors/5
        [ResponseType(typeof(Author))]
        public IHttpActionResult GetAuthor(int id)
        {
            try
            {
                return Ok(authorRepository.getById(id));
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        // PUT: api/Authors/5
        [ResponseType(typeof(Author))]
        public IHttpActionResult PutAuthor(int id, Author author)
        {
            performAdditionalValidation(ModelState, author);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                return Ok(authorRepository.update(author, id));
            }
            catch (Exception e)
            {
                return NotFound();
            }

        }

        // POST: api/Authors
        [ResponseType(typeof(Author))]
        public IHttpActionResult PostAuthor(Author author)
        {
            performAdditionalValidation(ModelState, author);
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            return Ok(authorRepository.save(author));

        }

        // DELETE: api/Authors/5
        [ResponseType(typeof(bool))]
        public IHttpActionResult DeleteAuthor(int id)
        {

            try
            {
                return Ok(authorRepository.delete(id));
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        [Route("api/authors/{id}/addProduct")]
        [HttpPost]
        public IHttpActionResult AddProduct(int id, [FromBody] AddProductToAuthorRequest request)
        {
            try
            {
                Author author = authorRepository.getById(id);
                if (productRepository.exists(request.ProductId))
                {
                    author.Products.Add(productRepository.getById(request.ProductId));
                    db.SaveChanges();
                    return Ok(author);
                }
                else
                {
                    return BadRequest("Product does not exist");
                }
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        [Route("api/authors/{id}/removeProduct")]
        [HttpDelete]
        public IHttpActionResult RemoveProduct(int id, AddProductToAuthorRequest request)
        {
            try
            {
                Author author = authorRepository.getById(id);
                if (productRepository.exists(request.ProductId))
                {
                    author.Products.Remove(productRepository.getById(request.ProductId));
                    db.SaveChanges();
                    return Ok(author);
                }
                else
                {
                    return BadRequest("Product does not exist");
                }
            }
            catch (Exception e)
            {
                return NotFound();
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private void performAdditionalValidation(ModelStateDictionary modelState, Author author)
        {
            foreach (AdditionalValidator<Author> validator in additionalValidators)
            {
                modelState = validator.check(author, modelState);
            }
        }

    }

    [DataContract(Namespace = "")]
    public class AddProductToAuthorRequest
    {

        public AddProductToAuthorRequest() { }
        [DataMember]
        public int ProductId { get; set; }
    }
}