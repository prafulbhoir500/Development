using System;
using System.Collections.Generic;

namespace SSO.Domain;

public partial class Company
{
    public string CompanyId { get; set; } = null!;

    public string Name { get; set; } = null!;

    public byte? IsActive { get; set; }

    public int? CreatedBy { get; set; }

    public DateOnly? CreatedOn { get; set; }

    public int? RevisedBy { get; set; }

    public DateOnly? RevisedOn { get; set; }

    public virtual ICollection<CompanyLocation> CompanyLocations { get; set; } = new List<CompanyLocation>();

    public virtual ICollection<UserInfo> UserInfos { get; set; } = new List<UserInfo>();
}
