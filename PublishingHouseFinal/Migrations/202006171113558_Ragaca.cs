namespace PublishingHouseFinal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Ragaca : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Cities", "Name", c => c.String());
            AlterColumn("dbo.Countries", "Name", c => c.String());
            AlterColumn("dbo.Publishers", "Name", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Publishers", "Name", c => c.String(nullable: false));
            AlterColumn("dbo.Countries", "Name", c => c.String(nullable: false));
            AlterColumn("dbo.Cities", "Name", c => c.String(nullable: false));
        }
    }
}
