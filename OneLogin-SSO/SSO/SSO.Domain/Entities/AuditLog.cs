using System;
using System.Collections.Generic;

namespace SSO.Domain;

public partial class AuditLog
{
    public int AuditLogId { get; set; }

    public string UserId { get; set; } = null!;

    public string Action { get; set; } = null!;

    public string? Details { get; set; }

    public DateTime? Timestamp { get; set; }

    public string? Ipaddress { get; set; }

    public virtual UserInfo User { get; set; } = null!;
}
