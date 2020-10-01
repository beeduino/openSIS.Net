﻿using System;
using System.Collections.Generic;

namespace opensis.data.Models
{
    public partial class SchoolYears
    {
        public SchoolYears()
        {
            Semesters = new HashSet<Semesters>();
        }

        public Guid TenantId { get; set; }
        public int SchoolId { get; set; }
        public int MarkingPeriodId { get; set; }
        public decimal? AcademicYear { get; set; }
        public string Title { get; set; }
        public string ShortName { get; set; }
        public decimal? SortOrder { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public DateTime? PostStartDate { get; set; }
        public DateTime? PostEndDate { get; set; }
        public bool? DoesGrades { get; set; }
        public bool? DoesExam { get; set; }
        public bool? DoesComments { get; set; }
        public int? RolloverId { get; set; }
        public DateTime? LastUpdated { get; set; }
        public string UpdatedBy { get; set; }

        public virtual SchoolMaster SchoolMaster { get; set; }
        public virtual ICollection<Semesters> Semesters { get; set; }
    }
}
