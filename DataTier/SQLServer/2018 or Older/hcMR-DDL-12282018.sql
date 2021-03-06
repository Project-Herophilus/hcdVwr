USE [master]
GO
/****** Object:  Database [hcMR]    Script Date: 12/28/2018 4:27:33 PM ******/
CREATE DATABASE [hcMR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hcMR', FILENAME = N'D:\MSSQL_Data\Data\hcMR.mdf' , SIZE = 1024000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hcMR_log', FILENAME = N'D:\MSSQL_Data\Data\Logs\hcMR_log.ldf' , SIZE = 256000KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [hcMR] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hcMR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hcMR] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [hcMR] SET ANSI_NULLS ON 
GO
ALTER DATABASE [hcMR] SET ANSI_PADDING ON 
GO
ALTER DATABASE [hcMR] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [hcMR] SET ARITHABORT ON 
GO
ALTER DATABASE [hcMR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hcMR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hcMR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hcMR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hcMR] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [hcMR] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [hcMR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hcMR] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [hcMR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hcMR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hcMR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hcMR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hcMR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hcMR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hcMR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hcMR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hcMR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hcMR] SET RECOVERY FULL 
GO
ALTER DATABASE [hcMR] SET  MULTI_USER 
GO
ALTER DATABASE [hcMR] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [hcMR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hcMR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hcMR] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hcMR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'hcMR', N'ON'
GO
ALTER DATABASE [hcMR] SET QUERY_STORE = OFF
GO
USE [hcMR]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [hcMR]
GO
/****** Object:  User [hcPrototype]    Script Date: 12/28/2018 4:27:33 PM ******/
CREATE USER [hcPrototype] FOR LOGIN [hcPrototype] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [auditlogging]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [auditlogging]
GO
/****** Object:  Schema [authrzation]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [authrzation]
GO
/****** Object:  Schema [careincidentext]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [careincidentext]
GO
/****** Object:  Schema [careincidentgeneral]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [careincidentgeneral]
GO
/****** Object:  Schema [careincidentint]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [careincidentint]
GO
/****** Object:  Schema [clinicalrefdata]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [clinicalrefdata]
GO
/****** Object:  Schema [configrtn]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [configrtn]
GO
/****** Object:  Schema [datamodeldetail]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [datamodeldetail]
GO
/****** Object:  Schema [industrystds]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [industrystds]
GO
/****** Object:  Schema [integration]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [integration]
GO
/****** Object:  Schema [persondata]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [persondata]
GO
/****** Object:  Schema [refdata]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [refdata]
GO
/****** Object:  Schema [sampleimports]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [sampleimports]
GO
/****** Object:  Schema [semanticterms]    Script Date: 12/28/2018 4:27:34 PM ******/
CREATE SCHEMA [semanticterms]
GO
/****** Object:  Table [auditlogging].[AuditLoggingEventTypes]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditlogging].[AuditLoggingEventTypes](
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
/****** Object:  Table [auditlogging].[AuditLoggingIntegrations]    Script Date: 12/28/2018 4:27:34 PM ******/
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
/****** Object:  Table [auditlogging].[AuditLoggings]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [auditlogging].[AuditLoggings](
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
/****** Object:  Table [authrzation].[auth]    Script Date: 12/28/2018 4:27:34 PM ******/
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
/****** Object:  Table [careincidentext].[CareIncidents]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[CareIncidents](
	[ExtCareIncidentsID] [int] IDENTITY(1,1) NOT NULL,
	[Incident_AdmitDate] [date] NULL,
	[Incident_AdmitTime] [varchar](12) NULL,
	[Incident_DischargeDate] [date] NULL,
	[Incident_DischargeTime] [varchar](12) NULL,
	[AccountID] [bigint] NULL,
	[PersonID] [bigint] NULL,
 CONSTRAINT [PK_ExtCareIncidents] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[CareIncidentsToInsurances]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[CareIncidentsToInsurances](
	[ExtCareIncidentToInsuranceID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExtCareIncidentID] [int] NULL,
	[EffectiveStartDate] [date] NULL,
	[Status] [smallint] NULL,
	[PersonID] [bigint] NULL,
	[AccountID] [bigint] NULL,
	[InsuranceID] [int] NULL,
	[EffectiveEndingDate] [date] NULL,
 CONSTRAINT [PK_CareIncidentToInsurances] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentToInsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[CareIncidentsToPhysicians]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[CareIncidentsToPhysicians](
	[ExtCareIncidentToPhysicianID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExtCareIncidentID] [int] NULL,
	[EffectiveStartDate] [date] NULL,
	[Status] [smallint] NULL,
	[PersonID] [bigint] NULL,
	[AccountID] [bigint] NULL,
	[PhysicianID] [int] NULL,
	[PhysicianType] [smallint] NULL,
	[EffectiveEndingDate] [date] NULL,
 CONSTRAINT [PK_ExtCareIncidentToPhysicians] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentToPhysicianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[HeightsWeights]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[HeightsWeights](
	[ExtCareIncidentsHeightWeightID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExtCareIncidentID] [int] NULL,
	[CareIncidentHeight] [smallint] NULL,
	[CareIncidentWeight] [smallint] NULL,
	[ProcessedDate] [date] NULL,
	[ProcessedTime] [time](7) NULL,
	[WeightFactor] [nchar](10) NULL,
	[HeightFactor] [nchar](10) NULL,
	[CalculatedBMI] [nchar](10) NULL,
 CONSTRAINT [PK_ExtCIHeightWeights] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentsHeightWeightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[Notes]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[Notes](
	[ExtCareIncidentsNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentOrderID] [bigint] NULL,
	[CareIncidentNotesLink] [varchar](65) NULL,
	[ExrCareIncidentID] [int] NULL,
 CONSTRAINT [PK_ExtCareIncidentsNotes] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentsNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[Observations]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[Observations](
	[ExtClinicalIncidentObservationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentID] [int] NULL,
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
 CONSTRAINT [PK_ExtCIObservations] PRIMARY KEY CLUSTERED 
(
	[ExtClinicalIncidentObservationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[Orders]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[Orders](
	[extOrderNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[extCareIncidentID] [bigint] NULL,
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
 CONSTRAINT [PK_extCareIncidentsOrders] PRIMARY KEY CLUSTERED 
(
	[extOrderNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[OrdersToLabTimes]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[OrdersToLabTimes](
	[ExtCareIncidentOrdersToLabTimesID] [bigint] IDENTITY(1,1) NOT NULL,
	[ExtCareIncidentID] [int] NULL,
	[LabTimesOrderID] [smallint] NULL,
	[Quantity] [varchar](20) NULL,
	[ExplicitTime] [varchar](20) NULL,
	[RelativeTimeUnits] [varchar](20) NULL,
	[ServiceDuration] [varchar](20) NULL,
	[DateTimeStart] [varchar](26) NULL,
	[DateTimeEnd] [varchar](26) NULL,
	[Priority] [varchar](250) NULL,
	[OccurenceDuration] [varchar](20) NULL,
	[TotalOccurences] [varchar](10) NULL,
	[ExtCareIncidentOrderID] [bigint] NULL,
 CONSTRAINT [PK_ExtCareIncidentOrdersToLabTimes] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentOrdersToLabTimesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[Transcriptions]    Script Date: 12/28/2018 4:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[Transcriptions](
	[ExtCareIncidentsTranscribedNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CareIncidentOrderID] [bigint] NULL,
	[CareIncidentNotesLink] [varchar](65) NULL,
	[ExtCIID] [int] NULL,
 CONSTRAINT [PK_extCareIncidentsTranscribedNotes] PRIMARY KEY CLUSTERED 
(
	[ExtCareIncidentsTranscribedNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentext].[Vitals]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentext].[Vitals](
	[CareIncidentVitalsID] [bigint] NOT NULL,
	[ExtCIID] [int] NULL,
	[BPSystolic] [int] NOT NULL,
	[BPDiastolic] [int] NULL,
	[BPDate] [date] NULL,
	[BPTime] [time](7) NULL,
	[ProcessdDateTime] [datetime] NULL,
	[ProcessedDate] [varchar](12) NULL,
	[ProcessedTime] [varchar](20) NULL,
 CONSTRAINT [PK_ExtCIVitals] PRIMARY KEY CLUSTERED 
(
	[CareIncidentVitalsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentgeneral].[ClinicalAddedDetails]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentgeneral].[ClinicalAddedDetails](
	[ClincalAddedDetailsID] [bigint] IDENTITY(1,1) NOT NULL,
	[ClinicalAddedDetailsDateTime] [datetime] NULL,
	[PersonID] [bigint] NULL,
	[ResourceType] [smallint] NULL,
	[ClinicalAddedDetailNotes] [varchar](4096) NULL,
 CONSTRAINT [PK_ClinicalAddedDetails] PRIMARY KEY CLUSTERED 
(
	[ClincalAddedDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentgeneral].[Communications]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentgeneral].[Communications](
	[CommunictionID] [bigint] IDENTITY(1,1) NOT NULL,
	[CommunicationDateTime] [datetime] NULL,
	[CommunicationType] [smallint] NULL,
	[PersonID] [bigint] NULL,
	[CommunicationDetails] [varchar](4096) NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Communications] PRIMARY KEY CLUSTERED 
(
	[CommunictionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentgeneral].[DeviceAssociation]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentgeneral].[DeviceAssociation](
	[DeviceAssociationID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeviceAssociationDateTime] [datetime] NULL,
	[DeviceID] [varchar](50) NULL,
	[PersonID] [bigint] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_DeviceAssociation] PRIMARY KEY CLUSTERED 
(
	[DeviceAssociationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentgeneral].[Diagnosis]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentgeneral].[Diagnosis](
	[DiagnosisID] [bigint] IDENTITY(1,1) NOT NULL,
	[DiagnosisDateTime] [datetime] NULL,
	[Diagnosis] [varchar](5) NULL,
	[PersonID] [bigint] NULL,
	[DiagnosisDate] [varchar](12) NULL,
	[DiagnosisTime] [varchar](20) NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentgeneral].[Procedures]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentgeneral].[Procedures](
	[ProceduresID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProcedureDateTime] [datetime] NULL,
	[ProceduresCode] [varchar](5) NULL,
	[PersonID] [bigint] NULL,
	[Status] [smallint] NULL,
	[ProcedureDate] [varchar](12) NULL,
	[ProcedureTime] [varchar](16) NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[ProceduresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[CareIncidents]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[CareIncidents](
	[CareIncidentsID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdmitDate] [date] NULL,
	[AdmitTime] [varchar](12) NULL,
	[DischargeDate] [date] NULL,
	[DischargeTime] [varchar](12) NULL,
	[AccountID] [bigint] NULL,
	[PersonID] [bigint] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_IntCareIncidents] PRIMARY KEY CLUSTERED 
(
	[CareIncidentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[CareIncidentsToInsurances]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[CareIncidentsToInsurances](
	[CareIncidentToInsuranceID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndingDate] [date] NULL,
	[PersonID] [bigint] NULL,
	[AccountID] [bigint] NULL,
	[InsuranceID] [int] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_CareIncidentToInsurance] PRIMARY KEY CLUSTERED 
(
	[CareIncidentToInsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[CareIncidentsToPhysicians]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[CareIncidentsToPhysicians](
	[CareIncidentToPhysicianID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
	[EffectiveStartDate] [date] NULL,
	[EffectiveEndingDate] [date] NULL,
	[PersonID] [bigint] NULL,
	[AccountID] [bigint] NULL,
	[PhysicianID] [int] NULL,
	[PhysicianType] [smallint] NULL,
 CONSTRAINT [PK_IntCareIncidentToPhysicians] PRIMARY KEY CLUSTERED 
(
	[CareIncidentToPhysicianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[HeightWeights]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[HeightWeights](
	[IntCIHeightWeightID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
	[Height] [smallint] NULL,
	[Weight] [smallint] NULL,
	[ProcessedDate] [date] NULL,
	[ProcessedTime] [time](7) NULL,
	[WeightFactor] [nchar](10) NULL,
	[HeightFactor] [nchar](10) NULL,
	[CalculatedBMI] [nchar](10) NULL,
 CONSTRAINT [PK_IntCareIncidentsHeightWeights] PRIMARY KEY CLUSTERED 
(
	[IntCIHeightWeightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[Notes]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[Notes](
	[IntCareIncidentsNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CIOrderID] [bigint] NULL,
	[CareIncidentNotesLink] [varchar](65) NULL,
	[CareIncidentID] [bigint] NULL,
 CONSTRAINT [PK_IntCINotes] PRIMARY KEY CLUSTERED 
(
	[IntCareIncidentsNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[Observations]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[Observations](
	[IntCIObservationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
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
 CONSTRAINT [PK_IntClinicalIncidentObservations] PRIMARY KEY CLUSTERED 
(
	[IntCIObservationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[Orders]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[Orders](
	[intOrderNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[CIID] [bigint] NULL,
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
 CONSTRAINT [PK_IntCIOrders] PRIMARY KEY CLUSTERED 
(
	[intOrderNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[OrdersToLabTimes]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[OrdersToLabTimes](
	[IntCareIncidentOrdersToLabTimesID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NOT NULL,
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
	[IntCareIncidentOrderID] [bigint] NOT NULL,
 CONSTRAINT [PK_IntCIOrdersToLabTimes] PRIMARY KEY CLUSTERED 
(
	[IntCareIncidentOrdersToLabTimesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[Transcriptions]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[Transcriptions](
	[IntCareIncidentsTranscribedNotesID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntOrderID] [bigint] NULL,
	[CareIncidentNotesLink] [varchar](65) NULL,
	[IntCIID] [bigint] NULL,
 CONSTRAINT [PK_intCareIncidentsTranscribedNotes] PRIMARY KEY CLUSTERED 
(
	[IntCareIncidentsTranscribedNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [careincidentint].[Vitals]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [careincidentint].[Vitals](
	[CareIncidentVitalsID] [bigint] IDENTITY(1,1) NOT NULL,
	[IntCIID] [bigint] NULL,
	[BPSystolic] [int] NOT NULL,
	[BPDiastolic] [int] NULL,
	[BPDate] [date] NULL,
	[BPTime] [time](7) NULL,
	[ProcessdDateTime] [datetime] NULL,
 CONSTRAINT [PK_VitalsInt] PRIMARY KEY CLUSTERED 
(
	[CareIncidentVitalsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Allergens]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Allergens](
	[AllergensD] [int] IDENTITY(1,1) NOT NULL,
	[AllergyCode] [varchar](10) NULL,
	[AllergyDesc] [varchar](100) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Allergens] PRIMARY KEY CLUSTERED 
(
	[AllergensD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[ExternalHealthcareEntities]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[ExternalHealthcareEntities](
	[ExternalHealthcareEntitiesId] [smallint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesExtID] [varchar](25) NULL,
	[HealthcareEntitiesName] [varchar](25) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](3) NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[HealthcareEntitiesTypeId] [bigint] NULL,
	[LicenseNumber] [varchar](25) NULL,
	[Notes] [varchar](256) NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntities] PRIMARY KEY CLUSTERED 
(
	[ExternalHealthcareEntitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[ExternalPhysiciansOrderings]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[ExternalPhysiciansOrderings](
	[PhysiciansOrderingId] [int] NOT NULL,
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
 CONSTRAINT [PK_PhysiciansOrdering] PRIMARY KEY CLUSTERED 
(
	[PhysiciansOrderingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Insurances]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[Insurances](
	[InsuranceId] [int] NOT NULL,
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
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[OrderControlTypes]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [clinicalrefdata].[OrderControlTypes](
	[OrderControlTypeId] [varchar](2) NOT NULL,
	[OrderControlTypeDesc] [varchar](40) NULL,
 CONSTRAINT [PK_OrderControlType] PRIMARY KEY CLUSTERED 
(
	[OrderControlTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [clinicalrefdata].[Physicians]    Script Date: 12/28/2018 4:27:35 PM ******/
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
 CONSTRAINT [PK_Physician] PRIMARY KEY CLUSTERED 
(
	[PhysicianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[ConfigrationSettings]    Script Date: 12/28/2018 4:27:35 PM ******/
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
/****** Object:  Table [configrtn].[Departments]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[Departments](
	[DepartmentID] [smallint] IDENTITY(1,1) NOT NULL,
	[DepartmentValue] [varchar](15) NULL,
	[DepartmentDesc] [varchar](60) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
	[CompleteDepartmentDetail]  AS (([DepartmentValue]+' - ')+[DepartmentDesc]),
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntities]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntities](
	[HealthcareEntitiesId] [smallint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesName] [varchar](25) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](3) NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[Notes] [varchar](256) NULL,
	[CreatedDate] [date] NOT NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntities] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesBrandings]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntitiesBrandings](
	[HealthcareEntitiesBrandingID] [smallint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesID] [smallint] NULL,
	[Logo] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntitiesBranding] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesBrandingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesLeadership]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntitiesLeadership](
	[HealthcareEntitiesLeadershipID] [smallint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesID] [smallint] NULL,
	[ExecCEO] [varchar](79) NULL,
	[ExecCEOEMail] [varchar](129) NULL,
	[ExecCIO] [varchar](79) NULL,
	[ExecCIOEMail] [varchar](129) NULL,
	[ExecCFO] [varchar](79) NULL,
	[ExecCFOEmail] [varchar](129) NULL,
	[ExecCNO] [varchar](79) NULL,
	[ExecCNOEMail] [varchar](129) NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_HealthcareEntitiesLeadership] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesLeadershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesToLocalities]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntitiesToLocalities](
	[LocalitiesToHealthcareEntitiesID] [bigint] NOT NULL,
	[LocalitiesID] [smallint] NULL,
	[HealthcareEntitiesID] [smallint] NULL,
	[DateCreated] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_LocalitiesToHealthcareEntities] PRIMARY KEY CLUSTERED 
(
	[LocalitiesToHealthcareEntitiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareEntitiesToLocations]    Script Date: 12/28/2018 4:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareEntitiesToLocations](
	[HealthcareEntitiesToLocationsID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationID] [smallint] NOT NULL,
	[HealthcareEntitiesID] [smallint] NULL,
	[DepartmentID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_DepartmentToLocations] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntitiesToLocationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[HealthcareLocations]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[HealthcareLocations](
	[HealthcareLocationID] [smallint] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](35) NULL,
	[LocationDesc] [varchar](60) NULL,
	[StreetAddress] [varchar](75) NULL,
	[City] [varchar](50) NULL,
	[StateID] [varchar](2) NULL,
	[Zipcode] [varchar](12) NULL,
	[HealthcareEntityTypeID] [bigint] NULL,
	[LicenseNumber] [varchar](25) NULL,
	[LicenseNumberState] [varchar](2) NULL,
	[HealthcareEntityID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[HealthcareLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[Localities]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[Localities](
	[LocalitiesID] [smallint] IDENTITY(1,1) NOT NULL,
	[LocalitiesDesc] [varchar](45) NULL,
	[LocalitiesNotes] [varchar](256) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Localities] PRIMARY KEY CLUSTERED 
(
	[LocalitiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[Regions]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[Regions](
	[RegionID] [smallint] IDENTITY(1,1) NOT NULL,
	[RegionDesc] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[RegionToLocalities]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[RegionToLocalities](
	[RegionToLocalitiesID] [bigint] IDENTITY(1,1) NOT NULL,
	[RegionID] [smallint] NULL,
	[LocalitiesID] [smallint] NULL,
	[DateCreated] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RegionToLocalities] PRIMARY KEY CLUSTERED 
(
	[RegionToLocalitiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [configrtn].[Rooms]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [configrtn].[Rooms](
	[RoomID] [smallint] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](35) NULL,
	[DepartmentID] [smallint] NULL,
	[HealthcareLocationID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [datamodeldetail].[appDataCatalogs]    Script Date: 12/28/2018 4:27:36 PM ******/
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
/****** Object:  Table [datamodeldetail].[appModules]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datamodeldetail].[appModules](
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
/****** Object:  Table [datamodeldetail].[dbSchemas]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datamodeldetail].[dbSchemas](
	[dbSchemasID] [varchar](50) NOT NULL,
	[dbSchemasName] [varchar](100) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_dbSchemas_1] PRIMARY KEY CLUSTERED 
(
	[dbSchemasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[IndustryStd]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[IndustryStd](
	[IndustryStd] [varchar](12) NOT NULL,
	[IndustryStdDesc] [varchar](30) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK__IndustryStds] PRIMARY KEY CLUSTERED 
(
	[IndustryStd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[MesageFields]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[MesageFields](
	[MessageFieldID] [int] NOT NULL,
	[MessageFieldName] [varchar](154) NULL,
	[FieldLength] [varchar](10) NULL,
	[StdDataType] [varchar](5) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_MesageFields] PRIMARY KEY CLUSTERED 
(
	[MessageFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[MessageDataTypes]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[MessageDataTypes](
	[DataType] [varchar](5) NOT NULL,
	[DataTypeDesc] [varchar](75) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_MessageDataTypes] PRIMARY KEY CLUSTERED 
(
	[DataType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[MessageEvents]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[MessageEvents](
	[EventCode] [varchar](7) NOT NULL,
	[EventDesc] [varchar](195) NULL,
	[MsgType] [varchar](4) NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_MessageEvents] PRIMARY KEY CLUSTERED 
(
	[EventCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[MessageSegments]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[MessageSegments](
	[MsgSegment] [varchar](3) NOT NULL,
	[MsgSegmentDesc] [varchar](70) NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_MsgType] PRIMARY KEY CLUSTERED 
(
	[MsgSegment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[MessageTypes]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[MessageTypes](
	[MessageTypeId] [varchar](4) NOT NULL,
	[MessageTypeDesc] [varchar](50) NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_MessageType] PRIMARY KEY CLUSTERED 
(
	[MessageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [industrystds].[MessageVersions]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [industrystds].[MessageVersions](
	[Vrsn] [varchar](7) NOT NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_MessageVersion] PRIMARY KEY CLUSTERED 
(
	[Vrsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAccounts]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAccounts](
	[PersonAccountsID] [bigint] NOT NULL,
	[PersonID] [bigint] NULL,
	[HealthcareLocationID] [smallint] NULL,
	[AccountNumber] [bigint] NULL,
	[EMPI] [varchar](25) NULL,
	[CustomAccountNumber] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_PersonAccount] PRIMARY KEY CLUSTERED 
(
	[PersonAccountsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAddresses]    Script Date: 12/28/2018 4:27:36 PM ******/
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
	[Status] [smallint] NULL,
 CONSTRAINT [PK_PersonAddress] PRIMARY KEY CLUSTERED 
(
	[PersonAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonAllergies]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonAllergies](
	[PersonAllergiesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NULL,
	[AllergensID] [int] NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Allergies] PRIMARY KEY CLUSTERED 
(
	[PersonAllergiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonDemographics]    Script Date: 12/28/2018 4:27:36 PM ******/
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
	[StatusId] [smallint] NULL,
	[GenderId] [varchar](1) NULL,
	[ReligionId] [varchar](3) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_PersonDemographics] PRIMARY KEY CLUSTERED 
(
	[PersonDemogDtlsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonEmployers]    Script Date: 12/28/2018 4:27:36 PM ******/
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
/****** Object:  Table [persondata].[PersonPhones]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonPhones](
	[PersonPhoneId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[PhoneTypeId] [smallint] NOT NULL,
	[PhoneNumber] [varchar](12) NOT NULL,
 CONSTRAINT [PK_PersonPhone] PRIMARY KEY CLUSTERED 
(
	[PersonPhoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [persondata].[PersonProblems]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [persondata].[PersonProblems](
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
/****** Object:  Table [persondata].[Persons]    Script Date: 12/28/2018 4:27:36 PM ******/
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
/****** Object:  Table [refdata].[AddressTypes]    Script Date: 12/28/2018 4:27:36 PM ******/
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
/****** Object:  Table [refdata].[AdmissionTypes]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[AdmissionTypes](
	[AdmissionTypeId] [varchar](2) NOT NULL,
	[AdmissionTypeDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefAdmissionType] PRIMARY KEY CLUSTERED 
(
	[AdmissionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[AdmitSources]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[AdmitSources](
	[AdmitSourceId] [varchar](6) NOT NULL,
	[AdmitSourceDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_AdmitSource] PRIMARY KEY CLUSTERED 
(
	[AdmitSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[AmbulatoryStatus]    Script Date: 12/28/2018 4:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[AmbulatoryStatus](
	[AmbulatoryStatusId] [varchar](2) NOT NULL,
	[AmbulatoryStatusDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_AmbulatoryStatus] PRIMARY KEY CLUSTERED 
(
	[AmbulatoryStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[CommunicationType]    Script Date: 12/28/2018 4:27:36 PM ******/
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
/****** Object:  Table [refdata].[ConfigurationSettingType]    Script Date: 12/28/2018 4:27:36 PM ******/
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
/****** Object:  Table [refdata].[Countries]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [refdata].[Employers]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Employers](
	[EmployerId] [bigint] NOT NULL,
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
	[Status] [smallint] NULL,
 CONSTRAINT [PK_Employer] PRIMARY KEY CLUSTERED 
(
	[EmployerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[Ethnicities]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Ethnicities](
	[EthnicityId] [smallint] IDENTITY(1,1) NOT NULL,
	[EthnicityDesc] [varchar](75) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefEthnicity] PRIMARY KEY CLUSTERED 
(
	[EthnicityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[ExternalHealthcareEntities]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[ExternalHealthcareEntities](
	[ExternalHealthcareEntitiesId] [smallint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntitiesName] [varchar](25) NULL,
	[Address] [varchar](60) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[Country] [varchar](3) NULL,
	[PostalCode] [varchar](12) NOT NULL,
	[CreatedDate] [smalldatetime] NOT NULL,
	[HealthcareEntitiesTypeId] [bigint] NULL,
	[LicenseNumber] [varchar](25) NULL,
	[Notes] [varchar](256) NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_ExternalHealthcareEntities] PRIMARY KEY CLUSTERED 
(
	[ExternalHealthcareEntitiesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[FinancialClasses]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[FinancialClasses](
	[FinancialClassId] [int] IDENTITY(1,1) NOT NULL,
	[FinancialClassCode] [varchar](1) NOT NULL,
	[FinancialClassDesc] [varchar](50) NULL,
	[CompleteFinancialClass]  AS (([FinancialClassCode]+' - ')+[FinancialClassDesc]),
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_FinancialClassId] PRIMARY KEY CLUSTERED 
(
	[FinancialClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[Genders]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Genders](
	[GenderId] [varchar](1) NOT NULL,
	[GenderDesc] [varchar](25) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefGender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[HealthcareEntityTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[HealthcareEntityTypes](
	[HealthcareEntityTypeID] [bigint] IDENTITY(1,1) NOT NULL,
	[HealthcareEntityTypeDesc] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_HealthcareEntityTypes] PRIMARY KEY CLUSTERED 
(
	[HealthcareEntityTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[HospitalServices]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[HospitalServices](
	[HospitalServiceId] [varchar](3) NOT NULL,
	[HospitalServiceDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefHospitalService] PRIMARY KEY CLUSTERED 
(
	[HospitalServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[InsuranceTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[InsuranceTypes](
	[InsuranceTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranceTypeDesc] [varchar](30) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefInsuranceType] PRIMARY KEY CLUSTERED 
(
	[InsuranceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[MaritalStatus]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[MaritalStatus](
	[MaritalStatusId] [varchar](1) NOT NULL,
	[MaritalStatusDesc] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[MaritalStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[PatientClasses]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[PatientClasses](
	[PatientClassId] [varchar](1) NOT NULL,
	[ClassificationDesc] [varchar](80) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefPatientClass] PRIMARY KEY CLUSTERED 
(
	[PatientClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[PatientTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[PatientTypes](
	[PatientTypeId] [varchar](2) NOT NULL,
	[PatientTypeDesc] [varchar](50) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_PatientType] PRIMARY KEY CLUSTERED 
(
	[PatientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[PhoneTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [refdata].[PhysicianTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[PhysicianTypes](
	[PhysicianTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[PhysicianTypeDesc] [varchar](25) NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_PhysicianType] PRIMARY KEY CLUSTERED 
(
	[PhysicianTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[Races]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Races](
	[RaceId] [varchar](6) NOT NULL,
	[RaceDesc] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefRace] PRIMARY KEY CLUSTERED 
(
	[RaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[Religions]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Religions](
	[ReligionId] [varchar](3) NOT NULL,
	[ReligionDesc] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_RefReligion] PRIMARY KEY CLUSTERED 
(
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [refdata].[ResourceType]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [refdata].[States]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [refdata].[Status]    Script Date: 12/28/2018 4:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [refdata].[Status](
	[StatusId] [smallint] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_RefStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sampleimports].[SnoMedProblems]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[CWETermGroups]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[CWETerms]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[Diagnosis]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[LOINCCodeset]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[Procedures]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[RxNorms]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[SnomedCodeset]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Table [semanticterms].[SnomedProblems]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_AuditLoggingEventType]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_AuditLoggingEventType] ON [auditlogging].[AuditLoggingEventTypes]
(
	[AuditLoggingEventTypeId] ASC,
	[AuditLoggingEventTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_AuditLoggingIntegration]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_AuditLogging]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_AuditLogging] ON [auditlogging].[AuditLoggings]
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
/****** Object:  Index [IX_CIHeightsWeights]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_CIHeightsWeights] ON [careincidentext].[HeightsWeights]
(
	[ExtCareIncidentsHeightWeightID] ASC,
	[ExtCareIncidentID] ASC,
	[CareIncidentHeight] ASC,
	[CareIncidentWeight] ASC,
	[HeightFactor] ASC,
	[WeightFactor] ASC,
	[CalculatedBMI] ASC,
	[ProcessedDate] ASC,
	[ProcessedTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ExtCINotes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExtCINotes] ON [careincidentext].[Notes]
(
	[ExtCareIncidentsNotesID] ASC,
	[CareIncidentOrderID] ASC,
	[CareIncidentNotesLink] ASC,
	[ExrCareIncidentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ExtCIObservations]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ExtCIObservations] ON [careincidentext].[Observations]
(
	[ExtClinicalIncidentObservationsID] ASC,
	[CareIncidentID] ASC,
	[OrderNumberID] ASC,
	[ObservationID] ASC,
	[ProducerID] ASC,
	[AbnormalFlags] ASC,
	[AbnormalTestNature] ASC,
	[ObservationDetailLink] ASC,
	[ObservationMethod] ASC,
	[ObservationUnit] ASC,
	[Probability] ASC,
	[ReferenceRange] ASC,
	[ValueType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ExtCIOrders]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExtCIOrders] ON [careincidentext].[Orders]
(
	[extOrderNumberID] ASC,
	[extCareIncidentID] ASC,
	[Confidentiality] ASC,
	[FiillerGroupNumber] ASC,
	[FillerOrderNumber] ASC,
	[OrderControlReason] ASC,
	[OrderEffectiveDate] ASC,
	[OrderControlType] ASC,
	[OrderingDevice] ASC,
	[OrderingPhysician] ASC,
	[OrderStatusModifier] ASC,
	[OrderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CIExt_OrdersToLabTimes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_CIExt_OrdersToLabTimes] ON [careincidentext].[OrdersToLabTimes]
(
	[ExtCareIncidentOrdersToLabTimesID] ASC,
	[ExtCareIncidentID] ASC,
	[ExtCareIncidentOrderID] ASC,
	[LabTimesOrderID] ASC,
	[DateTimeStart] ASC,
	[DateTimeEnd] ASC,
	[ExplicitTime] ASC,
	[OccurenceDuration] ASC,
	[Priority] ASC,
	[Quantity] ASC,
	[RelativeTimeUnits] ASC,
	[ServiceDuration] ASC,
	[TotalOccurences] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ExtCITranscriptions]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ExtCITranscriptions] ON [careincidentext].[Transcriptions]
(
	[ExtCareIncidentsTranscribedNotesID] ASC,
	[CareIncidentNotesLink] ASC,
	[CareIncidentOrderID] ASC,
	[ExtCIID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ExtCIVitals]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExtCIVitals] ON [careincidentext].[Vitals]
(
	[CareIncidentVitalsID] ASC,
	[ExtCIID] ASC,
	[BPSystolic] ASC,
	[BPDiastolic] ASC,
	[BPDate] ASC,
	[BPTime] ASC,
	[ProcessdDateTime] ASC,
	[ProcessedDate] ASC,
	[ProcessedTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_ClinicalAddedDetails]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ClinicalAddedDetails] ON [careincidentgeneral].[ClinicalAddedDetails]
(
	[ClincalAddedDetailsID] ASC,
	[ClinicalAddedDetailsDateTime] ASC,
	[PersonID] ASC,
	[ResourceType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Communications]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Communications] ON [careincidentgeneral].[Communications]
(
	[CommunictionID] ASC,
	[CommunicationDateTime] ASC,
	[CommunicationType] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_DeviceAssociation]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_DeviceAssociation] ON [careincidentgeneral].[DeviceAssociation]
(
	[DeviceAssociationID] ASC,
	[DeviceAssociationDateTime] ASC,
	[DeviceID] ASC,
	[PersonID] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Diagnosis]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Diagnosis] ON [careincidentgeneral].[Diagnosis]
(
	[DiagnosisID] ASC,
	[Diagnosis] ASC,
	[DiagnosisDate] ASC,
	[DiagnosisTime] ASC,
	[DiagnosisDateTime] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Procedures]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Procedures] ON [careincidentgeneral].[Procedures]
(
	[ProceduresID] ASC,
	[ProcedureDate] ASC,
	[ProcedureTime] ASC,
	[ProceduresCode] ASC,
	[ProcedureDateTime] ASC,
	[PersonID] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_IntCareIncidents]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_IntCareIncidents] ON [careincidentint].[CareIncidents]
(
	[CareIncidentsID] ASC,
	[AdmitDate] ASC,
	[AdmitTime] ASC,
	[DischargeDate] ASC,
	[DischargeTime] ASC,
	[AccountID] ASC,
	[PersonID] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_CareIncidentsToInsurances]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_CareIncidentsToInsurances] ON [careincidentint].[CareIncidentsToInsurances]
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HeightWeights]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HeightWeights] ON [careincidentint].[HeightWeights]
(
	[IntCIHeightWeightID] ASC,
	[IntCIID] ASC,
	[Height] ASC,
	[Weight] ASC,
	[HeightFactor] ASC,
	[WeightFactor] ASC,
	[CalculatedBMI] ASC,
	[ProcessedDate] ASC,
	[ProcessedTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IntCINotes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_IntCINotes] ON [careincidentint].[Notes]
(
	[IntCareIncidentsNotesID] ASC,
	[CareIncidentID] ASC,
	[CareIncidentNotesLink] ASC,
	[CIOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ClinicalIncidentObservations]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ClinicalIncidentObservations] ON [careincidentint].[Observations]
(
	[IntCIObservationsID] ASC,
	[IntCIID] ASC,
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
	[ValueType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IntCIOrders]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_IntCIOrders] ON [careincidentint].[Orders]
(
	[intOrderNumberID] ASC,
	[CIID] ASC,
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
	[OrderType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_OrdersToLabTimes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_OrdersToLabTimes] ON [careincidentint].[OrdersToLabTimes]
(
	[IntCareIncidentOrdersToLabTimesID] ASC,
	[DateTimeEnd] ASC,
	[DateTimeStart] ASC,
	[ExplicitTime] ASC,
	[IntCareIncidentOrderID] ASC,
	[IntCIID] ASC,
	[LabTimesOrderID] ASC,
	[OccurenceDuration] ASC,
	[Priority] ASC,
	[Quantity] ASC,
	[RelativeTimeUnits] ASC,
	[ServiceDuration] ASC,
	[TotalOccurences] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IntCITranscriptions]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_IntCITranscriptions] ON [careincidentint].[Transcriptions]
(
	[IntCareIncidentsTranscribedNotesID] ASC,
	[CareIncidentNotesLink] ASC,
	[IntCIID] ASC,
	[IntOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Vitals]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Vitals] ON [careincidentint].[Vitals]
(
	[CareIncidentVitalsID] ASC,
	[IntCIID] ASC,
	[BPDate] ASC,
	[BPDiastolic] ASC,
	[BPSystolic] ASC,
	[BPTime] ASC,
	[ProcessdDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Allergies]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Allergies] ON [clinicalrefdata].[Allergens]
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
/****** Object:  Index [IDX_ExternalHealthcareEntities]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ExternalHealthcareEntities] ON [clinicalrefdata].[ExternalHealthcareEntities]
(
	[ExternalHealthcareEntitiesId] ASC,
	[HealthcareEntitiesExtID] ASC,
	[HealthcareEntitiesName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[State] ASC,
	[Status] ASC,
	[Notes] ASC,
	[LicenseNumber] ASC,
	[HealthcareEntitiesTypeId] ASC,
	[PostalCode] ASC,
	[CreatedDate] ASC,
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_ExternalPhysiciansOrdering]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ExternalPhysiciansOrdering] ON [clinicalrefdata].[ExternalPhysiciansOrderings]
(
	[PhysiciansOrderingId] ASC,
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
	[Address2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Insurance]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Insurance] ON [clinicalrefdata].[Insurances]
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
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_OrderControlType]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_OrderControlType] ON [clinicalrefdata].[OrderControlTypes]
(
	[OrderControlTypeId] ASC,
	[OrderControlTypeDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Physician]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Physician] ON [clinicalrefdata].[Physicians]
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
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_ConfigrationSettings]    Script Date: 12/28/2018 4:27:37 PM ******/
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
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IDX_Departments]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Departments] ON [configrtn].[Departments]
(
	[DepartmentID] ASC,
	[DepartmentValue] ASC,
	[DepartmentDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC,
	[CompleteDepartmentDetail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HealthcareEntities]    Script Date: 12/28/2018 4:27:37 PM ******/
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
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HealthcareEntitiesBrandings]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HealthcareEntitiesBrandings] ON [configrtn].[HealthcareEntitiesBrandings]
(
	[HealthcareEntitiesBrandingID] ASC,
	[HealthcareEntitiesID] ASC,
	[Logo] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HealthcareEntitiesLeadership]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_HealthcareEntitiesLeadership] ON [configrtn].[HealthcareEntitiesLeadership]
(
	[HealthcareEntitiesLeadershipID] ASC,
	[ExecCEO] ASC,
	[ExecCFO] ASC,
	[ExecCIO] ASC,
	[ExecCNO] ASC,
	[CreatedDate] ASC,
	[HealthcareEntitiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_HealthcareEntitiesToLocalities]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_HealthcareEntitiesToLocalities] ON [configrtn].[HealthcareEntitiesToLocalities]
(
	[LocalitiesToHealthcareEntitiesID] ASC,
	[LocalitiesID] ASC,
	[HealthcareEntitiesID] ASC,
	[DateCreated] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_HealthcareEntitiesToLocations]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_HealthcareEntitiesToLocations] ON [configrtn].[HealthcareEntitiesToLocations]
(
	[HealthcareEntitiesToLocationsID] ASC,
	[LocationID] ASC,
	[HealthcareEntitiesID] ASC,
	[CreatedDate] ASC,
	[Status] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Locations]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Locations] ON [configrtn].[HealthcareLocations]
(
	[HealthcareLocationID] ASC,
	[LocationName] ASC,
	[CreatedDate] ASC,
	[Status] ASC,
	[LocationDesc] ASC,
	[City] ASC,
	[HealthcareEntityTypeID] ASC,
	[StateID] ASC,
	[StreetAddress] ASC,
	[Zipcode] ASC,
	[LicenseNumber] ASC,
	[LicenseNumberState] ASC,
	[HealthcareEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Localities]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Localities] ON [configrtn].[Localities]
(
	[LocalitiesID] ASC,
	[LocalitiesDesc] ASC,
	[LocalitiesNotes] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Region]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Region] ON [configrtn].[Regions]
(
	[RegionID] ASC,
	[RegionDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_RegionToLocalities]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RegionToLocalities] ON [configrtn].[RegionToLocalities]
(
	[RegionToLocalitiesID] ASC,
	[RegionID] ASC,
	[LocalitiesID] ASC,
	[DateCreated] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Rooms]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Rooms] ON [configrtn].[Rooms]
(
	[RoomID] ASC,
	[RoomName] ASC,
	[DepartmentID] ASC,
	[HealthcareLocationID] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_appDataCatalogs]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_appModules]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_appModules] ON [datamodeldetail].[appModules]
(
	[appModuleID] ASC,
	[appModuleDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_dbSchemas]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_dbSchemas] ON [datamodeldetail].[dbSchemas]
(
	[dbSchemasID] ASC,
	[dbSchemasName] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IndustryStd]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_IndustryStd] ON [industrystds].[IndustryStd]
(
	[IndustryStd] ASC,
	[IndustryStdDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_MesageFields]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_MesageFields] ON [industrystds].[MesageFields]
(
	[MessageFieldID] ASC,
	[MessageFieldName] ASC,
	[FieldLength] ASC,
	[StdDataType] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_MessageDataTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_MessageDataTypes] ON [industrystds].[MessageDataTypes]
(
	[DataType] ASC,
	[DataTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Indx_MsgEvents]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [Indx_MsgEvents] ON [industrystds].[MessageEvents]
(
	[EventCode] ASC,
	[EventDesc] ASC,
	[MsgType] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Indx_MsgType]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [Indx_MsgType] ON [industrystds].[MessageSegments]
(
	[MsgSegment] ASC,
	[MsgSegmentDesc] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Indx_MessageTyoe]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [Indx_MessageTyoe] ON [industrystds].[MessageTypes]
(
	[MessageTypeId] ASC,
	[MessageTypeDesc] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageVersion]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageVersion] ON [industrystds].[MessageVersions]
(
	[Vrsn] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonAccount]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonAccount] ON [persondata].[PersonAccounts]
(
	[PersonAccountsID] ASC,
	[AccountNumber] ASC,
	[PersonID] ASC,
	[CustomAccountNumber] ASC,
	[EMPI] ASC,
	[HealthcareLocationID] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PersonAddress]    Script Date: 12/28/2018 4:27:37 PM ******/
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
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Allergies]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Allergies] ON [persondata].[PersonAllergies]
(
	[PersonAllergiesID] ASC,
	[PersonID] ASC,
	[CreatedDate] ASC,
	[Status] ASC,
	[AllergensID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonDemographics ]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_PersonDemographics2 ]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonDemographics2 ] ON [persondata].[PersonDemographics]
(
	[ExternalHealthcareEntitiesId] ASC,
	[RaceId] ASC,
	[EthnicityId] ASC,
	[MaritalStatusId] ASC,
	[PersonId] ASC,
	[StatusId] ASC,
	[GenderId] ASC,
	[ReligionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PersonEmployer]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_PersonPhone]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_PersonPhone] ON [persondata].[PersonPhones]
(
	[PersonPhoneId] ASC,
	[PersonId] ASC,
	[PhoneTypeId] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_PersonProblems]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_PersonProblems] ON [persondata].[PersonProblems]
(
	[PersonProblemID] ASC,
	[PersonID] ASC,
	[DateReported] ASC,
	[DateProcessedInSystem] ASC,
	[StatusID] ASC,
	[ProblemID] ASC
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
/****** Object:  Index [IDX_Person]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_RefAddressType]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_AdmissionTypes_Column]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_AdmissionTypes_Column] ON [refdata].[AdmissionTypes]
(
	[AdmissionTypeId] ASC,
	[AdmissionTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AdmitSources]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_AdmitSources] ON [refdata].[AdmitSources]
(
	[AdmitSourceId] ASC,
	[AdmitSourceDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_AmbulatoryStatus]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_AmbulatoryStatus] ON [refdata].[AmbulatoryStatus]
(
	[AmbulatoryStatusId] ASC,
	[AmbulatoryStatusDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CommunicationType]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IX_ConfigurationSettingType]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_RefCountry]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_Employer]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Employer] ON [refdata].[Employers]
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
/****** Object:  Index [INDX_Ethnicities]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_Ethnicities] ON [refdata].[Ethnicities]
(
	[EthnicityId] ASC,
	[EthnicityDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ExternalHealthcareEntities_Column]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [INDX_ExternalHealthcareEntities_Column] ON [refdata].[ExternalHealthcareEntities]
(
	[ExternalHealthcareEntitiesId] ASC,
	[HealthcareEntitiesName] ASC,
	[Address] ASC,
	[Address2] ASC,
	[City] ASC,
	[State] ASC,
	[Country] ASC,
	[PostalCode] ASC,
	[CreatedDate] ASC,
	[HealthcareEntitiesTypeId] ASC,
	[LicenseNumber] ASC,
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
/****** Object:  Index [IDX_FinancialClasses]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FinancialClasses] ON [refdata].[FinancialClasses]
(
	[FinancialClassId] ASC,
	[FinancialClassCode] ASC,
	[FinancialClassDesc] ASC,
	[CompleteFinancialClass] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Genders]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Genders] ON [refdata].[Genders]
(
	[GenderId] ASC,
	[GenderDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_HospitalServices]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_HospitalServices] ON [refdata].[HospitalServices]
(
	[HospitalServiceId] ASC,
	[HospitalServiceDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_InsuranceTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_InsuranceTypes] ON [refdata].[InsuranceTypes]
(
	[InsuranceTypeId] ASC,
	[InsuranceTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_MaritalStatus]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_MaritalStatus] ON [refdata].[MaritalStatus]
(
	[MaritalStatusId] ASC,
	[MaritalStatusDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PatientClasses]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_PatientClasses] ON [refdata].[PatientClasses]
(
	[PatientClassId] ASC,
	[ClassificationDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PatientTypes]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_PatientTypes] ON [refdata].[PatientTypes]
(
	[PatientTypeId] ASC,
	[PatientTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefPhoneType]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_PhysicianType]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_PhysicianType] ON [refdata].[PhysicianTypes]
(
	[PhysicianTypeId] ASC,
	[PhysicianTypeDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Races]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Races] ON [refdata].[Races]
(
	[RaceId] ASC,
	[RaceDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Religions]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Religions] ON [refdata].[Religions]
(
	[ReligionId] ASC,
	[ReligionDesc] ASC,
	[CreatedDate] ASC,
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ResourceType]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_States]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [IDX_RefStatus]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RefStatus] ON [refdata].[Status]
(
	[StatusId] ASC,
	[StatusDescription] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CWETermGroup]    Script Date: 12/28/2018 4:27:37 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CWETermGroup] ON [semanticterms].[CWETermGroups]
(
	[CWETermGroupId] ASC,
	[CWETermGroupDesc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CWETerms]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_Diagnosis]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_LOINCCodeset]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_Procedures]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_RxNorm]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_SnomedCodeset]    Script Date: 12/28/2018 4:27:37 PM ******/
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
/****** Object:  Index [INDX_SnomedProblems]    Script Date: 12/28/2018 4:27:37 PM ******/
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
ALTER TABLE [auditlogging].[AuditLoggings] ADD  CONSTRAINT [DF_AuditLogging_AuditDate]  DEFAULT (getdate()) FOR [AuditEventDate]
GO
ALTER TABLE [auditlogging].[AuditLoggings] ADD  CONSTRAINT [DF_AuditLogging_AuditEventTime]  DEFAULT (CONVERT([varchar],getdate(),(108))) FOR [AuditEventTime]
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_ExtCareIncidentsToInsurance_EffectiveStartDate]  DEFAULT (getdate()) FOR [EffectiveStartDate]
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_CareIncidentsToInsurances_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] ADD  CONSTRAINT [DF_ExtCareIncidentsToPhysicians_EffectiveStartDate]  DEFAULT (getdate()) FOR [EffectiveStartDate]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] ADD  CONSTRAINT [DF_CareIncidentsToPhysicians_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincidentext].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_ProcessedDate]  DEFAULT (getdate()) FOR [ProcessedDate]
GO
ALTER TABLE [careincidentext].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_ProcessedTime]  DEFAULT (CONVERT([varchar],getdate(),(108))) FOR [ProcessedTime]
GO
ALTER TABLE [careincidentext].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_WeightFactor]  DEFAULT (N'CareIncidentWeight*.45') FOR [WeightFactor]
GO
ALTER TABLE [careincidentext].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_HeightFactor]  DEFAULT (N'SQUARE(CareIncidentHeight*.025)') FOR [HeightFactor]
GO
ALTER TABLE [careincidentext].[HeightsWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_CalculatedBMI]  DEFAULT (N'WeightFactor/HeightFactor') FOR [CalculatedBMI]
GO
ALTER TABLE [careincidentext].[Vitals] ADD  DEFAULT (getdate()) FOR [ProcessdDateTime]
GO
ALTER TABLE [careincidentgeneral].[ClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_ClinicalAddedDetailsDateTime]  DEFAULT (getdate()) FOR [ClinicalAddedDetailsDateTime]
GO
ALTER TABLE [careincidentgeneral].[ClinicalAddedDetails] ADD  CONSTRAINT [DF_ClinicalAddedDetails_ResourceType]  DEFAULT ((1)) FOR [ResourceType]
GO
ALTER TABLE [careincidentgeneral].[Communications] ADD  CONSTRAINT [DF_Communications_CommunicationDateTime]  DEFAULT (getdate()) FOR [CommunicationDateTime]
GO
ALTER TABLE [careincidentgeneral].[Communications] ADD  CONSTRAINT [DF_Communications_CommunicationType]  DEFAULT ((1)) FOR [CommunicationType]
GO
ALTER TABLE [careincidentgeneral].[Communications] ADD  CONSTRAINT [DF_Communications_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincidentgeneral].[DeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_DeviceAssociationDateTime]  DEFAULT (getdate()) FOR [DeviceAssociationDateTime]
GO
ALTER TABLE [careincidentgeneral].[DeviceAssociation] ADD  CONSTRAINT [DF_DeviceAssociation_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincidentgeneral].[Diagnosis] ADD  CONSTRAINT [DF_Diagnosis_DiagnosisDateTime]  DEFAULT (getdate()) FOR [DiagnosisDateTime]
GO
ALTER TABLE [careincidentgeneral].[Procedures] ADD  CONSTRAINT [DF_Procedures_ProcedureDateTime]  DEFAULT (getdate()) FOR [ProcedureDateTime]
GO
ALTER TABLE [careincidentgeneral].[Procedures] ADD  CONSTRAINT [DF_Procedures_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_IntCareIncidentsToInsurance_EffectiveStartDate]  DEFAULT (getdate()) FOR [EffectiveStartDate]
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances] ADD  CONSTRAINT [DF_CareIncidentsToInsurances_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians] ADD  CONSTRAINT [DF_IntCareIncidentsToPhysicians_EffectiveStartDate]  DEFAULT (getdate()) FOR [EffectiveStartDate]
GO
ALTER TABLE [careincidentint].[HeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_ProcessedDate]  DEFAULT (getdate()) FOR [ProcessedDate]
GO
ALTER TABLE [careincidentint].[HeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_ProcessedTime]  DEFAULT (CONVERT([varchar],getdate(),(108))) FOR [ProcessedTime]
GO
ALTER TABLE [careincidentint].[HeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_WeightFactor]  DEFAULT (N'CareIncidentWeight*.45') FOR [WeightFactor]
GO
ALTER TABLE [careincidentint].[HeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_HeightFactor]  DEFAULT (N'SQUARE(CareIncidentHeight*.025)') FOR [HeightFactor]
GO
ALTER TABLE [careincidentint].[HeightWeights] ADD  CONSTRAINT [DF_CareIncidentsHeightWeight_CalculatedBMI]  DEFAULT (N'WeightFactor/HeightFactor') FOR [CalculatedBMI]
GO
ALTER TABLE [careincidentint].[Vitals] ADD  CONSTRAINT [DF__CareIncid__Proce__40257DE4]  DEFAULT (getdate()) FOR [ProcessdDateTime]
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities] ADD  CONSTRAINT [DF__ExtHealthcareEntities__Creat__7849DB76]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[ConfigrationSettings] ADD  CONSTRAINT [DF_ConfigrationSettings_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[ConfigrationSettings] ADD  CONSTRAINT [DF_ConfigrationSettings_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[Departments] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[Departments] ADD  CONSTRAINT [DF_Departments_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareEntities] ADD  CONSTRAINT [DF__Healthcar__Creat__7849DB76]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntities] ADD  CONSTRAINT [DF_HealthcareEntities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesBrandings] ADD  CONSTRAINT [DF_HealthcareEntitiesBrandings_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesBrandings] ADD  CONSTRAINT [DF_HealthcareEntitiesBrandings_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesLeadership] ADD  CONSTRAINT [DF_HealthcareEntitiesLeadership_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities] ADD  CONSTRAINT [DF_HealthcareEntitiesToLocalities_DateEntered]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities] ADD  CONSTRAINT [DF_HealthcareEntitiesToLocalities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations] ADD  CONSTRAINT [DF_HealthcareEntitiesToLocations_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations] ADD  CONSTRAINT [DF_HealthcareEntitiesToLocations_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[HealthcareLocations] ADD  CONSTRAINT [DF__Locations__Creat__28ED12D1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[HealthcareLocations] ADD  CONSTRAINT [DF_Locations_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[Localities] ADD  CONSTRAINT [DF_Localities_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[Localities] ADD  CONSTRAINT [DF_Localities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[Regions] ADD  CONSTRAINT [DF_Regions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[Regions] ADD  CONSTRAINT [DF_Regions_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[RegionToLocalities] ADD  CONSTRAINT [DF_RegionToLocalities_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [configrtn].[RegionToLocalities] ADD  CONSTRAINT [DF_RegionToLocalities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [configrtn].[Rooms] ADD  CONSTRAINT [DF_Rooms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [configrtn].[Rooms] ADD  CONSTRAINT [DF_Rooms_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] ADD  CONSTRAINT [DF__appDataCa__appMo__60924D76]  DEFAULT ((1)) FOR [appModule]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] ADD  CONSTRAINT [DF_appDataCatalog_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] ADD  CONSTRAINT [DF__appDataCa__Statu__55209ACA]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [datamodeldetail].[appModules] ADD  CONSTRAINT [DF_appModules_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [datamodeldetail].[appModules] ADD  CONSTRAINT [DF_appModules_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [datamodeldetail].[dbSchemas] ADD  CONSTRAINT [DF__dbSchemas__Creat__373B3228]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [datamodeldetail].[dbSchemas] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[IndustryStd] ADD  CONSTRAINT [DF_IndustryStd_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[IndustryStd] ADD  CONSTRAINT [DF_IndustryStd_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[MesageFields] ADD  CONSTRAINT [DF_MesageFields_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[MesageFields] ADD  CONSTRAINT [DF_MesageFields_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[MessageDataTypes] ADD  CONSTRAINT [DF_MessageDataTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[MessageDataTypes] ADD  CONSTRAINT [DF_MessageDataTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[MessageEvents] ADD  CONSTRAINT [DF_MessageEvents_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[MessageEvents] ADD  CONSTRAINT [DF_MessageEvents_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[MessageSegments] ADD  CONSTRAINT [DF_MessageSegments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[MessageSegments] ADD  CONSTRAINT [DF_MessageSegments_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[MessageTypes] ADD  CONSTRAINT [DF__tmp_ms_xx__Indus__7E22B05D]  DEFAULT ('HL7') FOR [IndustryStd]
GO
ALTER TABLE [industrystds].[MessageTypes] ADD  CONSTRAINT [DF_MessageTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[MessageTypes] ADD  CONSTRAINT [DF__tmp_ms_xx__Statu__7F16D496]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [industrystds].[MessageVersions] ADD  CONSTRAINT [DF_MessageVersions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [industrystds].[MessageVersions] ADD  CONSTRAINT [DF_MessageVersions_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [persondata].[PersonAccounts] ADD  CONSTRAINT [DF_PersonAccount_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonAccounts] ADD  CONSTRAINT [DF_PersonAccounts_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [persondata].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonAddresses] ADD  CONSTRAINT [DF_PersonAddresses_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [persondata].[PersonAllergies] ADD  CONSTRAINT [DF_Allergies_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonAllergies] ADD  CONSTRAINT [DF_Allergies_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [persondata].[PersonDemographics] ADD  CONSTRAINT [DF_PersonDemographics_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[PersonProblems] ADD  CONSTRAINT [DF__PersonPro__DateP__0F4D3C5F]  DEFAULT (getdate()) FOR [DateProcessedInSystem]
GO
ALTER TABLE [persondata].[PersonProblems] ADD  CONSTRAINT [DF__PersonPro__Statu__10416098]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [persondata].[Persons] ADD  CONSTRAINT [DF__Persons__Created__51300E55]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [persondata].[Persons] ADD  CONSTRAINT [DF_Persons_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[AddressTypes] ADD  CONSTRAINT [DF_AddressTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[AddressTypes] ADD  CONSTRAINT [DF_AddressTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[AdmissionTypes] ADD  CONSTRAINT [DF_AdmissionTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[AdmitSources] ADD  CONSTRAINT [DF_AdmitSources_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[AdmitSources] ADD  CONSTRAINT [DF_AdmitSources_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[AmbulatoryStatus] ADD  CONSTRAINT [DF_AmbulatoryStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[AmbulatoryStatus] ADD  CONSTRAINT [DF_AmbulatoryStatus_Status]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [refdata].[Employers] ADD  CONSTRAINT [DF_Employers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[Employers] ADD  CONSTRAINT [DF_Employers_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[Ethnicities] ADD  CONSTRAINT [DF_Ethnicities_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[Ethnicities] ADD  CONSTRAINT [DF_Ethnicities_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities] ADD  CONSTRAINT [DF_ExternalHCDataEntities]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[FinancialClasses] ADD  CONSTRAINT [DF_FinancialClasses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[FinancialClasses] ADD  CONSTRAINT [DF_FinancialClasses_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[Genders] ADD  CONSTRAINT [DF_Genders_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[Genders] ADD  CONSTRAINT [DF_Genders_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[HealthcareEntityTypes] ADD  CONSTRAINT [DF_HealthcareEntityTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[HealthcareEntityTypes] ADD  CONSTRAINT [DF_HealthcareEntityTypes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [refdata].[HospitalServices] ADD  CONSTRAINT [DF_HospitalServices_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[HospitalServices] ADD  CONSTRAINT [DF_HospitalServices_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[InsuranceTypes] ADD  CONSTRAINT [DF_InsuranceTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[InsuranceTypes] ADD  CONSTRAINT [DF_InsuranceTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[MaritalStatus] ADD  CONSTRAINT [DF_MaritalStatus_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[MaritalStatus] ADD  CONSTRAINT [DF_MaritalStatus_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[PatientClasses] ADD  CONSTRAINT [DF_PatientClasses_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PatientClasses] ADD  CONSTRAINT [DF_PatientClasses_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[PatientTypes] ADD  CONSTRAINT [DF_PatientTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PhoneTypes] ADD  CONSTRAINT [DF_PhoneTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PhoneTypes] ADD  CONSTRAINT [DF_PhoneTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[PhysicianTypes] ADD  CONSTRAINT [DF_PhysicianTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[PhysicianTypes] ADD  CONSTRAINT [DF_PhysicianTypes_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[Races] ADD  CONSTRAINT [DF_Races_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[Races] ADD  CONSTRAINT [DF_Races_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [refdata].[Religions] ADD  CONSTRAINT [DF_Religions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [refdata].[Religions] ADD  CONSTRAINT [DF_Religions_Status]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [auditlogging].[AuditLoggings]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggings_AppModule] FOREIGN KEY([AppModule])
REFERENCES [datamodeldetail].[appModules] ([appModuleID])
GO
ALTER TABLE [auditlogging].[AuditLoggings] CHECK CONSTRAINT [FK_AuditLoggings_AppModule]
GO
ALTER TABLE [auditlogging].[AuditLoggings]  WITH CHECK ADD  CONSTRAINT [FK_AuditLoggings_AuditLoggingType] FOREIGN KEY([AuditLoggingEventType])
REFERENCES [auditlogging].[AuditLoggingEventTypes] ([AuditLoggingEventTypeId])
GO
ALTER TABLE [auditlogging].[AuditLoggings] CHECK CONSTRAINT [FK_AuditLoggings_AuditLoggingType]
GO
ALTER TABLE [careincidentext].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidents_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincidentext].[CareIncidents] CHECK CONSTRAINT [FK_ExtCareIncidents_Accounts]
GO
ALTER TABLE [careincidentext].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidents_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentext].[CareIncidents] CHECK CONSTRAINT [FK_ExtCareIncidents_Persons]
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToInsurance_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_ExtCareIncidentsToInsurance_Accounts]
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToInsurance_CareIncidents] FOREIGN KEY([ExtCareIncidentID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_ExtCareIncidentsToInsurance_CareIncidents]
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToInsurance_Insurances] FOREIGN KEY([InsuranceID])
REFERENCES [clinicalrefdata].[Insurances] ([InsuranceId])
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_ExtCareIncidentsToInsurance_Insurances]
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToInsurance_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentext].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_ExtCareIncidentsToInsurance_Persons]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidentsToPhysicians_CareIncidents] FOREIGN KEY([ExtCareIncidentID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_CareIncidentsToPhysicians_CareIncidents]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToPhysicians_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_ExtCareIncidentsToPhysicians_Accounts]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToPhysicians_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_ExtCareIncidentsToPhysicians_Persons]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToPhysicians_Physicians] FOREIGN KEY([PhysicianID])
REFERENCES [clinicalrefdata].[Physicians] ([PhysicianId])
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_ExtCareIncidentsToPhysicians_Physicians]
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsToPhysicians_PhysicianType] FOREIGN KEY([PhysicianType])
REFERENCES [refdata].[PhysicianTypes] ([PhysicianTypeId])
GO
ALTER TABLE [careincidentext].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_ExtCareIncidentsToPhysicians_PhysicianType]
GO
ALTER TABLE [careincidentext].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsNotes_CareIncidents] FOREIGN KEY([ExrCareIncidentID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[Notes] CHECK CONSTRAINT [FK_ExtCareIncidentsNotes_CareIncidents]
GO
ALTER TABLE [careincidentext].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsNotes_CareIncidentsOrders] FOREIGN KEY([CareIncidentOrderID])
REFERENCES [careincidentext].[Orders] ([extOrderNumberID])
GO
ALTER TABLE [careincidentext].[Notes] CHECK CONSTRAINT [FK_ExtCareIncidentsNotes_CareIncidentsOrders]
GO
ALTER TABLE [careincidentext].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalIncidentObservations_ClinicalIncident] FOREIGN KEY([CareIncidentID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[Observations] CHECK CONSTRAINT [FK_ClinicalIncidentObservations_ClinicalIncident]
GO
ALTER TABLE [careincidentext].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_ExtClinicalIncidentObservations_CareIncidentsOrders] FOREIGN KEY([OrderNumberID])
REFERENCES [careincidentext].[Orders] ([extOrderNumberID])
GO
ALTER TABLE [careincidentext].[Observations] CHECK CONSTRAINT [FK_ExtClinicalIncidentObservations_CareIncidentsOrders]
GO
ALTER TABLE [careincidentext].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsOrders_OrderControlType] FOREIGN KEY([OrderControlType])
REFERENCES [clinicalrefdata].[OrderControlTypes] ([OrderControlTypeId])
GO
ALTER TABLE [careincidentext].[Orders] CHECK CONSTRAINT [FK_ExtCareIncidentsOrders_OrderControlType]
GO
ALTER TABLE [careincidentext].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_ExtCareIncidentsOrders_Physicians] FOREIGN KEY([OrderingPhysician])
REFERENCES [clinicalrefdata].[ExternalPhysiciansOrderings] ([PhysiciansOrderingId])
GO
ALTER TABLE [careincidentext].[Orders] CHECK CONSTRAINT [FK_ExtCareIncidentsOrders_Physicians]
GO
ALTER TABLE [careincidentext].[OrdersToLabTimes]  WITH CHECK ADD  CONSTRAINT [FK_ExtCIOrdersToLabTimes_CareIncidents] FOREIGN KEY([ExtCareIncidentID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[OrdersToLabTimes] CHECK CONSTRAINT [FK_ExtCIOrdersToLabTimes_CareIncidents]
GO
ALTER TABLE [careincidentext].[OrdersToLabTimes]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_Orders] FOREIGN KEY([ExtCareIncidentOrderID])
REFERENCES [careincidentext].[Orders] ([extOrderNumberID])
GO
ALTER TABLE [careincidentext].[OrdersToLabTimes] CHECK CONSTRAINT [FK_OrdersToLabTimes_Orders]
GO
ALTER TABLE [careincidentext].[Transcriptions]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidentsNotesTranscribeds_CareIncidentOrders] FOREIGN KEY([CareIncidentOrderID])
REFERENCES [careincidentext].[Orders] ([extOrderNumberID])
GO
ALTER TABLE [careincidentext].[Transcriptions] CHECK CONSTRAINT [FK_CareIncidentsNotesTranscribeds_CareIncidentOrders]
GO
ALTER TABLE [careincidentext].[Transcriptions]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidentsNotesTranscribeds_CareIncidents] FOREIGN KEY([ExtCIID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[Transcriptions] CHECK CONSTRAINT [FK_CareIncidentsNotesTranscribeds_CareIncidents]
GO
ALTER TABLE [careincidentext].[Vitals]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidentsVitals_CareIncidents] FOREIGN KEY([ExtCIID])
REFERENCES [careincidentext].[CareIncidents] ([ExtCareIncidentsID])
GO
ALTER TABLE [careincidentext].[Vitals] CHECK CONSTRAINT [FK_CareIncidentsVitals_CareIncidents]
GO
ALTER TABLE [careincidentgeneral].[ClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalAddedDetails_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentgeneral].[ClinicalAddedDetails] CHECK CONSTRAINT [FK_ClinicalAddedDetails_Person]
GO
ALTER TABLE [careincidentgeneral].[ClinicalAddedDetails]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalAddedDetails_ResourceType] FOREIGN KEY([ResourceType])
REFERENCES [refdata].[ResourceType] ([ResourceTypeID])
GO
ALTER TABLE [careincidentgeneral].[ClinicalAddedDetails] CHECK CONSTRAINT [FK_ClinicalAddedDetails_ResourceType]
GO
ALTER TABLE [careincidentgeneral].[Communications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_CommunicationType] FOREIGN KEY([CommunicationType])
REFERENCES [refdata].[CommunicationType] ([CommunicationTypeID])
GO
ALTER TABLE [careincidentgeneral].[Communications] CHECK CONSTRAINT [FK_Communications_CommunicationType]
GO
ALTER TABLE [careincidentgeneral].[Communications]  WITH CHECK ADD  CONSTRAINT [FK_Communications_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentgeneral].[Communications] CHECK CONSTRAINT [FK_Communications_Persons]
GO
ALTER TABLE [careincidentgeneral].[DeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_DeviceAssociation_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentgeneral].[DeviceAssociation] CHECK CONSTRAINT [FK_DeviceAssociation_Person]
GO
ALTER TABLE [careincidentgeneral].[DeviceAssociation]  WITH CHECK ADD  CONSTRAINT [FK_DeviceAssociation_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [careincidentgeneral].[DeviceAssociation] CHECK CONSTRAINT [FK_DeviceAssociation_Status]
GO
ALTER TABLE [careincidentgeneral].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_DiagnosisCodes] FOREIGN KEY([Diagnosis])
REFERENCES [semanticterms].[Diagnosis] ([DiagnosisCode])
GO
ALTER TABLE [careincidentgeneral].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_DiagnosisCodes]
GO
ALTER TABLE [careincidentgeneral].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentgeneral].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Person]
GO
ALTER TABLE [careincidentgeneral].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentgeneral].[Procedures] CHECK CONSTRAINT [FK_Procedures_Person]
GO
ALTER TABLE [careincidentgeneral].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_Procedures_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [careincidentgeneral].[Procedures] CHECK CONSTRAINT [FK_Procedures_Status]
GO
ALTER TABLE [careincidentint].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidents_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [careincidentint].[CareIncidents] CHECK CONSTRAINT [FK_CareIncidents_Status]
GO
ALTER TABLE [careincidentint].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidents_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincidentint].[CareIncidents] CHECK CONSTRAINT [FK_IntCareIncidents_Accounts]
GO
ALTER TABLE [careincidentint].[CareIncidents]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidents_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentint].[CareIncidents] CHECK CONSTRAINT [FK_IntCareIncidents_Persons]
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_Accounts]
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_CareIncidents] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_CareIncidents]
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_Insurances] FOREIGN KEY([InsuranceID])
REFERENCES [clinicalrefdata].[Insurances] ([InsuranceId])
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_Insurances]
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToInsurance_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentint].[CareIncidentsToInsurances] CHECK CONSTRAINT [FK_IntCareIncidentsToInsurance_Persons]
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_Accounts] FOREIGN KEY([AccountID])
REFERENCES [persondata].[PersonAccounts] ([PersonAccountsID])
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_Accounts]
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_CareIncidents] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_CareIncidents]
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_Persons]
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_Physicians] FOREIGN KEY([PhysicianID])
REFERENCES [clinicalrefdata].[Physicians] ([PhysicianId])
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_Physicians]
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsToPhysicians_PhysicianType] FOREIGN KEY([PhysicianType])
REFERENCES [refdata].[PhysicianTypes] ([PhysicianTypeId])
GO
ALTER TABLE [careincidentint].[CareIncidentsToPhysicians] CHECK CONSTRAINT [FK_IntCareIncidentsToPhysicians_PhysicianType]
GO
ALTER TABLE [careincidentint].[HeightWeights]  WITH CHECK ADD  CONSTRAINT [FK_IntCIHeightWeights_CI] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[HeightWeights] CHECK CONSTRAINT [FK_IntCIHeightWeights_CI]
GO
ALTER TABLE [careincidentint].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidents] FOREIGN KEY([CareIncidentID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[Notes] CHECK CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidents]
GO
ALTER TABLE [careincidentint].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidentsOrder] FOREIGN KEY([CIOrderID])
REFERENCES [careincidentint].[Orders] ([intOrderNumberID])
GO
ALTER TABLE [careincidentint].[Notes] CHECK CONSTRAINT [FK_IntCareIncidentsNotes_CareIncidentsOrder]
GO
ALTER TABLE [careincidentint].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_ClinicalIncidentObservations_ClinicalIncidents] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[Observations] CHECK CONSTRAINT [FK_ClinicalIncidentObservations_ClinicalIncidents]
GO
ALTER TABLE [careincidentint].[Observations]  WITH CHECK ADD  CONSTRAINT [FK_IntClinicalIncidentObservations_CareIncidentsOrders] FOREIGN KEY([OrderNumberID])
REFERENCES [careincidentint].[Orders] ([intOrderNumberID])
GO
ALTER TABLE [careincidentint].[Observations] CHECK CONSTRAINT [FK_IntClinicalIncidentObservations_CareIncidentsOrders]
GO
ALTER TABLE [careincidentint].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsOrders_OrderControlType] FOREIGN KEY([OrderControlType])
REFERENCES [clinicalrefdata].[OrderControlTypes] ([OrderControlTypeId])
GO
ALTER TABLE [careincidentint].[Orders] CHECK CONSTRAINT [FK_IntCareIncidentsOrders_OrderControlType]
GO
ALTER TABLE [careincidentint].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsOrders_Physicians] FOREIGN KEY([OrderingPhysician])
REFERENCES [clinicalrefdata].[ExternalPhysiciansOrderings] ([PhysiciansOrderingId])
GO
ALTER TABLE [careincidentint].[Orders] CHECK CONSTRAINT [FK_IntCareIncidentsOrders_Physicians]
GO
ALTER TABLE [careincidentint].[OrdersToLabTimes]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_IntCIID] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[OrdersToLabTimes] CHECK CONSTRAINT [FK_OrdersToLabTimes_IntCIID]
GO
ALTER TABLE [careincidentint].[OrdersToLabTimes]  WITH CHECK ADD  CONSTRAINT [FK_OrdersToLabTimes_IntCIOrders] FOREIGN KEY([IntCareIncidentOrderID])
REFERENCES [careincidentint].[Orders] ([intOrderNumberID])
GO
ALTER TABLE [careincidentint].[OrdersToLabTimes] CHECK CONSTRAINT [FK_OrdersToLabTimes_IntCIOrders]
GO
ALTER TABLE [careincidentint].[Transcriptions]  WITH CHECK ADD  CONSTRAINT [FK_IntCareIncidentsNotesTranscribed_IntCareIncident] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[Transcriptions] CHECK CONSTRAINT [FK_IntCareIncidentsNotesTranscribed_IntCareIncident]
GO
ALTER TABLE [careincidentint].[Vitals]  WITH CHECK ADD  CONSTRAINT [FK_CareIncidentsVitals_CareIncidents] FOREIGN KEY([IntCIID])
REFERENCES [careincidentint].[CareIncidents] ([CareIncidentsID])
GO
ALTER TABLE [careincidentint].[Vitals] CHECK CONSTRAINT [FK_CareIncidentsVitals_CareIncidents]
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_ExternalHealthcareEntities_Countries] FOREIGN KEY([Country])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_ExternalHealthcareEntities_Countries]
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_ExtHealthcareEntities_HealthcareEntityTypes] FOREIGN KEY([HealthcareEntitiesTypeId])
REFERENCES [refdata].[HealthcareEntityTypes] ([HealthcareEntityTypeID])
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_ExtHealthcareEntities_HealthcareEntityTypes]
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_ExtHealthcareEntities_States] FOREIGN KEY([State])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_ExtHealthcareEntities_States]
GO
ALTER TABLE [clinicalrefdata].[ExternalPhysiciansOrderings]  WITH CHECK ADD  CONSTRAINT [FK_ExternalPhysiciansOrdering] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[ExternalPhysiciansOrderings] CHECK CONSTRAINT [FK_ExternalPhysiciansOrdering]
GO
ALTER TABLE [clinicalrefdata].[ExternalPhysiciansOrderings]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianOrdering_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[ExternalPhysiciansOrderings] CHECK CONSTRAINT [FK_PhysicianOrdering_Country]
GO
ALTER TABLE [clinicalrefdata].[ExternalPhysiciansOrderings]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianOrdering_State] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[ExternalPhysiciansOrderings] CHECK CONSTRAINT [FK_PhysicianOrdering_State]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_Country]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_InsuranceType] FOREIGN KEY([InsCompnatType])
REFERENCES [refdata].[InsuranceTypes] ([InsuranceTypeId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_InsuranceType]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_RefCountry] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_RefCountry]
GO
ALTER TABLE [clinicalrefdata].[Insurances]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_RefState] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [clinicalrefdata].[Insurances] CHECK CONSTRAINT [FK_Insurance_RefState]
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
ALTER TABLE [configrtn].[ConfigrationSettings]  WITH CHECK ADD  CONSTRAINT [FK_ConfigrationSettings_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
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
ALTER TABLE [configrtn].[HealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[HealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesBrandings]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesBranding_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesBrandings] CHECK CONSTRAINT [FK_HealthcareEntitiesBranding_HealthcareEntities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesBrandings]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesBrandings_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesBrandings] CHECK CONSTRAINT [FK_HealthcareEntitiesBrandings_Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesLeadership]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesLeadership_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesLeadership] CHECK CONSTRAINT [FK_HealthcareEntitiesLeadership_HealthcareEntities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToLocalities_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities] CHECK CONSTRAINT [FK_HealthcareEntitiesToLocalities_HealthcareEntities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntitiesToLocalities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities] CHECK CONSTRAINT [FK_HealthcareEntitiesToLocalities_Status]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities]  WITH CHECK ADD  CONSTRAINT [FK_LocalitiesToHealthcareEntities_Localities] FOREIGN KEY([LocalitiesID])
REFERENCES [configrtn].[Localities] ([LocalitiesID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocalities] CHECK CONSTRAINT [FK_LocalitiesToHealthcareEntities_Localities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentToLocations_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [configrtn].[Departments] ([DepartmentID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations] CHECK CONSTRAINT [FK_DepartmentToLocations_Departments]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentToLocations_HealthcareEntities] FOREIGN KEY([HealthcareEntitiesID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations] CHECK CONSTRAINT [FK_DepartmentToLocations_HealthcareEntities]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentToLocations_Locations] FOREIGN KEY([LocationID])
REFERENCES [configrtn].[HealthcareLocations] ([HealthcareLocationID])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations] CHECK CONSTRAINT [FK_DepartmentToLocations_Locations]
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentToLocations_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[HealthcareEntitiesToLocations] CHECK CONSTRAINT [FK_DepartmentToLocations_Status]
GO
ALTER TABLE [configrtn].[HealthcareLocations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_HCEntityType] FOREIGN KEY([HealthcareEntityID])
REFERENCES [configrtn].[HealthcareEntities] ([HealthcareEntitiesId])
GO
ALTER TABLE [configrtn].[HealthcareLocations] CHECK CONSTRAINT [FK_Locations_HCEntityType]
GO
ALTER TABLE [configrtn].[HealthcareLocations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_LocationLicensedState] FOREIGN KEY([LicenseNumberState])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [configrtn].[HealthcareLocations] CHECK CONSTRAINT [FK_Locations_LocationLicensedState]
GO
ALTER TABLE [configrtn].[HealthcareLocations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_State] FOREIGN KEY([StateID])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [configrtn].[HealthcareLocations] CHECK CONSTRAINT [FK_Locations_State]
GO
ALTER TABLE [configrtn].[HealthcareLocations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[HealthcareLocations] CHECK CONSTRAINT [FK_Locations_Status]
GO
ALTER TABLE [configrtn].[Localities]  WITH CHECK ADD  CONSTRAINT [FK_Localities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[Localities] CHECK CONSTRAINT [FK_Localities_Status]
GO
ALTER TABLE [configrtn].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[Regions] CHECK CONSTRAINT [FK_Regions_Status]
GO
ALTER TABLE [configrtn].[RegionToLocalities]  WITH CHECK ADD  CONSTRAINT [FK_RegionToLocalities_Localities] FOREIGN KEY([LocalitiesID])
REFERENCES [configrtn].[Localities] ([LocalitiesID])
GO
ALTER TABLE [configrtn].[RegionToLocalities] CHECK CONSTRAINT [FK_RegionToLocalities_Localities]
GO
ALTER TABLE [configrtn].[RegionToLocalities]  WITH CHECK ADD  CONSTRAINT [FK_RegionToLocalities_Region] FOREIGN KEY([RegionID])
REFERENCES [configrtn].[Regions] ([RegionID])
GO
ALTER TABLE [configrtn].[RegionToLocalities] CHECK CONSTRAINT [FK_RegionToLocalities_Region]
GO
ALTER TABLE [configrtn].[RegionToLocalities]  WITH CHECK ADD  CONSTRAINT [FK_RegionToLocalities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[RegionToLocalities] CHECK CONSTRAINT [FK_RegionToLocalities_Status]
GO
ALTER TABLE [configrtn].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Department] FOREIGN KEY([DepartmentID])
REFERENCES [configrtn].[Departments] ([DepartmentID])
GO
ALTER TABLE [configrtn].[Rooms] CHECK CONSTRAINT [FK_Rooms_Department]
GO
ALTER TABLE [configrtn].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_HealthcareLocation] FOREIGN KEY([HealthcareLocationID])
REFERENCES [configrtn].[HealthcareLocations] ([HealthcareLocationID])
GO
ALTER TABLE [configrtn].[Rooms] CHECK CONSTRAINT [FK_Rooms_HealthcareLocation]
GO
ALTER TABLE [configrtn].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [configrtn].[Rooms] CHECK CONSTRAINT [FK_Rooms_Status]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs]  WITH CHECK ADD  CONSTRAINT [FK_appDataCatalog_appModule] FOREIGN KEY([appModule])
REFERENCES [datamodeldetail].[appModules] ([appModuleID])
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] CHECK CONSTRAINT [FK_appDataCatalog_appModule]
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs]  WITH CHECK ADD  CONSTRAINT [FK_appDataCatalogs_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [datamodeldetail].[appDataCatalogs] CHECK CONSTRAINT [FK_appDataCatalogs_Status]
GO
ALTER TABLE [datamodeldetail].[appModules]  WITH CHECK ADD  CONSTRAINT [FK_appModules_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [datamodeldetail].[appModules] CHECK CONSTRAINT [FK_appModules_Status]
GO
ALTER TABLE [datamodeldetail].[dbSchemas]  WITH CHECK ADD  CONSTRAINT [FK_dbSchemas_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [datamodeldetail].[dbSchemas] CHECK CONSTRAINT [FK_dbSchemas_Status]
GO
ALTER TABLE [industrystds].[IndustryStd]  WITH CHECK ADD  CONSTRAINT [FK_IndustryStd_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[IndustryStd] CHECK CONSTRAINT [FK_IndustryStd_Status]
GO
ALTER TABLE [industrystds].[MesageFields]  WITH CHECK ADD  CONSTRAINT [FK_MesageFields_DataTypes] FOREIGN KEY([StdDataType])
REFERENCES [industrystds].[MessageDataTypes] ([DataType])
GO
ALTER TABLE [industrystds].[MesageFields] CHECK CONSTRAINT [FK_MesageFields_DataTypes]
GO
ALTER TABLE [industrystds].[MesageFields]  WITH CHECK ADD  CONSTRAINT [FK_MesageFields_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[MesageFields] CHECK CONSTRAINT [FK_MesageFields_Status]
GO
ALTER TABLE [industrystds].[MessageDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageDataTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[MessageDataTypes] CHECK CONSTRAINT [FK_MessageDataTypes_Status]
GO
ALTER TABLE [industrystds].[MessageEvents]  WITH CHECK ADD  CONSTRAINT [FK_MessageEvent_IndustyStd] FOREIGN KEY([IndustryStd])
REFERENCES [industrystds].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [industrystds].[MessageEvents] CHECK CONSTRAINT [FK_MessageEvent_IndustyStd]
GO
ALTER TABLE [industrystds].[MessageEvents]  WITH CHECK ADD  CONSTRAINT [FK_MessageEvent_MsgType] FOREIGN KEY([MsgType])
REFERENCES [industrystds].[MessageTypes] ([MessageTypeId])
GO
ALTER TABLE [industrystds].[MessageEvents] CHECK CONSTRAINT [FK_MessageEvent_MsgType]
GO
ALTER TABLE [industrystds].[MessageEvents]  WITH CHECK ADD  CONSTRAINT [FK_MessageEvents_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[MessageEvents] CHECK CONSTRAINT [FK_MessageEvents_Status]
GO
ALTER TABLE [industrystds].[MessageSegments]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegment_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [industrystds].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [industrystds].[MessageSegments] CHECK CONSTRAINT [FK_MessageSegment_IndustryStd]
GO
ALTER TABLE [industrystds].[MessageSegments]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegments_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[MessageSegments] CHECK CONSTRAINT [FK_MessageSegments_Status]
GO
ALTER TABLE [industrystds].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageType_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [industrystds].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [industrystds].[MessageTypes] CHECK CONSTRAINT [FK_MessageType_IndustryStd]
GO
ALTER TABLE [industrystds].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[MessageTypes] CHECK CONSTRAINT [FK_MessageTypes_Status]
GO
ALTER TABLE [industrystds].[MessageVersions]  WITH CHECK ADD  CONSTRAINT [FK_MessageVersion_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [industrystds].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [industrystds].[MessageVersions] CHECK CONSTRAINT [FK_MessageVersion_IndustryStd]
GO
ALTER TABLE [industrystds].[MessageVersions]  WITH CHECK ADD  CONSTRAINT [FK_MessageVersions_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [industrystds].[MessageVersions] CHECK CONSTRAINT [FK_MessageVersions_Status]
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
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccount_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [persondata].[PersonAccounts] CHECK CONSTRAINT [FK_PersonAccount_Status]
GO
ALTER TABLE [persondata].[PersonAccounts]  WITH CHECK ADD  CONSTRAINT [FK_PersonAccounts_HealthcareLocations] FOREIGN KEY([HealthcareLocationID])
REFERENCES [configrtn].[HealthcareLocations] ([HealthcareLocationID])
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
ALTER TABLE [persondata].[PersonAddresses]  WITH CHECK ADD  CONSTRAINT [FK_PersonAddresses_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [persondata].[PersonAddresses] CHECK CONSTRAINT [FK_PersonAddresses_Status]
GO
ALTER TABLE [persondata].[PersonAllergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Allergens] FOREIGN KEY([AllergensID])
REFERENCES [clinicalrefdata].[Allergens] ([AllergensD])
GO
ALTER TABLE [persondata].[PersonAllergies] CHECK CONSTRAINT [FK_Allergies_Allergens]
GO
ALTER TABLE [persondata].[PersonAllergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Persons] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonAllergies] CHECK CONSTRAINT [FK_Allergies_Persons]
GO
ALTER TABLE [persondata].[PersonAllergies]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [persondata].[PersonAllergies] CHECK CONSTRAINT [FK_Allergies_Status]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_AdmitSource] FOREIGN KEY([AdmitSourceId])
REFERENCES [refdata].[AdmitSources] ([AdmitSourceId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_AdmitSource]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_AmbulatoryStatus] FOREIGN KEY([AmbulatoryStatusId])
REFERENCES [refdata].[AmbulatoryStatus] ([AmbulatoryStatusId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_AmbulatoryStatus]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Ethnicity] FOREIGN KEY([EthnicityId])
REFERENCES [refdata].[Ethnicities] ([EthnicityId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Ethnicity]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_ExternalHealthcareEntities] FOREIGN KEY([ExternalHealthcareEntitiesId])
REFERENCES [refdata].[ExternalHealthcareEntities] ([ExternalHealthcareEntitiesId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_ExternalHealthcareEntities]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_FinancialClass] FOREIGN KEY([FinancialClassId])
REFERENCES [refdata].[FinancialClasses] ([FinancialClassId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_FinancialClass]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Gender] FOREIGN KEY([GenderId])
REFERENCES [refdata].[Genders] ([GenderId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Gender]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_MaritalStatus] FOREIGN KEY([MaritalStatusId])
REFERENCES [refdata].[MaritalStatus] ([MaritalStatusId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_MaritalStatus]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_PatientClass] FOREIGN KEY([PatientClassId])
REFERENCES [refdata].[PatientClasses] ([PatientClassId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_PatientClass]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_PatientType] FOREIGN KEY([PatientTypeId])
REFERENCES [refdata].[PatientTypes] ([PatientTypeId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_PatientType]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Person]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Race] FOREIGN KEY([RaceId])
REFERENCES [refdata].[Races] ([RaceId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Race]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Religion] FOREIGN KEY([ReligionId])
REFERENCES [refdata].[Religions] ([ReligionId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Religion]
GO
ALTER TABLE [persondata].[PersonDemographics]  WITH CHECK ADD  CONSTRAINT [FK_PersonDemographics_Status] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [persondata].[PersonDemographics] CHECK CONSTRAINT [FK_PersonDemographics_Status]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Employer] FOREIGN KEY([EmployerId])
REFERENCES [refdata].[Employers] ([EmployerId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Employer]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_Person] FOREIGN KEY([PersonId])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonEmployers] CHECK CONSTRAINT [FK_PersonEmployer_Person]
GO
ALTER TABLE [persondata].[PersonEmployers]  WITH CHECK ADD  CONSTRAINT [FK_PersonEmployer_RefStatus] FOREIGN KEY([StatusId])
REFERENCES [refdata].[Status] ([StatusId])
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
ALTER TABLE [persondata].[PersonProblems]  WITH CHECK ADD  CONSTRAINT [FK_PersonProblems_Person] FOREIGN KEY([PersonID])
REFERENCES [persondata].[Persons] ([PersonId])
GO
ALTER TABLE [persondata].[PersonProblems] CHECK CONSTRAINT [FK_PersonProblems_Person]
GO
ALTER TABLE [persondata].[PersonProblems]  WITH CHECK ADD  CONSTRAINT [FK_PersonProblems_Problem] FOREIGN KEY([ProblemID])
REFERENCES [semanticterms].[SnomedProblems] ([ProblemID])
GO
ALTER TABLE [persondata].[PersonProblems] CHECK CONSTRAINT [FK_PersonProblems_Problem]
GO
ALTER TABLE [persondata].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [persondata].[Persons] CHECK CONSTRAINT [FK_Persons_Status]
GO
ALTER TABLE [refdata].[AddressTypes]  WITH CHECK ADD  CONSTRAINT [FK_AddressTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[AddressTypes] CHECK CONSTRAINT [FK_AddressTypes_Status]
GO
ALTER TABLE [refdata].[AdmissionTypes]  WITH CHECK ADD  CONSTRAINT [FK_AdmissionTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[AdmissionTypes] CHECK CONSTRAINT [FK_AdmissionTypes_Status]
GO
ALTER TABLE [refdata].[AdmitSources]  WITH CHECK ADD  CONSTRAINT [FK_AdmitSources_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[AdmitSources] CHECK CONSTRAINT [FK_AdmitSources_Status]
GO
ALTER TABLE [refdata].[AmbulatoryStatus]  WITH CHECK ADD  CONSTRAINT [FK_AmbulatoryStatus_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[AmbulatoryStatus] CHECK CONSTRAINT [FK_AmbulatoryStatus_Status]
GO
ALTER TABLE [refdata].[CommunicationType]  WITH CHECK ADD  CONSTRAINT [FK_CommunicationType_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[CommunicationType] CHECK CONSTRAINT [FK_CommunicationType_Status]
GO
ALTER TABLE [refdata].[ConfigurationSettingType]  WITH CHECK ADD  CONSTRAINT [FK_ConfigurationSettingType_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[ConfigurationSettingType] CHECK CONSTRAINT [FK_ConfigurationSettingType_Status]
GO
ALTER TABLE [refdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employer_Country] FOREIGN KEY([CountryId])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [refdata].[Employers] CHECK CONSTRAINT [FK_Employer_Country]
GO
ALTER TABLE [refdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employer_RefState] FOREIGN KEY([StateId])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [refdata].[Employers] CHECK CONSTRAINT [FK_Employer_RefState]
GO
ALTER TABLE [refdata].[Employers]  WITH CHECK ADD  CONSTRAINT [FK_Employers_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[Employers] CHECK CONSTRAINT [FK_Employers_Status]
GO
ALTER TABLE [refdata].[Ethnicities]  WITH CHECK ADD  CONSTRAINT [FK_Ethnicities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[Ethnicities] CHECK CONSTRAINT [FK_Ethnicities_Status]
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_Countries] FOREIGN KEY([Country])
REFERENCES [refdata].[Countries] ([CountryId])
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_Countries]
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_HealthcareEntityTypes] FOREIGN KEY([HealthcareEntitiesTypeId])
REFERENCES [refdata].[HealthcareEntityTypes] ([HealthcareEntityTypeID])
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_HealthcareEntityTypes]
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_States] FOREIGN KEY([State])
REFERENCES [refdata].[States] ([StateId])
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_States]
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities]  WITH CHECK ADD  CONSTRAINT [FK_HealthcareEntities_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[ExternalHealthcareEntities] CHECK CONSTRAINT [FK_HealthcareEntities_Status]
GO
ALTER TABLE [refdata].[FinancialClasses]  WITH CHECK ADD  CONSTRAINT [FK_FinancialClasses_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[FinancialClasses] CHECK CONSTRAINT [FK_FinancialClasses_Status]
GO
ALTER TABLE [refdata].[Genders]  WITH CHECK ADD  CONSTRAINT [FK_Genders_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[Genders] CHECK CONSTRAINT [FK_Genders_Status]
GO
ALTER TABLE [refdata].[HospitalServices]  WITH CHECK ADD  CONSTRAINT [FK_HospitalServices_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[HospitalServices] CHECK CONSTRAINT [FK_HospitalServices_Status]
GO
ALTER TABLE [refdata].[InsuranceTypes]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[InsuranceTypes] CHECK CONSTRAINT [FK_InsuranceTypes_Status]
GO
ALTER TABLE [refdata].[MaritalStatus]  WITH CHECK ADD  CONSTRAINT [FK_MaritalStatus_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[MaritalStatus] CHECK CONSTRAINT [FK_MaritalStatus_Status]
GO
ALTER TABLE [refdata].[PatientClasses]  WITH CHECK ADD  CONSTRAINT [FK_PatientClasses_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[PatientClasses] CHECK CONSTRAINT [FK_PatientClasses_Status]
GO
ALTER TABLE [refdata].[PatientTypes]  WITH CHECK ADD  CONSTRAINT [FK_PatientTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[PatientTypes] CHECK CONSTRAINT [FK_PatientTypes_Status]
GO
ALTER TABLE [refdata].[PhoneTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhoneTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[PhoneTypes] CHECK CONSTRAINT [FK_PhoneTypes_Status]
GO
ALTER TABLE [refdata].[PhysicianTypes]  WITH CHECK ADD  CONSTRAINT [FK_PhysicianTypes_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[PhysicianTypes] CHECK CONSTRAINT [FK_PhysicianTypes_Status]
GO
ALTER TABLE [refdata].[Races]  WITH CHECK ADD  CONSTRAINT [FK_Races_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[Races] CHECK CONSTRAINT [FK_Races_Status]
GO
ALTER TABLE [refdata].[Religions]  WITH CHECK ADD  CONSTRAINT [FK_Religions_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[Religions] CHECK CONSTRAINT [FK_Religions_Status]
GO
ALTER TABLE [refdata].[ResourceType]  WITH CHECK ADD  CONSTRAINT [FK_ResourceType_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[ResourceType] CHECK CONSTRAINT [FK_ResourceType_Status]
GO
ALTER TABLE [refdata].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [refdata].[States] CHECK CONSTRAINT [FK_States_Status]
GO
ALTER TABLE [semanticterms].[CWETermGroups]  WITH CHECK ADD  CONSTRAINT [FK_CWETermGroups_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
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
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [semanticterms].[CWETerms] CHECK CONSTRAINT [FK_CWETerms_Status]
GO
ALTER TABLE [semanticterms].[Diagnosis]  WITH CHECK ADD  CONSTRAINT [FK_Diagnosis_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [semanticterms].[Diagnosis] CHECK CONSTRAINT [FK_Diagnosis_Status]
GO
ALTER TABLE [semanticterms].[LOINCCodeset]  WITH CHECK ADD  CONSTRAINT [FK_LOINCCodeset_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [semanticterms].[LOINCCodeset] CHECK CONSTRAINT [FK_LOINCCodeset_Status]
GO
ALTER TABLE [semanticterms].[RxNorms]  WITH CHECK ADD  CONSTRAINT [FK_RxNorms_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [semanticterms].[RxNorms] CHECK CONSTRAINT [FK_RxNorms_Status]
GO
ALTER TABLE [semanticterms].[SnomedCodeset]  WITH CHECK ADD  CONSTRAINT [FK_SnomedCodeset_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [semanticterms].[SnomedCodeset] CHECK CONSTRAINT [FK_SnomedCodeset_Status]
GO
ALTER TABLE [semanticterms].[SnomedProblems]  WITH CHECK ADD  CONSTRAINT [FK_SnomedProblems_Status] FOREIGN KEY([Status])
REFERENCES [refdata].[Status] ([StatusId])
GO
ALTER TABLE [semanticterms].[SnomedProblems] CHECK CONSTRAINT [FK_SnomedProblems_Status]
GO
ALTER TABLE [careincidentext].[Vitals]  WITH CHECK ADD  CONSTRAINT [CK_CareIncidentsVitals_BPDiastolic] CHECK  (([BPDiastolic]>=(0) AND [BPDiastolic]<=(300)))
GO
ALTER TABLE [careincidentext].[Vitals] CHECK CONSTRAINT [CK_CareIncidentsVitals_BPDiastolic]
GO
ALTER TABLE [careincidentext].[Vitals]  WITH CHECK ADD  CONSTRAINT [CK_CareIncidentsVitals_BPSystolic] CHECK  (([BPSystolic]>=(0) AND [BPSystolic]<=(300)))
GO
ALTER TABLE [careincidentext].[Vitals] CHECK CONSTRAINT [CK_CareIncidentsVitals_BPSystolic]
GO
ALTER TABLE [careincidentint].[Vitals]  WITH CHECK ADD  CONSTRAINT [CK_CareIncidentsVitals_BPDiastolic] CHECK  (([BPDiastolic]>=(0) AND [BPDiastolic]<=(300)))
GO
ALTER TABLE [careincidentint].[Vitals] CHECK CONSTRAINT [CK_CareIncidentsVitals_BPDiastolic]
GO
ALTER TABLE [careincidentint].[Vitals]  WITH CHECK ADD  CONSTRAINT [CK_CareIncidentsVitals_BPSystolic] CHECK  (([BPSystolic]>=(0) AND [BPSystolic]<=(300)))
GO
ALTER TABLE [careincidentint].[Vitals] CHECK CONSTRAINT [CK_CareIncidentsVitals_BPSystolic]
GO
USE [master]
GO
ALTER DATABASE [hcMR] SET  READ_WRITE 
GO
