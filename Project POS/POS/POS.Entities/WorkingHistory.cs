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


namespace POS.Entities
{

    // WorkingHistory
    [System.CodeDom.Compiler.GeneratedCode("EF.Reverse.POCO.Generator", "2.33.0.0")]
    public partial class WorkingHistory
    {
        public string WhId { get; set; } // wh_id (Primary key) (length: 10)
        public string ResultSalary { get; set; } // result_salary (length: 10)
        public string EmpId { get; set; } // emp_id (length: 10)
        public System.DateTime StartTime { get; set; } // startTime
        public System.DateTime EndTime { get; set; } // endTime

        // Foreign keys

        /// <summary>
        /// Parent Employee pointed by [WorkingHistory].([EmpId]) (FK_dbo.WorkingHistory_dbo.Employee_emp_id)
        /// </summary>
        public virtual Employee Employee { get; set; } // FK_dbo.WorkingHistory_dbo.Employee_emp_id

        /// <summary>
        /// Parent SalaryNote pointed by [WorkingHistory].([ResultSalary]) (FK_dbo.WorkingHistory_dbo.SalaryNote_result_salary)
        /// </summary>
        public virtual SalaryNote SalaryNote { get; set; } // FK_dbo.WorkingHistory_dbo.SalaryNote_result_salary

        public WorkingHistory()
        {
            StartTime = System.DateTime.Now;
            EndTime = System.DateTime.Now;
            InitializePartial();
        }

        partial void InitializePartial();
    }

}
// </auto-generated>
