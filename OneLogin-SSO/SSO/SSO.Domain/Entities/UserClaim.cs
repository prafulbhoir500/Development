using System;
using System.Collections.Generic;

namespace SSO.Domain;

public partial class UserClaim
{
    public int ClaimId { get; set; }

    public string UserId { get; set; } = null!;

    public string ClaimType { get; set; } = null!;

    public string ClaimValue { get; set; } = null!;

    public virtual UserInfo User { get; set; } = null!;
}
