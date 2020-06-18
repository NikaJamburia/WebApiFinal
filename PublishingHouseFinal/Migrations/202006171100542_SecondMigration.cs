namespace PublishingHouseFinal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SecondMigration : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Authors",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false, maxLength: 50),
                        LastName = c.String(nullable: false, maxLength: 50),
                        gender = c.Int(nullable: false),
                        IdentityNumber = c.String(nullable: false, maxLength: 11),
                        BirthDate = c.DateTime(nullable: false),
                        telephone = c.String(maxLength: 50),
                        Email = c.String(),
                        City_Id = c.Int(),
                        Country_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Cities", t => t.City_Id)
                .ForeignKey("dbo.Countries", t => t.Country_Id)
                .Index(t => t.City_Id)
                .Index(t => t.Country_Id);
            
            CreateTable(
                "dbo.Cities",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Countries",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false, maxLength: 250),
                        ProductType = c.Int(nullable: false),
                        Isnb = c.String(nullable: false, maxLength: 13),
                        PublishDate = c.DateTime(nullable: false),
                        NumberOfpages = c.Int(nullable: false),
                        Address = c.String(),
                        Publisher_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Publishers", t => t.Publisher_Id, cascadeDelete: true)
                .Index(t => t.Publisher_Id);
            
            CreateTable(
                "dbo.Publishers",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.ProductAuthors",
                c => new
                    {
                        Product_Id = c.Int(nullable: false),
                        Author_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.Product_Id, t.Author_Id })
                .ForeignKey("dbo.Products", t => t.Product_Id, cascadeDelete: true)
                .ForeignKey("dbo.Authors", t => t.Author_Id, cascadeDelete: true)
                .Index(t => t.Product_Id)
                .Index(t => t.Author_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Products", "Publisher_Id", "dbo.Publishers");
            DropForeignKey("dbo.ProductAuthors", "Author_Id", "dbo.Authors");
            DropForeignKey("dbo.ProductAuthors", "Product_Id", "dbo.Products");
            DropForeignKey("dbo.Authors", "Country_Id", "dbo.Countries");
            DropForeignKey("dbo.Authors", "City_Id", "dbo.Cities");
            DropIndex("dbo.ProductAuthors", new[] { "Author_Id" });
            DropIndex("dbo.ProductAuthors", new[] { "Product_Id" });
            DropIndex("dbo.Products", new[] { "Publisher_Id" });
            DropIndex("dbo.Authors", new[] { "Country_Id" });
            DropIndex("dbo.Authors", new[] { "City_Id" });
            DropTable("dbo.ProductAuthors");
            DropTable("dbo.Publishers");
            DropTable("dbo.Products");
            DropTable("dbo.Countries");
            DropTable("dbo.Cities");
            DropTable("dbo.Authors");
        }
    }
}
