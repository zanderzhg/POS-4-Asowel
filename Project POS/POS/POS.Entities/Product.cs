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

using System;

#pragma warning disable 1591    //  Ignore "Missing XML Comment" warning


namespace POS.Entities
{

    // Product
    [Serializable]
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class Product
    {
        public string ProductId { get; set; } // product_id (Primary key) (length: 10)
        public string Name { get; set; } // name (length: 50)
        public string Info { get; set; } // info (length: 100)
        public decimal Price { get; set; } // price
        public int Type { get; set; } // type
        public int Deleted { get; set; } // deleted
        public string ImageLink { get; set; } // ImageLink
        public int Discount { get; set; } // Discount
        public string StandardStats { get; set; } //length(50)

        // Reverse navigation
        
        /// <summary>
        /// Child OrderNoteDetails where [OrderNoteDetails].[product_id] point to this entity (FK_dbo.OrderNoteDetails_dbo.Product_product_id)
        /// </summary>
        public virtual System.Collections.Generic.ICollection<OrderNoteDetail> OrderNoteDetails { get; set; } // OrderNoteDetails.FK_dbo.OrderNoteDetails_dbo.Product_product_id
        /// <summary>
        /// Child ProductDetails where [ProductDetails].[product_id] point to this entity (FK_dbo.ProductDetails_dbo.Product_product_id)
        /// </summary>
        public virtual System.Collections.Generic.ICollection<ProductDetail> ProductDetails { get; set; } // ProductDetails.FK_dbo.ProductDetails_dbo.Product_product_id

        public Product()
        {
            OrderNoteDetails = new System.Collections.Generic.List<OrderNoteDetail>();
            ProductDetails = new System.Collections.Generic.List<ProductDetail>();
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>