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


namespace POS.Interfaces
{
    using POS.Entities;

    public interface ICloudContext : System.IDisposable
    {
        System.Data.Entity.DbSet<ApplicationLog> ApplicationLogs { get; set; } // ApplicationLog
        System.Data.Entity.DbSet<AdminRe> AdminRes { get; set; } // AdminRes
        System.Data.Entity.DbSet<Customer> Customers { get; set; } // Customer
        System.Data.Entity.DbSet<Employee> Employees { get; set; } // Employee
        System.Data.Entity.DbSet<Ingredient> Ingredients { get; set; } // Ingredient
        System.Data.Entity.DbSet<OrderNote> OrderNotes { get; set; } // OrderNote
        System.Data.Entity.DbSet<OrderNoteDetail> OrderNoteDetails { get; set; } // OrderNoteDetails
        System.Data.Entity.DbSet<Product> Products { get; set; } // Product
        System.Data.Entity.DbSet<ProductDetail> ProductDetails { get; set; } // ProductDetails
        System.Data.Entity.DbSet<ReceiptNote> ReceiptNotes { get; set; } // ReceiptNote
        System.Data.Entity.DbSet<ReceiptNoteDetail> ReceiptNoteDetails { get; set; } // ReceiptNoteDetails
        System.Data.Entity.DbSet<SalaryNote> SalaryNotes { get; set; } // SalaryNote
        System.Data.Entity.DbSet<WareHouse> WareHouses { get; set; } // WareHouse
        System.Data.Entity.DbSet<WorkingHistory> WorkingHistories { get; set; } // WorkingHistory

        int SaveChanges();
        System.Threading.Tasks.Task<int> SaveChangesAsync();
        System.Threading.Tasks.Task<int> SaveChangesAsync(System.Threading.CancellationToken cancellationToken);
        System.Data.Entity.Infrastructure.DbChangeTracker ChangeTracker { get; }
        System.Data.Entity.Infrastructure.DbContextConfiguration Configuration { get; }
        System.Data.Entity.Database Database { get; }
        System.Data.Entity.Infrastructure.DbEntityEntry<TEntity> Entry<TEntity>(TEntity entity) where TEntity : class;
        System.Data.Entity.Infrastructure.DbEntityEntry Entry(object entity);
        System.Collections.Generic.IEnumerable<System.Data.Entity.Validation.DbEntityValidationResult> GetValidationErrors();
        System.Data.Entity.DbSet Set(System.Type entityType);
        System.Data.Entity.DbSet<TEntity> Set<TEntity>() where TEntity : class;
        string ToString();
    }

}
// </auto-generated>
