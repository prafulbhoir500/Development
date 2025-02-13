using System;
using System.Collections.Generic;

namespace SSO.Domain;

public partial class CompanyLocation
{
    public string CompanyLocationId { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string CompanyId { get; set; } = null!;

    public byte? IsActive { get; set; }

    public int? CreatedBy { get; set; }

    public DateOnly? CreatedOn { get; set; }

    public int? RevisedBy { get; set; }

    public DateOnly? RevisedOn { get; set; }

    public virtual Company Company { get; set; } = null!;

    public virtual ICollection<UserInfo> UserInfos { get; set; } = new List<UserInfo>();
}
