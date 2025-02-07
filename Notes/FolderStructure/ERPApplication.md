# ERP Solution Structure

## 📁 ERP-Solution/
- **📁 ERP.Web/** (Presentation Layer - Web UI)
  - **📁 Controllers/** (Handles HTTP Requests)
    - `AccountController.cs`
    - `DashboardController.cs`
    - **📁 Masters/**
      - `CustomerController.cs`
      - `VendorController.cs`
      - `ProductController.cs`
    - **📁 Transactions/**
      - `OrderController.cs`
      - `InvoiceController.cs`
      - `PaymentController.cs`
    - **📁 Reports/**
      - `SalesReportController.cs`
      - `PurchaseReportController.cs`
    - **📁 Configurations/**
      - `SettingsController.cs`
      - `PermissionsController.cs`
  - **📁 Views/**
  - **📁 wwwroot/**
  - `appsettings.json`
  
- **📁 ERP.API/** (API Layer - Web API for External Apps)
  - **📁 Controllers/**
  - `appsettings.json`

- **📁 ERP.Application/** (Application Layer - Business Logic)
  - **📁 Services/**
  - **📁 DTOs/**
  - **📁 Interfaces/**

- **📁 ERP.Domain/** (Domain Layer - Core Business Logic)
  - **📁 Entities/**
    - `User.cs`
    - `Role.cs`
    - `Customer.cs`
    - `Vendor.cs`
    - `Product.cs`
    - `Order.cs`
    - `Invoice.cs`
    - `Payment.cs`
  - **📁 Enums/**
  - **📁 BusinessRules/**

- **📁 ERP.Infrastructure/** (Infrastructure Layer - Database & External Services)
  - **📁 Data/**
    - `ERPContext.cs`
  - **📁 Repositories/**
    - `UserRepository.cs`
    - `OrderRepository.cs`
    - `InvoiceRepository.cs`
    - `PaymentRepository.cs`
  - **📁 IdentityProvider/**

- **📁 ERP.Tests/** (Unit & Integration Tests)
- `ERP.sln` (Solution File)
