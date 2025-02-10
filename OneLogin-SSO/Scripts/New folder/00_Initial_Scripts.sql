-- ==============================
-- 1. Create Companies Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Companies]') AND type IN (N'U'))
BEGIN
    CREATE TABLE Companies (
        CompanyID NVARCHAR(450) NOT NULL,
        Name NVARCHAR(256) NOT NULL,
        IsActive TINYINT,
        CreatedBy INT,
        CreatedOn DATE,
        RevisedBy INT,
        RevisedOn DATE,

        CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED ([CompanyID] ASC)
    ) ON [PRIMARY]
END

-- ==============================
-- 2. Create Company Locations Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CompanyLocations]') AND type IN (N'U'))
BEGIN
    CREATE TABLE CompanyLocations (
        CompanyLocationID NVARCHAR(450) NOT NULL,
        Name NVARCHAR(256) NOT NULL,
        CompanyID NVARCHAR(450) NOT NULL,
        IsActive TINYINT,
        CreatedBy INT,
        CreatedOn DATE,
        RevisedBy INT,
        RevisedOn DATE,

        CONSTRAINT [PK_CompanyLocations] PRIMARY KEY CLUSTERED ([CompanyLocationID] ASC)
    ) ON [PRIMARY]
END

-- Link CompanyLocations to Companies
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyLocations_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyLocations]'))
BEGIN
    ALTER TABLE [dbo].[CompanyLocations] WITH CHECK ADD CONSTRAINT [FK_CompanyLocations_Companies] FOREIGN KEY ([CompanyID]) REFERENCES [dbo].[Companies]([CompanyID]) ON DELETE CASCADE;
    ALTER TABLE [dbo].[CompanyLocations] CHECK CONSTRAINT [FK_CompanyLocations_Companies];
END;


-- ==============================
-- 3. Create UserInfo Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[UserInfo]') AND type IN (N'U'))
BEGIN
    CREATE TABLE UserInfo (
        UserID NVARCHAR(450) NOT NULL,
        UserName NVARCHAR(256) NOT NULL,
        NormalizedUserName NVARCHAR(256) NULL,
        Email NVARCHAR(256) NOT NULL,
        NormalizedEmail NVARCHAR(256) NULL,
        PasswordHash NVARCHAR(MAX) NULL,
        SecurityStamp NVARCHAR(MAX) NULL,
        PhoneNumber NVARCHAR(15) NULL,
        LockoutEnd DATETIMEOFFSET NULL,
        AccessFailedCount INT DEFAULT 0,
        CompanyID NVARCHAR(450) NULL,
        DefaultCompanyLocationID NVARCHAR(450) NULL,
        IsActive TINYINT,
        CreatedBy INT,
        CreatedOn DATE,
        RevisedBy INT,
        RevisedOn DATE,

        CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED ([UserID] ASC)
    ) ON [PRIMARY]
END


-- Link UserInfo to Companies
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserInfo_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserInfo]'))
BEGIN
    ALTER TABLE [dbo].[UserInfo] WITH CHECK ADD CONSTRAINT [FK_UserInfo_Companies] FOREIGN KEY ([CompanyID]) REFERENCES [dbo].[Companies]([CompanyID]) ON DELETE SET NULL;
    ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Companies];
END;

-- Link UserInfo to CompanyLocations
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserInfo_CompanyLocations]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserInfo]'))
BEGIN
    ALTER TABLE [dbo].[UserInfo] WITH CHECK ADD CONSTRAINT [FK_UserInfo_CompanyLocations] FOREIGN KEY ([DefaultCompanyLocationID]) REFERENCES [dbo].[CompanyLocations]([CompanyLocationID]) ON DELETE SET NULL;
    ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_CompanyLocations];
END;




-- ==============================
-- 4. Create Roles Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[Roles]') AND type IN (N'U'))
BEGIN
    CREATE TABLE Roles (
        RoleID NVARCHAR(450) NOT NULL,
        Name NVARCHAR(256) NOT NULL,
        NormalizedName NVARCHAR(256) NULL,
        ConcurrencyStamp NVARCHAR(256) NULL,
        IsActive TINYINT,
        CreatedBy INT,
        CreatedOn DATE,
        RevisedBy INT,
        RevisedOn DATE,

        CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED ([RoleID] ASC)
    ) ON [PRIMARY]
END

-- ==============================
-- 5. Create UserRoles Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[UserRoles]') AND type IN (N'U'))
BEGIN
    CREATE TABLE UserRoles (
        UserID NVARCHAR(450) NOT NULL,
        RoleID NVARCHAR(450) NOT NULL,

        CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED ([UserID], [RoleID])
    ) ON [PRIMARY]
END

-- Link UserRoles to UserInfo
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_UserInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
BEGIN
    ALTER TABLE [dbo].[UserRoles] WITH CHECK ADD CONSTRAINT [FK_UserRoles_UserInfo] FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInfo]([UserID]) ON DELETE CASCADE;
    ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_UserInfo];
END;

-- Link UserRoles to Roles
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserRoles_Roles]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserRoles]'))
BEGIN
    ALTER TABLE [dbo].[UserRoles] WITH CHECK ADD CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles]([RoleID]) ON DELETE CASCADE;
    ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles];
END;

-- ==============================
-- 6. Create UserClaims Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[UserClaims]') AND type IN (N'U'))
BEGIN
    CREATE TABLE UserClaims (
        ClaimID INT IDENTITY(1,1) NOT NULL,
        UserID NVARCHAR(450) NOT NULL,
        ClaimType NVARCHAR(256) NOT NULL,
        ClaimValue NVARCHAR(256) NOT NULL,

        CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED ([ClaimID] ASC)
    ) ON [PRIMARY]
END

-- Link UserClaims to UserInfo
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserClaims_UserInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserClaims]'))
BEGIN
    ALTER TABLE [dbo].[UserClaims] WITH CHECK ADD CONSTRAINT [FK_UserClaims_UserInfo] FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInfo]([UserID]) ON DELETE CASCADE;
    ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_UserInfo];
END;


-- ==============================
-- 7. Create UserLogins Table
-- ==============================
IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[UserLogins]') AND type IN (N'U'))
BEGIN
    CREATE TABLE UserLogins (
        LoginProvider NVARCHAR(128) NOT NULL,
        ProviderKey NVARCHAR(128) NOT NULL,
        ProviderDisplayName NVARCHAR(256) NULL,
        UserID NVARCHAR(450) NOT NULL,

        CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey])
    ) ON [PRIMARY]
END

-- Link UserLogins to UserInfo
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserLogins_UserInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserLogins]'))
BEGIN
    ALTER TABLE [dbo].[UserLogins] WITH CHECK ADD CONSTRAINT [FK_UserLogins_UserInfo] FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInfo]([UserID]) ON DELETE CASCADE;
    ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_UserInfo];
END;

-- ==============================
-- 7. Create AuditLogs Table
-- ==============================


IF NOT EXISTS (SELECT * FROM sys.tables WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AuditLogs]') AND type = (N'U'))
BEGIN
    CREATE TABLE AuditLogs (
        AuditLogID INT IDENTITY(1,1),
        UserID NVARCHAR(450) NOT NULL,
        Action NVARCHAR(255) NOT NULL,
        Details NVARCHAR(MAX) NULL,
        Timestamp DATETIME DEFAULT GETDATE(),
        IPAddress NVARCHAR(50) NULL
    CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED ([AuditLogID] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
END

-- Link AuditLogs to UserInfo
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AuditLogs_UserInfo]') AND parent_object_id = OBJECT_ID(N'[dbo].[AuditLogs]'))
BEGIN
    ALTER TABLE [dbo].[AuditLogs] WITH CHECK ADD CONSTRAINT [FK_AuditLogs_UserInfo] FOREIGN KEY ([UserID]) REFERENCES [dbo].[UserInfo]([UserID]) ON DELETE CASCADE;
    ALTER TABLE [dbo].[AuditLogs] CHECK CONSTRAINT [FK_AuditLogs_UserInfo];
END;
