using System;
using System.Collections.Generic;

namespace SSO.Domain;

public partial class UserInfo
{
    public string UserId { get; set; } = null!;

    public string UserName { get; set; } = null!;

    public string? NormalizedUserName { get; set; }

    public string Email { get; set; } = null!;

    public string? NormalizedEmail { get; set; }

    public string? PasswordHash { get; set; }

    public string? SecurityStamp { get; set; }

    public string? PhoneNumber { get; set; }

    public DateTimeOffset? LockoutEnd { get; set; }

    public int? AccessFailedCount { get; set; }

    public string? CompanyId { get; set; }

    public string? DefaultCompanyLocationId { get; set; }

    public byte? IsActive { get; set; }

    public int? CreatedBy { get; set; }

    public DateOnly? CreatedOn { get; set; }

    public int? RevisedBy { get; set; }

    public DateOnly? RevisedOn { get; set; }

    public virtual ICollection<AuditLog> AuditLogs { get; set; } = new List<AuditLog>();

    public virtual Company? Company { get; set; }

    public virtual CompanyLocation? DefaultCompanyLocation { get; set; }

    public virtual ICollection<UserClaim> UserClaims { get; set; } = new List<UserClaim>();

    public virtual ICollection<UserLogin> UserLogins { get; set; } = new List<UserLogin>();

    public virtual ICollection<Role> Roles { get; set; } = new List<Role>();
}
