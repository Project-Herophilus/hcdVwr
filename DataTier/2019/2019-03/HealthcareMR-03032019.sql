USE [DB_A395D9_healthcaremrdev]
GO
/****** Object:  Schema [auditlogging]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [auditlogging]
GO
/****** Object:  Schema [careincident]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [careincident]
GO
/****** Object:  Schema [clinicalrefdata]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [clinicalrefdata]
GO
/****** Object:  Schema [configrtn]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [configrtn]
GO
/****** Object:  Schema [datamodeldetail]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [datamodeldetail]
GO
/****** Object:  Schema [dataxchange]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [dataxchange]
GO
/****** Object:  Schema [genHealth]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [genHealth]
GO
/****** Object:  Schema [persondata]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [persondata]
GO
/****** Object:  Schema [refdata]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [refdata]
GO
/****** Object:  Schema [semanticterms]    Script Date: 3/3/2019 5:05:54 PM ******/
CREATE SCHEMA [semanticterms]
GO
/****** Object:  Table [auditlogging].[AuditLoggingIntegrations]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditlogging].[AuditLoggingIntegrations](
	[AuditLoggingIntegrationID] [bigint] IDENTITY(1,1) NOT NULL,
	[Vrsn] [varchar](8) NULL,
	[AppID] [smallint] NULL,
	[EntityName] [varchar](50) NULL,
	[MsgType] [varchar](3) NULL,
	[MsgEvent] [varchar](3) NULL,
	[MsgControlID] [varchar](20) NULL,
	[MsgDateTime] [varchar](26) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[DataReference] [varchar](25) NULL,
 CONSTRAINT [PK_AuditLoggingIntegrations] PRIMARY KEY CLUSTERED 
(
	[AuditLoggingIntegrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [auditlogging].[AuditLoggingsAppDetail]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditlogging].[AuditLoggingsAppDetail](
	[AuditLoggingID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditEventDate] [date] NULL,
	[AuditEventTime] [time](7) NULL,
	[AppComponent] [smallint] NOT NULL,
	[AppModule] [smallint] NULL,
	[EventDesc] [varchar](40) NULL,
	[AuditLoggingEventType] [smallint] NULL,
	[DataLink] [varchar](100) NULL,
 CONSTRAINT [PK_AuditLoggings] PRIMARY KEY CLUSTERED 
(
	[AuditLoggingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[CareIncidents]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[CareIncidents](
	[CareIncidentsID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdmitDate] [varchar](10) NULL,
	[AdmitTime] [varchar](12) NULL,
	[DischargeDate] [varchar](10) NULL,
	[DischargeTime] [varchar](12) NULL,
	[AccountID] [bigint] NULL,
	[PersonID] [bigint] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[StatusId] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_CareIncidents] PRIMARY KEY CLUSTERED 
(
	[CareIncidentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Genomics]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Genomics](
	[GenomicsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[GenomicsLink] [varchar](65) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Genomics] PRIMARY KEY CLUSTERED 
(
	[GenomicsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Observations]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Observations](
	[ObservationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[OrderNumberID] [bigint] NULL,
	[ObservationID] [smallint] NULL,
	[LineOrderID] [int] NULL,
	[ObservationDetailLink] [varchar](60) NULL,
	[ObservationUnit] [varchar](60) NULL,
	[ReferenceRange] [varchar](60) NULL,
	[AbnormalFlags] [varchar](5) NULL,
	[Probability] [varchar](5) NULL,
	[AbnormalTestNature] [varchar](2) NULL,
	[ProducerID] [varchar](60) NULL,
	[ObservationMethod] [varchar](60) NULL,
	[ValueType] [varchar](3) NULL,
	[ObservationDate] [varchar](10) NULL,
	[ObservationTime] [varchar](10) NULL,
	[StatusId] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Observations] PRIMARY KEY CLUSTERED 
(
	[ObservationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Orders]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Orders](
	[OrderNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[FillerOrderNumber] [bigint] NULL,
	[FiillerGroupNumber] [bigint] NULL,
	[OrderControlType] [varchar](2) NULL,
	[LineOrderID] [int] NULL,
	[OrderingPhysicianID] [varchar](10) NULL,
	[OrderEffectiveDate] [varchar](10) NULL,
	[OrderControlReason] [varchar](20) NULL,
	[OrderStatusModifier] [varchar](20) NULL,
	[Confidentiality] [varchar](20) NULL,
	[OrderType] [varchar](20) NULL,
	[OrderingDevice] [varchar](20) NULL,
	[OrderDate] [varchar](10) NULL,
	[OrderTime] [varchar](10) NULL,
	[OrderStatus] [varchar](10) NULL,
	[StatusId] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[OrdersLabDtls]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[OrdersLabDtls](
	[CareIncidentOrdersToLabDtlID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NOT NULL,
	[OrderNumberID] [bigint] NULL,
	[LabTimesOrderID] [smallint] NOT NULL,
	[LineOrderID] [int] NULL,
	[Quantity] [varchar](20) NOT NULL,
	[ExplicitTime] [varchar](20) NOT NULL,
	[RelativeTimeUnits] [varchar](20) NOT NULL,
	[ServiceDuration] [varchar](20) NOT NULL,
	[DateTimeStart] [varchar](26) NOT NULL,
	[DateTimeEnd] [varchar](26) NOT NULL,
	[Priority] [varchar](250) NOT NULL,
	[OccurenceDuration] [varchar](20) NOT NULL,
	[TotalOccurences] [varchar](10) NOT NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_OrdersLabDtls] PRIMARY KEY CLUSTERED 
(
	[CareIncidentOrdersToLabDtlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Pharmacy]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Pharmacy](
	[CareIncidentPharmacyID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[IncidentDate] [date] NULL,
	[LineOrderID] [int] NULL,
	[DrugCode] [varchar](8) NULL,
	[DrugName] [varchar](249) NULL,
	[DrugQuantity] [nvarchar](12) NULL,
	[ScriptDate] [date] NULL,
	[FilledDate] [date] NULL,
	[NPI] [varchar](12) NULL,
	[PhysicianName] [varchar](99) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[CareIncidentPharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Reports]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Reports](
	[ReportsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[OrderID] [bigint] NULL,
	[LineOrderID] [int] NULL,
	[CareIncidentNotesLink] [varchar](75) NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[ReportsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Vitals]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Vitals](
	[VitalsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[LineOrderID] [int] NULL,
	[BPSystolic] [int] NOT NULL,
	[BPDiastolic] [int] NULL,
	[BPDate] [date] NULL,
	[BPTime] [time](7) NULL,
	[ProcessdDateTime] [datetime] NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_VitalsInt] PRIMARY KEY CLUSTERED 
(
	[VitalsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Employers]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Employers](
	[EmployerId] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployerExternalId] [varchar](10) NULL,
	[EmployerName] [varchar](45) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](65) NULL,
	[StateId] [varchar](2) NULL,
	[CountryId] [varchar](3) NULL,
	[Zipcode] [varchar](10) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[FaxNumber] [varchar](12) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Genders]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Genders](
	[GenderId] [varchar](1) NOT NULL,
	[GenderCode] [varchar](10) NULL,
	[GenderDesc] [varchar](45) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RefGender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Insurances]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Insurances](
	[InsuranceId] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceExternalId] [varchar](10) NULL,
	[InsuranceCompanyName] [varchar](99) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](65) NULL,
	[StateId] [varchar](2) NULL,
	[Postalcode] [varchar](10) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[FaxNumber] [varchar](12) NULL,
	[InsCompanyTypeId] [bigint] NULL,
	[CountryId] [varchar](3) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[InsuranceTypes]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[InsuranceTypes](
	[InsuranceTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranceTypeCode] [varchar](10) NULL,
	[InsuranceTypeDesc] [varchar](30) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RefInsuranceType] PRIMARY KEY CLUSTERED 
(
	[InsuranceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[OrderControlTypes]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[OrderControlTypes](
	[OrderControlTypeId] [varchar](2) NOT NULL,
	[OrderControlTypeDesc] [varchar](40) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_OrderControlType] PRIMARY KEY CLUSTERED 
(
	[OrderControlTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[PatientClasses]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[PatientClasses](
	[PatientClassId] [varchar](1) NOT NULL,
	[ClassificationDesc] [varchar](80) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PatientClass] PRIMARY KEY CLUSTERED 
(
	[PatientClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Physicians]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Physicians](
	[PhysicianId] [int] NOT NULL,
	[PhysicianExternalId] [varchar](10) NULL,
	[CompleteName]  AS (([Name_Last]+', ')+[Name_First]) PERSISTED,
	[Name_First] [varchar](45) NULL,
	[Name_Middle] [varchar](45) NULL,
	[Name_Last] [varchar](45) NULL,
	[NPI] [varchar](12) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](65) NULL,
	[StateId] [varchar](2) NULL,
	[Postalcode] [varchar](10) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[FaxNumber] [varchar](12) NULL,
	[MobileNumber] [varchar](12) NULL,
	[HCEntitiesID] [bigint] NULL,
	[PlatformAppID] [smallint] NULL,
	[CountryId] [varchar](3) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[PhysicianTypes]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[PhysicianTypes](
	[PhysicianTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PhysicianTypeCode] [varchar](20) NULL,
	[PhysicianTypeDesc] [varchar](50) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PhysicianType] PRIMARY KEY CLUSTERED 
(
	[PhysicianTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Races]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Races](
	[RaceId] [varchar](6) NOT NULL,
	[RaceDesc] [varchar](45) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED 
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[appModules]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[appModules](
	[appModuleID] [smallint] IDENTITY(1,1) NOT NULL,
	[appModuleDesc] [varchar](60) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_appModules] PRIMARY KEY CLUSTERED 
(
	[appModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[ConfigrationSettings]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[ConfigrationSettings](
	[ConfigurationSettingID] [smallint] IDENTITY(1,1) NOT NULL,
	[ConfigurationParam] [varchar](25) NULL,
	[ConfigurationDesc] [varchar](75) NULL,
	[ConfigurationSettingType] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_ConfigrationSettings] PRIMARY KEY CLUSTERED 
(
	[ConfigurationSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntities]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntities](
	[HealthcareEntitiesId] [bigint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesName] [varchar](25) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](3) NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[Notes] [varchar](256) NULL,
	[LicenseNumber] [varchar](20) NULL,
	[LicensedState] [varchar](2) NULL,
	[OIDID] [varchar](50) NULL,
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntities] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesToContacts]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntitiesToContacts](
	[HealthcareEntitiesToContactsID] [bigint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[FullName] [varchar](99) NULL,
	[EmailAddress] [varchar](149) NULL,
	[CellNumber] [varchar](12) NULL,
	[OfficeNumber] [varchar](12) NULL,
	[OfficeNumberExt] [varchar](5) NULL,
	[ResourceTypeID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntitiesToContacts] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesToContactsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesToPlatformApps]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntitiesToPlatformApps](
	[HealthcareEntitiesToPlatformAppsID] [bigint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntitiesToPlatformApps] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesToPlatformAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[PlatformApps]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[PlatformApps](
	[PlatformAppsID] [smallint] IDENTITY(1,1) NOT NULL,
	[PlatformAppName] [varchar](45) NULL,
	[PlatformAppTypeID] [smallint] NULL,
	[VendorID] [smallint] NULL,
	[VendorVersion] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PlatformApps] PRIMARY KEY CLUSTERED 
(
	[PlatformAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[ThirdPartyApps]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[ThirdPartyApps](
	[ThirdPartyAppsID] [smallint] IDENTITY(1,1) NOT NULL,
	[ThirdPartyAppName] [varchar](40) NULL,
	[Host] [varchar](20) NULL,
	[Port] [varchar](5) NULL,
	[InvocationName] [varchar](75) NULL,
	[InvocationNameDtls] [varchar](150) NULL,
	[KeyValue] [varchar](25) NULL,
	[PlatformAppTypeID] [smallint] NULL,
	[VendorID] [smallint] NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_ThirdPartyApps] PRIMARY KEY CLUSTERED 
(
	[ThirdPartyAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[Vendors]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[Vendors](
	[VendorID] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](50) NULL,
	[Address] [varchar](75) NULL,
	[City] [varchar](50) NULL,
	[StateID] [varchar](2) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[ContactName] [varchar](75) NULL,
	[ContactEmailAddress] [varchar](99) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [datamodeldetail].[TableDetails]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datamodeldetail].[TableDetails](
	[TableDetailsID] [varchar](50) NOT NULL,
	[schemaName] [sysname] NULL,
	[tableName] [sysname] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[StatusID] [smallint] NOT NULL,
	[TablePurpose] [varchar](3) NOT NULL,
 CONSTRAINT [PK_TableDetails] PRIMARY KEY CLUSTERED 
(
	[TableDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dataxchange].[PersonOptInDiagnosis]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dataxchange].[PersonOptInDiagnosis](
	[PersonOptInDiagnosisID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[DiagnosisCode] [varchar](5) NULL,
	[CreatedDate] [date] NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonOptInDiagnosis] PRIMARY KEY CLUSTERED 
(
	[PersonOptInDiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dataxchange].[PersonOptInProcedures]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dataxchange].[PersonOptInProcedures](
	[PersonOptInProcedureID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[ProcedureCode] [varchar](5) NULL,
	[CreatedDate] [date] NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonOptInProcedures] PRIMARY KEY CLUSTERED 
(
	[PersonOptInProcedureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dataxchange].[PersonToDataRequests]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dataxchange].[PersonToDataRequests](
	[PersonToDataRequestsID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonRequestingID] [bigint] NULL,
	[PersonID] [bigint] NULL,
	[RequestedDateTime] [datetime] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonToDataRequests] PRIMARY KEY CLUSTERED 
(
	[PersonToDataRequestsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[Allergies]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[Allergies](
	[AllergiesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[AllergyCode] [varchar](20) NULL,
	[AllergyDesc] [varchar](100) NULL,
	[LineOrderID] [int] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppID] [smallint] NULL,
	[DateReported] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Allergies] PRIMARY KEY CLUSTERED 
(
	[AllergiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[ClinicalAddedDetails]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[ClinicalAddedDetails](
	[ClincalAddedDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClinicalAddedDetailsDateTime] [datetime] NULL,
	[PersonID] [bigint] NULL,
	[LineOrderID] [int] NULL,
	[ClinicalAddedDetailNotes] [varchar](256) NULL,
	[DateReported] [varchar](10) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_ClinicalAddedDetails] PRIMARY KEY CLUSTERED 
(
	[ClincalAddedDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[Communications]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[Communications](
	[CommunictionID] [bigint] IDENTITY(1,1) NOT NULL,
	[CommunicationDateTime] [datetime] NULL,
	[CommunicationType] [smallint] NULL,
	[PersonID] [bigint] NULL,
	[CommunicationDetails] [varchar](1024) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Communications] PRIMARY KEY CLUSTERED 
(
	[CommunictionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[DeviceAssociation]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[DeviceAssociation](
	[DeviceAssociationID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceAssociationDateTime] [datetime] NULL,
	[DeviceID] [varchar](50) NULL,
	[PersonID] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_DeviceAssociation] PRIMARY KEY CLUSTERED 
(
	[DeviceAssociationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[Diagnosis]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[Diagnosis](
	[DiagnosisID] [bigint] IDENTITY(1,1) NOT NULL,
	[DiagnosisDateTime] [datetime] NULL,
	[Diagnosis] [varchar](5) NULL,
	[PersonID] [bigint] NULL,
	[DiagnosisDate] [varchar](12) NULL,
	[DiagnosisTime] [varchar](20) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[HeightsWeights]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[HeightsWeights](
	[HeightWeightID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonD] [bigint] NULL,
	[DateReported] [varchar](10) NULL,
	[TimeReported] [varchar](10) NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[WeightFactor] [nchar](10) NULL,
	[HeightFactor] [nchar](10) NULL,
	[CalculatedBMI] [nchar](10) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_IntCareIncidentsHeightWeights] PRIMARY KEY CLUSTERED 
(
	[HeightWeightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[Problems]    Script Date: 3/3/2019 5:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[Problems](
	[PersonProblemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[ProblemID] [varchar](8) NULL,
	[DateReported] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonProblems] PRIMARY KEY CLUSTERED 
(
	[PersonProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genHealth].[Procedures]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genHealth].[Procedures](
	[ProceduresID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProceduresCode] [varchar](5) NULL,
	[PersonID] [bigint] NULL,
	[ProcedureDate] [varchar](12) NULL,
	[ProcedureTime] [varchar](16) NULL,
	[DateCreated] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[ProceduresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAccounts]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAccounts](
	[PersonAccountsID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[AccountNumber] [bigint] NULL,
	[EMPI] [varchar](25) NULL,
	[CustomAccountNumber] [varchar](50) NULL,
	[SelfSoveriegnID] [uniqueidentifier] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonAccount] PRIMARY KEY CLUSTERED 
(
	[PersonAccountsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAddresses]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAddresses](
	[PersonAddressId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NULL,
	[Address] [varchar](65) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](45) NULL,
	[StateId] [varchar](2) NULL,
	[PostalCode] [varchar](12) NULL,
	[CountryId] [varchar](3) NULL,
	[AddressTypeId] [bigint] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[PersonAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonDemographics]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonDemographics](
	[PersonDemogDtlsId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NULL,
	[PatientClassId] [varchar](1) NULL,
	[AdmissionTypeId] [varchar](2) NULL,
	[HospitalServiceId] [varchar](3) NULL,
	[ReadmissionInd] [bit] NULL,
	[AdmitSourceId] [varchar](6) NULL,
	[AmbulatoryStatusId] [varchar](2) NULL,
	[VIPIndicator] [bit] NULL,
	[PatientTypeId] [varchar](2) NULL,
	[FinancialClassId] [int] NULL,
	[ExternalHealthcareEntitiesId] [smallint] NULL,
	[RaceId] [varchar](6) NULL,
	[EthnicityId] [smallint] NULL,
	[MaritalStatusId] [varchar](1) NULL,
	[GenderId] [varchar](1) NULL,
	[ReligionId] [varchar](3) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NOT NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonDemographics] PRIMARY KEY CLUSTERED 
(
	[PersonDemogDtlsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonEmployers]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonEmployers](
	[PersonEmployerId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NULL,
	[EmployerId] [bigint] NULL,
	[EmployerCode] [varchar](20) NULL,
	[EmployerName] [varchar](50) NULL,
	[EmployerAddress] [varchar](120) NULL,
	[EmployerCityStateZip] [varchar](120) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[JobTitle] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_PersonEmployer] PRIMARY KEY CLUSTERED 
(
	[PersonEmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonImmunizations]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonImmunizations](
	[PersonToImmunizationID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[ImmunizationCode] [varchar](5) NULL,
	[ImmunizationDesc] [varchar](75) NULL,
	[ImmunizationDate] [varchar](12) NULL,
	[ImmunizationTime] [varchar](18) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonImmunizations] PRIMARY KEY CLUSTERED 
(
	[PersonToImmunizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonPhones]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonPhones](
	[PersonPhoneId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[PhoneTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](12) NOT NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonPhone] PRIMARY KEY CLUSTERED 
(
	[PersonPhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[Persons]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[Persons](
	[PersonId] [bigint] IDENTITY(1,1) NOT NULL,
	[NameFirst] [varchar](25) NOT NULL,
	[NameMiddle] [varchar](1) NOT NULL,
	[NameLast] [varchar](45) NOT NULL,
	[NameSuffix] [varchar](8) NULL,
	[DLN] [varchar](25) NULL,
	[SSN] [varchar](12) NULL,
	[CompleteName]  AS (([NameLast]+', ')+[NameFirst]) PERSISTED NOT NULL,
	[DOB] [date] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NULL,
	[UID] [nvarchar](149) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[AddressTypes]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[AddressTypes](
	[AddressTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[AddressTypeDesc] [varchar](25) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefAddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[AuditLoggingEventTypes]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[AuditLoggingEventTypes](
	[AuditLoggingEventTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[AuditLoggingEventTypeDesc] [varchar](20) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_AuditLoggingEventType] PRIMARY KEY CLUSTERED 
(
	[AuditLoggingEventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[CommunicationType]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[CommunicationType](
	[CommunicationTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[CommunicationTypeDesc] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_CommunicationType] PRIMARY KEY CLUSTERED 
(
	[CommunicationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[ConfigurationSettingType]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[ConfigurationSettingType](
	[ConfigurationSettingTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[ConfigurationSettingTypeDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NOT NULL,
 CONSTRAINT [PK_ConfigurationSettingType_1] PRIMARY KEY CLUSTERED 
(
	[ConfigurationSettingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[Countries]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Countries](
	[CountryId] [varchar](3) NOT NULL,
	[CountryName] [varchar](80) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefCountry] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[OIDS]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[OIDS](
	[OIDID] [varchar](50) NOT NULL,
	[OID] [varchar](50) NULL,
	[OIDDesc] [varchar](499) NULL,
	[CompleteOID]  AS (([OID]+'-')+[OIDDesc]) PERSISTED,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_OIDS] PRIMARY KEY CLUSTERED 
(
	[OIDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[PhoneTypes]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[PhoneTypes](
	[PhoneTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PhoneTypeDesc] [varchar](20) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefPhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[PlatformAppType]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[PlatformAppType](
	[PlatformAppTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[PlatformAppTypeName] [varchar](30) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PlatformAppType] PRIMARY KEY CLUSTERED 
(
	[PlatformAppTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[RelationshipCategoryType]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[RelationshipCategoryType](
	[RelationshipCategoryTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[RelationshipCategoryTypeDesc] [varchar](30) NULL,
	[CreatedDate] [date] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_RelationshipCategoryType] PRIMARY KEY CLUSTERED 
(
	[RelationshipCategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[RelationshipType]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[RelationshipType](
	[RelationshipTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[RelationshipTypeDesc] [varchar](35) NULL,
	[RelationshipCategoryTypeId] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RelationshipType] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[ResourceType]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[ResourceType](
	[ResourceTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[ResourceTypeDesc] [varchar](20) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_ResourceType] PRIMARY KEY CLUSTERED 
(
	[ResourceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[States]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[States](
	[StateId] [varchar](2) NOT NULL,
	[StateDescription] [varchar](65) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[Status]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Status](
	[StatusID] [smallint] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_RefStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Allergens]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[Allergens](
	[AllergensD] [int] NOT NULL,
	[AllergyCode] [varchar](20) NULL,
	[AllergyDesc] [varchar](100) NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[PlatformAppsID] [smallint] NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Allergens] PRIMARY KEY CLUSTERED 
(
	[AllergensD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[CWETermGroups]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[CWETermGroups](
	[CWETermGroupId] [varchar](20) NOT NULL,
	[CWETermGroupDesc] [varchar](100) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_CWETermGroup] PRIMARY KEY CLUSTERED 
(
	[CWETermGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[CWETerms]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[CWETerms](
	[CWETermID] [bigint] NOT NULL,
	[Identifier] [varchar](20) NULL,
	[TermText] [varchar](199) NULL,
	[CWETermGroup] [varchar](20) NULL,
	[AlternativeID] [varchar](20) NULL,
	[AlternativeText] [varchar](199) NULL,
	[AlternativeTermGroup] [varchar](20) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_CWETerms] PRIMARY KEY CLUSTERED 
(
	[CWETermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Diagnosis]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[Diagnosis](
	[DiagnosisCode] [varchar](5) NOT NULL,
	[DiagnosisCodeShortDesc] [varchar](50) NULL,
	[DiagnosisCodeLongDesc] [varchar](125) NULL,
	[IndustryVersion] [varchar](5) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[LOINC]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[LOINC](
	[LOINCCodesetID] [varchar](8) NOT NULL,
	[CodesetDesc] [varchar](75) NULL,
	[CodesetStatus] [varchar](10) NULL,
	[CUILink] [varchar](8) NULL,
	[Occurence] [varchar](2) NULL,
	[Usage] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_LOINC] PRIMARY KEY CLUSTERED 
(
	[LOINCCodesetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Procedures]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[Procedures](
	[ProcedureCode] [varchar](5) NOT NULL,
	[ProcedureCodeShortDesc] [varchar](50) NULL,
	[ProcedureCodeLongDesc] [varchar](125) NULL,
	[IndustryVersion] [varchar](5) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[ProcedureCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[RxNorms]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[RxNorms](
	[RXNormId] [varchar](8) NOT NULL,
	[LAT] [varchar](3) NOT NULL,
	[RxNormDesc] [varchar](3000) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RxNorm] PRIMARY KEY CLUSTERED 
(
	[RXNormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[SnomedCodeset]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[SnomedCodeset](
	[SnomedCodesetID] [varchar](8) NOT NULL,
	[CodesetDesc] [varchar](75) NULL,
	[CodesetStatus] [varchar](10) NULL,
	[CUILink] [varchar](8) NULL,
	[Occurence] [varchar](2) NULL,
	[Usage] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_SnomedCodeset] PRIMARY KEY CLUSTERED 
(
	[SnomedCodesetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[SnomedProblems]    Script Date: 3/3/2019 5:05:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[SnomedProblems](
	[ProblemID] [varchar](8) NOT NULL,
	[ProblemDesc] [varchar](75) NULL,
	[ProblemIDStatus] [varchar](10) NULL,
	[CUILink] [varchar](8) NULL,
	[Occurence] [varchar](2) NULL,
	[Usage] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_SnomedProblems] PRIMARY KEY CLUSTERED 
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_AuditLoggingIntegration]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_AuditLoggingIntegration] ON [auditlogging].[AuditLoggingIntegrations]
(
	[AuditLoggingIntegrationID] ASC,
	[AppID] ASC,
	[Vrsn] ASC,
	[EntityName] ASC,
	[MsgType] ASC,
	[MsgEvent] ASC,
	[MsgDateTime] ASC,
	[MsgControlID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AuditLogging]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_AuditLogging] ON [auditlogging].[AuditLoggingsAppDetail]
(
	[AuditLoggingID] ASC,
	[AuditEventDate] ASC,
	[AuditEventTime] ASC,
	[AppComponent] ASC,
	[AppModule] ASC,
	[EventDesc] ASC,
	[AuditLoggingEventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CareIncidents]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_CareIncidents] ON [careincident].[CareIncidents]
(
	[CareIncidentsID] ASC,
	[AdmitDate] ASC,
	[AdmitTime] ASC,
	[DischargeDate] ASC,
	[DischargeTime] ASC,
	[AccountID] ASC,
	[PersonID] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[DateCreated] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Observations]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Observations] ON [careincident].[Observations]
(
	[ObservationsID] ASC,
	[CareIncidentID] ASC,
	[AbnormalFlags] ASC,
	[AbnormalTestNature] ASC,
	[ObservationDate] ASC,
	[ObservationDetailLink] ASC,
	[ObservationID] ASC,
	[ObservationMethod] ASC,
	[ObservationTime] ASC,
	[ObservationUnit] ASC,
	[OrderNumberID] ASC,
	[Probability] ASC,
	[ProducerID] ASC,
	[ReferenceRange] ASC,
	[ValueType] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Observations1]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Observations1] ON [careincident].[Observations]
(
	[ObservationsID] ASC,
	[StatusId] ASC,
	[LineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Orders]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Orders] ON [careincident].[Orders]
(
	[OrderNumberID] ASC,
	[CareIncidentID] ASC,
	[Confidentiality] ASC,
	[FiillerGroupNumber] ASC,
	[FillerOrderNumber] ASC,
	[OrderControlReason] ASC,
	[OrderControlType] ASC,
	[OrderDate] ASC,
	[OrderEffectiveDate] ASC,
	[OrderingDevice] ASC,
	[OrderingPhysicianID] ASC,
	[OrderStatus] ASC,
	[OrderStatusModifier] ASC,
	[OrderTime] ASC,
	[OrderType] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Orders1]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Orders1] ON [careincident].[Orders]
(
	[OrderNumberID] ASC,
	[LineOrderID] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_OrdersLabDtls]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_OrdersLabDtls] ON [careincident].[OrdersLabDtls]
(
	[CareIncidentOrdersToLabDtlID] ASC,
	[CareIncidentID] ASC,
	[OrderNumberID] ASC,
	[LineOrderID] ASC,
	[LabTimesOrderID] ASC,
	[Quantity] ASC,
	[Priority] ASC,
	[RelativeTimeUnits] ASC,
	[OccurenceDuration] ASC,
	[ServiceDuration] ASC,
	[DateTimeStart] ASC,
	[DateTimeEnd] ASC,
	[ExplicitTime] ASC,
	[TotalOccurences] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Reports]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Reports] ON [careincident].[Reports]
(
	[ReportsID] ASC,
	[CareIncidentNotesLink] ASC,
	[CareIncidentID] ASC,
	[LineOrderID] ASC,
	[OrderID] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Vitals]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Vitals] ON [careincident].[Vitals]
(
	[VitalsID] ASC,
	[CareIncidentID] ASC,
	[BPDate] ASC,
	[BPDiastolic] ASC,
	[BPSystolic] ASC,
	[BPTime] ASC,
	[ProcessdDateTime] ASC,
	[StatusID] ASC,
	[DateCreated] ASC,
	[LineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Employer]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Employer] ON [clinicalrefdata].[Employers]
(
	[EmployerId] ASC,
	[EmployerExternalId] ASC,
	[EmployerName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateId] ASC,
	[Zipcode] ASC,
	[PhoneNumber] ASC,
	[FaxNumber] ASC,
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Employers1]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Employers1] ON [clinicalrefdata].[Employers]
(
	[EmployerId] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Genders]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Genders] ON [clinicalrefdata].[Genders]
(
	[GenderId] ASC,
	[GenderCode] ASC,
	[GenderDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Insurance]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Insurance] ON [clinicalrefdata].[Insurances]
(
	[InsuranceId] ASC,
	[InsuranceExternalId] ASC,
	[InsuranceCompanyName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateId] ASC,
	[Postalcode] ASC,
	[PhoneNumber] ASC,
	[FaxNumber] ASC,
	[InsCompanyTypeId] ASC,
	[CountryId] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_InsuranceTypes]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_InsuranceTypes] ON [clinicalrefdata].[InsuranceTypes]
(
	[InsuranceTypeId] ASC,
	[InsuranceTypeCode] ASC,
	[InsuranceTypeDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_OrderControlType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_OrderControlType] ON [clinicalrefdata].[OrderControlTypes]
(
	[OrderControlTypeId] ASC,
	[OrderControlTypeDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PatientClasses]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PatientClasses] ON [clinicalrefdata].[PatientClasses]
(
	[PatientClassId] ASC,
	[ClassificationDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Physician]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Physician] ON [clinicalrefdata].[Physicians]
(
	[PhysicianId] ASC,
	[PhysicianExternalId] ASC,
	[Name_First] ASC,
	[Name_Middle] ASC,
	[Name_Last] ASC,
	[NPI] ASC,
	[Address] ASC,
	[CountryId] ASC,
	[MobileNumber] ASC,
	[FaxNumber] ASC,
	[PhoneNumber] ASC,
	[Postalcode] ASC,
	[StateId] ASC,
	[City] ASC,
	[Address2] ASC,
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [INDX_Physicians1]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Physicians1] ON [clinicalrefdata].[Physicians]
(
	[PhysicianId] ASC,
	[StatusID] ASC,
	[CompleteName] ASC,
	[HCEntitiesID] ASC,
	[PlatformAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PhysicianType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PhysicianType] ON [clinicalrefdata].[PhysicianTypes]
(
	[PhysicianTypeId] ASC,
	[PhysicianTypeCode] ASC,
	[PhysicianTypeDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Races]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Races] ON [clinicalrefdata].[Races]
(
	[RaceId] ASC,
	[RaceDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_appModules]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_appModules] ON [configrtn].[appModules]
(
	[appModuleID] ASC,
	[appModuleDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_ConfigrationSettings]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ConfigrationSettings] ON [configrtn].[ConfigrationSettings]
(
	[ConfigurationSettingID] ASC,
	[ConfigurationParam] ASC,
	[ConfigurationDesc] ASC,
	[ConfigurationSettingType] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HealthcareEntities]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HealthcareEntities] ON [configrtn].[HealthcareEntities]
(
	[HealthcareEntitiesId] ASC,
	[HealthcareEntitiesName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[State] ASC,
	[PostalCode] ASC,
	[Country] ASC,
	[Notes] ASC,
	[CreatedDate] ASC,
	[Status] ASC,
	[LicenseNumber] ASC,
	[LicensedState] ASC,
	[OIDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HealthcareEntitiesToContacts]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HealthcareEntitiesToContacts] ON [configrtn].[HealthcareEntitiesToContacts]
(
	[HealthcareEntitiesToContactsID] ASC,
	[HealthcareEntitiesID] ASC,
	[FullName] ASC,
	[EmailAddress] ASC,
	[CellNumber] ASC,
	[OfficeNumber] ASC,
	[OfficeNumberExt] ASC,
	[ResourceTypeID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_HealthcareEntitiesToPlatformApps]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HealthcareEntitiesToPlatformApps] ON [configrtn].[HealthcareEntitiesToPlatformApps]
(
	[HealthcareEntitiesToPlatformAppsID] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PlatformApps]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PlatformApps] ON [configrtn].[PlatformApps]
(
	[PlatformAppsID] ASC,
	[PlatformAppName] ASC,
	[PlatformAppTypeID] ASC,
	[VendorID] ASC,
	[VendorVersion] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ThirdPartyApps]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ThirdPartyApps] ON [configrtn].[ThirdPartyApps]
(
	[ThirdPartyAppsID] ASC,
	[ThirdPartyAppName] ASC,
	[Host] ASC,
	[Port] ASC,
	[InvocationName] ASC,
	[InvocationNameDtls] ASC,
	[KeyValue] ASC,
	[PlatformAppTypeID] ASC,
	[VendorID] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Vendors]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Vendors] ON [configrtn].[Vendors]
(
	[VendorID] ASC,
	[VendorName] ASC,
	[Address] ASC,
	[City] ASC,
	[StateID] ASC,
	[PhoneNumber] ASC,
	[ContactName] ASC,
	[ContactEmailAddress] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_TableDetails]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_TableDetails] ON [datamodeldetail].[TableDetails]
(
	[TableDetailsID] ASC,
	[schemaName] ASC,
	[tableName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[TablePurpose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonOptInDiagnosis]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonOptInDiagnosis] ON [dataxchange].[PersonOptInDiagnosis]
(
	[PersonOptInDiagnosisID] ASC,
	[PersonID] ASC,
	[DiagnosisCode] ASC,
	[CreatedDate] ASC,
	[EffectiveDate] ASC,
	[ExpirationDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonOptInProcedures]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonOptInProcedures] ON [dataxchange].[PersonOptInProcedures]
(
	[PersonOptInProcedureID] ASC,
	[PersonID] ASC,
	[ProcedureCode] ASC,
	[CreatedDate] ASC,
	[EffectiveDate] ASC,
	[ExpirationDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_PersonToDataRequests]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonToDataRequests] ON [dataxchange].[PersonToDataRequests]
(
	[PersonToDataRequestsID] ASC,
	[PersonRequestingID] ASC,
	[PersonID] ASC,
	[RequestedDateTime] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Allergies]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_Allergies] ON [genHealth].[Allergies]
(
	[AllergiesID] ASC,
	[PersonID] ASC,
	[AllergyCode] ASC,
	[AllergyDesc] ASC,
	[LineOrderID] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppID] ASC,
	[DateReported] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Communications]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Communications] ON [genHealth].[Communications]
(
	[CommunictionID] ASC,
	[CommunicationDateTime] ASC,
	[CommunicationType] ASC,
	[PersonID] ASC,
	[StatusID] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_DeviceAssociation]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_DeviceAssociation] ON [genHealth].[DeviceAssociation]
(
	[DeviceAssociationID] ASC,
	[DeviceAssociationDateTime] ASC,
	[DeviceID] ASC,
	[PersonID] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Diagnosis]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Diagnosis] ON [genHealth].[Diagnosis]
(
	[DiagnosisID] ASC,
	[Diagnosis] ASC,
	[DiagnosisDate] ASC,
	[DiagnosisTime] ASC,
	[DiagnosisDateTime] ASC,
	[PersonID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HeightsWeights]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HeightsWeights] ON [genHealth].[HeightsWeights]
(
	[HeightWeightID] ASC,
	[PersonD] ASC,
	[DateReported] ASC,
	[TimeReported] ASC,
	[Height] ASC,
	[Weight] ASC,
	[HeightFactor] ASC,
	[WeightFactor] ASC,
	[CalculatedBMI] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonProblems]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonProblems] ON [genHealth].[Problems]
(
	[PersonProblemID] ASC,
	[PersonID] ASC,
	[DateReported] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonAccount]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonAccount] ON [persondata].[PersonAccounts]
(
	[PersonAccountsID] ASC,
	[AccountNumber] ASC,
	[PersonID] ASC,
	[CustomAccountNumber] ASC,
	[EMPI] ASC,
	[HealthcareEntitiesID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[PlatformAppsID] ASC,
	[SelfSoveriegnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PersonAddress]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_PersonAddress] ON [persondata].[PersonAddresses]
(
	[PersonAddressId] ASC,
	[PersonId] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateId] ASC,
	[PostalCode] ASC,
	[AddressTypeId] ASC,
	[CountryId] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonDemographics ]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonDemographics ] ON [persondata].[PersonDemographics]
(
	[PersonDemogDtlsId] ASC,
	[PatientClassId] ASC,
	[AdmissionTypeId] ASC,
	[HospitalServiceId] ASC,
	[ReadmissionInd] ASC,
	[AdmitSourceId] ASC,
	[AmbulatoryStatusId] ASC,
	[VIPIndicator] ASC,
	[PatientTypeId] ASC,
	[FinancialClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonDemographics2]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonDemographics2] ON [persondata].[PersonDemographics]
(
	[ExternalHealthcareEntitiesId] ASC,
	[RaceId] ASC,
	[EthnicityId] ASC,
	[MaritalStatusId] ASC,
	[PersonId] ASC,
	[StatusID] ASC,
	[GenderId] ASC,
	[ReligionId] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonEmployer]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonEmployer] ON [persondata].[PersonEmployers]
(
	[PersonEmployerId] ASC,
	[PersonId] ASC,
	[EmployerId] ASC,
	[EmployerName] ASC,
	[EmployerAddress] ASC,
	[EmployerCityStateZip] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[JobTitle] ASC,
	[CreatedDate] ASC,
	[StatusId] ASC,
	[EmployerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonImmunizations]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonImmunizations] ON [persondata].[PersonImmunizations]
(
	[PersonToImmunizationID] ASC,
	[PersonID] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[ImmunizationCode] ASC,
	[ImmunizationDesc] ASC,
	[ImmunizationDate] ASC,
	[ImmunizationTime] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonPhone]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonPhone] ON [persondata].[PersonPhones]
(
	[PersonPhoneId] ASC,
	[PersonId] ASC,
	[PhoneTypeId] ASC,
	[PhoneNumber] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [INDX_Person]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Person] ON [persondata].[Persons]
(
	[PersonId] ASC,
	[NameFirst] ASC,
	[NameMiddle] ASC,
	[NameLast] ASC,
	[NameSuffix] ASC,
	[DLN] ASC,
	[SSN] ASC,
	[CompleteName] ASC,
	[CreatedDate] ASC,
	[DOB] ASC,
	[Status] ASC,
	[UID] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefAddressType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RefAddressType] ON [refdata].[AddressTypes]
(
	[AddressTypeId] ASC,
	[AddressTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AuditLoggingEventType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_AuditLoggingEventType] ON [refdata].[AuditLoggingEventTypes]
(
	[AuditLoggingEventTypeId] ASC,
	[AuditLoggingEventTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CommunicationType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_CommunicationType] ON [refdata].[CommunicationType]
(
	[CommunicationTypeID] ASC,
	[CommunicationTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConfigurationSettingType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConfigurationSettingType] ON [refdata].[ConfigurationSettingType]
(
	[ConfigurationSettingTypeID] ASC,
	[ConfigurationSettingTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefCountry]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RefCountry] ON [refdata].[Countries]
(
	[CountryId] ASC,
	[CountryName] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [INDX_OIDS]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_OIDS] ON [refdata].[OIDS]
(
	[OIDID] ASC,
	[OID] ASC,
	[OIDDesc] ASC,
	[CompleteOID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefPhoneType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RefPhoneType] ON [refdata].[PhoneTypes]
(
	[PhoneTypeId] ASC,
	[PhoneTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PlatformAppType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PlatformAppType] ON [refdata].[PlatformAppType]
(
	[PlatformAppTypeID] ASC,
	[PlatformAppTypeName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_RelationshipType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_RelationshipType] ON [refdata].[RelationshipType]
(
	[RelationshipTypeID] ASC,
	[RelationshipTypeDesc] ASC,
	[RelationshipCategoryTypeId] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ResourceType]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ResourceType] ON [refdata].[ResourceType]
(
	[ResourceTypeID] ASC,
	[ResourceTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_States]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_States] ON [refdata].[States]
(
	[StateId] ASC,
	[StateDescription] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefStatus]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RefStatus] ON [refdata].[Status]
(
	[StatusID] ASC,
	[StatusDescription] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Allergies]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Allergies] ON [semanticterms].[Allergens]
(
	[AllergensD] ASC,
	[AllergyCode] ASC,
	[AllergyDesc] ASC,
	[HealthcareEntitiesID] ASC,
	[PlatformAppsID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CWETermGroup]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CWETermGroup] ON [semanticterms].[CWETermGroups]
(
	[CWETermGroupId] ASC,
	[CWETermGroupDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CWETerms]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CWETerms] ON [semanticterms].[CWETerms]
(
	[CWETermID] ASC,
	[Identifier] ASC,
	[TermText] ASC,
	[CWETermGroup] ASC,
	[AlternativeID] ASC,
	[AlternativeText] ASC,
	[AlternativeTermGroup] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Diagnosis]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Diagnosis] ON [semanticterms].[Diagnosis]
(
	[DiagnosisCode] ASC,
	[DiagnosisCodeLongDesc] ASC,
	[DiagnosisCodeShortDesc] ASC,
	[IndustryVersion] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_LOINC]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_LOINC] ON [semanticterms].[LOINC]
(
	[LOINCCodesetID] ASC,
	[CUILink] ASC,
	[Occurence] ASC,
	[CodesetDesc] ASC,
	[CodesetStatus] ASC,
	[Usage] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Procedures]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Procedures] ON [semanticterms].[Procedures]
(
	[ProcedureCode] ASC,
	[ProcedureCodeLongDesc] ASC,
	[ProcedureCodeShortDesc] ASC,
	[IndustryVersion] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_RxNorm]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_RxNorm] ON [semanticterms].[RxNorms]
(
	[RXNormId] ASC,
	[LAT] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_SnomedCodeset]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_SnomedCodeset] ON [semanticterms].[SnomedCodeset]
(
	[SnomedCodesetID] ASC,
	[CUILink] ASC,
	[Occurence] ASC,
	[CodesetDesc] ASC,
	[CodesetStatus] ASC,
	[Usage] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_SnomedProblems]    Script Date: 3/3/2019 5:05:55 PM ******/
CREATE NONCLUSTERED INDEX [INDX_SnomedProblems] ON [semanticterms].[SnomedProblems]
(
	[ProblemID] ASC,
	[CUILink] ASC,
	[Occurence] ASC,
	[ProblemDesc] ASC,
	[ProblemIDStatus] ASC,
	[Usage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [auditlogging].[AuditLoggingIntegrations] ADD  CONSTRAINT [DF_AuditLoggingIntegrations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail] ADD  CONSTRAINT [DF_AuditLogging_AuditDate]  DEFAULT (getdate()) FOR [AuditEventDate]
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail] ADD  CONSTRAINT [DF_AuditLogging_AuditEventTime]  DEFAULT (CONVERT([varchar],getdate(),(108))) FOR [AuditEventTime]
GO
ALTER TABLE [careincident].[CareIncidents] ADD  CONSTRAINT [DF_CareIncidents_Status]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [careincident].[CareIncidents] ADD  CONSTRAINT [DF_CareIncidents_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [careincident].[Genomics] ADD  CONSTRAINT [DF_Genomics_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Genomics] ADD  CONSTRAINT [DF_Genomics_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Observations] ADD  CONSTRAINT [DF_Observations_StatusID]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [careincident].[Observations] ADD  CONSTRAINT [DF_Observations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Orders] ADD  CONSTRAINT [DF_Orders_StatusID]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [careincident].[Orders] ADD  CONSTRAINT [DF_Orders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[OrdersLabDtls] ADD  CONSTRAINT [DF_OrdersToLabTimes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[OrdersLabDtls] ADD  CONSTRAINT [DF_OrdersToLabTimes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Pharmacy] ADD  CONSTRAINT [DF_Pharmacy_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Reports] ADD  CONSTRAINT [DF_Transcriptions_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Reports] ADD  CONSTRAINT [DF_Transcriptions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [careincident].[Vitals] ADD  CONSTRAINT [DF__CareIncid__Proce__40257DE4]  DEFAULT (getdate()) FOR [ProcessdDateTime]
GO
ALTER TABLE [careincident].[Vitals] ADD  CONSTRAINT [DF_Vitals_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Vitals] ADD  CONSTRAINT [DF_Vitals_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [clinicalrefdata].[Employers] ADD  CONSTRAINT [DF_Employers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[Employers] ADD  CONSTRAINT [DF_Employers_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[Genders] ADD  CONSTRAINT [DF_Genders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[Genders] ADD  CONSTRAINT [DF_Genders_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[Insurances] ADD  CONSTRAINT [DF_Insurances_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[Insurances] ADD  CONSTRAINT [DF_Insurances_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes] ADD  CONSTRAINT [DF_InsuranceTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes] ADD  CONSTRAINT [DF_InsuranceTypes_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes] ADD  CONSTRAINT [DF_OrderControlTypes_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes] ADD  CONSTRAINT [DF_OrderControlTypes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[PatientClasses] ADD  CONSTRAINT [DF_PatientClasses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[PatientClasses] ADD  CONSTRAINT [DF_PatientClasses_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[Physicians] ADD  CONSTRAINT [DF_Physicians_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [clinicalrefdata].[Physicians] ADD  CONSTRAINT [DF_Physicians_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes] ADD  CONSTRAINT [DF_PhysicianTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes] ADD  CONSTRAINT [DF_PhysicianTypes_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clinicalrefdata].[Races] ADD  CONSTRAINT [DF_Races_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[Races] ADD  CONSTRAINT [DF_Races_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [configrtn].[appModules] ADD  CONSTRAINT [DF_appModules_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[appModules] ADD  CONSTRAINT [DF_appModules_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[ConfigrationSettings] ADD  CONSTRAINT [DF_ConfigrationSettings_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[ConfigrationSettings] ADD  CONSTRAINT [DF_ConfigrationSettings_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareEntities] ADD  CONSTRAINT [DF__Healthcar__Creat__7849DB76]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntities] ADD  CONSTRAINT [DF_HealthcareEntities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts] ADD  CONSTRAINT [DF_HealthcareEntitiesToContacts_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts] ADD  CONSTRAINT [DF_HealthcareEntitiesToContacts_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps] ADD  CONSTRAINT [DF_HealthcareEntitiesToPlatformApps_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps] ADD  CONSTRAINT [DF_HealthcareEntitiesToPlatformApps_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [configrtn].[PlatformApps] ADD  CONSTRAINT [DF_PlatformApps_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[PlatformApps] ADD  CONSTRAINT [DF_PlatformApps_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [configrtn].[ThirdPartyApps] ADD  CONSTRAINT [DF_ThirdPartyApps_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [configrtn].[ThirdPartyApps] ADD  CONSTRAINT [DF_ThirdPartyApps_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [configrtn].[Vendors] ADD  CONSTRAINT [DF_Vendors_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[Vendors] ADD  CONSTRAINT [DF_Vendors_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis] ADD  CONSTRAINT [DF_PersonOptInDiagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures] ADD  CONSTRAINT [DF_PersonOptInProcedures_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures] ADD  CONSTRAINT [DF_PersonOptInProcedures_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dataxchange].[PersonToDataRequests] ADD  CONSTRAINT [DF_PersonToDataRequests_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dataxchange].[PersonToDataRequests] ADD  CONSTRAINT [DF_PersonToDataRequests_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genHealth].[Allergies] ADD  CONSTRAINT [DF_Allergies_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[Allergies] ADD  CONSTRAINT [DF_Allergies_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [genHealth].[ClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_ClinicalAddedDetailsDateTime]  DEFAULT (getdate()) FOR [ClinicalAddedDetailsDateTime]
GO
ALTER TABLE [genHealth].[ClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genHealth].[ClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[Communications] ADD  CONSTRAINT [DF_Communications_CommunicationDateTime]  DEFAULT (getdate()) FOR [CommunicationDateTime]
GO
ALTER TABLE [genHealth].[Communications] ADD  CONSTRAINT [DF_Communications_CommunicationType]  DEFAULT ((1)) FOR [CommunicationType]
GO
ALTER TABLE [genHealth].[Communications] ADD  CONSTRAINT [DF_Communications_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[Communications] ADD  CONSTRAINT [DF_Communications_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genHealth].[DeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_DeviceAssociationDateTime]  DEFAULT (getdate()) FOR [DeviceAssociationDateTime]
GO
ALTER TABLE [genHealth].[DeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[DeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [genHealth].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_DiagnosisDateTime]  DEFAULT (getdate()) FOR [DiagnosisDateTime]
GO
ALTER TABLE [genHealth].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genHealth].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_WeightFactor]  DEFAULT (N'CareIncidentWeight*.45') FOR [WeightFactor]
GO
ALTER TABLE [genHealth].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_HeightFactor]  DEFAULT (N'SQUARE(CareIncidentHeight*.025)') FOR [HeightFactor]
GO
ALTER TABLE [genHealth].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_CalculatedBMI]  DEFAULT (N'WeightFactor/HeightFactor') FOR [CalculatedBMI]
GO
ALTER TABLE [genHealth].[HeightsWeights] ADD  CONSTRAINT [DF_HeightWeights_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genHealth].[HeightsWeights] ADD  CONSTRAINT [DF_HeightWeights_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[Problems] ADD  CONSTRAINT [DF__PersonPro__DateP__0F4D3C5F]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genHealth].[Problems] ADD  CONSTRAINT [DF__PersonPro__Statu__10416098]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genHealth].[Procedures] ADD  CONSTRAINT [DF_Procedures_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genHealth].[Procedures] ADD  CONSTRAINT [DF_Procedures_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [persondata].[PersonAccounts] ADD  CONSTRAINT [DF_PersonAccounts_SelfSoveriegnID]  DEFAULT (newid()) FOR [SelfSoveriegnID]
GO
ALTER TABLE [persondata].[PersonAccounts] ADD  CONSTRAINT [DF_PersonAccount_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonAccounts] ADD  CONSTRAINT [DF_PersonAccounts_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonDemographics] ADD  CONSTRAINT [DF_PersonDemographics_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonDemographics] ADD  CONSTRAINT [DF_PersonDemographics_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonEmployers] ADD  CONSTRAINT [DF_PersonEmployers_EntryDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonEmployers] ADD  CONSTRAINT [DF_PersonEmployers_StatusId]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [persondata].[PersonImmunizations] ADD  CONSTRAINT [DF_PersonImmunizations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonImmunizations] ADD  CONSTRAINT [DF_PersonImmunizations_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonPhones] ADD  CONSTRAINT [DF_PersonPhones_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonPhones] ADD  CONSTRAINT [DF_PersonPhones_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[Persons] ADD  CONSTRAINT [DF__Persons__Created__51300E55]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[Persons] ADD  CONSTRAINT [DF_Persons_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[AddressTypes] ADD  CONSTRAINT [DF_AddressTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[AddressTypes] ADD  CONSTRAINT [DF_AddressTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[CommunicationType] ADD  CONSTRAINT [DF_CommunicationType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[CommunicationType] ADD  CONSTRAINT [DF_CommunicationType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[ConfigurationSettingType] ADD  CONSTRAINT [DF_ConfigurationSettingType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[ConfigurationSettingType] ADD  CONSTRAINT [DF_ConfigurationSettingType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[Countries] ADD  CONSTRAINT [DF_Countries_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[Countries] ADD  CONSTRAINT [DF_Countries_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[OIDS] ADD  CONSTRAINT [DF_OIDS_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[OIDS] ADD  CONSTRAINT [DF_OIDS_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdata].[PhoneTypes] ADD  CONSTRAINT [DF_PhoneTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PhoneTypes] ADD  CONSTRAINT [DF_PhoneTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[PlatformAppType] ADD  CONSTRAINT [DF_PlatformAppType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PlatformAppType] ADD  CONSTRAINT [DF_PlatformAppType_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdata].[RelationshipCategoryType] ADD  CONSTRAINT [DF_RelationshipCategoryType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[RelationshipCategoryType] ADD  CONSTRAINT [DF_RelationshipCategoryType_StatusId]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [refdata].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdata].[ResourceType] ADD  CONSTRAINT [DF_ResourceType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[ResourceType] ADD  CONSTRAINT [DF_ResourceType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[States] ADD  CONSTRAINT [DF_States_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[States] ADD  CONSTRAINT [DF_States_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[Status] ADD  CONSTRAINT [DF_Status_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[Allergens] ADD  CONSTRAINT [DF_Allergens_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[Allergens] ADD  CONSTRAINT [DF_Allergens_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[CWETermGroups] ADD  CONSTRAINT [DF_CWETermGroups_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[CWETermGroups] ADD  CONSTRAINT [DF_CWETermGroups_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[CWETerms] ADD  CONSTRAINT [DF_CWETerms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[CWETerms] ADD  CONSTRAINT [DF_CWETerms_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[LOINC] ADD  CONSTRAINT [DF_LOINCCodeset_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[LOINC] ADD  CONSTRAINT [DF_LOINCCodeset_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[Procedures] ADD  CONSTRAINT [DF_Procedures_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[Procedures] ADD  CONSTRAINT [DF_Procedures_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[RxNorms] ADD  DEFAULT ('ENG') FOR [LAT]
GO
ALTER TABLE [semanticterms].[RxNorms] ADD  CONSTRAINT [DF_RxNorms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[RxNorms] ADD  CONSTRAINT [DF_RxNorms_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[SnomedCodeset] ADD  CONSTRAINT [DF_SnomedCodeset_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[SnomedCodeset] ADD  CONSTRAINT [DF_SnomedCodeset_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[SnomedProblems] ADD  CONSTRAINT [DF_SnomedProblems_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[SnomedProblems] ADD  CONSTRAINT [DF_SnomedProblems_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [auditlogging].[AuditLoggingIntegrations]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggingIntegrations_PlatformApps] FOREIGN KEY([AppID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [auditlogging].[AuditLoggingIntegrations] CHECK CONSTRAINT [FK_AuditLoggingIntegrations_PlatformApps]
GO
ALTER TABLE [auditlogging].[AuditLoggingIntegrations]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggingIntegrations_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [auditlogging].[AuditLoggingIntegrations] CHECK CONSTRAINT [FK_AuditLoggingIntegrations_Status]
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggings_AppModule] FOREIGN KEY([AppModule])
REFERENCES [configrtn].[appModules] ([appModuleID])
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail] CHECK CONSTRAINT [FK_AuditLoggings_AppModule]
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggings_AuditLoggingType] FOREIGN KEY([AuditLoggingEventType])
REFERENCES [refdata].[AuditLoggingEventTypes] ([AuditLoggingEventTypeId])
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail] CHECK CONSTRAINT [FK_AuditLoggings_AuditLoggingType]
GO
ALTER TABLE [careincident].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidents_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [careincident].[CareIncidents] CHECK CONSTRAINT [FK_CareIncidents_HealthcareEntities]
GO
ALTER TABLE [careincident].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidents_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [careincident].[CareIncidents] CHECK CONSTRAINT [FK_CareIncidents_PlatformApps]
GO
ALTER TABLE [careincident].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidents_Status] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[CareIncidents] CHECK CONSTRAINT [FK_CareIncidents_Status]
GO
ALTER TABLE [careincident].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidents_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincident].[CareIncidents] CHECK CONSTRAINT [FK_IntCareIncidents_Accounts]
GO
ALTER TABLE [careincident].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidents_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[CareIncidents] CHECK CONSTRAINT [FK_IntCareIncidents_Persons]
GO
ALTER TABLE [careincident].[Genomics]  WITH CHECK ADD  CONSTRAINT [FK_Genomics_CareIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Genomics] CHECK CONSTRAINT [FK_Genomics_CareIncidents]
GO
ALTER TABLE [careincident].[Genomics]  WITH CHECK ADD  CONSTRAINT [FK_Genomics_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Genomics] CHECK CONSTRAINT [FK_Genomics_Status]
GO
ALTER TABLE [careincident].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_ClinicalIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Observations] CHECK CONSTRAINT [FK_Observations_ClinicalIncidents]
GO
ALTER TABLE [careincident].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_Orders] FOREIGN KEY([OrderNumberID])
REFERENCES [careincident].[Orders] ([OrderNumberID])
GO
ALTER TABLE [careincident].[Observations] CHECK CONSTRAINT [FK_Observations_Orders]
GO
ALTER TABLE [careincident].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_Status] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Observations] CHECK CONSTRAINT [FK_Observations_Status]
GO
ALTER TABLE [careincident].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CareIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Orders] CHECK CONSTRAINT [FK_Orders_CareIncidents]
GO
ALTER TABLE [careincident].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderControlType] FOREIGN KEY([OrderControlType])
REFERENCES [clinicalrefdata].[OrderControlTypes] ([OrderControlTypeId])
GO
ALTER TABLE [careincident].[Orders] CHECK CONSTRAINT [FK_Orders_OrderControlType]
GO
ALTER TABLE [careincident].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [careincident].[OrdersLabDtls]  WITH CHECK ADD  CONSTRAINT [FK_OrdersLabDtls_Orders] FOREIGN KEY([OrderNumberID])
REFERENCES [careincident].[Orders] ([OrderNumberID])
GO
ALTER TABLE [careincident].[OrdersLabDtls] CHECK CONSTRAINT [FK_OrdersLabDtls_Orders]
GO
ALTER TABLE [careincident].[OrdersLabDtls]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_IntCIID] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[OrdersLabDtls] CHECK CONSTRAINT [FK_OrdersToLabTimes_IntCIID]
GO
ALTER TABLE [careincident].[OrdersLabDtls]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[OrdersLabDtls] CHECK CONSTRAINT [FK_OrdersToLabTimes_Status]
GO
ALTER TABLE [careincident].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_CareIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Pharmacy] CHECK CONSTRAINT [FK_Pharmacy_CareIncidents]
GO
ALTER TABLE [careincident].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Pharmacy] CHECK CONSTRAINT [FK_Pharmacy_Status]
GO
ALTER TABLE [careincident].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_CareIncident] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Reports] CHECK CONSTRAINT [FK_Reports_CareIncident]
GO
ALTER TABLE [careincident].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Orders] FOREIGN KEY([OrderID])
REFERENCES [careincident].[Orders] ([OrderNumberID])
GO
ALTER TABLE [careincident].[Reports] CHECK CONSTRAINT [FK_Reports_Orders]
GO
ALTER TABLE [careincident].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Reports] CHECK CONSTRAINT [FK_Reports_Status]
GO
ALTER TABLE [careincident].[Vitals]  WITH CHECK ADD  CONSTRAINT [FK_Vitals_CareIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Vitals] CHECK CONSTRAINT [FK_Vitals_CareIncidents]
GO
ALTER TABLE [careincident].[Vitals]  WITH CHECK ADD  CONSTRAINT [FK_Vitals_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Vitals] CHECK CONSTRAINT [FK_Vitals_Status]
GO
ALTER TABLE [clinicalrefdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employer_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[Employers] CHECK CONSTRAINT [FK_Employer_Country]
GO
ALTER TABLE [clinicalrefdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employer_State] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[Employers] CHECK CONSTRAINT [FK_Employer_State]
GO
ALTER TABLE [clinicalrefdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[Employers] CHECK CONSTRAINT [FK_Employers_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[Employers] CHECK CONSTRAINT [FK_Employers_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Employers] CHECK CONSTRAINT [FK_Employers_Status]
GO
ALTER TABLE [clinicalrefdata].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[Genders] CHECK CONSTRAINT [FK_Genders_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[Genders] CHECK CONSTRAINT [FK_Genders_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Genders] CHECK CONSTRAINT [FK_Genders_Status]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_Country]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_InsuranceType] FOREIGN KEY([InsCompanyTypeId])
REFERENCES [clinicalrefdata].[InsuranceTypes] ([InsuranceTypeId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_InsuranceType]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_State] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_State]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurances_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurances_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurances_Status]
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceTypes_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes] CHECK CONSTRAINT [FK_InsuranceTypes_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceTypes_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes] CHECK CONSTRAINT [FK_InsuranceTypes_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes] CHECK CONSTRAINT [FK_InsuranceTypes_Status]
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_Status]
GO
ALTER TABLE [clinicalrefdata].[PatientClasses]  WITH CHECK ADD  CONSTRAINT [FK_PatientClasses_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[PatientClasses] CHECK CONSTRAINT [FK_PatientClasses_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[PatientClasses]  WITH CHECK ADD  CONSTRAINT [FK_PatientClasses_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[PatientClasses] CHECK CONSTRAINT [FK_PatientClasses_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[PatientClasses]  WITH CHECK ADD  CONSTRAINT [FK_PatientClasses_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[PatientClasses] CHECK CONSTRAINT [FK_PatientClasses_Status]
GO
ALTER TABLE [clinicalrefdata].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physician_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[Physicians] CHECK CONSTRAINT [FK_Physician_Country]
GO
ALTER TABLE [clinicalrefdata].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physician_State] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[Physicians] CHECK CONSTRAINT [FK_Physician_State]
GO
ALTER TABLE [clinicalrefdata].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_HealthcareEntities] FOREIGN KEY([HCEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[Physicians] CHECK CONSTRAINT [FK_Physicians_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_PlatformApps] FOREIGN KEY([PlatformAppID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[Physicians] CHECK CONSTRAINT [FK_Physicians_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Physicians] CHECK CONSTRAINT [FK_Physicians_Status]
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes] CHECK CONSTRAINT [FK_PhysicianTypes_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes] CHECK CONSTRAINT [FK_PhysicianTypes_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes] CHECK CONSTRAINT [FK_PhysicianTypes_Status]
GO
ALTER TABLE [clinicalrefdata].[Races]  WITH CHECK ADD  CONSTRAINT [FK_Races_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [clinicalrefdata].[Races] CHECK CONSTRAINT [FK_Races_HealthcareEntities]
GO
ALTER TABLE [clinicalrefdata].[Races]  WITH CHECK ADD  CONSTRAINT [FK_Races_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [clinicalrefdata].[Races] CHECK CONSTRAINT [FK_Races_PlatformApps]
GO
ALTER TABLE [clinicalrefdata].[Races]  WITH CHECK ADD  CONSTRAINT [FK_Races_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Races] CHECK CONSTRAINT [FK_Races_Status]
GO
ALTER TABLE [configrtn].[appModules]  WITH CHECK ADD  CONSTRAINT [FK_appModules_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[appModules] CHECK CONSTRAINT [FK_appModules_Status]
GO
ALTER TABLE [configrtn].[ConfigrationSettings]  WITH CHECK ADD  CONSTRAINT [FK_ConfigrationSettings_ConfigurationSettingType] FOREIGN KEY([ConfigurationSettingType])
REFERENCES [refdata].[ConfigurationSettingType] ([ConfigurationSettingTypeID])
GO
ALTER TABLE [configrtn].[ConfigrationSettings] CHECK CONSTRAINT [FK_ConfigrationSettings_ConfigurationSettingType]
GO
ALTER TABLE [configrtn].[ConfigrationSettings]  WITH CHECK ADD  CONSTRAINT [FK_ConfigrationSettings_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[ConfigrationSettings] CHECK CONSTRAINT [FK_ConfigrationSettings_Status]
GO
ALTER TABLE [configrtn].[HealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_Countries] FOREIGN KEY([Country])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [configrtn].[HealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_Countries]
GO
ALTER TABLE [configrtn].[HealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_States] FOREIGN KEY([State])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [configrtn].[HealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_States]
GO
ALTER TABLE [configrtn].[HealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_StatesLicensed] FOREIGN KEY([LicensedState])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [configrtn].[HealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_StatesLicensed]
GO
ALTER TABLE [configrtn].[HealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[HealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToContacts_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts] CHECK CONSTRAINT [FK_HealthcareEntitiesToContacts_HealthcareEntities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToContacts_ResourceType] FOREIGN KEY([ResourceTypeID])
REFERENCES [refdata].[ResourceType] ([ResourceTypeID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts] CHECK CONSTRAINT [FK_HealthcareEntitiesToContacts_ResourceType]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToContacts_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToContacts] CHECK CONSTRAINT [FK_HealthcareEntitiesToContacts_Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToPlatformApps_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps] CHECK CONSTRAINT [FK_HealthcareEntitiesToPlatformApps_HealthcareEntities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToPlatformApps_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps] CHECK CONSTRAINT [FK_HealthcareEntitiesToPlatformApps_PlatformApps]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToPlatformApps_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToPlatformApps] CHECK CONSTRAINT [FK_HealthcareEntitiesToPlatformApps_Status]
GO
ALTER TABLE [configrtn].[PlatformApps]  WITH CHECK ADD  CONSTRAINT [FK_PlatformApps_PlatformAppType] FOREIGN KEY([PlatformAppTypeID])
REFERENCES [refdata].[PlatformAppType] ([PlatformAppTypeID])
GO
ALTER TABLE [configrtn].[PlatformApps] CHECK CONSTRAINT [FK_PlatformApps_PlatformAppType]
GO
ALTER TABLE [configrtn].[PlatformApps]  WITH CHECK ADD  CONSTRAINT [FK_PlatformApps_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[PlatformApps] CHECK CONSTRAINT [FK_PlatformApps_Status]
GO
ALTER TABLE [configrtn].[PlatformApps]  WITH CHECK ADD  CONSTRAINT [FK_PlatformApps_Vendors] FOREIGN KEY([VendorID])
REFERENCES [configrtn].[Vendors] ([VendorID])
GO
ALTER TABLE [configrtn].[PlatformApps] CHECK CONSTRAINT [FK_PlatformApps_Vendors]
GO
ALTER TABLE [configrtn].[ThirdPartyApps]  WITH CHECK ADD  CONSTRAINT [FK_ThirdPartyApps_PlatformAppType] FOREIGN KEY([PlatformAppTypeID])
REFERENCES [refdata].[PlatformAppType] ([PlatformAppTypeID])
GO
ALTER TABLE [configrtn].[ThirdPartyApps] CHECK CONSTRAINT [FK_ThirdPartyApps_PlatformAppType]
GO
ALTER TABLE [configrtn].[ThirdPartyApps]  WITH CHECK ADD  CONSTRAINT [FK_ThirdPartyApps_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[ThirdPartyApps] CHECK CONSTRAINT [FK_ThirdPartyApps_Status]
GO
ALTER TABLE [configrtn].[ThirdPartyApps]  WITH CHECK ADD  CONSTRAINT [FK_ThirdPartyApps_Vendors] FOREIGN KEY([VendorID])
REFERENCES [configrtn].[Vendors] ([VendorID])
GO
ALTER TABLE [configrtn].[ThirdPartyApps] CHECK CONSTRAINT [FK_ThirdPartyApps_Vendors]
GO
ALTER TABLE [configrtn].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendors_States] FOREIGN KEY([StateID])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [configrtn].[Vendors] CHECK CONSTRAINT [FK_Vendors_States]
GO
ALTER TABLE [configrtn].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendors_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[Vendors] CHECK CONSTRAINT [FK_Vendors_Status]
GO
ALTER TABLE [datamodeldetail].[TableDetails]  WITH CHECK ADD  CONSTRAINT [FK_TableDetails_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [datamodeldetail].[TableDetails] CHECK CONSTRAINT [FK_TableDetails_Status]
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInDiagnosis_Diagnosis] FOREIGN KEY([DiagnosisCode])
REFERENCES [semanticterms].[Diagnosis] ([DiagnosisCode])
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis] CHECK CONSTRAINT [FK_PersonOptInDiagnosis_Diagnosis]
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInDiagnosis_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis] CHECK CONSTRAINT [FK_PersonOptInDiagnosis_Persons]
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInDiagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [dataxchange].[PersonOptInDiagnosis] CHECK CONSTRAINT [FK_PersonOptInDiagnosis_Status]
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInProcedures_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures] CHECK CONSTRAINT [FK_PersonOptInProcedures_Persons]
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInProcedures_Procedures] FOREIGN KEY([ProcedureCode])
REFERENCES [semanticterms].[Procedures] ([ProcedureCode])
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures] CHECK CONSTRAINT [FK_PersonOptInProcedures_Procedures]
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInProcedures_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [dataxchange].[PersonOptInProcedures] CHECK CONSTRAINT [FK_PersonOptInProcedures_Status]
GO
ALTER TABLE [dataxchange].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [dataxchange].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_Persons]
GO
ALTER TABLE [dataxchange].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_PersonsRequesting] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [dataxchange].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_PersonsRequesting]
GO
ALTER TABLE [dataxchange].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [dataxchange].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_Status]
GO
ALTER TABLE [genHealth].[Allergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [genHealth].[Allergies] CHECK CONSTRAINT [FK_Allergies_HealthcareEntities]
GO
ALTER TABLE [genHealth].[Allergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[Allergies] CHECK CONSTRAINT [FK_Allergies_Persons]
GO
ALTER TABLE [genHealth].[Allergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_PlatformApps] FOREIGN KEY([PlatformAppID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [genHealth].[Allergies] CHECK CONSTRAINT [FK_Allergies_PlatformApps]
GO
ALTER TABLE [genHealth].[Allergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[Allergies] CHECK CONSTRAINT [FK_Allergies_Status]
GO
ALTER TABLE [genHealth].[ClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalAddedDetails_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[ClinicalAddedDetails] CHECK CONSTRAINT [FK_ClinicalAddedDetails_Person]
GO
ALTER TABLE [genHealth].[Communications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_CommunicationType] FOREIGN KEY([CommunicationType])
REFERENCES [refdata].[CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [genHealth].[Communications] CHECK CONSTRAINT [FK_Communications_CommunicationType]
GO
ALTER TABLE [genHealth].[Communications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[Communications] CHECK CONSTRAINT [FK_Communications_Persons]
GO
ALTER TABLE [genHealth].[Communications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[Communications] CHECK CONSTRAINT [FK_Communications_Status]
GO
ALTER TABLE [genHealth].[DeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_DeviceAssociation_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[DeviceAssociation] CHECK CONSTRAINT [FK_DeviceAssociation_Person]
GO
ALTER TABLE [genHealth].[DeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_DeviceAssociation_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[DeviceAssociation] CHECK CONSTRAINT [FK_DeviceAssociation_Status]
GO
ALTER TABLE [genHealth].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_DiagnosisCodes] FOREIGN KEY([Diagnosis])
REFERENCES [semanticterms].[Diagnosis] ([DiagnosisCode])
GO
ALTER TABLE [genHealth].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_DiagnosisCodes]
GO
ALTER TABLE [genHealth].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Person]
GO
ALTER TABLE [genHealth].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Status]
GO
ALTER TABLE [genHealth].[HeightsWeights]  WITH CHECK ADD  CONSTRAINT [FK_HeightsWeights_Persons] FOREIGN KEY([PersonD])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[HeightsWeights] CHECK CONSTRAINT [FK_HeightsWeights_Persons]
GO
ALTER TABLE [genHealth].[HeightsWeights]  WITH CHECK ADD  CONSTRAINT [FK_HeightWeights_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[HeightsWeights] CHECK CONSTRAINT [FK_HeightWeights_Status]
GO
ALTER TABLE [genHealth].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_GenHealthProblems_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[Problems] CHECK CONSTRAINT [FK_GenHealthProblems_Status]
GO
ALTER TABLE [genHealth].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_PersonProblems_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[Problems] CHECK CONSTRAINT [FK_PersonProblems_Person]
GO
ALTER TABLE [genHealth].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_PersonProblems_Problem] FOREIGN KEY([ProblemID])
REFERENCES [semanticterms].[SnomedProblems] ([ProblemID])
GO
ALTER TABLE [genHealth].[Problems] CHECK CONSTRAINT [FK_PersonProblems_Problem]
GO
ALTER TABLE [genHealth].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [genHealth].[Procedures] CHECK CONSTRAINT [FK_Procedures_Person]
GO
ALTER TABLE [genHealth].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [genHealth].[Procedures] CHECK CONSTRAINT [FK_Procedures_Status]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccount_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccount_Person]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccount_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccount_Status]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccounts_HealthcareLocations] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccounts_HealthcareLocations]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccounts_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccounts_PlatformApps]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddress_Country]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_State] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddress_State]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_AddressTypes] FOREIGN KEY([AddressTypeId])
REFERENCES [refdata].[AddressTypes] ([AddressTypeId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_AddressTypes]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_HealthcareEntities]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_PlatformApps]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Status]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_HealthcareEntities]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Person]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_PlatformApps]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Status]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Person]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Status] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Status]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployers_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployers_HealthcareEntities]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployers_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployers_PlatformApps]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_HealthcareEntities]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_Persons]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_PlatformApps]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_Procedures] FOREIGN KEY([ImmunizationCode])
REFERENCES [semanticterms].[Procedures] ([ProcedureCode])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_Procedures]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_Status]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhone_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhone_Person]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhone_RefPhoneType] FOREIGN KEY([PhoneTypeId])
REFERENCES [refdata].[PhoneTypes] ([PhoneTypeId])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhone_RefPhoneType]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhones_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhones_HealthcareEntities]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhones_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhones_PlatformApps]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhones_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhones_Status]
GO
ALTER TABLE [persondata].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [persondata].[Persons] CHECK CONSTRAINT [FK_Persons_HealthcareEntities]
GO
ALTER TABLE [persondata].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [persondata].[Persons] CHECK CONSTRAINT [FK_Persons_PlatformApps]
GO
ALTER TABLE [persondata].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[Persons] CHECK CONSTRAINT [FK_Persons_Status]
GO
ALTER TABLE [refdata].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_Status]
GO
ALTER TABLE [refdata].[AuditLoggingEventTypes]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggingEventTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[AuditLoggingEventTypes] CHECK CONSTRAINT [FK_AuditLoggingEventTypes_Status]
GO
ALTER TABLE [refdata].[CommunicationType]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationType_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[CommunicationType] CHECK CONSTRAINT [FK_CommunicationType_Status]
GO
ALTER TABLE [refdata].[ConfigurationSettingType]  WITH CHECK ADD  CONSTRAINT [FK_ConfigurationSettingType_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[ConfigurationSettingType] CHECK CONSTRAINT [FK_ConfigurationSettingType_Status]
GO
ALTER TABLE [refdata].[OIDS]  WITH CHECK ADD  CONSTRAINT [FK_OIDS_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[OIDS] CHECK CONSTRAINT [FK_OIDS_Status]
GO
ALTER TABLE [refdata].[PhoneTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhoneTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[PhoneTypes] CHECK CONSTRAINT [FK_PhoneTypes_Status]
GO
ALTER TABLE [refdata].[PlatformAppType]  WITH CHECK ADD  CONSTRAINT [FK_PlatformAppType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[PlatformAppType] CHECK CONSTRAINT [FK_PlatformAppType_Status]
GO
ALTER TABLE [refdata].[RelationshipType]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipType_RelationshipCategoryType] FOREIGN KEY([RelationshipCategoryTypeId])
REFERENCES [refdata].[RelationshipCategoryType] ([RelationshipCategoryTypeID])
GO
ALTER TABLE [refdata].[RelationshipType] CHECK CONSTRAINT [FK_RelationshipType_RelationshipCategoryType]
GO
ALTER TABLE [refdata].[RelationshipType]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[RelationshipType] CHECK CONSTRAINT [FK_RelationshipType_Status]
GO
ALTER TABLE [refdata].[ResourceType]  WITH CHECK ADD  CONSTRAINT [FK_ResourceType_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[ResourceType] CHECK CONSTRAINT [FK_ResourceType_Status]
GO
ALTER TABLE [refdata].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [refdata].[States] CHECK CONSTRAINT [FK_States_Status]
GO
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_HealthcareEntities]
GO
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_PlatformApps] FOREIGN KEY([PlatformAppsID])
REFERENCES [configrtn].[PlatformApps] ([PlatformAppsID])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_PlatformApps]
GO
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_Status]
GO
ALTER TABLE [semanticterms].[CWETermGroups]  WITH CHECK ADD  CONSTRAINT [FK_CWETermGroups_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[CWETermGroups] CHECK CONSTRAINT [FK_CWETermGroups_Status]
GO
ALTER TABLE [semanticterms].[CWETerms]  WITH CHECK ADD  CONSTRAINT [FK_CWETerms_AltTermGroup_CWETermGroup] FOREIGN KEY([AlternativeTermGroup])
REFERENCES [semanticterms].[CWETermGroups] ([CWETermGroupId])
GO
ALTER TABLE [semanticterms].[CWETerms] CHECK CONSTRAINT [FK_CWETerms_AltTermGroup_CWETermGroup]
GO
ALTER TABLE [semanticterms].[CWETerms]  WITH CHECK ADD  CONSTRAINT [FK_CWETerms_CWETermGroup] FOREIGN KEY([CWETermGroup])
REFERENCES [semanticterms].[CWETermGroups] ([CWETermGroupId])
GO
ALTER TABLE [semanticterms].[CWETerms] CHECK CONSTRAINT [FK_CWETerms_CWETermGroup]
GO
ALTER TABLE [semanticterms].[CWETerms]  WITH CHECK ADD  CONSTRAINT [FK_CWETerms_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[CWETerms] CHECK CONSTRAINT [FK_CWETerms_Status]
GO
ALTER TABLE [semanticterms].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Status]
GO
ALTER TABLE [semanticterms].[LOINC]  WITH CHECK ADD  CONSTRAINT [FK_LOINCCodeset_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[LOINC] CHECK CONSTRAINT [FK_LOINCCodeset_Status]
GO
ALTER TABLE [semanticterms].[RxNorms]  WITH CHECK ADD  CONSTRAINT [FK_RxNorms_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[RxNorms] CHECK CONSTRAINT [FK_RxNorms_Status]
GO
ALTER TABLE [semanticterms].[SnomedCodeset]  WITH CHECK ADD  CONSTRAINT [FK_SnomedCodeset_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[SnomedCodeset] CHECK CONSTRAINT [FK_SnomedCodeset_Status]
GO
ALTER TABLE [semanticterms].[SnomedProblems]  WITH CHECK ADD  CONSTRAINT [FK_SnomedProblems_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[SnomedProblems] CHECK CONSTRAINT [FK_SnomedProblems_Status]
GO
ALTER TABLE [careincident].[Vitals]  WITH CHECK ADD  CONSTRAINT [CK_CareIncidentsVitals_BPDiastolic] CHECK  (([BPDiastolic]>=(0) AND [BPDiastolic]<=(300)))
GO
ALTER TABLE [careincident].[Vitals] CHECK CONSTRAINT [CK_CareIncidentsVitals_BPDiastolic]
GO
ALTER TABLE [careincident].[Vitals]  WITH CHECK ADD  CONSTRAINT [CK_CareIncidentsVitals_BPSystolic] CHECK  (([BPSystolic]>=(0) AND [BPSystolic]<=(300)))
GO
ALTER TABLE [careincident].[Vitals] CHECK CONSTRAINT [CK_CareIncidentsVitals_BPSystolic]
GO
