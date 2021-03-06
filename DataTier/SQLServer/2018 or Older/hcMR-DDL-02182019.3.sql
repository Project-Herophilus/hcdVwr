USE [HealthcareMR]
GO
/****** Object:  Schema [auditlogging]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [auditlogging]
GO
/****** Object:  Schema [authrzation]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [authrzation]
GO
/****** Object:  Schema [careincident]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [careincident]
GO
/****** Object:  Schema [clinicalrefdata]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [clinicalrefdata]
GO
/****** Object:  Schema [configrtn]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [configrtn]
GO
/****** Object:  Schema [datamodeldetail]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [datamodeldetail]
GO
/****** Object:  Schema [persondata]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [persondata]
GO
/****** Object:  Schema [refdata]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [refdata]
GO
/****** Object:  Schema [sampleimports]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [sampleimports]
GO
/****** Object:  Schema [semanticterms]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE SCHEMA [semanticterms]
GO
/****** Object:  Table [auditlogging].[AuditLoggingIntegrations]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditlogging].[AuditLoggingIntegrations](
	[AuditLoggingIntegrationID] [bigint] IDENTITY(1,1) NOT NULL,
	[Vrsn] [varchar](8) NULL,
	[App] [varchar](50) NULL,
	[EntityName] [varchar](50) NULL,
	[MsgType] [varchar](3) NULL,
	[MsgEvent] [varchar](3) NULL,
	[MsgControlID] [varchar](20) NULL,
	[MsgDateTime] [varchar](26) NULL,
	[DataReference] [varchar](25) NULL,
 CONSTRAINT [PK_AuditLoggingIntegrations] PRIMARY KEY CLUSTERED 
(
	[AuditLoggingIntegrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [auditlogging].[AuditLoggingsAppDetail]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [authrzation].[auth]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [authrzation].[auth](
	[authid] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_auth] PRIMARY KEY CLUSTERED 
(
	[authid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[CareIncidents]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[CareIncidents](
	[CareIncidentsID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdmitDate] [date] NULL,
	[AdmitTime] [varchar](12) NULL,
	[DischargeDate] [date] NULL,
	[DischargeTime] [varchar](12) NULL,
	[AccountID] [bigint] NULL,
	[PersonID] [bigint] NULL,
	[Status] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_IntCareIncidents] PRIMARY KEY CLUSTERED 
(
	[CareIncidentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[CareIncidentsToInsurances]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[CareIncidentsToInsurances](
	[CareIncidentToInsuranceID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndingDate] [date] NULL,
	[PersonID] [bigint] NULL,
	[AccountID] [bigint] NULL,
	[InsuranceID] [int] NULL,
	[Status] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_CareIncidentToInsurance] PRIMARY KEY CLUSTERED 
(
	[CareIncidentToInsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[CareIncidentsToPhysicians]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[CareIncidentsToPhysicians](
	[CareIncidentToPhysicianID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndingDate] [date] NULL,
	[PersonID] [bigint] NULL,
	[AccountID] [bigint] NULL,
	[PhysicianID] [int] NULL,
	[PhysicianType] [smallint] NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_IntCareIncidentToPhysicians] PRIMARY KEY CLUSTERED 
(
	[CareIncidentToPhysicianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthAllergies]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthAllergies](
	[AllergiesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[AllergensID] [int] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Allergies] PRIMARY KEY CLUSTERED 
(
	[AllergiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthClinicalAddedDetails]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthClinicalAddedDetails](
	[ClincalAddedDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClinicalAddedDetailsDateTime] [datetime] NULL,
	[PersonID] [bigint] NULL,
	[ResourceType] [smallint] NULL,
	[ClinicalAddedDetailNotes] [varchar](4096) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_ClinicalAddedDetails] PRIMARY KEY CLUSTERED 
(
	[ClincalAddedDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthCommunications]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthCommunications](
	[CommunictionID] [bigint] IDENTITY(1,1) NOT NULL,
	[CommunicationDateTime] [datetime] NULL,
	[CommunicationType] [smallint] NULL,
	[PersonID] [bigint] NULL,
	[CommunicationDetails] [varchar](4096) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Communications] PRIMARY KEY CLUSTERED 
(
	[CommunictionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthDeviceAssociation]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthDeviceAssociation](
	[DeviceAssociationID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceAssociationDateTime] [datetime] NULL,
	[DeviceID] [varchar](50) NULL,
	[PersonID] [bigint] NULL,
	[Status] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_DeviceAssociation] PRIMARY KEY CLUSTERED 
(
	[DeviceAssociationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthDiagnosis]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthDiagnosis](
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
/****** Object:  Table [careincident].[GenHealthHeightWeights]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthHeightWeights](
	[IntCIHeightWeightID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[ProcessedDate] [date] NULL,
	[ProcessedTime] [time](7) NULL,
	[WeightFactor] [nchar](10) NULL,
	[HeightFactor] [nchar](10) NULL,
	[CalculatedBMI] [nchar](10) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_IntCareIncidentsHeightWeights] PRIMARY KEY CLUSTERED 
(
	[IntCIHeightWeightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthProblems]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthProblems](
	[PersonProblemID] [bigint] NOT NULL,
	[PersonID] [bigint] NULL,
	[ProblemID] [varchar](8) NULL,
	[DateReported] [date] NULL,
	[DateProcessedInSystem] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonProblems] PRIMARY KEY CLUSTERED 
(
	[PersonProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[GenHealthProcedures]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[GenHealthProcedures](
	[ProceduresID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProcedureDateTime] [datetime] NULL,
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
/****** Object:  Table [careincident].[Notes]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Notes](
	[IntCareIncidentsNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CIOrderID] [bigint] NULL,
	[CareIncidentNotesLink] [varchar](65) NULL,
	[CareIncidentID] [bigint] NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_IntCINotes] PRIMARY KEY CLUSTERED 
(
	[IntCareIncidentsNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Observations]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Observations](
	[IntCIObservationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[OrderNumberID] [bigint] NULL,
	[ObservationID] [smallint] NULL,
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
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_IntClinicalIncidentObservations] PRIMARY KEY CLUSTERED 
(
	[IntCIObservationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Orders]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Orders](
	[intOrderNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[FillerOrderNumber] [bigint] NULL,
	[FiillerGroupNumber] [bigint] NULL,
	[OrderControlType] [varchar](2) NULL,
	[OrderingPhysician] [int] NULL,
	[OrderEffectiveDate] [date] NULL,
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
 CONSTRAINT [PK_IntCIOrders] PRIMARY KEY CLUSTERED 
(
	[intOrderNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[OrdersToLabTimes]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[OrdersToLabTimes](
	[IntCareIncidentOrdersToLabTimesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NOT NULL,
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
 CONSTRAINT [PK_IntCIOrdersToLabTimes] PRIMARY KEY CLUSTERED 
(
	[IntCareIncidentOrdersToLabTimesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Transcriptions]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Transcriptions](
	[IntCareIncidentsTranscribedNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[IntOrderID] [bigint] NULL,
	[CareIncidentNotesLink] [varchar](65) NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_intCareIncidentsTranscribedNotes] PRIMARY KEY CLUSTERED 
(
	[IntCareIncidentsTranscribedNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincident].[Vitals]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincident].[Vitals](
	[CareIncidentVitalsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [bigint] NULL,
	[BPSystolic] [int] NOT NULL,
	[BPDiastolic] [int] NULL,
	[BPDate] [date] NULL,
	[BPTime] [time](7) NULL,
	[ProcessdDateTime] [datetime] NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_VitalsInt] PRIMARY KEY CLUSTERED 
(
	[CareIncidentVitalsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Employers]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Genders]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Genders](
	[GenderId] [varchar](1) NOT NULL,
	[GenderDesc] [varchar](25) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RefGender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Insurances]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Insurances](
	[InsuranceId] [int] IDENTITY(1,1) NOT NULL,
	[InsuranceExternalId] [varchar](10) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](65) NULL,
	[StateId] [varchar](2) NULL,
	[Postalcode] [varchar](10) NULL,
	[PhoneNumber] [varchar](12) NULL,
	[FaxNumber] [varchar](12) NULL,
	[InsCompnatType] [bigint] NULL,
	[CountryId] [varchar](3) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[InsuranceTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[InsuranceTypes](
	[InsuranceTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranceTypeDesc] [varchar](30) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RefInsuranceType] PRIMARY KEY CLUSTERED 
(
	[InsuranceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[OrderControlTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[OrderControlTypes](
	[OrderControlTypeId] [varchar](2) NOT NULL,
	[OrderControlTypeDesc] [varchar](40) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_OrderControlType] PRIMARY KEY CLUSTERED 
(
	[OrderControlTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[PatientClasses]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[PatientClasses](
	[PatientClassId] [varchar](1) NOT NULL,
	[ClassificationDesc] [varchar](80) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PatientClass] PRIMARY KEY CLUSTERED 
(
	[PatientClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Physicians]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Physicians](
	[PhysicianId] [int] NOT NULL,
	[PhysicianExternalId] [varchar](10) NULL,
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
	[CountryId] [varchar](3) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[PhysicianTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[PhysicianTypes](
	[PhysicianTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PhysicianTypeDesc] [varchar](25) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PhysicianType] PRIMARY KEY CLUSTERED 
(
	[PhysicianTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Races]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Races](
	[RaceId] [varchar](6) NOT NULL,
	[RaceDesc] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED 
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[RelationshipType]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[RelationshipType](
	[RelationshipTypeID] [smallint] IDENTITY(1,1) NOT NULL,
	[RelationshipTypeDesc] [varchar](35) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_RelationshipType] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[appModules]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [configrtn].[ConfigrationSettings]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [configrtn].[HealthcareEntities]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntities] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesToContacts]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [configrtn].[HealthcareEntitiesToPlatformApps]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [configrtn].[PlatformApps]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[PlatformApps](
	[PlatformAppsID] [smallint] IDENTITY(1,1) NOT NULL,
	[PlatformAppName] [varchar](45) NULL,
	[PlatformAppTypeID] [smallint] NULL,
	[VendorName] [varchar](50) NULL,
	[VendorVersion] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PlatformApps] PRIMARY KEY CLUSTERED 
(
	[PlatformAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[ThirdPartyApps]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_ThirdPartyApps] PRIMARY KEY CLUSTERED 
(
	[ThirdPartyAppsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [datamodeldetail].[appDataCatalogs]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datamodeldetail].[appDataCatalogs](
	[appDataCatalogID] [smallint] IDENTITY(1,1) NOT NULL,
	[appModule] [smallint] NULL,
	[dbSchema] [varchar](50) NULL,
	[DataCatalogDetails] [varchar](249) NULL,
	[appTableName] [varchar](125) NULL,
	[DateCreated] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_AppDataCatalog] PRIMARY KEY CLUSTERED 
(
	[appDataCatalogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAccounts]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAccounts](
	[PersonAccountsID] [bigint] NOT NULL,
	[PersonID] [bigint] NULL,
	[HealthcareEntitiesID] [bigint] NULL,
	[AccountNumber] [bigint] NULL,
	[EMPI] [varchar](25) NULL,
	[CustomAccountNumber] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonAccount] PRIMARY KEY CLUSTERED 
(
	[PersonAccountsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAddresses]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[PersonAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonDemographics]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonDemographics](
	[PersonDemogDtlsId] [bigint] IDENTITY(1,1) NOT NULL,
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
	[PersonId] [bigint] NULL,
	[StatusID] [smallint] NULL,
	[GenderId] [varchar](1) NULL,
	[ReligionId] [varchar](3) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_PersonDemographics] PRIMARY KEY CLUSTERED 
(
	[PersonDemogDtlsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonEmployers]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonEmployers](
	[PersonEmployerId] [bigint] NOT NULL,
	[PersonId] [bigint] NULL,
	[EmployerId] [bigint] NULL,
	[JobTitle] [varchar](50) NULL,
	[EntryDate] [smalldatetime] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_PersonEmployer] PRIMARY KEY CLUSTERED 
(
	[PersonEmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonPhones]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonPhones](
	[PersonPhoneId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[PhoneTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](12) NOT NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_PersonPhone] PRIMARY KEY CLUSTERED 
(
	[PersonPhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[Persons]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[AddressTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[AuditLoggingEventTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[CommunicationType]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[ConfigurationSettingType]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[Countries]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[PhoneTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[PlatformAppType]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[ResourceType]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[States]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [refdata].[Status]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [sampleimports].[SnoMedProblems]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sampleimports].[SnoMedProblems](
	[SnomenCID] [varchar](10) NOT NULL,
	[SnomedDescription] [varchar](249) NULL,
	[ConceptStatus] [varchar](15) NULL,
	[UMLSCUI] [varchar](8) NULL,
	[Occurrence] [varchar](2) NULL,
	[Usage] [varchar](10) NULL,
	[FirstInSubset] [varchar](8) NULL,
	[IsRetiredFrom] [varchar](10) NULL,
	[LastInSubset] [varchar](8) NULL,
	[IsReplacedBy] [varchar](10) NULL,
 CONSTRAINT [PK_SnoMedProblems_1] PRIMARY KEY CLUSTERED 
(
	[SnomenCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Allergens]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[Allergens](
	[AllergensD] [int] IDENTITY(1,1) NOT NULL,
	[AllergyCode] [varchar](10) NULL,
	[AllergyDesc] [varchar](100) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Allergens] PRIMARY KEY CLUSTERED 
(
	[AllergensD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[CWETermGroups]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[CWETermGroups](
	[CWETermGroupId] [varchar](20) NOT NULL,
	[CWETermGroupDesc] [varchar](100) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_CWETermGroup] PRIMARY KEY CLUSTERED 
(
	[CWETermGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[CWETerms]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[Status] [smallint] NULL,
 CONSTRAINT [PK_CWETerms] PRIMARY KEY CLUSTERED 
(
	[CWETermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Diagnosis]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[LOINCCodeset]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[LOINCCodeset](
	[LOINCCodesetID] [varchar](8) NOT NULL,
	[CodesetDesc] [varchar](75) NULL,
	[CodesetStatus] [varchar](10) NULL,
	[CUILink] [varchar](8) NULL,
	[Occurence] [varchar](2) NULL,
	[Usage] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_LOINCCodeset] PRIMARY KEY CLUSTERED 
(
	[LOINCCodesetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[Procedures]    Script Date: 2/19/2019 12:13:41 AM ******/
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
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[ProcedureCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[RxNorms]    Script Date: 2/19/2019 12:13:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [semanticterms].[RxNorms](
	[RXNormId] [varchar](8) NOT NULL,
	[LAT] [varchar](3) NOT NULL,
	[RxNormDesc] [varchar](3000) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RxNorm] PRIMARY KEY CLUSTERED 
(
	[RXNormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [semanticterms].[SnomedCodeset]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Table [semanticterms].[SnomedProblems]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Index [INDX_AuditLoggingIntegration]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_AuditLoggingIntegration] ON [auditlogging].[AuditLoggingIntegrations]
(
	[Vrsn] ASC,
	[App] ASC,
	[EntityName] ASC,
	[MsgType] ASC,
	[MsgEvent] ASC,
	[MsgControlID] ASC,
	[MsgDateTime] ASC,
	[DataReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AuditLogging]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Index [IDX_IntCareIncidents]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_IntCareIncidents] ON [careincident].[CareIncidents]
(
	[CareIncidentsID] ASC,
	[AdmitDate] ASC,
	[AdmitTime] ASC,
	[DischargeDate] ASC,
	[DischargeTime] ASC,
	[AccountID] ASC,
	[PersonID] ASC,
	[Status] ASC,
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_CareIncidentsToInsurances]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_CareIncidentsToInsurances] ON [careincident].[CareIncidentsToInsurances]
(
	[CareIncidentToInsuranceID] ASC,
	[AccountID] ASC,
	[EffectiveStartDate] ASC,
	[EffectiveEndingDate] ASC,
	[InsuranceID] ASC,
	[IntCIID] ASC,
	[PersonID] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CareIncidentsToPhysicians]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IX_CareIncidentsToPhysicians] ON [careincident].[CareIncidentsToPhysicians]
(
	[CareIncidentToPhysicianID] ASC,
	[IntCIID] ASC,
	[EffectiveStartDate] ASC,
	[EffectiveEndingDate] ASC,
	[PersonID] ASC,
	[AccountID] ASC,
	[PhysicianID] ASC,
	[PhysicianType] ASC,
	[StatusID] ASC,
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Allergies]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Allergies] ON [careincident].[GenHealthAllergies]
(
	[AllergiesID] ASC,
	[PersonID] ASC,
	[CreatedDate] ASC,
	[Status] ASC,
	[AllergensID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_ClinicalAddedDetails]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_ClinicalAddedDetails] ON [careincident].[GenHealthClinicalAddedDetails]
(
	[ClincalAddedDetailsID] ASC,
	[ClinicalAddedDetailsDateTime] ASC,
	[PersonID] ASC,
	[ResourceType] ASC,
	[StatusID] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Communications]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Communications] ON [careincident].[GenHealthCommunications]
(
	[CommunictionID] ASC,
	[CommunicationDateTime] ASC,
	[CommunicationType] ASC,
	[PersonID] ASC,
	[Status] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_DeviceAssociation]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_DeviceAssociation] ON [careincident].[GenHealthDeviceAssociation]
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
/****** Object:  Index [INDX_Diagnosis]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Diagnosis] ON [careincident].[GenHealthDiagnosis]
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
/****** Object:  Index [INDX_HeightWeights]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_HeightWeights] ON [careincident].[GenHealthHeightWeights]
(
	[IntCIHeightWeightID] ASC,
	[CareIncidentID] ASC,
	[Height] ASC,
	[Weight] ASC,
	[HeightFactor] ASC,
	[WeightFactor] ASC,
	[CalculatedBMI] ASC,
	[ProcessedDate] ASC,
	[ProcessedTime] ASC,
	[StatusID] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonProblems]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonProblems] ON [careincident].[GenHealthProblems]
(
	[PersonProblemID] ASC,
	[PersonID] ASC,
	[DateReported] ASC,
	[DateProcessedInSystem] ASC,
	[StatusID] ASC,
	[ProblemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Procedures]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Procedures] ON [careincident].[GenHealthProcedures]
(
	[ProceduresID] ASC,
	[ProcedureDate] ASC,
	[ProcedureTime] ASC,
	[ProceduresCode] ASC,
	[ProcedureDateTime] ASC,
	[PersonID] ASC,
	[Status] ASC,
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IntCINotes]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_IntCINotes] ON [careincident].[Notes]
(
	[IntCareIncidentsNotesID] ASC,
	[CareIncidentID] ASC,
	[CareIncidentNotesLink] ASC,
	[CIOrderID] ASC,
	[StatusID] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ClinicalIncidentObservations]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_ClinicalIncidentObservations] ON [careincident].[Observations]
(
	[IntCIObservationsID] ASC,
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
/****** Object:  Index [INDX_Observations1]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Observations1] ON [careincident].[Observations]
(
	[IntCIObservationsID] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IntCIOrders]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_IntCIOrders] ON [careincident].[Orders]
(
	[intOrderNumberID] ASC,
	[CareIncidentID] ASC,
	[Confidentiality] ASC,
	[FiillerGroupNumber] ASC,
	[FillerOrderNumber] ASC,
	[OrderControlReason] ASC,
	[OrderControlType] ASC,
	[OrderDate] ASC,
	[OrderEffectiveDate] ASC,
	[OrderingDevice] ASC,
	[OrderingPhysician] ASC,
	[OrderStatus] ASC,
	[OrderStatusModifier] ASC,
	[OrderTime] ASC,
	[OrderType] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Orders1]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Orders1] ON [careincident].[Orders]
(
	[intOrderNumberID] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IntCITranscriptions]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_IntCITranscriptions] ON [careincident].[Transcriptions]
(
	[IntCareIncidentsTranscribedNotesID] ASC,
	[CareIncidentNotesLink] ASC,
	[CareIncidentID] ASC,
	[IntOrderID] ASC,
	[StatusID] ASC,
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Vitals]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Vitals] ON [careincident].[Vitals]
(
	[CareIncidentVitalsID] ASC,
	[CareIncidentID] ASC,
	[BPDate] ASC,
	[BPDiastolic] ASC,
	[BPSystolic] ASC,
	[BPTime] ASC,
	[ProcessdDateTime] ASC,
	[StatusID] ASC,
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Employer]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Employer] ON [clinicalrefdata].[Employers]
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
	[FaxNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Genders]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Genders] ON [clinicalrefdata].[Genders]
(
	[GenderId] ASC,
	[GenderDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Insurance]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Insurance] ON [clinicalrefdata].[Insurances]
(
	[InsuranceId] ASC,
	[InsuranceExternalId] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateId] ASC,
	[Postalcode] ASC,
	[PhoneNumber] ASC,
	[FaxNumber] ASC,
	[InsCompnatType] ASC,
	[CountryId] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_InsuranceTypes]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_InsuranceTypes] ON [clinicalrefdata].[InsuranceTypes]
(
	[InsuranceTypeId] ASC,
	[InsuranceTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_OrderControlType]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_OrderControlType] ON [clinicalrefdata].[OrderControlTypes]
(
	[OrderControlTypeId] ASC,
	[OrderControlTypeDesc] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PatientClasses]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_PatientClasses] ON [clinicalrefdata].[PatientClasses]
(
	[PatientClassId] ASC,
	[ClassificationDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Physician]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Index [INDX_Physicians1]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Physicians1] ON [clinicalrefdata].[Physicians]
(
	[PhysicianId] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PhysicianType]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_PhysicianType] ON [clinicalrefdata].[PhysicianTypes]
(
	[PhysicianTypeId] ASC,
	[PhysicianTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Races]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Races] ON [clinicalrefdata].[Races]
(
	[RaceId] ASC,
	[RaceDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_RelationshipType]    Script Date: 2/19/2019 12:13:41 AM ******/
CREATE NONCLUSTERED INDEX [INDX_RelationshipType] ON [clinicalrefdata].[RelationshipType]
(
	[RelationshipTypeID] ASC,
	[RelationshipTypeDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_appModules]    Script Date: 2/19/2019 12:13:41 AM ******/
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
/****** Object:  Index [IDX_ConfigrationSettings]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_HealthcareEntities]    Script Date: 2/19/2019 12:13:42 AM ******/
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
	[LicensedState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HealthcareEntitiesToContacts]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_HealthcareEntitiesToPlatformApps]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_PlatformApps]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_PlatformApps] ON [configrtn].[PlatformApps]
(
	[PlatformAppsID] ASC,
	[PlatformAppName] ASC,
	[PlatformAppTypeID] ASC,
	[VendorName] ASC,
	[VendorVersion] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ThirdPartyApps]    Script Date: 2/19/2019 12:13:42 AM ******/
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
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_appDataCatalogs]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_appDataCatalogs] ON [datamodeldetail].[appDataCatalogs]
(
	[appDataCatalogID] ASC,
	[appModule] ASC,
	[dbSchema] ASC,
	[appTableName] ASC,
	[DataCatalogDetails] ASC,
	[DateCreated] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonAccount]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonAccount] ON [persondata].[PersonAccounts]
(
	[PersonAccountsID] ASC,
	[AccountNumber] ASC,
	[PersonID] ASC,
	[CustomAccountNumber] ASC,
	[EMPI] ASC,
	[HealthcareEntitiesID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PersonAddress]    Script Date: 2/19/2019 12:13:42 AM ******/
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
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonDemographics ]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_PersonDemographics2 ]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonDemographics2 ] ON [persondata].[PersonDemographics]
(
	[ExternalHealthcareEntitiesId] ASC,
	[RaceId] ASC,
	[EthnicityId] ASC,
	[MaritalStatusId] ASC,
	[PersonId] ASC,
	[StatusID] ASC,
	[GenderId] ASC,
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PersonEmployer]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_PersonEmployer] ON [persondata].[PersonEmployers]
(
	[PersonEmployerId] ASC,
	[PersonId] ASC,
	[EmployerId] ASC,
	[EntryDate] ASC,
	[StatusId] ASC,
	[JobTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PersonPhone]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_PersonPhone] ON [persondata].[PersonPhones]
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
/****** Object:  Index [IDX_Person]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Person] ON [persondata].[Persons]
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
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefAddressType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [IDX_AuditLoggingEventType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_CommunicationType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [IX_ConfigurationSettingType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [IDX_RefCountry]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_RefCountry] ON [refdata].[Countries]
(
	[CountryId] ASC,
	[CountryName] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefPhoneType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_PlatformAppType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_ResourceType]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [IDX_States]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [IDX_RefStatus]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_RefStatus] ON [refdata].[Status]
(
	[StatusID] ASC,
	[StatusDescription] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Allergies]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_Allergies] ON [semanticterms].[Allergens]
(
	[AllergensD] ASC,
	[AllergyCode] ASC,
	[CreatedDate] ASC,
	[AllergyDesc] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CWETermGroup]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [IDX_CWETermGroup] ON [semanticterms].[CWETermGroups]
(
	[CWETermGroupId] ASC,
	[CWETermGroupDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CWETerms]    Script Date: 2/19/2019 12:13:42 AM ******/
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
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Diagnosis]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Diagnosis] ON [semanticterms].[Diagnosis]
(
	[DiagnosisCode] ASC,
	[DiagnosisCodeLongDesc] ASC,
	[DiagnosisCodeShortDesc] ASC,
	[IndustryVersion] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_LOINCCodeset]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_LOINCCodeset] ON [semanticterms].[LOINCCodeset]
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
/****** Object:  Index [INDX_Procedures]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Procedures] ON [semanticterms].[Procedures]
(
	[ProcedureCode] ASC,
	[ProcedureCodeLongDesc] ASC,
	[ProcedureCodeShortDesc] ASC,
	[IndustryVersion] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_RxNorm]    Script Date: 2/19/2019 12:13:42 AM ******/
CREATE NONCLUSTERED INDEX [INDX_RxNorm] ON [semanticterms].[RxNorms]
(
	[RXNormId] ASC,
	[LAT] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_SnomedCodeset]    Script Date: 2/19/2019 12:13:42 AM ******/
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
/****** Object:  Index [INDX_SnomedProblems]    Script Date: 2/19/2019 12:13:42 AM ******/
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
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail] ADD  CONSTRAINT [DF_AuditLogging_AuditDate]  DEFAULT (getdate()) FOR [AuditEventDate]
GO
ALTER TABLE [auditlogging].[AuditLoggingsAppDetail] ADD  CONSTRAINT [DF_AuditLogging_AuditEventTime]  DEFAULT (CONVERT([varchar],getdate(),(108))) FOR [AuditEventTime]
GO
ALTER TABLE [careincident].[CareIncidents] ADD  CONSTRAINT [DF_CareIncidents_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincident].[CareIncidents] ADD  CONSTRAINT [DF_CareIncidents_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_IntCareIncidentsToInsurance_EffectiveStartDate]  DEFAULT (getdate()) FOR [EffectiveStartDate]
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_CareIncidentsToInsurances_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_CareIncidentsToInsurances_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] ADD  CONSTRAINT [DF_IntCareIncidentsToPhysicians_EffectiveStartDate]  DEFAULT (getdate()) FOR [EffectiveStartDate]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] ADD  CONSTRAINT [DF_CareIncidentsToPhysicians_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] ADD  CONSTRAINT [DF_CareIncidentsToPhysicians_DatreCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [careincident].[GenHealthAllergies] ADD  CONSTRAINT [DF_Allergies_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[GenHealthAllergies] ADD  CONSTRAINT [DF_Allergies_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_ClinicalAddedDetailsDateTime]  DEFAULT (getdate()) FOR [ClinicalAddedDetailsDateTime]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_ResourceType]  DEFAULT ((1)) FOR [ResourceType]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[GenHealthCommunications] ADD  CONSTRAINT [DF_Communications_CommunicationDateTime]  DEFAULT (getdate()) FOR [CommunicationDateTime]
GO
ALTER TABLE [careincident].[GenHealthCommunications] ADD  CONSTRAINT [DF_Communications_CommunicationType]  DEFAULT ((1)) FOR [CommunicationType]
GO
ALTER TABLE [careincident].[GenHealthCommunications] ADD  CONSTRAINT [DF_Communications_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[GenHealthCommunications] ADD  CONSTRAINT [DF_Communications_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_DeviceAssociationDateTime]  DEFAULT (getdate()) FOR [DeviceAssociationDateTime]
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[GenHealthDiagnosis] ADD  CONSTRAINT [DF_Diagnosis_DiagnosisDateTime]  DEFAULT (getdate()) FOR [DiagnosisDateTime]
GO
ALTER TABLE [careincident].[GenHealthDiagnosis] ADD  CONSTRAINT [DF_Diagnosis_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[GenHealthDiagnosis] ADD  CONSTRAINT [DF_Diagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_ProcessedDate]  DEFAULT (getdate()) FOR [ProcessedDate]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_ProcessedTime]  DEFAULT (CONVERT([varchar],getdate(),(108))) FOR [ProcessedTime]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_WeightFactor]  DEFAULT (N'CareIncidentWeight*.45') FOR [WeightFactor]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_HeightFactor]  DEFAULT (N'SQUARE(CareIncidentHeight*.025)') FOR [HeightFactor]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_CalculatedBMI]  DEFAULT (N'WeightFactor/HeightFactor') FOR [CalculatedBMI]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_HeightWeights_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] ADD  CONSTRAINT [DF_HeightWeights_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[GenHealthProblems] ADD  CONSTRAINT [DF__PersonPro__DateP__0F4D3C5F]  DEFAULT (getdate()) FOR [DateProcessedInSystem]
GO
ALTER TABLE [careincident].[GenHealthProblems] ADD  CONSTRAINT [DF__PersonPro__Statu__10416098]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[GenHealthProcedures] ADD  CONSTRAINT [DF_Procedures_ProcedureDateTime]  DEFAULT (getdate()) FOR [ProcedureDateTime]
GO
ALTER TABLE [careincident].[GenHealthProcedures] ADD  CONSTRAINT [DF_Procedures_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [careincident].[GenHealthProcedures] ADD  CONSTRAINT [DF_Procedures_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincident].[Notes] ADD  CONSTRAINT [DF_Notes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Notes] ADD  CONSTRAINT [DF_Notes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Observations] ADD  CONSTRAINT [DF_Observations_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Observations] ADD  CONSTRAINT [DF_Observations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Orders] ADD  CONSTRAINT [DF_Orders_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Orders] ADD  CONSTRAINT [DF_Orders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[OrdersToLabTimes] ADD  CONSTRAINT [DF_OrdersToLabTimes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[OrdersToLabTimes] ADD  CONSTRAINT [DF_OrdersToLabTimes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [careincident].[Transcriptions] ADD  CONSTRAINT [DF_Transcriptions_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [careincident].[Transcriptions] ADD  CONSTRAINT [DF_Transcriptions_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
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
ALTER TABLE [clinicalrefdata].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [clinicalrefdata].[RelationshipType] ADD  CONSTRAINT [DF_RelationshipType_StatusID]  DEFAULT ((1)) FOR [StatusID]
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
ALTER TABLE [datamodeldetail].[appDataCatalogs] ADD  CONSTRAINT [DF__appDataCa__appMo__60924D76]  DEFAULT ((1)) FOR [appModule]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] ADD  CONSTRAINT [DF_appDataCatalog_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] ADD  CONSTRAINT [DF__appDataCa__Statu__55209ACA]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [refdata].[PhoneTypes] ADD  CONSTRAINT [DF_PhoneTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PhoneTypes] ADD  CONSTRAINT [DF_PhoneTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[PlatformAppType] ADD  CONSTRAINT [DF_PlatformAppType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PlatformAppType] ADD  CONSTRAINT [DF_PlatformAppType_StatusID]  DEFAULT ((1)) FOR [StatusID]
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
ALTER TABLE [semanticterms].[CWETermGroups] ADD  CONSTRAINT [DF_CWETermGroups_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[CWETerms] ADD  CONSTRAINT [DF_CWETerms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[CWETerms] ADD  CONSTRAINT [DF_CWETerms_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[LOINCCodeset] ADD  CONSTRAINT [DF_LOINCCodeset_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[LOINCCodeset] ADD  CONSTRAINT [DF_LOINCCodeset_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[Procedures] ADD  CONSTRAINT [DF_Procedures_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[Procedures] ADD  CONSTRAINT [DF_Procedures_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[RxNorms] ADD  DEFAULT ('ENG') FOR [LAT]
GO
ALTER TABLE [semanticterms].[RxNorms] ADD  CONSTRAINT [DF_RxNorms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[RxNorms] ADD  CONSTRAINT [DF_RxNorms_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[SnomedCodeset] ADD  CONSTRAINT [DF_SnomedCodeset_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[SnomedCodeset] ADD  CONSTRAINT [DF_SnomedCodeset_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [semanticterms].[SnomedProblems] ADD  CONSTRAINT [DF_SnomedProblems_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [semanticterms].[SnomedProblems] ADD  CONSTRAINT [DF_SnomedProblems_Status]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [careincident].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidents_Status] FOREIGN KEY([Status])
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
ALTER TABLE [careincident].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_Accounts]
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_CareIncidents] FOREIGN KEY([IntCIID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_CareIncidents]
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_Insurances] FOREIGN KEY([InsuranceID])
REFERENCES [clinicalrefdata].[Insurances] ([InsuranceId])
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_Insurances]
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_Persons]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidentsToPhysicians_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_CareIncidentsToPhysicians_Status]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_Accounts]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_CareIncidents] FOREIGN KEY([IntCIID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_CareIncidents]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_Persons]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_Physicians] FOREIGN KEY([PhysicianID])
REFERENCES [clinicalrefdata].[Physicians] ([PhysicianId])
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_Physicians]
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_PhysicianType] FOREIGN KEY([PhysicianType])
REFERENCES [clinicalrefdata].[PhysicianTypes] ([PhysicianTypeId])
GO
ALTER TABLE [careincident].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_PhysicianType]
GO
ALTER TABLE [careincident].[GenHealthAllergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Allergens] FOREIGN KEY([AllergensID])
REFERENCES [semanticterms].[Allergens] ([AllergensD])
GO
ALTER TABLE [careincident].[GenHealthAllergies] CHECK CONSTRAINT [FK_Allergies_Allergens]
GO
ALTER TABLE [careincident].[GenHealthAllergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthAllergies] CHECK CONSTRAINT [FK_Allergies_Persons]
GO
ALTER TABLE [careincident].[GenHealthAllergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthAllergies] CHECK CONSTRAINT [FK_Allergies_Status]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalAddedDetails_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] CHECK CONSTRAINT [FK_ClinicalAddedDetails_Person]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalAddedDetails_ResourceType] FOREIGN KEY([ResourceType])
REFERENCES [refdata].[ResourceType] ([ResourceTypeID])
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] CHECK CONSTRAINT [FK_ClinicalAddedDetails_ResourceType]
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalAddedDetails_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthClinicalAddedDetails] CHECK CONSTRAINT [FK_ClinicalAddedDetails_Status]
GO
ALTER TABLE [careincident].[GenHealthCommunications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_CommunicationType] FOREIGN KEY([CommunicationType])
REFERENCES [refdata].[CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [careincident].[GenHealthCommunications] CHECK CONSTRAINT [FK_Communications_CommunicationType]
GO
ALTER TABLE [careincident].[GenHealthCommunications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthCommunications] CHECK CONSTRAINT [FK_Communications_Persons]
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_DeviceAssociation_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation] CHECK CONSTRAINT [FK_DeviceAssociation_Person]
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_DeviceAssociation_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthDeviceAssociation] CHECK CONSTRAINT [FK_DeviceAssociation_Status]
GO
ALTER TABLE [careincident].[GenHealthDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_DiagnosisCodes] FOREIGN KEY([Diagnosis])
REFERENCES [semanticterms].[Diagnosis] ([DiagnosisCode])
GO
ALTER TABLE [careincident].[GenHealthDiagnosis] CHECK CONSTRAINT [FK_Diagnosis_DiagnosisCodes]
GO
ALTER TABLE [careincident].[GenHealthDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthDiagnosis] CHECK CONSTRAINT [FK_Diagnosis_Person]
GO
ALTER TABLE [careincident].[GenHealthDiagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthDiagnosis] CHECK CONSTRAINT [FK_Diagnosis_Status]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights]  WITH CHECK ADD  CONSTRAINT [FK_HeightWeights_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] CHECK CONSTRAINT [FK_HeightWeights_Status]
GO
ALTER TABLE [careincident].[GenHealthHeightWeights]  WITH CHECK ADD  CONSTRAINT [FK_IntCIHeightWeights_CI] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[GenHealthHeightWeights] CHECK CONSTRAINT [FK_IntCIHeightWeights_CI]
GO
ALTER TABLE [careincident].[GenHealthProblems]  WITH CHECK ADD  CONSTRAINT [FK_GenHealthProblems_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthProblems] CHECK CONSTRAINT [FK_GenHealthProblems_Status]
GO
ALTER TABLE [careincident].[GenHealthProblems]  WITH CHECK ADD  CONSTRAINT [FK_PersonProblems_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthProblems] CHECK CONSTRAINT [FK_PersonProblems_Person]
GO
ALTER TABLE [careincident].[GenHealthProblems]  WITH CHECK ADD  CONSTRAINT [FK_PersonProblems_Problem] FOREIGN KEY([ProblemID])
REFERENCES [semanticterms].[SnomedProblems] ([ProblemID])
GO
ALTER TABLE [careincident].[GenHealthProblems] CHECK CONSTRAINT [FK_PersonProblems_Problem]
GO
ALTER TABLE [careincident].[GenHealthProcedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincident].[GenHealthProcedures] CHECK CONSTRAINT [FK_Procedures_Person]
GO
ALTER TABLE [careincident].[GenHealthProcedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[GenHealthProcedures] CHECK CONSTRAINT [FK_Procedures_Status]
GO
ALTER TABLE [careincident].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Notes] CHECK CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidents]
GO
ALTER TABLE [careincident].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidentsOrder] FOREIGN KEY([CIOrderID])
REFERENCES [careincident].[Orders] ([intOrderNumberID])
GO
ALTER TABLE [careincident].[Notes] CHECK CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidentsOrder]
GO
ALTER TABLE [careincident].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Notes] CHECK CONSTRAINT [FK_Notes_Status]
GO
ALTER TABLE [careincident].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalIncidentObservations_ClinicalIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Observations] CHECK CONSTRAINT [FK_ClinicalIncidentObservations_ClinicalIncidents]
GO
ALTER TABLE [careincident].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_IntClinicalIncidentObservations_CareIncidentsOrders] FOREIGN KEY([OrderNumberID])
REFERENCES [careincident].[Orders] ([intOrderNumberID])
GO
ALTER TABLE [careincident].[Observations] CHECK CONSTRAINT [FK_IntClinicalIncidentObservations_CareIncidentsOrders]
GO
ALTER TABLE [careincident].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsOrders_OrderControlType] FOREIGN KEY([OrderControlType])
REFERENCES [clinicalrefdata].[OrderControlTypes] ([OrderControlTypeId])
GO
ALTER TABLE [careincident].[Orders] CHECK CONSTRAINT [FK_IntCareIncidentsOrders_OrderControlType]
GO
ALTER TABLE [careincident].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsOrders_Physicians] FOREIGN KEY([OrderingPhysician])
REFERENCES [clinicalrefdata].[Physicians] ([PhysicianId])
GO
ALTER TABLE [careincident].[Orders] CHECK CONSTRAINT [FK_IntCareIncidentsOrders_Physicians]
GO
ALTER TABLE [careincident].[OrdersToLabTimes]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_IntCIID] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[OrdersToLabTimes] CHECK CONSTRAINT [FK_OrdersToLabTimes_IntCIID]
GO
ALTER TABLE [careincident].[OrdersToLabTimes]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[OrdersToLabTimes] CHECK CONSTRAINT [FK_OrdersToLabTimes_Status]
GO
ALTER TABLE [careincident].[Transcriptions]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsNotesTranscribed_IntCareIncident] FOREIGN KEY([CareIncidentID])
REFERENCES [careincident].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincident].[Transcriptions] CHECK CONSTRAINT [FK_IntCareIncidentsNotesTranscribed_IntCareIncident]
GO
ALTER TABLE [careincident].[Transcriptions]  WITH CHECK ADD  CONSTRAINT [FK_Transcriptions_Orders] FOREIGN KEY([IntOrderID])
REFERENCES [careincident].[Orders] ([intOrderNumberID])
GO
ALTER TABLE [careincident].[Transcriptions] CHECK CONSTRAINT [FK_Transcriptions_Orders]
GO
ALTER TABLE [careincident].[Transcriptions]  WITH CHECK ADD  CONSTRAINT [FK_Transcriptions_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [careincident].[Transcriptions] CHECK CONSTRAINT [FK_Transcriptions_Status]
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
ALTER TABLE [clinicalrefdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Employers] CHECK CONSTRAINT [FK_Employers_Status]
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
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_InsuranceType] FOREIGN KEY([InsCompnatType])
REFERENCES [clinicalrefdata].[InsuranceTypes] ([InsuranceTypeId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_InsuranceType]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_State] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_State]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurances_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurances_Status]
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[InsuranceTypes] CHECK CONSTRAINT [FK_InsuranceTypes_Status]
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes]  WITH CHECK ADD  CONSTRAINT [FK_OrderControlTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[OrderControlTypes] CHECK CONSTRAINT [FK_OrderControlTypes_Status]
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
ALTER TABLE [clinicalrefdata].[Physicians]  WITH CHECK ADD  CONSTRAINT [FK_Physicians_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Physicians] CHECK CONSTRAINT [FK_Physicians_Status]
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[PhysicianTypes] CHECK CONSTRAINT [FK_PhysicianTypes_Status]
GO
ALTER TABLE [clinicalrefdata].[Races]  WITH CHECK ADD  CONSTRAINT [FK_Races_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[Races] CHECK CONSTRAINT [FK_Races_Status]
GO
ALTER TABLE [clinicalrefdata].[RelationshipType]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipType_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [clinicalrefdata].[RelationshipType] CHECK CONSTRAINT [FK_RelationshipType_Status]
GO
ALTER TABLE [configrtn].[appModules]  WITH CHECK ADD  CONSTRAINT [FK_appModules_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [configrtn].[appModules] CHECK CONSTRAINT [FK_appModules_Status]
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
ALTER TABLE [datamodeldetail].[appDataCatalogs]  WITH CHECK ADD  CONSTRAINT [FK_appDataCatalogs_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] CHECK CONSTRAINT [FK_appDataCatalogs_Status]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccount_Account] FOREIGN KEY([AccountNumber])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccount_Account]
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
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Status]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Gender] FOREIGN KEY([GenderId])
REFERENCES [clinicalrefdata].[Genders] ([GenderId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Gender]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Person]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Race] FOREIGN KEY([RaceId])
REFERENCES [clinicalrefdata].[Races] ([RaceId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Race]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Status]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Employer] FOREIGN KEY([EmployerId])
REFERENCES [clinicalrefdata].[Employers] ([EmployerId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Employer]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Person]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_RefStatus] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_RefStatus]
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
ALTER TABLE [persondata].[PersonPhones]  WITH CHECK ADD  CONSTRAINT [FK_PersonPhones_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [persondata].[PersonPhones] CHECK CONSTRAINT [FK_PersonPhones_Status]
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
ALTER TABLE [semanticterms].[Allergens]  WITH CHECK ADD  CONSTRAINT [FK_Allergens_Status] FOREIGN KEY([StatusID])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[Allergens] CHECK CONSTRAINT [FK_Allergens_Status]
GO
ALTER TABLE [semanticterms].[CWETermGroups]  WITH CHECK ADD  CONSTRAINT [FK_CWETermGroups_Status] FOREIGN KEY([Status])
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
ALTER TABLE [semanticterms].[CWETerms]  WITH CHECK ADD  CONSTRAINT [FK_CWETerms_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[CWETerms] CHECK CONSTRAINT [FK_CWETerms_Status]
GO
ALTER TABLE [semanticterms].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Status]
GO
ALTER TABLE [semanticterms].[LOINCCodeset]  WITH CHECK ADD  CONSTRAINT [FK_LOINCCodeset_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusID])
GO
ALTER TABLE [semanticterms].[LOINCCodeset] CHECK CONSTRAINT [FK_LOINCCodeset_Status]
GO
ALTER TABLE [semanticterms].[RxNorms]  WITH CHECK ADD  CONSTRAINT [FK_RxNorms_Status] FOREIGN KEY([Status])
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
