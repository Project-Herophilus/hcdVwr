USE [DataSynthesis]
GO
/****** Object:  Schema [appData]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [appData]
GO
/****** Object:  Schema [appPlatform]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [appPlatform]
GO
/****** Object:  Schema [appRefData]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [appRefData]
GO
/****** Object:  Schema [dataimports]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [dataimports]
GO
/****** Object:  Schema [datamodel]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [datamodel]
GO
/****** Object:  Schema [genData]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [genData]
GO
/****** Object:  Schema [genRefData]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [genRefData]
GO
/****** Object:  Schema [industrystds]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [industrystds]
GO
/****** Object:  Schema [SDU_Tools]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [SDU_Tools]
GO
/****** Object:  Schema [stdsedi]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [stdsedi]
GO
/****** Object:  Schema [stdshl7]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [stdshl7]
GO
/****** Object:  Schema [stdsncpdp]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [stdsncpdp]
GO
/****** Object:  Schema [termData]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE SCHEMA [termData]
GO
/****** Object:  Table [appData].[HCInterfaceDataMapDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[HCInterfaceDataMapDetail](
	[InterfaceDataMapDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterfaceDataMapHeaderID] [bigint] NULL,
	[SourceApplicationID] [smallint] NULL,
	[Vrsn] [varchar](7) NULL,
	[MsgSegment] [varchar](3) NULL,
	[SegmentFieldOrder] [varchar](8) NULL,
	[MsgFieldNumber] [varchar](7) NULL,
	[MsgFieldName] [varchar](154) NULL,
	[MsgFieldLength] [varchar](10) NULL,
	[DataType] [varchar](5) NULL,
	[SensitivityFlagID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_HCInterfaceDataMapDetail] PRIMARY KEY CLUSTERED 
(
	[InterfaceDataMapDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[HCInterfaceDataMapDetailToCodesets]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[HCInterfaceDataMapDetailToCodesets](
	[InterfaceDataMapToCodesetsDataMappingDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterfaceDataMapDetailID] [bigint] NULL,
	[CodesetsID] [smallint] NULL,
	[FieldNumber] [varchar](25) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_InterfaceDataMapToCodesetsDataMappingDetail] PRIMARY KEY CLUSTERED 
(
	[InterfaceDataMapToCodesetsDataMappingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[HCInterfaceDataMapDetailToCoreMetadata]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata](
	[InterfaceDataMapToCoreMetadataDataMappingDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterfaceDataMapDetailID] [bigint] NULL,
	[CoreMetadataID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_InterfaceDataMapToCoreMetadataDataMappingDetail] PRIMARY KEY CLUSTERED 
(
	[InterfaceDataMapToCoreMetadataDataMappingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[HCInterfaceDataMapDetailToVendorDataModel]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel](
	[InterfaceDataMapToVendorDataMappingDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterfaceDataMapDetailID] [bigint] NULL,
	[VendorDataMappingDetailID] [bigint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_InterfaceDataMapToVendorDataMappingDetail] PRIMARY KEY CLUSTERED 
(
	[InterfaceDataMapToVendorDataMappingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[HCInterfaceDataMapHeader]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[HCInterfaceDataMapHeader](
	[InterfaceDataMapHeaderID] [bigint] IDENTITY(1,1) NOT NULL,
	[InterfaceName] [varchar](50) NULL,
	[InterfaceDesc] [varchar](50) NULL,
	[VendorID] [smallint] NULL,
	[ApplicationID] [smallint] NULL,
	[MessageType] [varchar](4) NULL,
	[MessageTrigger] [varchar](10) NULL,
	[MessageVersion] [varchar](7) NULL,
	[OrganizationID] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_DataMapInterfaceHeader] PRIMARY KEY CLUSTERED 
(
	[InterfaceDataMapHeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[VendorDataMappingDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[VendorDataMappingDetail](
	[VendorDataMappingDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorDataMappingHeaderID] [smallint] NULL,
	[SourceDataMapDesc] [varchar](75) NULL,
	[ApplicationID] [smallint] NULL,
	[DBName] [varchar](20) NULL,
	[TableName] [varchar](30) NULL,
	[FieldNumber] [varchar](10) NULL,
	[FieldName] [varchar](50) NULL,
	[FieldDataType] [varchar](10) NULL,
	[FieldLength] [varchar](10) NULL,
	[CompeleteFieldName]  AS (((([DBName]+'.')+[TableName])+'.')+[FieldName]) PERSISTED,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorDataMappingDetail] PRIMARY KEY CLUSTERED 
(
	[VendorDataMappingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[VendorDataMappingDetailToCodesets]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[VendorDataMappingDetailToCodesets](
	[VendorDataMappingDetailToCodesetsID] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorDataMappingDetailID] [bigint] NULL,
	[CodesetsID] [smallint] NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorDataMappingDetailToCodesets] PRIMARY KEY CLUSTERED 
(
	[VendorDataMappingDetailToCodesetsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[VendorDataMappingDetailToCoreMetadata]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[VendorDataMappingDetailToCoreMetadata](
	[VendorDataMappingDetailToCoreMetadataID] [bigint] IDENTITY(1,1) NOT NULL,
	[VendorDataMappingDetailID] [bigint] NULL,
	[CoreMetadataID] [smallint] NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorDataMappingDetailToCoreMetadata] PRIMARY KEY CLUSTERED 
(
	[VendorDataMappingDetailToCoreMetadataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appData].[VendorDataMappingHeader]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appData].[VendorDataMappingHeader](
	[VendorDataMappingHeaderID] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorTechnologyName] [varchar](50) NULL,
	[VendorTechnologyDesc] [varchar](50) NULL,
	[VendorTechnologyInternalMnemonic] [varchar](10) NULL,
	[VendorID] [smallint] NULL,
	[ApplicationID] [smallint] NULL,
	[OrganizationID] [varchar](10) NULL,
	[VendorTechnologyVersion] [varchar](15) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorDataMappingHeader] PRIMARY KEY CLUSTERED 
(
	[VendorDataMappingHeaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appPlatform].[Auditing]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appPlatform].[Auditing](
	[AuditingID] [bigint] IDENTITY(1,1) NOT NULL,
	[Component] [varchar](20) NULL,
	[Action] [varchar](20) NULL,
	[AuditDetails] [varchar](256) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[RunTime] [int] NULL,
	[JobGUID] [varchar](50) NULL,
	[JobID] [varchar](50) NULL,
	[TransactionCount] [bigint] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Auditing] PRIMARY KEY CLUSTERED 
(
	[AuditingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appPlatform].[DataGenConfig]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appPlatform].[DataGenConfig](
	[DataGenConfigID] [smallint] IDENTITY(1,1) NOT NULL,
	[DataTypeGenConfigName] [varchar](25) NULL,
	[CorePlatformMetadataID] [smallint] NULL,
	[SpecialInstructions] [varchar](99) NULL,
	[RunQuantity] [int] NULL,
	[MinuteInterval] [smallint] NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_DataGenConfig] PRIMARY KEY CLUSTERED 
(
	[DataGenConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[Application]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[Application](
	[ApplicationID] [smallint] IDENTITY(1,1) NOT NULL,
	[ApplicationMnemonic] [varchar](10) NULL,
	[ApplicationDesc] [varchar](50) NULL,
	[VendorID] [smallint] NULL,
	[AppGUID] [uniqueidentifier] NULL,
	[CreatedUser] [varchar](20) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[CodeSets]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[CodeSets](
	[CodeSetsID] [smallint] IDENTITY(1,1) NOT NULL,
	[CodeSetName] [varchar](50) NULL,
	[Domain] [varchar](50) NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_CodeSets] PRIMARY KEY CLUSTERED 
(
	[CodeSetsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[CorePlatformMetadata]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[CorePlatformMetadata](
	[CoreMetadataID] [smallint] IDENTITY(1,1) NOT NULL,
	[MetadataFieldName] [varchar](50) NULL,
	[SensitivityFlagID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_CoreMetadata] PRIMARY KEY CLUSTERED 
(
	[CoreMetadataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[Gender]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[Gender](
	[Gender] [varchar](1) NOT NULL,
	[GenderDescription] [varchar](15) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[IndustryStd]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[IndustryStd](
	[IndustryStd] [varchar](12) NOT NULL,
	[IndustryStdDesc] [varchar](30) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK__IndustryStds] PRIMARY KEY CLUSTERED 
(
	[IndustryStd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[Organization]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[Organization](
	[OrganizationID] [varchar](10) NOT NULL,
	[OrganizationName] [varchar](50) NULL,
	[Address] [varchar](75) NULL,
	[City] [varchar](60) NULL,
	[StateID] [varchar](2) NULL,
	[ZipCode] [varchar](12) NULL,
	[CreatedUser] [varchar](20) NULL,
	[StatusID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[OrganizationInternalID] [varchar](10) NULL,
	[OrganizationInternalCode] [varchar](10) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[SensitivityFlag]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[SensitivityFlag](
	[SensitiveInfoFlagID] [smallint] IDENTITY(1,1) NOT NULL,
	[SensitiveInfoFlagDesc] [varchar](30) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_SensitivityFlag] PRIMARY KEY CLUSTERED 
(
	[SensitiveInfoFlagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[Status]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[Status](
	[StatusID] [smallint] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [varchar](45) NOT NULL,
	[CreatedDate] [date] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_RefStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[TimeZones]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[TimeZones](
	[TimeZone] [varchar](3) NOT NULL,
	[TimeZoneDesc] [varchar](25) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
 CONSTRAINT [PK_TimeZones] PRIMARY KEY CLUSTERED 
(
	[TimeZone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[USStates]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[USStates](
	[StateID] [varchar](2) NOT NULL,
	[StateDescription] [varchar](65) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_USStates] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[Vendors]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[Vendors](
	[VendorID] [smallint] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](30) NULL,
	[DateCreated] [date] NULL,
	[ExternalVendorKey] [uniqueidentifier] NULL,
	[CreatedBy] [varchar](20) NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[VendorsDataTypes]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[VendorsDataTypes](
	[FieldDataType] [varchar](10) NOT NULL,
	[FieldDataTypeDesc] [varchar](70) NULL,
	[ApplicationID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorsDataTypes] PRIMARY KEY CLUSTERED 
(
	[FieldDataType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[VendorsDB]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[VendorsDB](
	[DBName] [varchar](20) NOT NULL,
	[DBDesc] [varchar](50) NULL,
	[DBVersion] [varchar](10) NULL,
	[ApplicationID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorsDB] PRIMARY KEY CLUSTERED 
(
	[DBName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [appRefData].[VendorsTables]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [appRefData].[VendorsTables](
	[TableName] [varchar](30) NOT NULL,
	[TableDesc] [varchar](50) NULL,
	[ApplicationID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_VendorsTables] PRIMARY KEY CLUSTERED 
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [datamodel].[TableDetails]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [datamodel].[TableDetails](
	[TableDetailsID] [varchar](50) NOT NULL,
	[schemaName] [sysname] NULL,
	[tableName] [sysname] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[TablePurpose] [varchar](3) NOT NULL,
 CONSTRAINT [PK_TableDetails] PRIMARY KEY CLUSTERED 
(
	[TableDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[AccountNumbers]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[AccountNumbers](
	[AccountNumbersID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [varchar](17) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_AccountNumbers] PRIMARY KEY CLUSTERED 
(
	[AccountNumbersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[Addresses]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[Addresses](
	[AddressID] [bigint] IDENTITY(1,1) NOT NULL,
	[AddressStreet] [varchar](99) NULL,
	[AddressStreet2] [varchar](59) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[BankAccounts]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[BankAccounts](
	[BankAccountsID] [bigint] IDENTITY(1,1) NOT NULL,
	[BankAccount] [varchar](17) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_Banking] PRIMARY KEY CLUSTERED 
(
	[BankAccountsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[CreditCards]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[CreditCards](
	[CreditCardID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreditCardNumber] [varchar](20) NULL,
	[CreditCardName] [varchar](10) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_CreditCard] PRIMARY KEY CLUSTERED 
(
	[CreditCardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[DateOfBirths]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[DateOfBirths](
	[DateofBirthsID] [bigint] IDENTITY(1,1) NOT NULL,
	[DateOfBirth] [varchar](12) NULL,
	[DateOfBirthDate] [date] NULL,
	[Age] [int] NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_DateOfBirths] PRIMARY KEY CLUSTERED 
(
	[DateofBirthsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[DriversLicenses]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[DriversLicenses](
	[DriversLicensesID] [bigint] IDENTITY(1,1) NOT NULL,
	[DriversLicenseNumber] [varchar](25) NULL,
	[StateCode] [varchar](2) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CompleteDriversLicenseNumber] [varchar](30) NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_DriversLicenses] PRIMARY KEY CLUSTERED 
(
	[DriversLicensesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[EIN]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[EIN](
	[EINID] [bigint] IDENTITY(1,1) NOT NULL,
	[EIN] [varchar](10) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_EIN] PRIMARY KEY CLUSTERED 
(
	[EINID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[NameFirst]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[NameFirst](
	[NameFirstID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](49) NULL,
	[Gender] [varchar](1) NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_NameFirst] PRIMARY KEY CLUSTERED 
(
	[NameFirstID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[NameLast]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[NameLast](
	[NameLastID] [bigint] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](99) NULL,
	[StatusID] [smallint] NOT NULL,
	[DateCreated] [date] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_NameLast] PRIMARY KEY CLUSTERED 
(
	[NameLastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[PhoneNumbers]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[PhoneNumbers](
	[PhoneNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [varchar](8) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_PhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[PhoneNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genData].[SocialSecurityNumber]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genData].[SocialSecurityNumber](
	[SocialSecurityNumberID] [bigint] IDENTITY(1,1) NOT NULL,
	[SocialSecurityNumber] [varchar](11) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_SocialSecurityNumber] PRIMARY KEY CLUSTERED 
(
	[SocialSecurityNumberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[ABABanking]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[ABABanking](
	[ABABankingID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoutingNumber] [varchar](9) NULL,
	[TelegraphicName] [varchar](20) NULL,
	[CustomerName] [varchar](36) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](5) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_RefABABanking] PRIMARY KEY CLUSTERED 
(
	[ABABankingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[AreaCode]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[AreaCode](
	[AreaCode] [varchar](3) NOT NULL,
	[TimeZone] [varchar](3) NULL,
	[StateCode] [varchar](2) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_AreaCode] PRIMARY KEY CLUSTERED 
(
	[AreaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[Companies]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[Companies](
	[CompaniesID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](149) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompaniesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[UPCCodes]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[UPCCodes](
	[UPCCodeID] [bigint] IDENTITY(1,1) NOT NULL,
	[UPCCode] [varchar](15) NULL,
	[UPCProductName] [varchar](150) NULL,
	[CreatedDate] [date] NULL,
	[StatusId] [smallint] NULL,
 CONSTRAINT [PK_UPCCodes] PRIMARY KEY CLUSTERED 
(
	[UPCCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[ZipcodeIntl]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[ZipcodeIntl](
	[ZipCodeIntnlID] [int] IDENTITY(1,1) NOT NULL,
	[ZipCode] [char](10) NOT NULL,
	[ZipCodeType] [varchar](15) NULL,
	[City] [varchar](75) NULL,
	[Country] [varchar](3) NULL,
	[Lattitude] [varchar](10) NULL,
	[Longitude] [varchar](10) NULL,
	[Location] [varchar](99) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_ZipcodeIntl] PRIMARY KEY CLUSTERED 
(
	[ZipCodeIntnlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[ZipcodeUS]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[ZipcodeUS](
	[ZipCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ZipCodeType] [varchar](15) NULL,
	[City] [varchar](75) NULL,
	[State] [varchar](2) NULL,
	[Lattitude] [varchar](10) NULL,
	[Longitude] [varchar](10) NULL,
	[Location] [varchar](99) NULL,
	[Decommissioned] [varchar](10) NULL,
	[TaxReturnFilled] [varchar](15) NULL,
	[EstPopulation] [varchar](15) NULL,
	[TotalWages] [varchar](15) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_ZipcodeUS] PRIMARY KEY CLUSTERED 
(
	[ZipCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [genRefData].[ZipcodeUSComplete]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [genRefData].[ZipcodeUSComplete](
	[ZipCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[ZipCodeType] [varchar](15) NULL,
	[City] [varchar](75) NULL,
	[State] [varchar](2) NULL,
	[Lattitude] [varchar](10) NULL,
	[Longitude] [varchar](10) NULL,
	[Location] [varchar](99) NULL,
	[Decommissioned] [varchar](10) NULL,
	[TaxReturnFilled] [varchar](15) NULL,
	[EstPopulation] [varchar](15) NULL,
	[TotalWages] [varchar](15) NULL,
	[DateCreated] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageDataTypes]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageDataTypes](
	[DataType] [varchar](5) NOT NULL,
	[DataTypeDesc] [varchar](75) NULL,
	[Vrsn] [varchar](7) NULL,
	[IndustryStd] [varchar](12) NULL,
	[DataTypeSubFields] [varchar](max) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageDataTypes] PRIMARY KEY CLUSTERED 
(
	[DataType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageFields]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageFields](
	[MessageFieldID] [int] IDENTITY(10000,1) NOT NULL,
	[MessageField] [varchar](7) NOT NULL,
	[MessageFieldName] [varchar](154) NULL,
	[FieldLength] [varchar](10) NULL,
	[DataType] [varchar](5) NULL,
	[Vrsn] [varchar](7) NULL,
	[IndustryStd] [varchar](12) NULL,
	[SensitiveInfoFlagID] [smallint] NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageFields] PRIMARY KEY CLUSTERED 
(
	[MessageFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageSegmentFieldDetails]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageSegmentFieldDetails](
	[MessageSegmentFieldDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[MessageFieldNumber] [varchar](7) NULL,
	[MessageFieldName] [varchar](154) NULL,
	[FieldLength] [varchar](10) NULL,
	[DataType] [varchar](5) NULL,
	[MessageSegment] [varchar](3) NULL,
	[SegmentFieldOrder] [varchar](8) NULL,
	[Vrsn] [varchar](7) NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MesageSegmentFieldDetails] PRIMARY KEY CLUSTERED 
(
	[MessageSegmentFieldDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageSegments]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageSegments](
	[MsgSegment] [varchar](3) NOT NULL,
	[MsgSegmentDesc] [varchar](70) NULL,
	[IndustryStd] [varchar](12) NULL,
	[Vrsn] [varchar](7) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageSegments] PRIMARY KEY CLUSTERED 
(
	[MsgSegment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageStructures]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageStructures](
	[MessageStructuresID] [bigint] IDENTITY(1,1) NOT NULL,
	[MessageType] [varchar](4) NULL,
	[MessageTrigger] [varchar](10) NULL,
	[MessageDetails] [varchar](max) NULL,
	[IndustryStd] [varchar](12) NULL,
	[Vrsn] [varchar](7) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageStructures] PRIMARY KEY CLUSTERED 
(
	[MessageStructuresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageTriggers]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageTriggers](
	[MessageTrigger] [varchar](10) NOT NULL,
	[MessageTriggerDesc] [varchar](125) NULL,
	[MessageType] [varchar](4) NULL,
	[IndustryStd] [varchar](12) NULL,
	[Vrsn] [varchar](7) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageTriggers] PRIMARY KEY CLUSTERED 
(
	[MessageTrigger] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageTypes]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageTypes](
	[MessageType] [varchar](4) NOT NULL,
	[MessageTypeDesc] [varchar](125) NULL,
	[IndustryStd] [varchar](12) NULL,
	[Vrsn] [varchar](7) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageTypes] PRIMARY KEY CLUSTERED 
(
	[MessageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stdshl7].[MessageVersions]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stdshl7].[MessageVersions](
	[Vrsn] [varchar](7) NOT NULL,
	[IndustryStd] [varchar](12) NULL,
	[CreatedDate] [date] NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_MessageVersion] PRIMARY KEY CLUSTERED 
(
	[Vrsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [termData].[TermCodes]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [termData].[TermCodes](
	[TermsID] [bigint] IDENTITY(1,1) NOT NULL,
	[CodesetID] [smallint] NULL,
	[TermCode] [varchar](50) NULL,
	[TermDescription] [varchar](499) NULL,
	[CreatedDate] [date] NULL,
	[ApplicationID] [smallint] NULL,
	[OrganizationID] [varchar](10) NULL,
	[StatusID] [smallint] NULL,
	[CreatedUser] [varchar](20) NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[TermsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [termData].[TermCodesWithDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [termData].[TermCodesWithDetail](
	[TermCodesWithDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[CodesetID] [smallint] NULL,
	[TermCode] [varchar](50) NULL,
	[TermDescription] [varchar](499) NULL,
	[Address1] [varchar](75) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StateCode] [varchar](2) NULL,
	[ZipCode] [varchar](20) NULL,
	[CountryCode] [varchar](10) NULL,
	[Phone] [varchar](20) NULL,
	[CustomField1] [varchar](50) NULL,
	[CustomField2] [varchar](50) NULL,
	[CustomField3] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ApplicationID] [smallint] NULL,
	[OrganizationID] [varchar](10) NULL,
	[CreatedUser] [varchar](20) NULL,
	[StatusID] [smallint] NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_TermCodesWithDetails] PRIMARY KEY CLUSTERED 
(
	[TermCodesWithDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_HCInterfaceDataMapDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_HCInterfaceDataMapDetail] ON [appData].[HCInterfaceDataMapDetail]
(
	[InterfaceDataMapDetailID] ASC,
	[InterfaceDataMapHeaderID] ASC,
	[SourceApplicationID] ASC,
	[Vrsn] ASC,
	[MsgSegment] ASC,
	[SegmentFieldOrder] ASC,
	[MsgFieldNumber] ASC,
	[MsgFieldName] ASC,
	[MsgFieldLength] ASC,
	[DataType] ASC,
	[SensitivityFlagID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_InterfaceDataMapDetailToCoreMetadata]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_InterfaceDataMapDetailToCoreMetadata] ON [appData].[HCInterfaceDataMapDetailToCoreMetadata]
(
	[InterfaceDataMapToCoreMetadataDataMappingDetailID] ASC,
	[InterfaceDataMapDetailID] ASC,
	[CoreMetadataID] ASC,
	[CreatedUser] ASC,
	[StatusID] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_InterfaceDataMapToVendorDataMappingDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_InterfaceDataMapToVendorDataMappingDetail] ON [appData].[HCInterfaceDataMapDetailToVendorDataModel]
(
	[InterfaceDataMapToVendorDataMappingDetailID] ASC,
	[InterfaceDataMapDetailID] ASC,
	[VendorDataMappingDetailID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_InterfaceDataMapHeader]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_InterfaceDataMapHeader] ON [appData].[HCInterfaceDataMapHeader]
(
	[InterfaceDataMapHeaderID] ASC,
	[InterfaceName] ASC,
	[InterfaceDesc] ASC,
	[VendorID] ASC,
	[ApplicationID] ASC,
	[MessageType] ASC,
	[MessageTrigger] ASC,
	[MessageVersion] ASC,
	[OrganizationID] ASC,
	[CreatedDate] ASC,
	[CreatedUser] ASC,
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
/****** Object:  Index [INDX_VendorDataMappingDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorDataMappingDetail] ON [appData].[VendorDataMappingDetail]
(
	[VendorDataMappingDetailID] ASC,
	[SourceDataMapDesc] ASC,
	[ApplicationID] ASC,
	[DBName] ASC,
	[TableName] ASC,
	[FieldNumber] ASC,
	[FieldName] ASC,
	[FieldDataType] ASC,
	[FieldLength] ASC,
	[CompeleteFieldName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[VendorDataMappingHeaderID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_VendorDataMappingDetailToCodesets]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorDataMappingDetailToCodesets] ON [appData].[VendorDataMappingDetailToCodesets]
(
	[VendorDataMappingDetailToCodesetsID] ASC,
	[CodesetsID] ASC,
	[VendorDataMappingDetailID] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_VendorDataMappingDetailToCoreMetadata]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorDataMappingDetailToCoreMetadata] ON [appData].[VendorDataMappingDetailToCoreMetadata]
(
	[VendorDataMappingDetailToCoreMetadataID] ASC,
	[VendorDataMappingDetailID] ASC,
	[CoreMetadataID] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_VendorDataMappingHeader]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorDataMappingHeader] ON [appData].[VendorDataMappingHeader]
(
	[VendorDataMappingHeaderID] ASC,
	[VendorTechnologyName] ASC,
	[VendorTechnologyDesc] ASC,
	[VendorTechnologyInternalMnemonic] ASC,
	[VendorID] ASC,
	[ApplicationID] ASC,
	[VendorTechnologyVersion] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedBy] ASC,
	[CreatedUser] ASC,
	[OrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Auditing]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Auditing] ON [appPlatform].[Auditing]
(
	[AuditingID] ASC,
	[Component] ASC,
	[Action] ASC,
	[AuditDetails] ASC,
	[StartTime] ASC,
	[EndTime] ASC,
	[RunTime] ASC,
	[JobGUID] ASC,
	[JobID] ASC,
	[TransactionCount] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_DataGenConfig]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_DataGenConfig] ON [appPlatform].[DataGenConfig]
(
	[DataGenConfigID] ASC,
	[CorePlatformMetadataID] ASC,
	[DataTypeGenConfigName] ASC,
	[RunQuantity] ASC,
	[MinuteInterval] ASC,
	[SpecialInstructions] ASC,
	[DateCreated] ASC,
	[CreatedUser] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Application]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Application] ON [appRefData].[Application]
(
	[ApplicationID] ASC,
	[ApplicationMnemonic] ASC,
	[ApplicationDesc] ASC,
	[AppGUID] ASC,
	[VendorID] ASC,
	[CreatedUser] ASC,
	[DateCreated] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CodeSets]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_CodeSets] ON [appRefData].[CodeSets]
(
	[CodeSetsID] ASC,
	[Domain] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[IndustryStd] ASC,
	[CreatedUser] ASC,
	[CodeSetName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CorePlatformMetadata]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_CorePlatformMetadata] ON [appRefData].[CorePlatformMetadata]
(
	[CoreMetadataID] ASC,
	[MetadataFieldName] ASC,
	[SensitivityFlagID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Gender]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Gender] ON [appRefData].[Gender]
(
	[Gender] ASC,
	[GenderDescription] ASC,
	[DateCreated] ASC,
	[CreatedUser] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_IndustryStd]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_IndustryStd] ON [appRefData].[IndustryStd]
(
	[IndustryStd] ASC,
	[IndustryStdDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Organization]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Organization] ON [appRefData].[Organization]
(
	[OrganizationID] ASC,
	[OrganizationName] ASC,
	[Address] ASC,
	[City] ASC,
	[StateID] ASC,
	[ZipCode] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC,
	[OrganizationInternalCode] ASC,
	[OrganizationInternalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_SensitivityFlag]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_SensitivityFlag] ON [appRefData].[SensitivityFlag]
(
	[SensitiveInfoFlagID] ASC,
	[SensitiveInfoFlagDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RefStatus]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [IDX_RefStatus] ON [appRefData].[Status]
(
	[StatusID] ASC,
	[StatusDescription] ASC,
	[CreatedDate] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TimeZones]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [IX_TimeZones] ON [appRefData].[TimeZones]
(
	[TimeZone] ASC,
	[TimeZoneDesc] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_USStates]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_USStates] ON [appRefData].[USStates]
(
	[StateID] ASC,
	[StateDescription] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Vendors]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Vendors] ON [appRefData].[Vendors]
(
	[VendorID] ASC,
	[VendorName] ASC,
	[DateCreated] ASC,
	[ExternalVendorKey] ASC,
	[StatusID] ASC,
	[CreatedBy] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_VendorsDataTypes]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorsDataTypes] ON [appRefData].[VendorsDataTypes]
(
	[FieldDataType] ASC,
	[FieldDataTypeDesc] ASC,
	[ApplicationID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_VendorsDB]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorsDB] ON [appRefData].[VendorsDB]
(
	[DBName] ASC,
	[DBDesc] ASC,
	[DBVersion] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[ApplicationID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_VendorsTables]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_VendorsTables] ON [appRefData].[VendorsTables]
(
	[TableName] ASC,
	[TableDesc] ASC,
	[ApplicationID] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TableDetails]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [IX_TableDetails] ON [datamodel].[TableDetails]
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
/****** Object:  Index [INDX_AccountNumbers]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_AccountNumbers] ON [genData].[AccountNumbers]
(
	[AccountNumbersID] ASC,
	[AccountNumber] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_BankAccounts]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_BankAccounts] ON [genData].[BankAccounts]
(
	[BankAccountsID] ASC,
	[BankAccount] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_CreditCard]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_CreditCard] ON [genData].[CreditCards]
(
	[CreditCardID] ASC,
	[CreditCardNumber] ASC,
	[CreditCardName] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_DateOfBirths]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_DateOfBirths] ON [genData].[DateOfBirths]
(
	[DateofBirthsID] ASC,
	[DateOfBirth] ASC,
	[DateOfBirthDate] ASC,
	[Age] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_DriversLicenses]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_DriversLicenses] ON [genData].[DriversLicenses]
(
	[DriversLicensesID] ASC,
	[DateCreated] ASC,
	[DriversLicenseNumber] ASC,
	[StateCode] ASC,
	[StatusID] ASC,
	[CompleteDriversLicenseNumber] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_EIN]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_EIN] ON [genData].[EIN]
(
	[EINID] ASC,
	[EIN] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_NameLast]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_NameLast] ON [genData].[NameLast]
(
	[NameLastID] ASC,
	[LastName] ASC,
	[StatusID] ASC,
	[DateCreated] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_SocialSecurityNumber]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_SocialSecurityNumber] ON [genData].[SocialSecurityNumber]
(
	[SocialSecurityNumberID] ASC,
	[SocialSecurityNumber] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ABABanking]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_ABABanking] ON [genRefData].[ABABanking]
(
	[ABABankingID] ASC,
	[RoutingNumber] ASC,
	[TelegraphicName] ASC,
	[CustomerName] ASC,
	[City] ASC,
	[State] ASC,
	[ZipCode] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_AreaCode]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_AreaCode] ON [genRefData].[AreaCode]
(
	[AreaCode] ASC,
	[TimeZone] ASC,
	[StateCode] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Companies]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Companies] ON [genRefData].[Companies]
(
	[CompaniesID] ASC,
	[CompanyName] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_UPCCodes]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_UPCCodes] ON [genRefData].[UPCCodes]
(
	[UPCCodeID] ASC,
	[UPCCode] ASC,
	[UPCProductName] ASC,
	[CreatedDate] ASC,
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ZipcodeIntl]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_ZipcodeIntl] ON [genRefData].[ZipcodeIntl]
(
	[ZipCodeIntnlID] ASC,
	[ZipCode] ASC,
	[ZipCodeType] ASC,
	[City] ASC,
	[Country] ASC,
	[Lattitude] ASC,
	[Longitude] ASC,
	[Location] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_ZipcodeUS]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_ZipcodeUS] ON [genRefData].[ZipcodeUS]
(
	[ZipCodeID] ASC,
	[City] ASC,
	[State] ASC,
	[Lattitude] ASC,
	[Longitude] ASC,
	[ZipCode] ASC,
	[ZipCodeType] ASC,
	[DateCreated] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageDataTypes]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageDataTypes] ON [stdshl7].[MessageDataTypes]
(
	[DataType] ASC,
	[DataTypeDesc] ASC,
	[Vrsn] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageFields]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageFields] ON [stdshl7].[MessageFields]
(
	[MessageFieldID] ASC,
	[MessageField] ASC,
	[MessageFieldName] ASC,
	[FieldLength] ASC,
	[DataType] ASC,
	[IndustryStd] ASC,
	[Vrsn] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[SensitiveInfoFlagID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageSegmentFieldDetails]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageSegmentFieldDetails] ON [stdshl7].[MessageSegmentFieldDetails]
(
	[MessageSegmentFieldDetailsID] ASC,
	[MessageFieldNumber] ASC,
	[MessageFieldName] ASC,
	[FieldLength] ASC,
	[DataType] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[Vrsn] ASC,
	[IndustryStd] ASC,
	[MessageSegment] ASC,
	[SegmentFieldOrder] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageSegments]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageSegments] ON [stdshl7].[MessageSegments]
(
	[MsgSegment] ASC,
	[MsgSegmentDesc] ASC,
	[IndustryStd] ASC,
	[Vrsn] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageStructures]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageStructures] ON [stdshl7].[MessageStructures]
(
	[MessageStructuresID] ASC,
	[MessageTrigger] ASC,
	[MessageType] ASC,
	[IndustryStd] ASC,
	[StatusID] ASC,
	[CreatedDate] ASC,
	[Vrsn] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageTriggers]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageTriggers] ON [stdshl7].[MessageTriggers]
(
	[MessageTrigger] ASC,
	[MessageTriggerDesc] ASC,
	[MessageType] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[Vrsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageTypes]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageTypes] ON [stdshl7].[MessageTypes]
(
	[MessageType] ASC,
	[MessageTypeDesc] ASC,
	[IndustryStd] ASC,
	[Vrsn] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_MessageVersion]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_MessageVersion] ON [stdshl7].[MessageVersions]
(
	[Vrsn] ASC,
	[IndustryStd] ASC,
	[CreatedDate] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [INDX_Terms]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [INDX_Terms] ON [termData].[TermCodes]
(
	[TermsID] ASC,
	[CodesetID] ASC,
	[TermCode] ASC,
	[TermDescription] ASC,
	[CreatedDate] ASC,
	[ApplicationID] ASC,
	[OrganizationID] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TermCodesWithDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [IX_TermCodesWithDetail] ON [termData].[TermCodesWithDetail]
(
	[TermCodesWithDetailID] ASC,
	[CodesetID] ASC,
	[TermCode] ASC,
	[TermDescription] ASC,
	[Address1] ASC,
	[Address2] ASC,
	[City] ASC,
	[StateCode] ASC,
	[ZipCode] ASC,
	[CountryCode] ASC,
	[Phone] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX1_TermCodesWithDetail]    Script Date: 3/24/2019 12:33:12 AM ******/
CREATE NONCLUSTERED INDEX [IX1_TermCodesWithDetail] ON [termData].[TermCodesWithDetail]
(
	[TermCodesWithDetailID] ASC,
	[CustomField1] ASC,
	[CustomField2] ASC,
	[CustomField3] ASC,
	[CreatedDate] ASC,
	[ApplicationID] ASC,
	[OrganizationID] ASC,
	[StatusID] ASC,
	[CreatedUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] ADD  CONSTRAINT [DF_DataMapInterfaceDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] ADD  CONSTRAINT [DF_DataMapInterfaceDetail_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets] ADD  CONSTRAINT [DF_InterfaceDataMapToCodesetsDataMappingDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets] ADD  CONSTRAINT [DF_InterfaceDataMapToCodesetsDataMappingDetail_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata] ADD  CONSTRAINT [DF_InterfaceDataMapToCoreMetadataDataMappingDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata] ADD  CONSTRAINT [DF_InterfaceDataMapToCoreMetadataDataMappingDetail_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel] ADD  CONSTRAINT [DF_InterfaceDataMapToVendorDataMappingDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel] ADD  CONSTRAINT [DF_InterfaceDataMapToVendorDataMappingDetail_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] ADD  CONSTRAINT [DF_DataMapInterfaceHeader_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] ADD  CONSTRAINT [DF_DataMapInterfaceHeader_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[VendorDataMappingDetail] ADD  CONSTRAINT [DF_SourceDataMap_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[VendorDataMappingDetail] ADD  CONSTRAINT [DF_SourceDataMap_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets] ADD  CONSTRAINT [DF_VendorDataMappingDetailToCodesets_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets] ADD  CONSTRAINT [DF_VendorDataMappingDetailToCodesets_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata] ADD  CONSTRAINT [DF_VendorDataMappingDetailToCoreMetadata_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata] ADD  CONSTRAINT [DF_VendorDataMappingDetailToCoreMetadata_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[VendorDataMappingHeader] ADD  CONSTRAINT [DF_DataMapVendorDataModelHeader_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appData].[VendorDataMappingHeader] ADD  CONSTRAINT [DF_DataMapVendorDataModelHeader_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appPlatform].[Auditing] ADD  CONSTRAINT [DF_Auditing_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appPlatform].[DataGenConfig] ADD  CONSTRAINT [DF_DataGenConfig_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [appPlatform].[DataGenConfig] ADD  CONSTRAINT [DF_DataGenConfig_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[Application] ADD  CONSTRAINT [DF_Application_AppGUID]  DEFAULT (newid()) FOR [AppGUID]
GO
ALTER TABLE [appRefData].[Application] ADD  CONSTRAINT [DF_Application_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [appRefData].[Application] ADD  CONSTRAINT [DF_Application_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[CodeSets] ADD  CONSTRAINT [DF_CodeSets_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[CodeSets] ADD  CONSTRAINT [DF_CodeSets_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[CorePlatformMetadata] ADD  CONSTRAINT [DF_CorePlatformMetadata_SensitivityFlagID]  DEFAULT ((1)) FOR [SensitivityFlagID]
GO
ALTER TABLE [appRefData].[CorePlatformMetadata] ADD  CONSTRAINT [DF_CoreMetadata_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[CorePlatformMetadata] ADD  CONSTRAINT [DF_CoreMetadata_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[Gender] ADD  CONSTRAINT [DF_Gender_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [appRefData].[Gender] ADD  CONSTRAINT [DF_Gender_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[IndustryStd] ADD  CONSTRAINT [DF_IndustryStd_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[IndustryStd] ADD  CONSTRAINT [DF_IndustryStd_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[Organization] ADD  CONSTRAINT [DF_Organization_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[Organization] ADD  CONSTRAINT [DF_Organization_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[SensitivityFlag] ADD  CONSTRAINT [DF_SensitivityFlag_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[SensitivityFlag] ADD  CONSTRAINT [DF_SensitivityFlag_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[Status] ADD  CONSTRAINT [DF_Status_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[TimeZones] ADD  CONSTRAINT [DF_TimeZones_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[TimeZones] ADD  CONSTRAINT [DF_TimeZones_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[USStates] ADD  CONSTRAINT [DF_USStates_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [appRefData].[USStates] ADD  CONSTRAINT [DF_USStates_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[Vendors] ADD  CONSTRAINT [DF_Vendors_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [appRefData].[Vendors] ADD  CONSTRAINT [DF_Vendors_ExternalVendorKey]  DEFAULT (newid()) FOR [ExternalVendorKey]
GO
ALTER TABLE [appRefData].[Vendors] ADD  CONSTRAINT [DF_Vendors_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[VendorsDataTypes] ADD  CONSTRAINT [DF_VendorsDataTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[VendorsDataTypes] ADD  CONSTRAINT [DF_VendorsDataTypes_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[VendorsDB] ADD  CONSTRAINT [DF_VendorsDB_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[VendorsDB] ADD  CONSTRAINT [DF_VendorsDB_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [appRefData].[VendorsTables] ADD  CONSTRAINT [DF_VendorsTables_ApplicationID]  DEFAULT ((1)) FOR [ApplicationID]
GO
ALTER TABLE [appRefData].[VendorsTables] ADD  CONSTRAINT [DF_VendorsTables_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [appRefData].[VendorsTables] ADD  CONSTRAINT [DF_VendorsTables_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[AccountNumbers] ADD  CONSTRAINT [DF_AccountNumbers_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[AccountNumbers] ADD  CONSTRAINT [DF_AccountNumbers_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[Addresses] ADD  CONSTRAINT [DF_Addresses_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[Addresses] ADD  CONSTRAINT [DF_Addresses_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[BankAccounts] ADD  CONSTRAINT [DF_BankAccounts_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[BankAccounts] ADD  CONSTRAINT [DF_BankAccounts_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[CreditCards] ADD  CONSTRAINT [DF_CreditCard_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[CreditCards] ADD  CONSTRAINT [DF_CreditCard_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[DateOfBirths] ADD  CONSTRAINT [DF_DateOfBirths_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[DateOfBirths] ADD  CONSTRAINT [DF_DateOfBirths_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[DriversLicenses] ADD  CONSTRAINT [DF_DriversLicenses_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[DriversLicenses] ADD  CONSTRAINT [DF_DriversLicenses_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[EIN] ADD  CONSTRAINT [DF_EIN_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genData].[EIN] ADD  CONSTRAINT [DF_EIN_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[NameFirst] ADD  CONSTRAINT [DF_NameFirst_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[NameFirst] ADD  CONSTRAINT [DF_NameFirst_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[NameLast] ADD  CONSTRAINT [DF_NameLast_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[NameLast] ADD  CONSTRAINT [DF_NameLast_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[PhoneNumbers] ADD  CONSTRAINT [DF_PhoneNumbers_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[PhoneNumbers] ADD  CONSTRAINT [DF_PhoneNumbers_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genData].[SocialSecurityNumber] ADD  CONSTRAINT [DF_SocialSecurityNumber_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genData].[SocialSecurityNumber] ADD  CONSTRAINT [DF_SocialSecurityNumber_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genRefData].[ABABanking] ADD  CONSTRAINT [DF_ABABanking_DateAdded]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genRefData].[ABABanking] ADD  CONSTRAINT [DF_ABABanking_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genRefData].[AreaCode] ADD  CONSTRAINT [DF_AreaCode_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genRefData].[AreaCode] ADD  CONSTRAINT [DF_AreaCode_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genRefData].[Companies] ADD  CONSTRAINT [DF_Companies_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genRefData].[Companies] ADD  CONSTRAINT [DF_Companies_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genRefData].[UPCCodes] ADD  CONSTRAINT [DF_UPCCodes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [genRefData].[UPCCodes] ADD  CONSTRAINT [DF_UPCCodes_StatusId]  DEFAULT ((1)) FOR [StatusId]
GO
ALTER TABLE [genRefData].[ZipcodeIntl] ADD  CONSTRAINT [DF_ZipcodeIntl_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genRefData].[ZipcodeIntl] ADD  CONSTRAINT [DF_ZipcodeIntl_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [genRefData].[ZipcodeUS] ADD  CONSTRAINT [DF_ZipcodeUS_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [genRefData].[ZipcodeUS] ADD  CONSTRAINT [DF_ZipcodeUS_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageDataTypes] ADD  CONSTRAINT [DF_MessageDataTypes_IndustryStd]  DEFAULT ('HL7') FOR [IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageDataTypes] ADD  CONSTRAINT [DF_MessageDataTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageDataTypes] ADD  CONSTRAINT [DF_MessageDataTypes_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageFields] ADD  CONSTRAINT [DF_MesageFields_IndustryStd]  DEFAULT ('HL7') FOR [IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageFields] ADD  CONSTRAINT [DF_MessageFields_SensitiveInfoFlagID]  DEFAULT ((1)) FOR [SensitiveInfoFlagID]
GO
ALTER TABLE [stdshl7].[MessageFields] ADD  CONSTRAINT [DF_MesageFields_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageFields] ADD  CONSTRAINT [DF_MesageFields_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] ADD  CONSTRAINT [DF_MessageSegmentFieldDetails_IndustryStd]  DEFAULT ('HL7') FOR [IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] ADD  CONSTRAINT [DF_MessageSegmentFieldDetails_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] ADD  CONSTRAINT [DF_MessageSegmentFieldDetails_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageSegments] ADD  CONSTRAINT [DF_MessageSegments_IndustryStd]  DEFAULT ('HL7') FOR [IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageSegments] ADD  CONSTRAINT [DF_MessageSegments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageSegments] ADD  CONSTRAINT [DF_MessageSegments_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageStructures] ADD  CONSTRAINT [DF_MessageStructures_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageStructures] ADD  CONSTRAINT [DF_MessageStructures_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageTriggers] ADD  CONSTRAINT [DF_MessageTriggers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageTriggers] ADD  CONSTRAINT [DF_MessageTriggers_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageTypes] ADD  CONSTRAINT [DF__tmp_ms_xx__Indus__7E22B05D]  DEFAULT ('HL7') FOR [IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageTypes] ADD  CONSTRAINT [DF_MessageTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageTypes] ADD  CONSTRAINT [DF__tmp_ms_xx__Statu__7F16D496]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [stdshl7].[MessageVersions] ADD  CONSTRAINT [DF_MessageVersions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stdshl7].[MessageVersions] ADD  CONSTRAINT [DF_MessageVersions_Status]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [termData].[TermCodes] ADD  CONSTRAINT [DF_Terms_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [termData].[TermCodes] ADD  CONSTRAINT [DF_Terms_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [termData].[TermCodesWithDetail] ADD  CONSTRAINT [DF_TermCodesWithDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [termData].[TermCodesWithDetail] ADD  CONSTRAINT [DF_TermCodesWithDetail_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [termData].[TermCodesWithDetail] ADD  CONSTRAINT [DF_TermCodesWithDetail_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_Application] FOREIGN KEY([SourceApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_Application]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_DataTypes] FOREIGN KEY([DataType])
REFERENCES [stdshl7].[MessageDataTypes] ([DataType])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_DataTypes]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_InterfaceDataMapHeader] FOREIGN KEY([InterfaceDataMapHeaderID])
REFERENCES [appData].[HCInterfaceDataMapHeader] ([InterfaceDataMapHeaderID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_InterfaceDataMapHeader]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_Segments] FOREIGN KEY([MsgSegment])
REFERENCES [stdshl7].[MessageSegments] ([MsgSegment])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_Segments]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_SensitivityFlag] FOREIGN KEY([SensitivityFlagID])
REFERENCES [appRefData].[SensitivityFlag] ([SensitiveInfoFlagID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_SensitivityFlag]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_Status]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetail_Versions] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetail] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetail_Versions]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetailToCodesets_HCInterfaceDataMapDetail] FOREIGN KEY([InterfaceDataMapDetailID])
REFERENCES [appData].[HCInterfaceDataMapDetail] ([InterfaceDataMapDetailID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetailToCodesets_HCInterfaceDataMapDetail]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapDetailToCodesets_Codesets] FOREIGN KEY([CodesetsID])
REFERENCES [appRefData].[CodeSets] ([CodeSetsID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets] CHECK CONSTRAINT [FK_InterfaceDataMapDetailToCodesets_Codesets]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapToCodesetsDataMappingDetail_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCodesets] CHECK CONSTRAINT [FK_InterfaceDataMapToCodesetsDataMappingDetail_Status]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetailToCoreMetadata_HCInterfaceDataMapDetail] FOREIGN KEY([InterfaceDataMapDetailID])
REFERENCES [appData].[HCInterfaceDataMapDetail] ([InterfaceDataMapDetailID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetailToCoreMetadata_HCInterfaceDataMapDetail]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapDetailToCoreMetadata_CorePlatformMetadata] FOREIGN KEY([CoreMetadataID])
REFERENCES [appRefData].[CorePlatformMetadata] ([CoreMetadataID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata] CHECK CONSTRAINT [FK_InterfaceDataMapDetailToCoreMetadata_CorePlatformMetadata]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapToCoreMetadataDataMappingDetail_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToCoreMetadata] CHECK CONSTRAINT [FK_InterfaceDataMapToCoreMetadataDataMappingDetail_Status]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel]  WITH CHECK ADD  CONSTRAINT [FK_HCInterfaceDataMapDetailToVendorDataModel_HCInterfaceDataMapDetail] FOREIGN KEY([InterfaceDataMapDetailID])
REFERENCES [appData].[HCInterfaceDataMapDetail] ([InterfaceDataMapDetailID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel] CHECK CONSTRAINT [FK_HCInterfaceDataMapDetailToVendorDataModel_HCInterfaceDataMapDetail]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapToVendorDataMappingDetail_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel] CHECK CONSTRAINT [FK_InterfaceDataMapToVendorDataMappingDetail_Status]
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapToVendorDataMappingDetail_VendorDataMappingDetail] FOREIGN KEY([VendorDataMappingDetailID])
REFERENCES [appData].[VendorDataMappingDetail] ([VendorDataMappingDetailID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapDetailToVendorDataModel] CHECK CONSTRAINT [FK_InterfaceDataMapToVendorDataMappingDetail_VendorDataMappingDetail]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_Application]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_MessageTriggers] FOREIGN KEY([MessageTrigger])
REFERENCES [stdshl7].[MessageTriggers] ([MessageTrigger])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_MessageTriggers]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_MessageTypes] FOREIGN KEY([MessageType])
REFERENCES [stdshl7].[MessageTypes] ([MessageType])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_MessageTypes]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_MessageVersions] FOREIGN KEY([MessageVersion])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_MessageVersions]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [appRefData].[Organization] ([OrganizationID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_Organization]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_Status]
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader]  WITH CHECK ADD  CONSTRAINT [FK_InterfaceDataMapHeader_Vendors] FOREIGN KEY([VendorID])
REFERENCES [appRefData].[Vendors] ([VendorID])
GO
ALTER TABLE [appData].[HCInterfaceDataMapHeader] CHECK CONSTRAINT [FK_InterfaceDataMapHeader_Vendors]
GO
ALTER TABLE [appData].[VendorDataMappingDetail]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetail_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appData].[VendorDataMappingDetail] CHECK CONSTRAINT [FK_VendorDataMappingDetail_Application]
GO
ALTER TABLE [appData].[VendorDataMappingDetail]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetail_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[VendorDataMappingDetail] CHECK CONSTRAINT [FK_VendorDataMappingDetail_Status]
GO
ALTER TABLE [appData].[VendorDataMappingDetail]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetail_VendorsDataTypes] FOREIGN KEY([FieldDataType])
REFERENCES [appRefData].[VendorsDataTypes] ([FieldDataType])
GO
ALTER TABLE [appData].[VendorDataMappingDetail] CHECK CONSTRAINT [FK_VendorDataMappingDetail_VendorsDataTypes]
GO
ALTER TABLE [appData].[VendorDataMappingDetail]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetail_VendorsDB] FOREIGN KEY([DBName])
REFERENCES [appRefData].[VendorsDB] ([DBName])
GO
ALTER TABLE [appData].[VendorDataMappingDetail] CHECK CONSTRAINT [FK_VendorDataMappingDetail_VendorsDB]
GO
ALTER TABLE [appData].[VendorDataMappingDetail]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetail_VendorsTables] FOREIGN KEY([TableName])
REFERENCES [appRefData].[VendorsTables] ([TableName])
GO
ALTER TABLE [appData].[VendorDataMappingDetail] CHECK CONSTRAINT [FK_VendorDataMappingDetail_VendorsTables]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetailToCodesets_Codesets] FOREIGN KEY([CodesetsID])
REFERENCES [appRefData].[CodeSets] ([CodeSetsID])
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets] CHECK CONSTRAINT [FK_VendorDataMappingDetailToCodesets_Codesets]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetailToCodesets_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets] CHECK CONSTRAINT [FK_VendorDataMappingDetailToCodesets_Status]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetailToCodesets_VendorDataMappingDetail] FOREIGN KEY([VendorDataMappingDetailID])
REFERENCES [appData].[VendorDataMappingDetail] ([VendorDataMappingDetailID])
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCodesets] CHECK CONSTRAINT [FK_VendorDataMappingDetailToCodesets_VendorDataMappingDetail]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetailToCoreMetadata_CorePlatformMetadata] FOREIGN KEY([CoreMetadataID])
REFERENCES [appRefData].[CorePlatformMetadata] ([CoreMetadataID])
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata] CHECK CONSTRAINT [FK_VendorDataMappingDetailToCoreMetadata_CorePlatformMetadata]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetailToCoreMetadata_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata] CHECK CONSTRAINT [FK_VendorDataMappingDetailToCoreMetadata_Status]
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingDetailToCoreMetadata_VendorDataMappingDetail] FOREIGN KEY([VendorDataMappingDetailID])
REFERENCES [appData].[VendorDataMappingDetail] ([VendorDataMappingDetailID])
GO
ALTER TABLE [appData].[VendorDataMappingDetailToCoreMetadata] CHECK CONSTRAINT [FK_VendorDataMappingDetailToCoreMetadata_VendorDataMappingDetail]
GO
ALTER TABLE [appData].[VendorDataMappingHeader]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingHeader_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [appRefData].[Organization] ([OrganizationID])
GO
ALTER TABLE [appData].[VendorDataMappingHeader] CHECK CONSTRAINT [FK_VendorDataMappingHeader_Organization]
GO
ALTER TABLE [appData].[VendorDataMappingHeader]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataMappingHeader_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appData].[VendorDataMappingHeader] CHECK CONSTRAINT [FK_VendorDataMappingHeader_Status]
GO
ALTER TABLE [appData].[VendorDataMappingHeader]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataModelHeader_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appData].[VendorDataMappingHeader] CHECK CONSTRAINT [FK_VendorDataModelHeader_Application]
GO
ALTER TABLE [appData].[VendorDataMappingHeader]  WITH CHECK ADD  CONSTRAINT [FK_VendorDataModelHeader_Vendor] FOREIGN KEY([VendorID])
REFERENCES [appRefData].[Vendors] ([VendorID])
GO
ALTER TABLE [appData].[VendorDataMappingHeader] CHECK CONSTRAINT [FK_VendorDataModelHeader_Vendor]
GO
ALTER TABLE [appPlatform].[DataGenConfig]  WITH CHECK ADD  CONSTRAINT [FK_DataGenConfig_CorePlatformMetadata] FOREIGN KEY([CorePlatformMetadataID])
REFERENCES [appRefData].[CorePlatformMetadata] ([CoreMetadataID])
GO
ALTER TABLE [appPlatform].[DataGenConfig] CHECK CONSTRAINT [FK_DataGenConfig_CorePlatformMetadata]
GO
ALTER TABLE [appPlatform].[DataGenConfig]  WITH CHECK ADD  CONSTRAINT [FK_DataGenConfig_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appPlatform].[DataGenConfig] CHECK CONSTRAINT [FK_DataGenConfig_Status]
GO
ALTER TABLE [appRefData].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[Application] CHECK CONSTRAINT [FK_Application_Status]
GO
ALTER TABLE [appRefData].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Vendors] FOREIGN KEY([VendorID])
REFERENCES [appRefData].[Vendors] ([VendorID])
GO
ALTER TABLE [appRefData].[Application] CHECK CONSTRAINT [FK_Application_Vendors]
GO
ALTER TABLE [appRefData].[CodeSets]  WITH CHECK ADD  CONSTRAINT [FK_CodeSets_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [appRefData].[CodeSets] CHECK CONSTRAINT [FK_CodeSets_IndustryStd]
GO
ALTER TABLE [appRefData].[CodeSets]  WITH CHECK ADD  CONSTRAINT [FK_CodeSets_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[CodeSets] CHECK CONSTRAINT [FK_CodeSets_Status]
GO
ALTER TABLE [appRefData].[CorePlatformMetadata]  WITH CHECK ADD  CONSTRAINT [FK_CorePlatformMetadata_SensitivityFlag] FOREIGN KEY([SensitivityFlagID])
REFERENCES [appRefData].[SensitivityFlag] ([SensitiveInfoFlagID])
GO
ALTER TABLE [appRefData].[CorePlatformMetadata] CHECK CONSTRAINT [FK_CorePlatformMetadata_SensitivityFlag]
GO
ALTER TABLE [appRefData].[CorePlatformMetadata]  WITH CHECK ADD  CONSTRAINT [FK_CorePlatformMetadata_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[CorePlatformMetadata] CHECK CONSTRAINT [FK_CorePlatformMetadata_Status]
GO
ALTER TABLE [appRefData].[Gender]  WITH CHECK ADD  CONSTRAINT [FK_Gender_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[Gender] CHECK CONSTRAINT [FK_Gender_Status]
GO
ALTER TABLE [appRefData].[IndustryStd]  WITH CHECK ADD  CONSTRAINT [FK_IndustryStd_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[IndustryStd] CHECK CONSTRAINT [FK_IndustryStd_Status]
GO
ALTER TABLE [appRefData].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[Organization] CHECK CONSTRAINT [FK_Organization_Status]
GO
ALTER TABLE [appRefData].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_USStates] FOREIGN KEY([StateID])
REFERENCES [appRefData].[USStates] ([StateID])
GO
ALTER TABLE [appRefData].[Organization] CHECK CONSTRAINT [FK_Organization_USStates]
GO
ALTER TABLE [appRefData].[SensitivityFlag]  WITH CHECK ADD  CONSTRAINT [FK_SensitivityFlag_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[SensitivityFlag] CHECK CONSTRAINT [FK_SensitivityFlag_Status]
GO
ALTER TABLE [appRefData].[TimeZones]  WITH CHECK ADD  CONSTRAINT [FK_TimeZones_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[TimeZones] CHECK CONSTRAINT [FK_TimeZones_Status]
GO
ALTER TABLE [appRefData].[USStates]  WITH CHECK ADD  CONSTRAINT [FK_USStates_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[USStates] CHECK CONSTRAINT [FK_USStates_Status]
GO
ALTER TABLE [appRefData].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_Vendors_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[Vendors] CHECK CONSTRAINT [FK_Vendors_Status]
GO
ALTER TABLE [appRefData].[VendorsDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_VendorsDataTypes_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appRefData].[VendorsDataTypes] CHECK CONSTRAINT [FK_VendorsDataTypes_Application]
GO
ALTER TABLE [appRefData].[VendorsDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_VendorsDataTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[VendorsDataTypes] CHECK CONSTRAINT [FK_VendorsDataTypes_Status]
GO
ALTER TABLE [appRefData].[VendorsDB]  WITH CHECK ADD  CONSTRAINT [FK_VendorsDB_Applications] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appRefData].[VendorsDB] CHECK CONSTRAINT [FK_VendorsDB_Applications]
GO
ALTER TABLE [appRefData].[VendorsDB]  WITH CHECK ADD  CONSTRAINT [FK_VendorsDB_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[VendorsDB] CHECK CONSTRAINT [FK_VendorsDB_Status]
GO
ALTER TABLE [appRefData].[VendorsTables]  WITH CHECK ADD  CONSTRAINT [FK_VendorsTables_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [appRefData].[VendorsTables] CHECK CONSTRAINT [FK_VendorsTables_Application]
GO
ALTER TABLE [appRefData].[VendorsTables]  WITH CHECK ADD  CONSTRAINT [FK_VendorsTables_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [appRefData].[VendorsTables] CHECK CONSTRAINT [FK_VendorsTables_Status]
GO
ALTER TABLE [genData].[AccountNumbers]  WITH CHECK ADD  CONSTRAINT [FK_AccountNumbers_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[AccountNumbers] CHECK CONSTRAINT [FK_AccountNumbers_Status]
GO
ALTER TABLE [genData].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[Addresses] CHECK CONSTRAINT [FK_Addresses_Status]
GO
ALTER TABLE [genData].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BankAccounts_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[BankAccounts] CHECK CONSTRAINT [FK_BankAccounts_Status]
GO
ALTER TABLE [genData].[CreditCards]  WITH CHECK ADD  CONSTRAINT [FK_CreditCard_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[CreditCards] CHECK CONSTRAINT [FK_CreditCard_Status]
GO
ALTER TABLE [genData].[DateOfBirths]  WITH CHECK ADD  CONSTRAINT [FK_DateOfBirths_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[DateOfBirths] CHECK CONSTRAINT [FK_DateOfBirths_Status]
GO
ALTER TABLE [genData].[DriversLicenses]  WITH CHECK ADD  CONSTRAINT [FK_DriversLicenses_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[DriversLicenses] CHECK CONSTRAINT [FK_DriversLicenses_Status]
GO
ALTER TABLE [genData].[DriversLicenses]  WITH CHECK ADD  CONSTRAINT [FK_DriversLicenses_USStates] FOREIGN KEY([StateCode])
REFERENCES [appRefData].[USStates] ([StateID])
GO
ALTER TABLE [genData].[DriversLicenses] CHECK CONSTRAINT [FK_DriversLicenses_USStates]
GO
ALTER TABLE [genData].[EIN]  WITH CHECK ADD  CONSTRAINT [FK_EIN_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[EIN] CHECK CONSTRAINT [FK_EIN_Status]
GO
ALTER TABLE [genData].[NameFirst]  WITH CHECK ADD  CONSTRAINT [FK_NameFirst_Gender] FOREIGN KEY([Gender])
REFERENCES [appRefData].[Gender] ([Gender])
GO
ALTER TABLE [genData].[NameFirst] CHECK CONSTRAINT [FK_NameFirst_Gender]
GO
ALTER TABLE [genData].[NameFirst]  WITH CHECK ADD  CONSTRAINT [FK_NameFirst_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[NameFirst] CHECK CONSTRAINT [FK_NameFirst_Status]
GO
ALTER TABLE [genData].[NameLast]  WITH CHECK ADD  CONSTRAINT [FK_NameLast_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[NameLast] CHECK CONSTRAINT [FK_NameLast_Status]
GO
ALTER TABLE [genData].[SocialSecurityNumber]  WITH CHECK ADD  CONSTRAINT [FK_SocialSecurityNumber_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genData].[SocialSecurityNumber] CHECK CONSTRAINT [FK_SocialSecurityNumber_Status]
GO
ALTER TABLE [genRefData].[ABABanking]  WITH CHECK ADD  CONSTRAINT [FK_ABABanking_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genRefData].[ABABanking] CHECK CONSTRAINT [FK_ABABanking_Status]
GO
ALTER TABLE [genRefData].[AreaCode]  WITH CHECK ADD  CONSTRAINT [FK_AreaCode_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genRefData].[AreaCode] CHECK CONSTRAINT [FK_AreaCode_Status]
GO
ALTER TABLE [genRefData].[AreaCode]  WITH CHECK ADD  CONSTRAINT [FK_AreaCode_TimeZones] FOREIGN KEY([TimeZone])
REFERENCES [appRefData].[TimeZones] ([TimeZone])
GO
ALTER TABLE [genRefData].[AreaCode] CHECK CONSTRAINT [FK_AreaCode_TimeZones]
GO
ALTER TABLE [genRefData].[AreaCode]  WITH CHECK ADD  CONSTRAINT [FK_AreaCode_USStates] FOREIGN KEY([StateCode])
REFERENCES [appRefData].[USStates] ([StateID])
GO
ALTER TABLE [genRefData].[AreaCode] CHECK CONSTRAINT [FK_AreaCode_USStates]
GO
ALTER TABLE [genRefData].[Companies]  WITH CHECK ADD  CONSTRAINT [FK_Companies_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genRefData].[Companies] CHECK CONSTRAINT [FK_Companies_Status]
GO
ALTER TABLE [genRefData].[UPCCodes]  WITH CHECK ADD  CONSTRAINT [FK_UPCCodes_Status] FOREIGN KEY([StatusId])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genRefData].[UPCCodes] CHECK CONSTRAINT [FK_UPCCodes_Status]
GO
ALTER TABLE [genRefData].[ZipcodeIntl]  WITH CHECK ADD  CONSTRAINT [FK_ZipcodeIntl_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genRefData].[ZipcodeIntl] CHECK CONSTRAINT [FK_ZipcodeIntl_Status]
GO
ALTER TABLE [genRefData].[ZipcodeUS]  WITH CHECK ADD  CONSTRAINT [FK_ZipcodeUS_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [genRefData].[ZipcodeUS] CHECK CONSTRAINT [FK_ZipcodeUS_Status]
GO
ALTER TABLE [stdshl7].[MessageDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageDataTypes_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageDataTypes] CHECK CONSTRAINT [FK_MessageDataTypes_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageDataTypes_MessageVersion] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageDataTypes] CHECK CONSTRAINT [FK_MessageDataTypes_MessageVersion]
GO
ALTER TABLE [stdshl7].[MessageDataTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageDataTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageDataTypes] CHECK CONSTRAINT [FK_MessageDataTypes_Status]
GO
ALTER TABLE [stdshl7].[MessageFields]  WITH CHECK ADD  CONSTRAINT [FK_MesageFields_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageFields] CHECK CONSTRAINT [FK_MesageFields_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageFields]  WITH CHECK ADD  CONSTRAINT [FK_MesageFields_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageFields] CHECK CONSTRAINT [FK_MesageFields_Status]
GO
ALTER TABLE [stdshl7].[MessageFields]  WITH CHECK ADD  CONSTRAINT [FK_MesageFields_Version] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageFields] CHECK CONSTRAINT [FK_MesageFields_Version]
GO
ALTER TABLE [stdshl7].[MessageFields]  WITH CHECK ADD  CONSTRAINT [FK_MessageFields_DataType] FOREIGN KEY([DataType])
REFERENCES [stdshl7].[MessageDataTypes] ([DataType])
GO
ALTER TABLE [stdshl7].[MessageFields] CHECK CONSTRAINT [FK_MessageFields_DataType]
GO
ALTER TABLE [stdshl7].[MessageFields]  WITH CHECK ADD  CONSTRAINT [FK_MessageFields_SensitivityFlag] FOREIGN KEY([SensitiveInfoFlagID])
REFERENCES [appRefData].[SensitivityFlag] ([SensitiveInfoFlagID])
GO
ALTER TABLE [stdshl7].[MessageFields] CHECK CONSTRAINT [FK_MessageFields_SensitivityFlag]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegmentFieldDetails_DataType] FOREIGN KEY([DataType])
REFERENCES [stdshl7].[MessageDataTypes] ([DataType])
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] CHECK CONSTRAINT [FK_MessageSegmentFieldDetails_DataType]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegmentFieldDetails_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] CHECK CONSTRAINT [FK_MessageSegmentFieldDetails_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegmentFieldDetails_MessageSegment] FOREIGN KEY([MessageSegment])
REFERENCES [stdshl7].[MessageSegments] ([MsgSegment])
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] CHECK CONSTRAINT [FK_MessageSegmentFieldDetails_MessageSegment]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegmentFieldDetails_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] CHECK CONSTRAINT [FK_MessageSegmentFieldDetails_Status]
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegmentFieldDetails_Version] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageSegmentFieldDetails] CHECK CONSTRAINT [FK_MessageSegmentFieldDetails_Version]
GO
ALTER TABLE [stdshl7].[MessageSegments]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegments_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageSegments] CHECK CONSTRAINT [FK_MessageSegments_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageSegments]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegments_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageSegments] CHECK CONSTRAINT [FK_MessageSegments_Status]
GO
ALTER TABLE [stdshl7].[MessageSegments]  WITH CHECK ADD  CONSTRAINT [FK_MessageSegments_Version] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageSegments] CHECK CONSTRAINT [FK_MessageSegments_Version]
GO
ALTER TABLE [stdshl7].[MessageStructures]  WITH CHECK ADD  CONSTRAINT [FK_MessageStructures_IndustrtStds] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageStructures] CHECK CONSTRAINT [FK_MessageStructures_IndustrtStds]
GO
ALTER TABLE [stdshl7].[MessageStructures]  WITH CHECK ADD  CONSTRAINT [FK_MessageStructures_MessageTrigger] FOREIGN KEY([MessageTrigger])
REFERENCES [stdshl7].[MessageTriggers] ([MessageTrigger])
GO
ALTER TABLE [stdshl7].[MessageStructures] CHECK CONSTRAINT [FK_MessageStructures_MessageTrigger]
GO
ALTER TABLE [stdshl7].[MessageStructures]  WITH CHECK ADD  CONSTRAINT [FK_MessageStructures_MessageType] FOREIGN KEY([MessageType])
REFERENCES [stdshl7].[MessageTypes] ([MessageType])
GO
ALTER TABLE [stdshl7].[MessageStructures] CHECK CONSTRAINT [FK_MessageStructures_MessageType]
GO
ALTER TABLE [stdshl7].[MessageStructures]  WITH CHECK ADD  CONSTRAINT [FK_MessageStructures_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageStructures] CHECK CONSTRAINT [FK_MessageStructures_Status]
GO
ALTER TABLE [stdshl7].[MessageStructures]  WITH CHECK ADD  CONSTRAINT [FK_MessageStructures_Vrsn] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageStructures] CHECK CONSTRAINT [FK_MessageStructures_Vrsn]
GO
ALTER TABLE [stdshl7].[MessageTriggers]  WITH CHECK ADD  CONSTRAINT [FK_MessageTriggers_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageTriggers] CHECK CONSTRAINT [FK_MessageTriggers_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageTriggers]  WITH CHECK ADD  CONSTRAINT [FK_MessageTriggers_MessageType] FOREIGN KEY([MessageType])
REFERENCES [stdshl7].[MessageTypes] ([MessageType])
GO
ALTER TABLE [stdshl7].[MessageTriggers] CHECK CONSTRAINT [FK_MessageTriggers_MessageType]
GO
ALTER TABLE [stdshl7].[MessageTriggers]  WITH CHECK ADD  CONSTRAINT [FK_MessageTriggers_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageTriggers] CHECK CONSTRAINT [FK_MessageTriggers_Status]
GO
ALTER TABLE [stdshl7].[MessageTriggers]  WITH CHECK ADD  CONSTRAINT [FK_MessageTriggers_Vrsn] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageTriggers] CHECK CONSTRAINT [FK_MessageTriggers_Vrsn]
GO
ALTER TABLE [stdshl7].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageType_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageTypes] CHECK CONSTRAINT [FK_MessageType_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageTypes_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageTypes] CHECK CONSTRAINT [FK_MessageTypes_Status]
GO
ALTER TABLE [stdshl7].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageTypes_Version] FOREIGN KEY([Vrsn])
REFERENCES [stdshl7].[MessageVersions] ([Vrsn])
GO
ALTER TABLE [stdshl7].[MessageTypes] CHECK CONSTRAINT [FK_MessageTypes_Version]
GO
ALTER TABLE [stdshl7].[MessageVersions]  WITH CHECK ADD  CONSTRAINT [FK_MessageVersions_IndustryStd] FOREIGN KEY([IndustryStd])
REFERENCES [appRefData].[IndustryStd] ([IndustryStd])
GO
ALTER TABLE [stdshl7].[MessageVersions] CHECK CONSTRAINT [FK_MessageVersions_IndustryStd]
GO
ALTER TABLE [stdshl7].[MessageVersions]  WITH CHECK ADD  CONSTRAINT [FK_MessageVersions_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [stdshl7].[MessageVersions] CHECK CONSTRAINT [FK_MessageVersions_Status]
GO
ALTER TABLE [termData].[TermCodes]  WITH CHECK ADD  CONSTRAINT [FK_TermCodes_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [termData].[TermCodes] CHECK CONSTRAINT [FK_TermCodes_Application]
GO
ALTER TABLE [termData].[TermCodes]  WITH CHECK ADD  CONSTRAINT [FK_TermCodes_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [appRefData].[Organization] ([OrganizationID])
GO
ALTER TABLE [termData].[TermCodes] CHECK CONSTRAINT [FK_TermCodes_Organization]
GO
ALTER TABLE [termData].[TermCodes]  WITH CHECK ADD  CONSTRAINT [FK_TermsCodes_CodeSets] FOREIGN KEY([CodesetID])
REFERENCES [appRefData].[CodeSets] ([CodeSetsID])
GO
ALTER TABLE [termData].[TermCodes] CHECK CONSTRAINT [FK_TermsCodes_CodeSets]
GO
ALTER TABLE [termData].[TermCodes]  WITH CHECK ADD  CONSTRAINT [FK_TermsCodes_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [termData].[TermCodes] CHECK CONSTRAINT [FK_TermsCodes_Status]
GO
ALTER TABLE [termData].[TermCodesWithDetail]  WITH CHECK ADD  CONSTRAINT [FK_TermCodesWithDetail_Application] FOREIGN KEY([ApplicationID])
REFERENCES [appRefData].[Application] ([ApplicationID])
GO
ALTER TABLE [termData].[TermCodesWithDetail] CHECK CONSTRAINT [FK_TermCodesWithDetail_Application]
GO
ALTER TABLE [termData].[TermCodesWithDetail]  WITH CHECK ADD  CONSTRAINT [FK_TermCodesWithDetail_CodeSets] FOREIGN KEY([CodesetID])
REFERENCES [appRefData].[CodeSets] ([CodeSetsID])
GO
ALTER TABLE [termData].[TermCodesWithDetail] CHECK CONSTRAINT [FK_TermCodesWithDetail_CodeSets]
GO
ALTER TABLE [termData].[TermCodesWithDetail]  WITH CHECK ADD  CONSTRAINT [FK_TermCodesWithDetail_Organization] FOREIGN KEY([OrganizationID])
REFERENCES [appRefData].[Organization] ([OrganizationID])
GO
ALTER TABLE [termData].[TermCodesWithDetail] CHECK CONSTRAINT [FK_TermCodesWithDetail_Organization]
GO
ALTER TABLE [termData].[TermCodesWithDetail]  WITH CHECK ADD  CONSTRAINT [FK_TermCodesWithDetail_Status] FOREIGN KEY([StatusID])
REFERENCES [appRefData].[Status] ([StatusID])
GO
ALTER TABLE [termData].[TermCodesWithDetail] CHECK CONSTRAINT [FK_TermCodesWithDetail_Status]
GO
