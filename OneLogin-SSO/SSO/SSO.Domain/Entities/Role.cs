using System;
using System.Collections.Generic;

namespace SSO.Domain;

public partial class Role
{
    public string RoleId { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? NormalizedName { get; set; }

    public string? ConcurrencyStamp { get; set; }

    public byte? IsActive { get; set; }

    public int? CreatedBy { get; set; }

    public DateOnly? CreatedOn { get; set; }

    public int? RevisedBy { get; set; }

    public DateOnly? RevisedOn { get; set; }

    public virtual ICollection<UserInfo> Users { get; set; } = new List<UserInfo>();
}
