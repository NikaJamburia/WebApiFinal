namespace PublishingHouseFinal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Ragaca2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Annotation", c => c.String(nullable: false, maxLength: 500));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Products", "Annotation");
        }
    }
}
