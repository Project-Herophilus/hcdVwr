/****** Object:  Schema [clnclinterventions]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE SCHEMA [clnclinterventions]
GO
/****** Object:  Schema [persondata]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE SCHEMA [persondata]
GO
/****** Object:  Schema [refdataclinical]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE SCHEMA [refdataclinical]
GO
/****** Object:  Schema [refdatagnrl]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE SCHEMA [refdatagnrl]
GO
/****** Object:  Schema [semanticterms]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE SCHEMA [semanticterms]
GO
/****** Object:  Table [clnclinterventions].[Interventions]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[Interventions](
	[InterventionID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdmitDate] [varchar](10) NULL,
	[AdmitTime] [varchar](12) NULL,
	[DischargeDate] [varchar](10) NULL,
	[DischargeTime] [varchar](12) NULL,
	[AccountID] [bigint] NULL,
	[PersonID] [bigint] NULL,
	[TreatingFacility] [varchar](12) NULL,
	[PlatformAppsID] [varchar](12) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_clnclinterventions] PRIMARY KEY CLUSTERED 
(
	[InterventionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdAllergies]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdAllergies](
	[AllergiesID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[AllergyCode] [varchar](20) NULL,
	[AllergyDesc] [varchar](100) NULL,
	[LineOrderID] [smallint] NULL,
	[ClinicalDateTime] [varchar](15) NULL,
	[DateReported] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RptdAllergies] PRIMARY KEY CLUSTERED 
(
	[AllergiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdClinicalAddedDetails]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdClinicalAddedDetails](
	[RptdClincalAddedDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[LineOrderID] [smallint] NOT NULL,
	[HealthcareOrgName] [varchar](25) NULL,
	[ClinicalDetailNotes] [varchar](256) NULL,
	[ClinicalDateTime] [varchar](15) NULL,
	[CreatedDate] [date] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_RptdClinicalAddedDetails] PRIMARY KEY CLUSTERED 
(
	[RptdClincalAddedDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdDiagnosis]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdDiagnosis](
	[RptdDiagnosisID] [bigint] IDENTITY(1,1) NOT NULL,
	[Diagnosis] [varchar](5) NULL,
	[InterventionID] [bigint] NULL,
	[DiagnosisDate] [varchar](12) NULL,
	[DiagnosisTime] [varchar](20) NULL,
	[ClinicalDateTime] [varchar](15) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RptdDiagnosis] PRIMARY KEY CLUSTERED 
(
	[RptdDiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdGenomics]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdGenomics](
	[GenomicsID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[GenomicsLink] [varchar](65) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Genomics] PRIMARY KEY CLUSTERED 
(
	[GenomicsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdHeightsWeights]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdHeightsWeights](
	[RptdHeightWeightID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[DateReported] [varchar](10) NULL,
	[TimeReported] [varchar](10) NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[WeightFactor] [nchar](10) NULL,
	[HeightFactor] [nchar](10) NULL,
	[CalculatedBMI] [nchar](10) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_RptdHeightWeights] PRIMARY KEY CLUSTERED 
(
	[RptdHeightWeightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdObservations]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdObservations](
	[ObservationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionsID] [bigint] NULL,
	[OrderNumberID] [bigint] NULL,
	[ObservationCode] [varchar](60) NULL,
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
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Observations] PRIMARY KEY CLUSTERED 
(
	[ObservationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdOrders]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdOrders](
	[OrderNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionsID] [bigint] NULL,
	[FillerOrderNumber] [bigint] NULL,
	[FiillerGroupNumber] [bigint] NULL,
	[OrderControlType] [uniqueidentifier] NULL,
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
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_RptdOrders] PRIMARY KEY CLUSTERED 
(
	[OrderNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdOrdersLabDtls]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdOrdersLabDtls](
	[InterventionOrdersToLabDtlID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NOT NULL,
	[OrderNumberID] [bigint] NULL,
	[LabTimesOrderID] [smallint] NOT NULL,
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
 CONSTRAINT [PK_RptdOrdersLabDtls] PRIMARY KEY CLUSTERED 
(
	[InterventionOrdersToLabDtlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdPharmacy]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdPharmacy](
	[RptdPharmacyID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionsID] [bigint] NULL,
	[IncidentDate] [varchar](12) NULL,
	[DrugCode] [varchar](8) NULL,
	[DrugName] [varchar](249) NULL,
	[DrugQuantity] [nvarchar](12) NULL,
	[ScriptDate] [varchar](12) NULL,
	[FilledDate] [varchar](12) NULL,
	[NPI] [varchar](12) NULL,
	[PhysicianName] [varchar](99) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_RptdPharmacy] PRIMARY KEY CLUSTERED 
(
	[RptdPharmacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdProblems]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdProblems](
	[RptdPersonProblemID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[ProblemID] [varchar](8) NULL,
	[ProblemDesc] [varchar](50) NULL,
	[ClinicalDateTime] [varchar](15) NULL,
	[CreatedDate] [date] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_RptdProblems] PRIMARY KEY CLUSTERED 
(
	[RptdPersonProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdProcedures]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdProcedures](
	[RptdProceduresID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[ProcedureCode] [varchar](5) NULL,
	[ProcedureDesc] [varchar](99) NULL,
	[ProcedureDate] [varchar](12) NULL,
	[ProcedureTime] [varchar](16) NULL,
	[DateCreated] [date] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_RptdProcedures] PRIMARY KEY CLUSTERED 
(
	[RptdProceduresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdReports]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdReports](
	[ReportsID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[OrderID] [varchar](20) NULL,
	[InterventionsNotesDetail] [varchar](175) NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_RptdReports] PRIMARY KEY CLUSTERED 
(
	[ReportsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clnclinterventions].[RptdVitals]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clnclinterventions].[RptdVitals](
	[VitalsID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterventionID] [bigint] NULL,
	[BPSystolic] [int] NOT NULL,
	[BPDiastolic] [int] NULL,
	[BPDate] [varchar](12) NULL,
	[BPTime] [varchar](10) NULL,
	[ProcessdDateTime] [datetime] NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_RptdVitals] PRIMARY KEY CLUSTERED 
(
	[VitalsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[ExtrnlCommunications]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[ExtrnlCommunications](
	[ExtrnlCommunictionID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[CommunicationDateTime] [datetime] NULL,
	[CommunicationType] [smallint] NULL,
	[CommunicationDetails] [varchar](1024) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RptdCommunications] PRIMARY KEY CLUSTERED 
(
	[ExtrnlCommunictionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[ExtrnlDeviceAssociation]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[ExtrnlDeviceAssociation](
	[DeviceAssociationID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[DeviceAssociationDateTime] [datetime] NULL,
	[DeviceID] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_ExtrnlDeviceAssociation] PRIMARY KEY CLUSTERED 
(
	[DeviceAssociationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[Person]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[Person](
	[PersonId] [bigint] IDENTITY(1,1) NOT NULL,
	[NameFirst] [varchar](35) NOT NULL,
	[NameMiddle] [varchar](1) NULL,
	[NameLast] [varchar](50) NOT NULL,
	[NameSuffix] [varchar](8) NULL,
	[CompleteName]  AS (([NameLast]+', ')+[NameFirst]) PERSISTED NOT NULL,
	[DLN] [varchar](25) NULL,
	[DLSState] [varchar](2) NULL,
	[SSN] [varchar](12) NULL,
	[DOB] [varchar](14) NULL,
	[TreatmentFacilityID] [varchar](12) NULL,
	[PlatformAppsID] [varchar](12) NULL,
	[UID] [varchar](149) NULL,
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAccounts]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAccounts](
	[PersonAccountsID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[PatientID] [varchar](20) NULL,
	[AltPatientID] [varchar](20) NULL,
	[AccountNumber] [varchar](30) NULL,
	[CustomAccountNumber] [varchar](50) NULL,
	[EMPI] [varchar](25) NULL,
	[SelfSoveriegnID] [uniqueidentifier] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonAccount] PRIMARY KEY CLUSTERED 
(
	[PersonAccountsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAddresses]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAddresses](
	[PersonAddressID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[Address] [varchar](65) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](45) NULL,
	[StateId] [varchar](2) NULL,
	[PostalCode] [varchar](12) NULL,
	[CountryID] [varchar](3) NULL,
	[AddressTypeID] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[PersonAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonDemographics]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonDemographics](
	[PersonDemographicID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[DemographicInfoTypeID] [smallint] NULL,
	[CodeValue] [varchar](10) NULL,
	[CodeDesc] [varchar](75) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](6) NULL,
	[StateID] [varchar](2) NULL,
	[PhoneNumber] [varchar](14) NULL,
	[CustomData] [varchar](25) NULL,
	[CreatedDate] [date] NOT NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonDemographics] PRIMARY KEY CLUSTERED 
(
	[PersonDemographicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonEmployers]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonEmployers](
	[PersonEmployerId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[EmployerCode] [varchar](20) NULL,
	[EmployerName] [varchar](50) NULL,
	[EmployerAddress] [varchar](120) NULL,
	[EmployerCityStateZip] [varchar](120) NULL,
	[JobTitle] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonEmployer] PRIMARY KEY CLUSTERED 
(
	[PersonEmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonImmunizations]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonImmunizations](
	[PersonToImmunizationID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
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
/****** Object:  Table [persondata].[PersonOptInDiagnosis]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonOptInDiagnosis](
	[PersonOptInDiagnosisID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[DiagnosisCode] [varchar](5) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonOptInDiagnosis] PRIMARY KEY CLUSTERED 
(
	[PersonOptInDiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonOptInProcedures]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonOptInProcedures](
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
/****** Object:  Table [persondata].[PersonPhones]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonPhones](
	[PersonPhoneID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NOT NULL,
	[PhoneTypeID] [smallint] NOT NULL,
	[PhoneNumber] [varchar](12) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonPhone] PRIMARY KEY CLUSTERED 
(
	[PersonPhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonToDataRequests]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonToDataRequests](
	[PersonToDataRequestsID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[PersonAffiliatesID] [bigint] NULL,
	[RelationshipTypeId] [smallint] NULL,
	[InitialRequestedDateTime] [datetime] NULL,
	[RequestValidationDateTime] [nchar](10) NULL,
	[RevocationRequestDateTime] [datetime] NULL,
	[InitialRequestId] [varchar](50) NULL,
	[RequestValudationId] [varchar](50) NULL,
	[RevocationRequestId] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonToDataRequests] PRIMARY KEY CLUSTERED 
(
	[PersonToDataRequestsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdataclinical].[Employers]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[Employers](
	[EmployerID] [uniqueidentifier] NOT NULL,
	[EmployeeCode] [varchar](20) NULL,
	[EmployerExternalID] [varchar](10) NULL,
	[EmployerName] [varchar](45) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](65) NULL,
	[StateID] [varchar](2) NULL,
	[CountryID] [varchar](3) NULL,
	[Zipcode] [varchar](10) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[FaxNumber] [varchar](12) NULL,
	[TreatingFacilityID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EmployerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdataclinical].[Genders]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[Genders](
	[GenderId] [uniqueidentifier] NOT NULL,
	[GenderValue] [varchar](1) NULL,
	[GenderCode] [varchar](10) NULL,
	[GenderDesc] [varchar](45) NOT NULL,
	[TreatingFacilityID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RefGender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdataclinical].[Insurances]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[Insurances](
	[InsuranceId] [uniqueidentifier] NOT NULL,
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
	[TreatingFacilitiesID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdataclinical].[InsuranceTypes]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[InsuranceTypes](
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
/****** Object:  Table [refdataclinical].[OrderControlTypes]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[OrderControlTypes](
	[OrderControlTypeId] [uniqueidentifier] NOT NULL,
	[OrderControlTypeCode] [varchar](2) NULL,
	[OrderControlTypeDesc] [varchar](40) NULL,
	[TreatingFacilityID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_OrderControlType] PRIMARY KEY CLUSTERED 
(
	[OrderControlTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdataclinical].[Physician]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[Physician](
	[PhysicianId] [uniqueidentifier] NOT NULL,
	[PhysicianExternalId] [varchar](10) NULL,
	[CompleteName]  AS (([NameLast]+', ')+[NameFirst]) PERSISTED,
	[NameFirst] [varchar](45) NULL,
	[NameMiddle] [varchar](45) NULL,
	[NameLast] [varchar](45) NULL,
	[NPI] [varchar](12) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](65) NULL,
	[StateId] [varchar](2) NULL,
	[Postalcode] [varchar](10) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[FaxNumber] [varchar](12) NULL,
	[MobileNumber] [varchar](12) NULL,
	[TreatingFacilityID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[CountryId] [varchar](3) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdataclinical].[PhysicianType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdataclinical].[PhysicianType](
	[PhysicianTypeId] [uniqueidentifier] NOT NULL,
	[PhysicianTypeCode] [varchar](20) NULL,
	[PhysicianTypeDesc] [varchar](50) NULL,
	[TreatingFacilityID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PhysicianType] PRIMARY KEY CLUSTERED 
(
	[PhysicianTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[AddressType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[AddressType](
	[AddressTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[AddressTypeDesc] [varchar](25) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[Application]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[Application](
	[ApplicationID] [varchar](12) NOT NULL,
	[ApplicationName] [varchar](35) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[CommunicationType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[CommunicationType](
	[CommunicationTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[CommunicationTypeDesc] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_CommunicationType] PRIMARY KEY CLUSTERED 
(
	[CommunicationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[ConfigurationSettingType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[ConfigurationSettingType](
	[ConfigurationSettingTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[ConfigurationSettingTypeDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[StatusID] [smallint] NOT NULL,
 CONSTRAINT [PK_ConfigurationSettingType_1] PRIMARY KEY CLUSTERED 
(
	[ConfigurationSettingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[Countries]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[Countries](
	[CountryID] [varchar](3) NOT NULL,
	[CountryName] [varchar](80) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[DemographicInfoType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[DemographicInfoType](
	[DemographicInfoTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[DemographicInfoTypeDesc] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_DemographicInfoType] PRIMARY KEY CLUSTERED 
(
	[DemographicInfoTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[Department]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[Department](
	[DepartmentID] [varchar](8) NOT NULL,
	[DepartmentDesc] [varchar](10) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[Facilities]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[Facilities](
	[FacilitiesID] [varchar](12) NOT NULL,
	[FacilitiesName] [varchar](25) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[CountryID] [varchar](3) NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[Notes] [varchar](256) NULL,
	[LicenseNumber] [varchar](20) NULL,
	[LicenseType] [varchar](20) NULL,
	[LicensedState] [varchar](2) NULL,
	[OIDID] [varchar](50) NULL,
	[CreatedDate] [date] NOT NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Facilities] PRIMARY KEY CLUSTERED 
(
	[FacilitiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[FacilityRooms]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[FacilityRooms](
	[FacilityRoomId] [varchar](8) NOT NULL,
	[FacilityRoomDesc] [varchar](10) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[TreatingFacilitiesID] [varchar](12) NULL,
 CONSTRAINT [PK_FacilityRooms] PRIMARY KEY CLUSTERED 
(
	[FacilityRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[NamePrefix]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[NamePrefix](
	[NamePrefixId] [varchar](5) NOT NULL,
	[NamePrefixDesc] [varchar](10) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_NamePrefix] PRIMARY KEY CLUSTERED 
(
	[NamePrefixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[NameSuffix]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[NameSuffix](
	[NameSuffixId] [varchar](5) NOT NULL,
	[NameSuffixDesc] [varchar](10) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_NameSuffix] PRIMARY KEY CLUSTERED 
(
	[NameSuffixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[OIDS]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[OIDS](
	[OIDID] [varchar](50) NOT NULL,
	[OIDDesc] [varchar](499) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_OIDS] PRIMARY KEY CLUSTERED 
(
	[OIDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[Organization]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[Organization](
	[OrganizationID] [varchar](12) NOT NULL,
	[OrganizationName] [varchar](25) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](3) NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[Notes] [varchar](256) NULL,
	[LicenseNumber] [varchar](20) NULL,
	[LicenseType] [varchar](20) NULL,
	[LicensedState] [varchar](2) NULL,
	[IncorporatedState] [varchar](2) NULL,
	[OIDID] [varchar](50) NULL,
	[CreatedDate] [date] NOT NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[PhoneType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[PhoneType](
	[PhoneTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PhoneTypeDesc] [varchar](20) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[PlatformAppType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[PlatformAppType](
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
/****** Object:  Table [refdatagnrl].[RelationshipCategoryType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[RelationshipCategoryType](
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
/****** Object:  Table [refdatagnrl].[RelationshipType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[RelationshipType](
	[RelationshipTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[RelationshipTypeDesc] [varchar](35) NULL,
	[RelationshipCategoryTypeID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RelationshipType] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[ResourceType]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[ResourceType](
	[ResourceTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[ResourceTypeDesc] [varchar](20) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_ResourceType] PRIMARY KEY CLUSTERED 
(
	[ResourceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[Statuses]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[Statuses](
	[StatusID] [smallint] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdatagnrl].[USStates]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdatagnrl].[USStates](
	[StateID] [varchar](2) NOT NULL,
	[StateDescription] [varchar](65) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Allergens]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[Allergens](
	[AllergensD] [varchar](10) NOT NULL,
	[AllergyCode] [varchar](20) NULL,
	[AllergyDesc] [varchar](100) NULL,
	[TreatingFacilityID] [varchar](12) NULL,
	[PlatformAppID] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Allergens] PRIMARY KEY CLUSTERED 
(
	[AllergensD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[CWETermGroups]    Script Date: 7/3/2020 10:54:02 PM ******/
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
/****** Object:  Table [semanticterms].[CWETerms]    Script Date: 7/3/2020 10:54:02 PM ******/
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
/****** Object:  Table [semanticterms].[Diagnosis]    Script Date: 7/3/2020 10:54:02 PM ******/
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
/****** Object:  Table [semanticterms].[LOINC]    Script Date: 7/3/2020 10:54:02 PM ******/
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
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_LOINC] PRIMARY KEY CLUSTERED 
(
	[LOINCCodesetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Procedures]    Script Date: 7/3/2020 10:54:02 PM ******/
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
/****** Object:  Table [semanticterms].[RxNorms]    Script Date: 7/3/2020 10:54:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[RxNorms](
	[RXNormID] [varchar](8) NOT NULL,
	[LAT] [varchar](3) NOT NULL,
	[RxNormDesc] [varchar](3000) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RxNorm] PRIMARY KEY CLUSTERED 
(
	[RXNormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[SnomedCodeset]    Script Date: 7/3/2020 10:54:02 PM ******/
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
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_SnomedCodeset] PRIMARY KEY CLUSTERED 
(
	[SnomedCodesetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[SnomedProblems]    Script Date: 7/3/2020 10:54:02 PM ******/
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
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_SnomedProblems] PRIMARY KEY CLUSTERED 
(
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_clnclinterventionss]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IDX_clnclinterventionss] ON [clnclinterventions].[Interventions]
(
	[InterventionID] ASC,
	[AdmitDate] ASC,
	[AdmitTime] ASC,
	[DischargeDate] ASC,
	[DischargeTime] ASC,
	[AccountID] ASC,
	[PersonID] ASC,
	[TreatingFacility] ASC,
	[PlatformAppsID] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdAllergies]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdAllergies] ON [clnclinterventions].[RptdAllergies]
(
	[AllergiesID] ASC,
	[InterventionID] ASC,
	[AllergyCode] ASC,
	[AllergyDesc] ASC,
	[LineOrderID] ASC,
	[ClinicalDateTime] ASC,
	[DateReported] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdClinicalAddedDetails]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdClinicalAddedDetails] ON [clnclinterventions].[RptdClinicalAddedDetails]
(
	[RptdClincalAddedDetailsID] ASC,
	[InterventionID] ASC,
	[LineOrderID] ASC,
	[HealthcareOrgName] ASC,
	[ClinicalDetailNotes] ASC,
	[ClinicalDateTime] ASC,
	[CreatedDate] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdDiagnosis]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdDiagnosis] ON [clnclinterventions].[RptdDiagnosis]
(
	[RptdDiagnosisID] ASC,
	[Diagnosis] ASC,
	[InterventionID] ASC,
	[DiagnosisDate] ASC,
	[DiagnosisTime] ASC,
	[ClinicalDateTime] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdGenomics]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdGenomics] ON [clnclinterventions].[RptdGenomics]
(
	[GenomicsID] ASC,
	[InterventionID] ASC,
	[GenomicsLink] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdHeightsWeights]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdHeightsWeights] ON [clnclinterventions].[RptdHeightsWeights]
(
	[RptdHeightWeightID] ASC,
	[InterventionID] ASC,
	[DateReported] ASC,
	[TimeReported] ASC,
	[Height] ASC,
	[Weight] ASC,
	[WeightFactor] ASC,
	[HeightFactor] ASC,
	[CalculatedBMI] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdObservations]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdObservations] ON [clnclinterventions].[RptdObservations]
(
	[ObservationsID] ASC,
	[InterventionsID] ASC,
	[OrderNumberID] ASC,
	[ObservationCode] ASC,
	[ObservationUnit] ASC,
	[ReferenceRange] ASC,
	[AbnormalFlags] ASC,
	[Probability] ASC,
	[AbnormalTestNature] ASC,
	[ProducerID] ASC,
	[ObservationMethod] ASC,
	[ValueType] ASC,
	[ObservationDate] ASC,
	[ObservationTime] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdOrders]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdOrders] ON [clnclinterventions].[RptdOrders]
(
	[OrderNumberID] ASC,
	[InterventionsID] ASC,
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdOrdersLabDtls]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdOrdersLabDtls] ON [clnclinterventions].[RptdOrdersLabDtls]
(
	[InterventionOrdersToLabDtlID] ASC,
	[InterventionID] ASC,
	[OrderNumberID] ASC,
	[LabTimesOrderID] ASC,
	[Quantity] ASC,
	[ExplicitTime] ASC,
	[RelativeTimeUnits] ASC,
	[ServiceDuration] ASC,
	[DateTimeStart] ASC,
	[DateTimeEnd] ASC,
	[Priority] ASC,
	[OccurenceDuration] ASC,
	[TotalOccurences] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdPharmacy]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdPharmacy] ON [clnclinterventions].[RptdPharmacy]
(
	[RptdPharmacyID] ASC,
	[InterventionsID] ASC,
	[IncidentDate] ASC,
	[DrugCode] ASC,
	[DrugName] ASC,
	[DrugQuantity] ASC,
	[ScriptDate] ASC,
	[FilledDate] ASC,
	[NPI] ASC,
	[PhysicianName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdProblems]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdProblems] ON [clnclinterventions].[RptdProblems]
(
	[RptdPersonProblemID] ASC,
	[InterventionID] ASC,
	[ProblemID] ASC,
	[ProblemDesc] ASC,
	[ClinicalDateTime] ASC,
	[CreatedDate] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdProcedures]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdProcedures] ON [clnclinterventions].[RptdProcedures]
(
	[RptdProceduresID] ASC,
	[InterventionID] ASC,
	[ProcedureCode] ASC,
	[ProcedureDesc] ASC,
	[ProcedureDate] ASC,
	[ProcedureTime] ASC,
	[DateCreated] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdReports]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdReports] ON [clnclinterventions].[RptdReports]
(
	[ReportsID] ASC,
	[InterventionID] ASC,
	[OrderID] ASC,
	[InterventionsNotesDetail] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RptdVitals]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdVitals] ON [clnclinterventions].[RptdVitals]
(
	[VitalsID] ASC,
	[InterventionID] ASC,
	[BPSystolic] ASC,
	[BPDiastolic] ASC,
	[BPDate] ASC,
	[BPTime] ASC,
	[ProcessdDateTime] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RptdCommunications]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RptdCommunications] ON [persondata].[ExtrnlCommunications]
(
	[ExtrnlCommunictionID] ASC,
	[PersonID] ASC,
	[CommunicationType] ASC,
	[CommunicationDateTime] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ExtrnlDeviceAssociation]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExtrnlDeviceAssociation] ON [persondata].[ExtrnlDeviceAssociation]
(
	[DeviceAssociationID] ASC,
	[DeviceAssociationDateTime] ASC,
	[DeviceID] ASC,
	[PersonID] ASC,
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
/****** Object:  Index [IX_Person]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Person] ON [persondata].[Person]
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
	[TreatmentFacilityID] ASC,
	[PlatformAppsID] ASC,
	[DLSState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonAccounts]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonAccounts] ON [persondata].[PersonAccounts]
(
	[PersonAccountsID] ASC,
	[PersonID] ASC,
	[PatientID] ASC,
	[AltPatientID] ASC,
	[AccountNumber] ASC,
	[CustomAccountNumber] ASC,
	[EMPI] ASC,
	[SelfSoveriegnID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonAddresses]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonAddresses] ON [persondata].[PersonAddresses]
(
	[PersonAddressID] ASC,
	[PersonID] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateId] ASC,
	[PostalCode] ASC,
	[CountryID] ASC,
	[AddressTypeID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonDemographics]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonDemographics] ON [persondata].[PersonDemographics]
(
	[PersonDemographicID] ASC,
	[PersonID] ASC,
	[DemographicInfoTypeID] ASC,
	[CodeValue] ASC,
	[CodeDesc] ASC,
	[Address] ASC,
	[City] ASC,
	[StateID] ASC,
	[PhoneNumber] ASC,
	[CustomData] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonEmployers]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonEmployers] ON [persondata].[PersonEmployers]
(
	[PersonEmployerId] ASC,
	[PersonID] ASC,
	[EmployerCode] ASC,
	[EmployerName] ASC,
	[EmployerAddress] ASC,
	[EmployerCityStateZip] ASC,
	[JobTitle] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonImmunizations]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonImmunizations] ON [persondata].[PersonImmunizations]
(
	[PersonToImmunizationID] ASC,
	[PersonID] ASC,
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
/****** Object:  Index [IX_PersonOptInDiagnosis]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonOptInDiagnosis] ON [persondata].[PersonOptInDiagnosis]
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
/****** Object:  Index [IX_PersonOptInProcedures]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonOptInProcedures] ON [persondata].[PersonOptInProcedures]
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonPhone]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonPhone] ON [persondata].[PersonPhones]
(
	[PersonPhoneID] ASC,
	[PersonID] ASC,
	[PhoneTypeID] ASC,
	[PhoneNumber] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersonToDataRequests]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonToDataRequests] ON [persondata].[PersonToDataRequests]
(
	[PersonToDataRequestsID] ASC,
	[PersonID] ASC,
	[PersonAffiliatesID] ASC,
	[RelationshipTypeId] ASC,
	[InitialRequestedDateTime] ASC,
	[RequestValidationDateTime] ASC,
	[RevocationRequestDateTime] ASC,
	[InitialRequestId] ASC,
	[RequestValudationId] ASC,
	[RevocationRequestId] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Employer]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Employer] ON [refdataclinical].[Employers]
(
	[EmployerID] ASC,
	[EmployerExternalID] ASC,
	[EmployerName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateID] ASC,
	[Zipcode] ASC,
	[PhoneNumber] ASC,
	[FaxNumber] ASC,
	[CountryID] ASC,
	[CreatedDate] ASC,
	[EmployeeCode] ASC,
	[PlatformAppID] ASC,
	[StatusID] ASC,
	[TreatingFacilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genders]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Genders] ON [refdataclinical].[Genders]
(
	[GenderId] ASC,
	[GenderCode] ASC,
	[GenderDesc] ASC,
	[TreatingFacilityID] ASC,
	[PlatformAppID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[GenderValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Insurance]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Insurance] ON [refdataclinical].[Insurances]
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
	[TreatingFacilitiesID] ASC,
	[PlatformAppID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_InsuranceTypes]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_InsuranceTypes] ON [refdataclinical].[InsuranceTypes]
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
/****** Object:  Index [IX_OrderControlType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderControlType] ON [refdataclinical].[OrderControlTypes]
(
	[OrderControlTypeId] ASC,
	[OrderControlTypeDesc] ASC,
	[TreatingFacilityID] ASC,
	[PlatformAppID] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[OrderControlTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Physician]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Physician] ON [refdataclinical].[Physician]
(
	[PhysicianId] ASC,
	[PhysicianExternalId] ASC,
	[NameFirst] ASC,
	[NameMiddle] ASC,
	[NameLast] ASC,
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
/****** Object:  Index [IX_Physicians1]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Physicians1] ON [refdataclinical].[Physician]
(
	[PhysicianId] ASC,
	[StatusID] ASC,
	[CompleteName] ASC,
	[TreatingFacilityID] ASC,
	[PlatformAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PhysicianType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PhysicianType] ON [refdataclinical].[PhysicianType]
(
	[PhysicianTypeId] ASC,
	[PhysicianTypeCode] ASC,
	[PhysicianTypeDesc] ASC,
	[TreatingFacilityID] ASC,
	[PlatformAppID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AddressType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AddressType] ON [refdatagnrl].[AddressType]
(
	[AddressTypeId] ASC,
	[AddressTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Application]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Application] ON [refdatagnrl].[Application]
(
	[ApplicationID] ASC,
	[ApplicationName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CommunicationType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_CommunicationType] ON [refdatagnrl].[CommunicationType]
(
	[CommunicationTypeID] ASC,
	[CommunicationTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ConfigurationSettingType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConfigurationSettingType] ON [refdatagnrl].[ConfigurationSettingType]
(
	[ConfigurationSettingTypeID] ASC,
	[ConfigurationSettingTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Country]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Country] ON [refdatagnrl].[Countries]
(
	[CountryID] ASC,
	[CountryName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DemographicInfoType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_DemographicInfoType] ON [refdatagnrl].[DemographicInfoType]
(
	[DemographicInfoTypeID] ASC,
	[DemographicInfoTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Department]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Department] ON [refdatagnrl].[Department]
(
	[DepartmentID] ASC,
	[DepartmentDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Facilities]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Facilities] ON [refdatagnrl].[Facilities]
(
	[FacilitiesID] ASC,
	[FacilitiesName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[State] ASC,
	[PostalCode] ASC,
	[CountryID] ASC,
	[Notes] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[LicenseNumber] ASC,
	[LicensedState] ASC,
	[OIDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FacilityRooms]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_FacilityRooms] ON [refdatagnrl].[FacilityRooms]
(
	[FacilityRoomId] ASC,
	[FacilityRoomDesc] ASC,
	[TreatingFacilitiesID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NamePrefix]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_NamePrefix] ON [refdatagnrl].[NamePrefix]
(
	[NamePrefixId] ASC,
	[NamePrefixDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NameSuffix]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_NameSuffix] ON [refdatagnrl].[NameSuffix]
(
	[NameSuffixId] ASC,
	[NameSuffixDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OIDS]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OIDS] ON [refdatagnrl].[OIDS]
(
	[OIDID] ASC,
	[OIDDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Organization]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Organization] ON [refdatagnrl].[Organization]
(
	[OrganizationID] ASC,
	[OrganizationName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[State] ASC,
	[PostalCode] ASC,
	[Country] ASC,
	[Notes] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[LicenseNumber] ASC,
	[LicensedState] ASC,
	[OIDID] ASC,
	[IncorporatedState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PhoneType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PhoneType] ON [refdatagnrl].[PhoneType]
(
	[PhoneTypeId] ASC,
	[PhoneTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PlatformAppType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_PlatformAppType] ON [refdatagnrl].[PlatformAppType]
(
	[PlatformAppTypeID] ASC,
	[PlatformAppTypeName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RelationshipCategoryType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RelationshipCategoryType] ON [refdatagnrl].[RelationshipCategoryType]
(
	[RelationshipCategoryTypeID] ASC,
	[RelationshipCategoryTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RelationshipType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RelationshipType] ON [refdatagnrl].[RelationshipType]
(
	[RelationshipTypeID] ASC,
	[RelationshipTypeDesc] ASC,
	[RelationshipCategoryTypeID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ResourceType]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ResourceType] ON [refdatagnrl].[ResourceType]
(
	[ResourceTypeID] ASC,
	[ResourceTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Status]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Status] ON [refdatagnrl].[Statuses]
(
	[StatusID] ASC,
	[StatusDescription] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_States]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_States] ON [refdatagnrl].[USStates]
(
	[StateID] ASC,
	[StateDescription] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Allergies]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Allergies] ON [semanticterms].[Allergens]
(
	[AllergensD] ASC,
	[AllergyCode] ASC,
	[AllergyDesc] ASC,
	[TreatingFacilityID] ASC,
	[PlatformAppID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CWETermGroup]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_CWETermGroup] ON [semanticterms].[CWETermGroups]
(
	[CWETermGroupId] ASC,
	[CWETermGroupDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CWETerms]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_CWETerms] ON [semanticterms].[CWETerms]
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
/****** Object:  Index [IX_Diagnosis]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Diagnosis] ON [semanticterms].[Diagnosis]
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
/****** Object:  Index [IX_LOINC]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_LOINC] ON [semanticterms].[LOINC]
(
	[LOINCCodesetID] ASC,
	[CUILink] ASC,
	[Occurence] ASC,
	[CodesetDesc] ASC,
	[CodesetStatus] ASC,
	[Usage] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Procedures]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Procedures] ON [semanticterms].[Procedures]
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
/****** Object:  Index [IX_RxNorm]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_RxNorm] ON [semanticterms].[RxNorms]
(
	[RXNormID] ASC,
	[LAT] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SnomedCodeset]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_SnomedCodeset] ON [semanticterms].[SnomedCodeset]
(
	[SnomedCodesetID] ASC,
	[CUILink] ASC,
	[Occurence] ASC,
	[CodesetDesc] ASC,
	[CodesetStatus] ASC,
	[Usage] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SnomedProblems]    Script Date: 7/3/2020 10:54:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_SnomedProblems] ON [semanticterms].[SnomedProblems]
(
	[ProblemID] ASC,
	[CUILink] ASC,
	[Occurence] ASC,
	[ProblemDesc] ASC,
	[ProblemIDStatus] ASC,
	[Usage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [clnclinterventions].[Interventions] ADD  CONSTRAINT [DF_clnclinterventions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [clnclinterventions].[Interventions] ADD  CONSTRAINT [DF_clnclinterventions_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdAllergies] ADD  CONSTRAINT [DF_Allergies_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdAllergies] ADD  CONSTRAINT [DF_Allergies_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_ClinicalAddedDetailsDateTime]  DEFAULT (getdate()) FOR [ClinicalDateTime]
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_StatusID]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis] ADD  CONSTRAINT [DF_Diagnosis_DiagnosisDateTime]  DEFAULT (getdate()) FOR [ClinicalDateTime]
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis] ADD  CONSTRAINT [DF_Diagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis] ADD  CONSTRAINT [DF_Diagnosis_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdGenomics] ADD  CONSTRAINT [DF_Genomics_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdGenomics] ADD  CONSTRAINT [DF_Genomics_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] ADD  CONSTRAINT [DF_clnclinterventionssHeightWeight_WeightFactor]  DEFAULT (N'clnclinterventionsWeight*.45') FOR [WeightFactor]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] ADD  CONSTRAINT [DF_clnclinterventionssHeightWeight_HeightFactor]  DEFAULT (N'SQUARE(clnclinterventionsHeight*.025)') FOR [HeightFactor]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] ADD  CONSTRAINT [DF_clnclinterventionssHeightWeight_CalculatedBMI]  DEFAULT (N'WeightFactor/HeightFactor') FOR [CalculatedBMI]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] ADD  CONSTRAINT [DF_HeightWeights_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] ADD  CONSTRAINT [DF_HeightWeights_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdObservations] ADD  CONSTRAINT [DF_Observations_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdObservations] ADD  CONSTRAINT [DF_Observations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdOrders] ADD  CONSTRAINT [DF_Orders_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdOrders] ADD  CONSTRAINT [DF_Orders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls] ADD  CONSTRAINT [DF_OrdersToLabTimes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls] ADD  CONSTRAINT [DF_OrdersToLabTimes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdPharmacy] ADD  CONSTRAINT [DF_Pharmacy_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdProblems] ADD  CONSTRAINT [DF__PersonPro__DateP__0F4D3C5F]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clnclinterventions].[RptdProblems] ADD  CONSTRAINT [DF__PersonPro__Statu__10416098]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [clnclinterventions].[RptdProcedures] ADD  CONSTRAINT [DF_Procedures_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [clnclinterventions].[RptdProcedures] ADD  CONSTRAINT [DF_Procedures_Status]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [clnclinterventions].[RptdReports] ADD  CONSTRAINT [DF_Transcriptions_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdReports] ADD  CONSTRAINT [DF_Transcriptions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [clnclinterventions].[RptdVitals] ADD  CONSTRAINT [DF__CareIncid__Proce__40257DE4]  DEFAULT (getdate()) FOR [ProcessdDateTime]
GO
ALTER TABLE [clnclinterventions].[RptdVitals] ADD  CONSTRAINT [DF_Vitals_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[RptdVitals] ADD  CONSTRAINT [DF_Vitals_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [persondata].[ExtrnlCommunications] ADD  CONSTRAINT [DF_Communications_CommunicationDateTime]  DEFAULT (getdate()) FOR [CommunicationDateTime]
GO
ALTER TABLE [persondata].[ExtrnlCommunications] ADD  CONSTRAINT [DF_Communications_CommunicationType]  DEFAULT ((1)) FOR [CommunicationType]
GO
ALTER TABLE [persondata].[ExtrnlCommunications] ADD  CONSTRAINT [DF_Communications_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[ExtrnlCommunications] ADD  CONSTRAINT [DF_Communications_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_DeviceAssociationDateTime]  DEFAULT (getdate()) FOR [DeviceAssociationDateTime]
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[Person] ADD  CONSTRAINT [DF__Persons__Created__51300E55]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[Person] ADD  CONSTRAINT [DF_Persons_Status]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [persondata].[PersonEmployers] ADD  CONSTRAINT [DF_PersonEmployers_StatusId]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonImmunizations] ADD  CONSTRAINT [DF_PersonImmunizations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonImmunizations] ADD  CONSTRAINT [DF_PersonImmunizations_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis] ADD  CONSTRAINT [DF_PersonOptInDiagnosis_EffectiveDate]  DEFAULT (getdate()) FOR [EffectiveDate]
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis] ADD  CONSTRAINT [DF_PersonOptInDiagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis] ADD  CONSTRAINT [DF_PersonOptInDiagnosis_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonOptInProcedures] ADD  CONSTRAINT [DF_PersonOptInProcedures_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonOptInProcedures] ADD  CONSTRAINT [DF_PersonOptInProcedures_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonPhones] ADD  CONSTRAINT [DF_PersonPhones_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonPhones] ADD  CONSTRAINT [DF_PersonPhones_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[PersonToDataRequests] ADD  CONSTRAINT [DF_PersonToDataRequests_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonToDataRequests] ADD  CONSTRAINT [DF_PersonToDataRequests_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[Employers] ADD  CONSTRAINT [DF_Employers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdataclinical].[Employers] ADD  CONSTRAINT [DF_Employers_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[Genders] ADD  CONSTRAINT [DF_Genders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdataclinical].[Genders] ADD  CONSTRAINT [DF_Genders_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[Insurances] ADD  CONSTRAINT [DF_Insurances_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdataclinical].[Insurances] ADD  CONSTRAINT [DF_Insurances_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[InsuranceTypes] ADD  CONSTRAINT [DF_InsuranceTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdataclinical].[InsuranceTypes] ADD  CONSTRAINT [DF_InsuranceTypes_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[OrderControlTypes] ADD  CONSTRAINT [DF_OrderControlTypes_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [refdataclinical].[OrderControlTypes] ADD  CONSTRAINT [DF_OrderControlTypes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[Physician] ADD  CONSTRAINT [DF_Physicians_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [refdataclinical].[Physician] ADD  CONSTRAINT [DF_Physicians_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdataclinical].[PhysicianType] ADD  CONSTRAINT [DF_PhysicianTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdataclinical].[PhysicianType] ADD  CONSTRAINT [DF_PhysicianTypes_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[AddressType] ADD  CONSTRAINT [DF_AddressTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[AddressType] ADD  CONSTRAINT [DF_AddressTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdatagnrl].[Application] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[Application] ADD  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[CommunicationType] ADD  CONSTRAINT [DF_CommunicationType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[CommunicationType] ADD  CONSTRAINT [DF_CommunicationType_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[ConfigurationSettingType] ADD  CONSTRAINT [DF_ConfigurationSettingType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[ConfigurationSettingType] ADD  CONSTRAINT [DF_ConfigurationSettingType_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[Countries] ADD  CONSTRAINT [DF_Countries_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[Countries] ADD  CONSTRAINT [DF_Countries_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[DemographicInfoType] ADD  CONSTRAINT [DF_DemographicInfoType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[DemographicInfoType] ADD  CONSTRAINT [DF_DemographicInfoType_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[Department] ADD  CONSTRAINT [DF_Department_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[Department] ADD  CONSTRAINT [DF_Department_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[Facilities] ADD  CONSTRAINT [DF_Facilities_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[Facilities] ADD  CONSTRAINT [DF_Facilities_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[FacilityRooms] ADD  CONSTRAINT [DF_FacilityRooms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[FacilityRooms] ADD  CONSTRAINT [DF_FacilityRooms_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[NamePrefix] ADD  CONSTRAINT [DF_NamePrefix_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[NamePrefix] ADD  CONSTRAINT [DF_NamePrefix_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[NameSuffix] ADD  CONSTRAINT [DF_NameSuffix_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[NameSuffix] ADD  CONSTRAINT [DF_NameSuffix_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[OIDS] ADD  CONSTRAINT [DF_OIDS_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[OIDS] ADD  CONSTRAINT [DF_OIDS_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[Organization] ADD  CONSTRAINT [DF_Organization_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[Organization] ADD  CONSTRAINT [DF_Organization_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[PhoneType] ADD  CONSTRAINT [DF_PhoneTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[PhoneType] ADD  CONSTRAINT [DF_PhoneTypes_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[PlatformAppType] ADD  CONSTRAINT [DF_PlatformAppType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[PlatformAppType] ADD  CONSTRAINT [DF_PlatformAppType_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[RelationshipCategoryType] ADD  CONSTRAINT [DF_RelationshipCategoryType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[RelationshipCategoryType] ADD  CONSTRAINT [DF_RelationshipCategoryType_StatusId]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [refdatagnrl].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_RelationshipCategoryTypeId]  DEFAULT ((1)) FOR [RelationshipCategoryTypeID]
GO
ALTER TABLE [refdatagnrl].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[ResourceType] ADD  CONSTRAINT [DF_ResourceType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[ResourceType] ADD  CONSTRAINT [DF_ResourceType_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdatagnrl].[Statuses] ADD  CONSTRAINT [DF_Status_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[USStates] ADD  CONSTRAINT [DF_States_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdatagnrl].[USStates] ADD  CONSTRAINT [DF_States_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[Allergens] ADD  CONSTRAINT [DF_Allergens_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[Allergens] ADD  CONSTRAINT [DF_Allergens_StatusID]  DEFAULT ((1)) FOR [StatusID]
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
ALTER TABLE [semanticterms].[LOINC] ADD  CONSTRAINT [DF_LOINCCodeset_Status]  DEFAULT ((1)) FOR [StatusID]
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
ALTER TABLE [semanticterms].[SnomedCodeset] ADD  CONSTRAINT [DF_SnomedCodeset_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [semanticterms].[SnomedProblems] ADD  CONSTRAINT [DF_SnomedProblems_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[SnomedProblems] ADD  CONSTRAINT [DF_SnomedProblems_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [clnclinterventions].[Interventions]  WITH CHECK ADD  CONSTRAINT [FK_Interventions_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [clnclinterventions].[Interventions] CHECK CONSTRAINT [FK_Interventions_Accounts]
GO
ALTER TABLE [clnclinterventions].[Interventions]  WITH CHECK ADD  CONSTRAINT [FK_Interventions_Application] FOREIGN KEY([PlatformAppsID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [clnclinterventions].[Interventions] CHECK CONSTRAINT [FK_Interventions_Application]
GO
ALTER TABLE [clnclinterventions].[Interventions]  WITH CHECK ADD  CONSTRAINT [FK_Interventions_Facilities] FOREIGN KEY([TreatingFacility])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [clnclinterventions].[Interventions] CHECK CONSTRAINT [FK_Interventions_Facilities]
GO
ALTER TABLE [clnclinterventions].[Interventions]  WITH CHECK ADD  CONSTRAINT [FK_Interventions_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [clnclinterventions].[Interventions] CHECK CONSTRAINT [FK_Interventions_Persons]
GO
ALTER TABLE [clnclinterventions].[Interventions]  WITH CHECK ADD  CONSTRAINT [FK_Interventions_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[Interventions] CHECK CONSTRAINT [FK_Interventions_Status]
GO
ALTER TABLE [clnclinterventions].[RptdAllergies]  WITH CHECK ADD  CONSTRAINT [FK_RptdAllergies_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdAllergies] CHECK CONSTRAINT [FK_RptdAllergies_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdAllergies]  WITH CHECK ADD  CONSTRAINT [FK_RptdAllergies_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdAllergies] CHECK CONSTRAINT [FK_RptdAllergies_Status]
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_RptdClinicalAddedDetails_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails] CHECK CONSTRAINT [FK_RptdClinicalAddedDetails_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_RptdClinicalAddedDetails_Status] FOREIGN KEY([StatusId])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdClinicalAddedDetails] CHECK CONSTRAINT [FK_RptdClinicalAddedDetails_Status]
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_RptdDiagnosis_DiagnosisCodes] FOREIGN KEY([Diagnosis])
REFERENCES [semanticterms].[Diagnosis] ([DiagnosisCode])
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis] CHECK CONSTRAINT [FK_RptdDiagnosis_DiagnosisCodes]
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_RptdDiagnosis_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis] CHECK CONSTRAINT [FK_RptdDiagnosis_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_RptdDiagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdDiagnosis] CHECK CONSTRAINT [FK_RptdDiagnosis_Status]
GO
ALTER TABLE [clnclinterventions].[RptdGenomics]  WITH CHECK ADD  CONSTRAINT [FK_Genomics_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdGenomics] CHECK CONSTRAINT [FK_Genomics_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdGenomics]  WITH CHECK ADD  CONSTRAINT [FK_Genomics_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdGenomics] CHECK CONSTRAINT [FK_Genomics_Status]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights]  WITH CHECK ADD  CONSTRAINT [FK_RptdHeightsWeights_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] CHECK CONSTRAINT [FK_RptdHeightsWeights_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights]  WITH CHECK ADD  CONSTRAINT [FK_RptdHeightWeights_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdHeightsWeights] CHECK CONSTRAINT [FK_RptdHeightWeights_Status]
GO
ALTER TABLE [clnclinterventions].[RptdObservations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_Interventions] FOREIGN KEY([InterventionsID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdObservations] CHECK CONSTRAINT [FK_Observations_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdObservations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_RptdOrders] FOREIGN KEY([OrderNumberID])
REFERENCES [clnclinterventions].[RptdOrders] ([OrderNumberID])
GO
ALTER TABLE [clnclinterventions].[RptdObservations] CHECK CONSTRAINT [FK_Observations_RptdOrders]
GO
ALTER TABLE [clnclinterventions].[RptdObservations]  WITH CHECK ADD  CONSTRAINT [FK_Observations_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdObservations] CHECK CONSTRAINT [FK_Observations_Status]
GO
ALTER TABLE [clnclinterventions].[RptdOrders]  WITH CHECK ADD  CONSTRAINT [FK_RptdOrders_Interventions] FOREIGN KEY([InterventionsID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdOrders] CHECK CONSTRAINT [FK_RptdOrders_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdOrders]  WITH CHECK ADD  CONSTRAINT [FK_RptdOrders_OrderControlType] FOREIGN KEY([OrderControlType])
REFERENCES [refdataclinical].[OrderControlTypes] ([OrderControlTypeId])
GO
ALTER TABLE [clnclinterventions].[RptdOrders] CHECK CONSTRAINT [FK_RptdOrders_OrderControlType]
GO
ALTER TABLE [clnclinterventions].[RptdOrders]  WITH CHECK ADD  CONSTRAINT [FK_RptdOrders_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdOrders] CHECK CONSTRAINT [FK_RptdOrders_Status]
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls]  WITH CHECK ADD  CONSTRAINT [FK_RptdOrdersLabDtls_Orders] FOREIGN KEY([OrderNumberID])
REFERENCES [clnclinterventions].[RptdOrders] ([OrderNumberID])
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls] CHECK CONSTRAINT [FK_RptdOrdersLabDtls_Orders]
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls]  WITH CHECK ADD  CONSTRAINT [FK_RptdOrdersToLabTimes_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls] CHECK CONSTRAINT [FK_RptdOrdersToLabTimes_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls]  WITH CHECK ADD  CONSTRAINT [FK_RptdOrdersToLabTimes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdOrdersLabDtls] CHECK CONSTRAINT [FK_RptdOrdersToLabTimes_Status]
GO
ALTER TABLE [clnclinterventions].[RptdPharmacy]  WITH CHECK ADD  CONSTRAINT [FK_RptdPharmacy_Interventions] FOREIGN KEY([InterventionsID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdPharmacy] CHECK CONSTRAINT [FK_RptdPharmacy_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdPharmacy]  WITH CHECK ADD  CONSTRAINT [FK_RptdPharmacy_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdPharmacy] CHECK CONSTRAINT [FK_RptdPharmacy_Status]
GO
ALTER TABLE [clnclinterventions].[RptdProblems]  WITH CHECK ADD  CONSTRAINT [FK_RptdProblems_Intervention] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdProblems] CHECK CONSTRAINT [FK_RptdProblems_Intervention]
GO
ALTER TABLE [clnclinterventions].[RptdProblems]  WITH CHECK ADD  CONSTRAINT [FK_RptdProblems_Problem] FOREIGN KEY([ProblemID])
REFERENCES [semanticterms].[SnomedProblems] ([ProblemID])
GO
ALTER TABLE [clnclinterventions].[RptdProblems] CHECK CONSTRAINT [FK_RptdProblems_Problem]
GO
ALTER TABLE [clnclinterventions].[RptdProblems]  WITH CHECK ADD  CONSTRAINT [FK_RptdProblems_Status] FOREIGN KEY([StatusId])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdProblems] CHECK CONSTRAINT [FK_RptdProblems_Status]
GO
ALTER TABLE [clnclinterventions].[RptdProcedures]  WITH CHECK ADD  CONSTRAINT [FK_RptdProcedures_Intervention] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdProcedures] CHECK CONSTRAINT [FK_RptdProcedures_Intervention]
GO
ALTER TABLE [clnclinterventions].[RptdProcedures]  WITH CHECK ADD  CONSTRAINT [FK_RptdProcedures_Status] FOREIGN KEY([StatusId])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdProcedures] CHECK CONSTRAINT [FK_RptdProcedures_Status]
GO
ALTER TABLE [clnclinterventions].[RptdReports]  WITH CHECK ADD  CONSTRAINT [FK_RptdReports_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdReports] CHECK CONSTRAINT [FK_RptdReports_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdReports]  WITH CHECK ADD  CONSTRAINT [FK_RptdReports_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdReports] CHECK CONSTRAINT [FK_RptdReports_Status]
GO
ALTER TABLE [clnclinterventions].[RptdVitals]  WITH CHECK ADD  CONSTRAINT [FK_RptdVitals_Interventions] FOREIGN KEY([InterventionID])
REFERENCES [clnclinterventions].[Interventions] ([InterventionID])
GO
ALTER TABLE [clnclinterventions].[RptdVitals] CHECK CONSTRAINT [FK_RptdVitals_Interventions]
GO
ALTER TABLE [clnclinterventions].[RptdVitals]  WITH CHECK ADD  CONSTRAINT [FK_RptdVitals_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [clnclinterventions].[RptdVitals] CHECK CONSTRAINT [FK_RptdVitals_Status]
GO
ALTER TABLE [persondata].[ExtrnlCommunications]  WITH CHECK ADD  CONSTRAINT [FK_RptdCommunications_CommunicationType] FOREIGN KEY([CommunicationType])
REFERENCES [refdatagnrl].[CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [persondata].[ExtrnlCommunications] CHECK CONSTRAINT [FK_RptdCommunications_CommunicationType]
GO
ALTER TABLE [persondata].[ExtrnlCommunications]  WITH CHECK ADD  CONSTRAINT [FK_RptdCommunications_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[ExtrnlCommunications] CHECK CONSTRAINT [FK_RptdCommunications_Persons]
GO
ALTER TABLE [persondata].[ExtrnlCommunications]  WITH CHECK ADD  CONSTRAINT [FK_RptdCommunications_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[ExtrnlCommunications] CHECK CONSTRAINT [FK_RptdCommunications_Status]
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_RptdDeviceAssociation_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation] CHECK CONSTRAINT [FK_RptdDeviceAssociation_Person]
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_RptdDeviceAssociation_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[ExtrnlDeviceAssociation] CHECK CONSTRAINT [FK_RptdDeviceAssociation_Status]
GO
ALTER TABLE [persondata].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Application] FOREIGN KEY([PlatformAppsID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [persondata].[Person] CHECK CONSTRAINT [FK_Person_Application]
GO
ALTER TABLE [persondata].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Facilities] FOREIGN KEY([TreatmentFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [persondata].[Person] CHECK CONSTRAINT [FK_Person_Facilities]
GO
ALTER TABLE [persondata].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Status] FOREIGN KEY([Status])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[Person] CHECK CONSTRAINT [FK_Person_Status]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccount_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccount_Person]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccount_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccount_Status]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Country] FOREIGN KEY([CountryID])
REFERENCES [refdatagnrl].[Countries] ([CountryID])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddress_Country]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddress_Person]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddress_State] FOREIGN KEY([StateId])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddress_State]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_AddressTypes] FOREIGN KEY([AddressTypeID])
REFERENCES [refdatagnrl].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_AddressTypes]
GO
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Status]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_DemographicInfoType] FOREIGN KEY([DemographicInfoTypeID])
REFERENCES [refdatagnrl].[DemographicInfoType] ([DemographicInfoTypeID])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_DemographicInfoType]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Person]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Status]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Person]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Status]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_Persons]
GO
ALTER TABLE [persondata].[PersonImmunizations]  WITH CHECK ADD  CONSTRAINT [FK_PersonImmunizations_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonImmunizations] CHECK CONSTRAINT [FK_PersonImmunizations_Status]
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInDiagnosis_Diagnosis] FOREIGN KEY([DiagnosisCode])
REFERENCES [semanticterms].[Diagnosis] ([DiagnosisCode])
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis] CHECK CONSTRAINT [FK_PersonOptInDiagnosis_Diagnosis]
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInDiagnosis_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis] CHECK CONSTRAINT [FK_PersonOptInDiagnosis_Persons]
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInDiagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonOptInDiagnosis] CHECK CONSTRAINT [FK_PersonOptInDiagnosis_Status]
GO
ALTER TABLE [persondata].[PersonOptInProcedures]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInProcedures_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonOptInProcedures] CHECK CONSTRAINT [FK_PersonOptInProcedures_Persons]
GO
ALTER TABLE [persondata].[PersonOptInProcedures]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInProcedures_Procedures] FOREIGN KEY([ProcedureCode])
REFERENCES [semanticterms].[Procedures] ([ProcedureCode])
GO
ALTER TABLE [persondata].[PersonOptInProcedures] CHECK CONSTRAINT [FK_PersonOptInProcedures_Procedures]
GO
ALTER TABLE [persondata].[PersonOptInProcedures]  WITH CHECK ADD  CONSTRAINT [FK_PersonOptInProcedures_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonOptInProcedures] CHECK CONSTRAINT [FK_PersonOptInProcedures_Status]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhone_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhone_Person]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhone_PhoneType] FOREIGN KEY([PhoneTypeID])
REFERENCES [refdatagnrl].[PhoneType] ([PhoneTypeId])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhone_PhoneType]
GO
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhones_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhones_Status]
GO
ALTER TABLE [persondata].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_PersonsAffiliates] FOREIGN KEY([PersonAffiliatesID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_PersonsAffiliates]
GO
ALTER TABLE [persondata].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_PersonsRequesting] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Person] ([PersonId])
GO
ALTER TABLE [persondata].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_PersonsRequesting]
GO
ALTER TABLE [persondata].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_RelationshipType] FOREIGN KEY([RelationshipTypeId])
REFERENCES [refdatagnrl].[RelationshipType] ([RelationshipTypeID])
GO
ALTER TABLE [persondata].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_RelationshipType]
GO
ALTER TABLE [persondata].[PersonToDataRequests]  WITH CHECK ADD  CONSTRAINT [FK_PersonToDataRequests_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [persondata].[PersonToDataRequests] CHECK CONSTRAINT [FK_PersonToDataRequests_Status]
GO
ALTER TABLE [refdataclinical].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employer_Country] FOREIGN KEY([CountryID])
REFERENCES [refdatagnrl].[Countries] ([CountryID])
GO
ALTER TABLE [refdataclinical].[Employers] CHECK CONSTRAINT [FK_Employer_Country]
GO
ALTER TABLE [refdataclinical].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employer_State] FOREIGN KEY([StateID])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdataclinical].[Employers] CHECK CONSTRAINT [FK_Employer_State]
GO
ALTER TABLE [refdataclinical].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [refdataclinical].[Employers] CHECK CONSTRAINT [FK_Employers_Application]
GO
ALTER TABLE [refdataclinical].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_Facilities] FOREIGN KEY([TreatingFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdataclinical].[Employers] CHECK CONSTRAINT [FK_Employers_Facilities]
GO
ALTER TABLE [refdataclinical].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[Employers] CHECK CONSTRAINT [FK_Employers_Status]
GO
ALTER TABLE [refdataclinical].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [refdataclinical].[Genders] CHECK CONSTRAINT [FK_Genders_Application]
GO
ALTER TABLE [refdataclinical].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_Facilities] FOREIGN KEY([TreatingFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdataclinical].[Genders] CHECK CONSTRAINT [FK_Genders_Facilities]
GO
ALTER TABLE [refdataclinical].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[Genders] CHECK CONSTRAINT [FK_Genders_Status]
GO
ALTER TABLE [refdataclinical].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Country] FOREIGN KEY([CountryId])
REFERENCES [refdatagnrl].[Countries] ([CountryID])
GO
ALTER TABLE [refdataclinical].[Insurances] CHECK CONSTRAINT [FK_Insurance_Country]
GO
ALTER TABLE [refdataclinical].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_InsuranceType] FOREIGN KEY([InsCompanyTypeId])
REFERENCES [refdataclinical].[InsuranceTypes] ([InsuranceTypeId])
GO
ALTER TABLE [refdataclinical].[Insurances] CHECK CONSTRAINT [FK_Insurance_InsuranceType]
GO
ALTER TABLE [refdataclinical].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_State] FOREIGN KEY([StateId])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdataclinical].[Insurances] CHECK CONSTRAINT [FK_Insurance_State]
GO
ALTER TABLE [refdataclinical].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [refdataclinical].[Insurances] CHECK CONSTRAINT [FK_Insurances_Application]
GO
ALTER TABLE [refdataclinical].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_Facilities] FOREIGN KEY([TreatingFacilitiesID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdataclinical].[Insurances] CHECK CONSTRAINT [FK_Insurances_Facilities]
GO
ALTER TABLE [refdataclinical].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[Insurances] CHECK CONSTRAINT [FK_Insurances_Status]
GO
ALTER TABLE [refdataclinical].[InsuranceTypes]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[InsuranceTypes] CHECK CONSTRAINT [FK_InsuranceTypes_Status]
GO
ALTER TABLE [refdataclinical].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [refdataclinical].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_Application]
GO
ALTER TABLE [refdataclinical].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_Facilities] FOREIGN KEY([TreatingFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdataclinical].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_Facilities]
GO
ALTER TABLE [refdataclinical].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_Status]
GO
ALTER TABLE [refdataclinical].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physician_Country] FOREIGN KEY([CountryId])
REFERENCES [refdatagnrl].[Countries] ([CountryID])
GO
ALTER TABLE [refdataclinical].[Physician] CHECK CONSTRAINT [FK_Physician_Country]
GO
ALTER TABLE [refdataclinical].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physician_State] FOREIGN KEY([StateId])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdataclinical].[Physician] CHECK CONSTRAINT [FK_Physician_State]
GO
ALTER TABLE [refdataclinical].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [refdataclinical].[Physician] CHECK CONSTRAINT [FK_Physicians_Application]
GO
ALTER TABLE [refdataclinical].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_Facilities] FOREIGN KEY([TreatingFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdataclinical].[Physician] CHECK CONSTRAINT [FK_Physicians_Facilities]
GO
ALTER TABLE [refdataclinical].[Physician]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[Physician] CHECK CONSTRAINT [FK_Physicians_Status]
GO
ALTER TABLE [refdataclinical].[PhysicianType]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [refdataclinical].[PhysicianType] CHECK CONSTRAINT [FK_PhysicianTypes_Application]
GO
ALTER TABLE [refdataclinical].[PhysicianType]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_Facilities] FOREIGN KEY([TreatingFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdataclinical].[PhysicianType] CHECK CONSTRAINT [FK_PhysicianTypes_Facilities]
GO
ALTER TABLE [refdataclinical].[PhysicianType]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdataclinical].[PhysicianType] CHECK CONSTRAINT [FK_PhysicianTypes_Status]
GO
ALTER TABLE [refdatagnrl].[AddressType]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[AddressType] CHECK CONSTRAINT [FK_AddressTypes_Status]
GO
ALTER TABLE [refdatagnrl].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Statuses] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[Application] CHECK CONSTRAINT [FK_Application_Statuses]
GO
ALTER TABLE [refdatagnrl].[CommunicationType]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[CommunicationType] CHECK CONSTRAINT [FK_CommunicationType_Status]
GO
ALTER TABLE [refdatagnrl].[ConfigurationSettingType]  WITH CHECK ADD  CONSTRAINT [FK_ConfigurationSettingType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[ConfigurationSettingType] CHECK CONSTRAINT [FK_ConfigurationSettingType_Status]
GO
ALTER TABLE [refdatagnrl].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[Countries] CHECK CONSTRAINT [FK_Countries_Status]
GO
ALTER TABLE [refdatagnrl].[DemographicInfoType]  WITH CHECK ADD  CONSTRAINT [FK_DemographicInfoType_Statuses] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[DemographicInfoType] CHECK CONSTRAINT [FK_DemographicInfoType_Statuses]
GO
ALTER TABLE [refdatagnrl].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[Department] CHECK CONSTRAINT [FK_Department_Status]
GO
ALTER TABLE [refdatagnrl].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_Countries] FOREIGN KEY([CountryID])
REFERENCES [refdatagnrl].[Countries] ([CountryID])
GO
ALTER TABLE [refdatagnrl].[Facilities] CHECK CONSTRAINT [FK_Facilities_Countries]
GO
ALTER TABLE [refdatagnrl].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_States] FOREIGN KEY([State])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdatagnrl].[Facilities] CHECK CONSTRAINT [FK_Facilities_States]
GO
ALTER TABLE [refdatagnrl].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_StatesLicensed] FOREIGN KEY([LicensedState])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdatagnrl].[Facilities] CHECK CONSTRAINT [FK_Facilities_StatesLicensed]
GO
ALTER TABLE [refdatagnrl].[Facilities]  WITH CHECK ADD  CONSTRAINT [FK_Facilities_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[Facilities] CHECK CONSTRAINT [FK_Facilities_Status]
GO
ALTER TABLE [refdatagnrl].[FacilityRooms]  WITH CHECK ADD  CONSTRAINT [FK_FacilityRooms_Facilities] FOREIGN KEY([TreatingFacilitiesID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [refdatagnrl].[FacilityRooms] CHECK CONSTRAINT [FK_FacilityRooms_Facilities]
GO
ALTER TABLE [refdatagnrl].[FacilityRooms]  WITH CHECK ADD  CONSTRAINT [FK_FacilityRooms_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[FacilityRooms] CHECK CONSTRAINT [FK_FacilityRooms_Status]
GO
ALTER TABLE [refdatagnrl].[NamePrefix]  WITH CHECK ADD  CONSTRAINT [FK_NamePrefix_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[NamePrefix] CHECK CONSTRAINT [FK_NamePrefix_Status]
GO
ALTER TABLE [refdatagnrl].[NameSuffix]  WITH CHECK ADD  CONSTRAINT [FK_NameSuffix_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[NameSuffix] CHECK CONSTRAINT [FK_NameSuffix_Status]
GO
ALTER TABLE [refdatagnrl].[OIDS]  WITH CHECK ADD  CONSTRAINT [FK_OIDS_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[OIDS] CHECK CONSTRAINT [FK_OIDS_Status]
GO
ALTER TABLE [refdatagnrl].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Countries] FOREIGN KEY([Country])
REFERENCES [refdatagnrl].[Countries] ([CountryID])
GO
ALTER TABLE [refdatagnrl].[Organization] CHECK CONSTRAINT [FK_Organization_Countries]
GO
ALTER TABLE [refdatagnrl].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_States] FOREIGN KEY([State])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdatagnrl].[Organization] CHECK CONSTRAINT [FK_Organization_States]
GO
ALTER TABLE [refdatagnrl].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_StatesIncorporated] FOREIGN KEY([IncorporatedState])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdatagnrl].[Organization] CHECK CONSTRAINT [FK_Organization_StatesIncorporated]
GO
ALTER TABLE [refdatagnrl].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_StatesLicensed] FOREIGN KEY([LicensedState])
REFERENCES [refdatagnrl].[USStates] ([StateID])
GO
ALTER TABLE [refdatagnrl].[Organization] CHECK CONSTRAINT [FK_Organization_StatesLicensed]
GO
ALTER TABLE [refdatagnrl].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[Organization] CHECK CONSTRAINT [FK_Organization_Status]
GO
ALTER TABLE [refdatagnrl].[PhoneType]  WITH CHECK ADD  CONSTRAINT [FK_PhoneTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[PhoneType] CHECK CONSTRAINT [FK_PhoneTypes_Status]
GO
ALTER TABLE [refdatagnrl].[PlatformAppType]  WITH CHECK ADD  CONSTRAINT [FK_PlatformAppType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[PlatformAppType] CHECK CONSTRAINT [FK_PlatformAppType_Status]
GO
ALTER TABLE [refdatagnrl].[RelationshipCategoryType]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipCategoryType_Status] FOREIGN KEY([StatusId])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[RelationshipCategoryType] CHECK CONSTRAINT [FK_RelationshipCategoryType_Status]
GO
ALTER TABLE [refdatagnrl].[RelationshipType]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipType_RelationshipCategoryType] FOREIGN KEY([RelationshipCategoryTypeID])
REFERENCES [refdatagnrl].[RelationshipCategoryType] ([RelationshipCategoryTypeID])
GO
ALTER TABLE [refdatagnrl].[RelationshipType] CHECK CONSTRAINT [FK_RelationshipType_RelationshipCategoryType]
GO
ALTER TABLE [refdatagnrl].[RelationshipType]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[RelationshipType] CHECK CONSTRAINT [FK_RelationshipType_Status]
GO
ALTER TABLE [refdatagnrl].[ResourceType]  WITH CHECK ADD  CONSTRAINT [FK_ResourceType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[ResourceType] CHECK CONSTRAINT [FK_ResourceType_Status]
GO
ALTER TABLE [refdatagnrl].[USStates]  WITH CHECK ADD  CONSTRAINT [FK_States_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [refdatagnrl].[USStates] CHECK CONSTRAINT [FK_States_Status]
GO
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_Application] FOREIGN KEY([PlatformAppID])
REFERENCES [refdatagnrl].[Application] ([ApplicationID])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_Application]
GO
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_Facilities] FOREIGN KEY([TreatingFacilityID])
REFERENCES [refdatagnrl].[Facilities] ([FacilitiesID])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_Facilities]
GO
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_Status]
GO
ALTER TABLE [semanticterms].[CWETermGroups]  WITH CHECK ADD  CONSTRAINT [FK_CWETermGroups_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
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
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[CWETerms] CHECK CONSTRAINT [FK_CWETerms_Status]
GO
ALTER TABLE [semanticterms].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Status]
GO
ALTER TABLE [semanticterms].[LOINC]  WITH CHECK ADD  CONSTRAINT [FK_LOINCCodeset_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[LOINC] CHECK CONSTRAINT [FK_LOINCCodeset_Status]
GO
ALTER TABLE [semanticterms].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[Procedures] CHECK CONSTRAINT [FK_Procedures_Status]
GO
ALTER TABLE [semanticterms].[RxNorms]  WITH CHECK ADD  CONSTRAINT [FK_RxNorms_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[RxNorms] CHECK CONSTRAINT [FK_RxNorms_Status]
GO
ALTER TABLE [semanticterms].[SnomedCodeset]  WITH CHECK ADD  CONSTRAINT [FK_SnomedCodeset_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[SnomedCodeset] CHECK CONSTRAINT [FK_SnomedCodeset_Status]
GO
ALTER TABLE [semanticterms].[SnomedProblems]  WITH CHECK ADD  CONSTRAINT [FK_SnomedProblems_Status] FOREIGN KEY([StatusID])
REFERENCES [refdatagnrl].[Statuses] ([StatusID])
GO
ALTER TABLE [semanticterms].[SnomedProblems] CHECK CONSTRAINT [FK_SnomedProblems_Status]
GO
ALTER TABLE [clnclinterventions].[RptdVitals]  WITH CHECK ADD  CONSTRAINT [CK_clnclinterventionssVitals_BPDiastolic] CHECK  (([BPDiastolic]>=(0) AND [BPDiastolic]<=(300)))
GO
ALTER TABLE [clnclinterventions].[RptdVitals] CHECK CONSTRAINT [CK_clnclinterventionssVitals_BPDiastolic]
GO
ALTER TABLE [clnclinterventions].[RptdVitals]  WITH CHECK ADD  CONSTRAINT [CK_clnclinterventionssVitals_BPSystolic] CHECK  (([BPSystolic]>=(0) AND [BPSystolic]<=(300)))
GO
ALTER TABLE [clnclinterventions].[RptdVitals] CHECK CONSTRAINT [CK_clnclinterventionssVitals_BPSystolic]
GO
