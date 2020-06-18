namespace PublishingHouseFinal.Models
{
    using System;
    using System.Data.Entity;
    using System.Linq;

    public class PublishingHouseDatabase : DbContext
    {
        public PublishingHouseDatabase()
            : base("name=PublishingHouseDatabase")
        {
            Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Publisher> Publishers { get; set; }

    }

}