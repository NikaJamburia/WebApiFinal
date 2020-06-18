using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace PublishingHouseFinal.Models
{
    [DataContract(IsReference = true, Namespace = "")]
    public class Product
    {
        public Product() { }
        [DataMember]
        public int Id { get; set; }
        [DataMember]
        [Required]
        [MinLength(2)]
        [MaxLength(250)]
        public string Title { get; set; }
        [DataMember]
        [Required]
        [MinLength(100)]
        [MaxLength(500)]
        public string Annotation { get; set; }
        [DataMember]
        [Required]
        [EnumDataType(typeof(ProductType))]
        public ProductType ProductType { get; set; }
        [DataMember]
        [Required]
        [MaxLength(13)]
        [MinLength(13)]
        public string Isnb { get; set; }
        [DataMember]
        [Required]
        [DataType(DataType.Date)]
        public DateTime PublishDate { get; set; }
        [DataMember]
        [Required]
        public Publisher Publisher { get; set; }
        [DataMember]
        public int NumberOfpages { get; set; }
        [DataMember]
        public string Address { get; set; }

        public virtual ICollection<Author> Authors { get; set; }
    }
}