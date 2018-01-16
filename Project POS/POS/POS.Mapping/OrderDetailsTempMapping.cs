// <auto-generated>
// ReSharper disable ConvertPropertyToExpressionBody
// ReSharper disable DoNotCallOverridableMethodsInConstructor
// ReSharper disable EmptyNamespace
// ReSharper disable InconsistentNaming
// ReSharper disable PartialMethodWithSinglePart
// ReSharper disable PartialTypeWithSinglePart
// ReSharper disable RedundantNameQualifier
// ReSharper disable RedundantOverridenMember
// ReSharper disable UseNameofExpression
// TargetFrameworkVersion = 4.6
#pragma warning disable 1591    //  Ignore "Missing XML Comment" warning


namespace POS.Mapping
{
    using POS.Entities;

    // OrderDetailsTemp
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class OrderDetailsTempMapping : System.Data.Entity.ModelConfiguration.EntityTypeConfiguration<OrderDetailsTemp>
    {
        public OrderDetailsTempMapping()
            : this("dbo")
        {
        }

        public OrderDetailsTempMapping(string schema)
        {
            ToTable("OrderDetailsTemp", schema);
            HasKey(x => new { x.OrdertempId, x.ProductId, x.ChairId, x.SelectedStats, x.Note, x.IsPrinted });

            Property(x => x.OrdertempId).HasColumnName(@"ordertemp_id").HasColumnType("int").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.ProductId).HasColumnName(@"product_id").HasColumnType("varchar").IsRequired().IsUnicode(false).HasMaxLength(10).HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.ChairId).HasColumnName(@"chair_id").HasColumnType("int").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.SelectedStats).HasColumnName(@"SelectedStats").HasColumnType("nvarchar").HasMaxLength(50).IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.Note).HasColumnName(@"note").HasColumnType("varchar").IsUnicode(false).HasMaxLength(500).IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.IsPrinted).HasColumnName(@"is_printed").HasColumnType("int").IsRequired().HasDatabaseGeneratedOption(System.ComponentModel.DataAnnotations.Schema.DatabaseGeneratedOption.None);
            Property(x => x.Quan).HasColumnName(@"quan").HasColumnType("int").IsRequired();
            Property(x => x.Discount).HasColumnName(@"discount").HasColumnType("int").IsRequired();
            
            Ignore(x => x.OldStat);
            

            // Foreign keys
            HasRequired(a => a.Chair).WithMany(b => b.OrderDetailsTemps).HasForeignKey(c => c.ChairId).WillCascadeOnDelete(false); // fk_chair_id_orderdetailtemp
            HasRequired(a => a.OrderTemp).WithMany(b => b.OrderDetailsTemps).HasForeignKey(c => c.OrdertempId).WillCascadeOnDelete(false); // fk_ordertemp_id_orderdetailtemp
          
            InitializePartial();
        }
        partial void InitializePartial();
    }

}
// </auto-generated>
