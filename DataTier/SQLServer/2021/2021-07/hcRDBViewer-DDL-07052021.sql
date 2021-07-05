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

create table refdatagnrl.Status
(
	StatusID smallint identity
		constraint PK_RefStatus
			primary key,
	StatusDescription varchar(45) not null,
	CreatedDate date constraint DF_Status_CreatedDate default getdate()
)
go

create table refdatagnrl.AddressTypes
(
	AddressTypeId bigint identity
		constraint PK_RefAddressType
			primary key,
	AddressTypeDesc varchar(25) not null,
	CreatedDate date constraint DF_AddressTypes_CreatedDate default getdate(),
	Status smallint constraint DF_AddressTypes_Status default 1
		constraint FK_AddressTypes_Status
			references refdatagnrl.Status
)
go

create index IDX_RefAddressType
	on refdatagnrl.AddressTypes (AddressTypeId, AddressTypeDesc, CreatedDate, Status)
go

create table semanticterms.Allergens
(
	AllergensD int identity
		constraint PK_Allergens
			primary key,
	AllergyCode varchar(20),
	AllergyDesc varchar(100),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	StatusID smallint constraint DF_Allergens_StatusID default 1
		constraint FK_Allergens_Status
			references refdatagnrl.Status,
	CreatedDate date constraint DF_Allergens_CreatedDate default getdate()
)
go

create index INDX_Allergies
	on semanticterms.Allergens (AllergensD, AllergyCode, AllergyDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.AuditLoggingEventTypes
(
	AuditLoggingEventTypeId smallint identity
		constraint PK_AuditLoggingEventType
			primary key,
	AuditLoggingEventTypeDesc varchar(20),
	CreatedDate date,
	Status smallint
		constraint FK_AuditLoggingEventTypes_Status
			references refdatagnrl.Status
)
go

create index IDX_AuditLoggingEventType
	on refdatagnrl.AuditLoggingEventTypes (AuditLoggingEventTypeId, AuditLoggingEventTypeDesc, CreatedDate, Status)
go

create table semanticterms.CWETermGroups
(
	CWETermGroupId varchar(20) not null
		constraint PK_CWETermGroup
			primary key,
	CWETermGroupDesc varchar(100),
	CreatedDate date constraint DF_CWETermGroups_CreatedDate default getdate(),
	StatusID smallint constraint DF_CWETermGroups_Status default 1
		constraint FK_CWETermGroups_Status
			references refdatagnrl.Status
)
go

create index IDX_CWETermGroup
	on semanticterms.CWETermGroups (CWETermGroupId, CWETermGroupDesc)
go

create table semanticterms.CWETerms
(
	CWETermID bigint not null
		constraint PK_CWETerms
			primary key,
	Identifier varchar(20),
	TermText varchar(199),
	CWETermGroup varchar(20)
		constraint FK_CWETerms_CWETermGroup
			references semanticterms.CWETermGroups,
	AlternativeID varchar(20),
	AlternativeText varchar(199),
	AlternativeTermGroup varchar(20)
		constraint FK_CWETerms_AltTermGroup_CWETermGroup
			references semanticterms.CWETermGroups,
	CreatedDate date constraint DF_CWETerms_CreatedDate default getdate(),
	StatusID smallint constraint DF_CWETerms_Status default 1
		constraint FK_CWETerms_Status
			references refdatagnrl.Status
)
go

create index IDX_CWETerms
	on semanticterms.CWETerms (CWETermID, Identifier, TermText, CWETermGroup, AlternativeID, AlternativeText, AlternativeTermGroup, CreatedDate, StatusID)
go

create table refdatagnrl.CommunicationType
(
	CommunicationTypeID smallint identity
		constraint PK_CommunicationType
			primary key,
	CommunicationTypeDesc varchar(50),
	CreatedDate date constraint DF_CommunicationType_CreatedDate default getdate(),
	Status smallint constraint DF_CommunicationType_Status default 1
		constraint FK_CommunicationType_Status
			references refdatagnrl.Status
)
go

create index INDX_CommunicationType
	on refdatagnrl.CommunicationType (CommunicationTypeID, CommunicationTypeDesc, CreatedDate, Status)
go

create table refdatagnrl.ConfigurationSettingType
(
	ConfigurationSettingTypeID smallint identity
		constraint PK_ConfigurationSettingType_1
			primary key,
	ConfigurationSettingTypeDesc varchar(50) not null,
	CreatedDate date constraint DF_ConfigurationSettingType_CreatedDate default getdate() not null,
	Status smallint constraint DF_ConfigurationSettingType_Status default 1 not null
		constraint FK_ConfigurationSettingType_Status
			references refdatagnrl.Status
)
go

create index IX_ConfigurationSettingType
	on refdatagnrl.ConfigurationSettingType (ConfigurationSettingTypeID, ConfigurationSettingTypeDesc, CreatedDate, Status)
go

create table refdatagnrl.Countries
(
	CountryId varchar(3) not null
		constraint PK_RefCountry
			primary key,
	CountryName varchar(80) not null,
	CreatedDate date constraint DF_Countries_CreatedDate default getdate(),
	Status smallint constraint DF_Countries_Status default 1
		constraint FK_Countries_Status
			references refdatagnrl.Status
)
go

create index IDX_RefCountry
	on refdatagnrl.Countries (CountryId, CountryName, CreatedDate, Status)
go

create table refdatagnrl.Department
(
	DepartmentId varchar(8) not null
		constraint PK_Department
			primary key,
	DepartmentDesc varchar(10) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Department_CreatedDate default getdate(),
	StatusID smallint constraint DF_Department_Status default 1
		constraint FK_Department_Status
			references refdatagnrl.Status
)
go

create index IX_Department
	on refdatagnrl.Department (DepartmentId, DepartmentDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table semanticterms.Diagnosis
(
	DiagnosisCode varchar(5) not null
		constraint PK_Diagnosis
			primary key,
	DiagnosisCodeShortDesc varchar(50),
	DiagnosisCodeLongDesc varchar(125),
	IndustryVersion varchar(5),
	CreatedDate date constraint DF_Diagnosis_CreatedDate default getdate(),
	StatusID smallint constraint DF_Diagnosis_Status default 1
		constraint FK_Diagnosis_Status
			references refdatagnrl.Status
)
go

create index INDX_Diagnosis
	on semanticterms.Diagnosis (DiagnosisCode, DiagnosisCodeLongDesc, DiagnosisCodeShortDesc, IndustryVersion, CreatedDate, StatusID)
go

create table refdataclinical.Ethnicity
(
	EthnicityId varchar(5) not null
		constraint PK_Ethnicity
			primary key,
	EthnicityDesc varchar(50) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Ethnicity_CreatedDate default getdate(),
	StatusID smallint constraint DF_Ethnicity_Status default 1
		constraint FK_Ethnicity_Status
			references refdatagnrl.Status
)
go

create index IX_Ethnicity
	on refdataclinical.Ethnicity (EthnicityId, EthnicityDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.FacilityRooms
(
	FacilityRoomId varchar(8) not null
		constraint PK_FacilityRooms
			primary key,
	FacilityRoomDesc varchar(10) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_FacilityRooms_CreatedDate default getdate(),
	StatusID smallint constraint DF_FacilityRooms_Status default 1
		constraint FK_FacilityRooms_Status
			references refdatagnrl.Status,
	FacilitiesID varchar(10)
)
go

create index IX_FacilityRooms
	on refdatagnrl.FacilityRooms (FacilityRoomId, FacilityRoomDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID, FacilitiesID)
go

create table refdataclinical.FinancialClass
(
	FinancialClassId varchar(5) not null
		constraint PK_FinancialClass
			primary key,
	FinancialClassDesc varchar(50) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_FinancialClass_CreatedDate default getdate(),
	StatusID smallint constraint DF_FinancialClass_Status default 1
		constraint FK_FinancialClass_Status
			references refdatagnrl.Status
)
go

create index IX_Ethnicity
	on refdataclinical.FinancialClass (FinancialClassId, FinancialClassDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdataclinical.Genders
(
	GenderId varchar not null
		constraint PK_RefGender
			primary key,
	GenderCode varchar(10),
	GenderDesc varchar(45) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Genders_CreatedDate default getdate(),
	StatusID smallint constraint DF_Genders_Status default 1
		constraint FK_Genders_Status
			references refdatagnrl.Status
)
go

create index IX_Genders
	on refdataclinical.Genders (GenderId, GenderCode, GenderDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdataclinical.InsuranceTypes
(
	InsuranceTypeId bigint identity
		constraint PK_RefInsuranceType
			primary key,
	InsuranceTypeCode varchar(10),
	InsuranceTypeDesc varchar(30) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_InsuranceTypes_CreatedDate default getdate(),
	StatusID smallint constraint DF_InsuranceTypes_Status default 1
		constraint FK_InsuranceTypes_Status
			references refdatagnrl.Status
)
go

create index IX_InsuranceTypes
	on refdataclinical.InsuranceTypes (InsuranceTypeId, InsuranceTypeCode, InsuranceTypeDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table semanticterms.LOINC
(
	LOINCCodesetID varchar(8) not null
		constraint PK_LOINC
			primary key,
	CodesetDesc varchar(75),
	CodesetStatus varchar(10),
	CUILink varchar(8),
	Occurence varchar(2),
	Usage varchar(10),
	CreatedDate date constraint DF_LOINCCodeset_CreatedDate default getdate(),
	Status smallint constraint DF_LOINCCodeset_Status default 1
		constraint FK_LOINCCodeset_Status
			references refdatagnrl.Status
)
go

create index INDX_LOINC
	on semanticterms.LOINC (LOINCCodesetID, CUILink, Occurence, CodesetDesc, CodesetStatus, Usage, CreatedDate, Status)
go

create table refdataclinical.Languages
(
	LanguageId varchar(7) not null
		constraint PK_Languages
			primary key,
	LanguageDesc varchar(45) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Languages_CreatedDate default getdate(),
	StatusID smallint constraint DF_Languages_Status default 1
		constraint FK_Languages_Status
			references refdatagnrl.Status
)
go

create table refdataclinical.MaritalStatus
(
	MaritalStatusId varchar(5) not null
		constraint PK_MaritalStatus
			primary key,
	MaritalStatusDesc varchar(50) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_MaritalStatus_CreatedDate default getdate(),
	StatusID smallint constraint DF_MaritalStatus_Status default 1
		constraint FK_MaritalStatus_Status
			references refdatagnrl.Status
)
go

create index IX_MaritalStatus
	on refdataclinical.MaritalStatus (MaritalStatusId, MaritalStatusDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.NamePrefix
(
	NamePrefixId varchar(5) not null
		constraint PK_NamePrefix
			primary key,
	NamePrefixDesc varchar(10) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_NamePrefix_CreatedDate default getdate(),
	StatusID smallint constraint DF_NamePrefix_Status default 1
		constraint FK_NamePrefix_Status
			references refdatagnrl.Status
)
go

create index IX_NamePrefix
	on refdatagnrl.NamePrefix (NamePrefixId, NamePrefixDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.NameSuffix
(
	NameSuffixId varchar(5) not null
		constraint PK_NameSuffix
			primary key,
	NameSuffixDesc varchar(10) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_NameSuffix_CreatedDate default getdate(),
	StatusID smallint constraint DF_NameSuffix_Status default 1
		constraint FK_NameSuffix_Status
			references refdatagnrl.Status
)
go

create index IX_NameSuffix
	on refdatagnrl.NameSuffix (NameSuffixId, NameSuffixDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.OIDS
(
	OIDID varchar(50) not null
		constraint PK_OIDS
			primary key,
	OID varchar(50),
	OIDDesc varchar(499),
	CompleteOID as [OID]+'-'+[OIDDesc],
	CreatedDate date constraint DF_OIDS_CreatedDate default getdate(),
	StatusID smallint constraint DF_OIDS_StatusID default 1
		constraint FK_OIDS_Status
			references refdatagnrl.Status
)
go

create index INDX_OIDS
	on refdatagnrl.OIDS (OIDID, OID, OIDDesc, CompleteOID, CreatedDate, StatusID)
go

create table refdataclinical.OrderControlTypes
(
	OrderControlTypeId varchar(2) not null
		constraint PK_OrderControlType
			primary key,
	OrderControlTypeDesc varchar(40),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	DateCreated date constraint DF_OrderControlTypes_DateCreated default getdate(),
	StatusID smallint constraint DF_OrderControlTypes_StatusID default 1
		constraint FK_OrderControlTypes_Status
			references refdatagnrl.Status
)
go

create index IX_OrderControlType
	on refdataclinical.OrderControlTypes (OrderControlTypeId, OrderControlTypeDesc, HealthcareEntitiesID, PlatformAppsID, DateCreated, StatusID)
go

create table refdataclinical.PatientClasses
(
	PatientClassId varchar(5) not null
		constraint PK_PatientClass
			primary key,
	ClassificationDesc varchar(80) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_PatientClasses_CreatedDate default getdate(),
	StatusID smallint constraint DF_PatientClasses_Status default 1
		constraint FK_PatientClasses_Status
			references refdatagnrl.Status
)
go

create index IX_PatientClasses
	on refdataclinical.PatientClasses (PatientClassId, ClassificationDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table persondata.Persons
(
	PersonId bigint identity
		constraint PK_Person
			primary key,
	NameFirst varchar(25) not null,
	NameMiddle varchar,
	NameLast varchar(45) not null,
	NameSuffix varchar(8),
	DLN varchar(25),
	SSN varchar(12),
	CompleteName as [NameLast]+', '+[NameFirst],
	DOB date,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF__Persons__Created__51300E55 default getdate() not null,
	Status smallint constraint DF_Persons_Status default 1
		constraint FK_Persons_Status
			references refdatagnrl.Status,
	UID nvarchar(149)
)
go

create table persondata.PersonAccounts
(
	PersonAccountsID bigint identity
		constraint PK_PersonAccount
			primary key,
	PersonID bigint
		constraint FK_PersonAccount_Person
			references persondata.Persons,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	AccountNumber bigint,
	EMPI varchar(25),
	CustomAccountNumber varchar(50),
	SelfSoveriegnID uniqueidentifier constraint DF_PersonAccounts_SelfSoveriegnID default newid(),
	CreatedDate date constraint DF_PersonAccount_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonAccounts_Status default 1
		constraint FK_PersonAccount_Status
			references refdatagnrl.Status
)
go

create table clnclinterventions.Interventions
(
	InterventionID bigint identity
		constraint PK_clnclinterventions
			primary key
		constraint FK_Interventions_Interventions
			references clnclinterventions.Interventions,
	AdmitDate varchar(10),
	AdmitTime varchar(12),
	DischargeDate varchar(10),
	DischargeTime varchar(12),
	AccountID bigint
		constraint FK_Intclnclinterventions_Accounts
			references persondata.PersonAccounts,
	PersonID bigint
		constraint FK_Intclnclinterventions_Persons
			references persondata.Persons,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	StatusId smallint constraint DF_clnclinterventions_Status default 1
		constraint FK_clnclinterventions_Status
			references refdatagnrl.Status,
	DateCreated date constraint DF_clnclinterventions_DateCreated default getdate()
)
go

create table clnclinterventions.Genomics
(
	GenomicsID bigint identity
		constraint PK_Genomics
			primary key,
	clnclinterventionsID bigint
		constraint FK_Genomics_clnclinterventions
			references clnclinterventions.Interventions,
	GenomicsLink varchar(65),
	CreatedDate date constraint DF_Genomics_CreatedDate default getdate(),
	StatusID smallint constraint DF_Genomics_StatusID default 1
		constraint FK_Genomics_Status
			references refdatagnrl.Status
)
go

create index INDX_clnclinterventionss
	on clnclinterventions.Interventions (InterventionID, AdmitDate, AdmitTime, DischargeDate, DischargeTime, AccountID, PersonID, HealthcareEntitiesID, PlatformAppsID, DateCreated, StatusId)
go

create table clnclinterventions.Orders
(
	OrderNumberID bigint identity
		constraint PK_Orders
			primary key,
	clnclinterventionsID bigint
		constraint FK_Orders_clnclinterventions
			references clnclinterventions.Interventions,
	FillerOrderNumber bigint,
	FiillerGroupNumber bigint,
	OrderControlType varchar(2)
		constraint FK_Orders_OrderControlType
			references refdataclinical.OrderControlTypes,
	LineOrderID int,
	OrderingPhysicianID varchar(10),
	OrderEffectiveDate varchar(10),
	OrderControlReason varchar(20),
	OrderStatusModifier varchar(20),
	Confidentiality varchar(20),
	OrderType varchar(20),
	OrderingDevice varchar(20),
	OrderDate varchar(10),
	OrderTime varchar(10),
	OrderStatus varchar(10),
	StatusId smallint constraint DF_Orders_StatusID default 1
		constraint FK_Orders_Status
			references refdatagnrl.Status,
	CreatedDate date constraint DF_Orders_CreatedDate default getdate()
)
go

create table clnclinterventions.Observations
(
	ObservationsID bigint identity
		constraint PK_Observations
			primary key,
	clnclinterventionsID bigint
		constraint FK_Observations_ClinicalIncidents
			references clnclinterventions.Interventions,
	OrderNumberID bigint
		constraint FK_Observations_Orders
			references clnclinterventions.Orders,
	ObservationID smallint,
	LineOrderID int,
	ObservationDetailLink varchar(60),
	ObservationUnit varchar(60),
	ReferenceRange varchar(60),
	AbnormalFlags varchar(5),
	Probability varchar(5),
	AbnormalTestNature varchar(2),
	ProducerID varchar(60),
	ObservationMethod varchar(60),
	ValueType varchar(3),
	ObservationDate varchar(10),
	ObservationTime varchar(10),
	StatusId smallint constraint DF_Observations_StatusID default 1
		constraint FK_Observations_Status
			references refdatagnrl.Status,
	CreatedDate date constraint DF_Observations_CreatedDate default getdate()
)
go

create index INDX_Observations
	on clnclinterventions.Observations (ObservationsID, clnclinterventionsID, AbnormalFlags, AbnormalTestNature, ObservationDate, ObservationDetailLink, ObservationID, ObservationMethod, ObservationTime, ObservationUnit, OrderNumberID, Probability, ProducerID, ReferenceRange, ValueType, CreatedDate)
go

create index INDX_Observations1
	on clnclinterventions.Observations (ObservationsID, StatusId, LineOrderID)
go

create index INDX_Orders
	on clnclinterventions.Orders (OrderNumberID, clnclinterventionsID, Confidentiality, FiillerGroupNumber, FillerOrderNumber, OrderControlReason, OrderControlType, OrderDate, OrderEffectiveDate, OrderingDevice, OrderingPhysicianID, OrderStatus, OrderStatusModifier, OrderTime, OrderType, CreatedDate)
go

create index INDX_Orders1
	on clnclinterventions.Orders (OrderNumberID, LineOrderID, StatusId)
go

create table clnclinterventions.OrdersLabDtls
(
	clnclinterventionsOrdersToLabDtlID bigint identity
		constraint PK_OrdersLabDtls
			primary key,
	clnclinterventionsID bigint not null
		constraint FK_OrdersToLabTimes_IntCIID
			references clnclinterventions.Interventions,
	OrderNumberID bigint
		constraint FK_OrdersLabDtls_Orders
			references clnclinterventions.Orders,
	LabTimesOrderID smallint not null,
	LineOrderID int,
	Quantity varchar(20) not null,
	ExplicitTime varchar(20) not null,
	RelativeTimeUnits varchar(20) not null,
	ServiceDuration varchar(20) not null,
	DateTimeStart varchar(26) not null,
	DateTimeEnd varchar(26) not null,
	Priority varchar(250) not null,
	OccurenceDuration varchar(20) not null,
	TotalOccurences varchar(10) not null,
	StatusID smallint constraint DF_OrdersToLabTimes_StatusID default 1
		constraint FK_OrdersToLabTimes_Status
			references refdatagnrl.Status,
	CreatedDate date constraint DF_OrdersToLabTimes_CreatedDate default getdate()
)
go

create index INDX_OrdersLabDtls
	on clnclinterventions.OrdersLabDtls (clnclinterventionsOrdersToLabDtlID, clnclinterventionsID, OrderNumberID, LineOrderID, LabTimesOrderID, Quantity, Priority, RelativeTimeUnits, OccurenceDuration, ServiceDuration, DateTimeStart, DateTimeEnd, ExplicitTime, TotalOccurences, CreatedDate, StatusID)
go

create index INDX_PersonAccount
	on persondata.PersonAccounts (PersonAccountsID, AccountNumber, PersonID, CustomAccountNumber, EMPI, HealthcareEntitiesID, CreatedDate, StatusID, PlatformAppsID, SelfSoveriegnID)
go

create table persondata.PersonDemographics
(
	PersonDemogDtlsId bigint identity
		constraint PK_PersonDemographics
			primary key,
	PersonId bigint
		constraint FK_PersonDemographics_Person
			references persondata.Persons,
	PatientClassId varchar,
	AdmissionTypeId varchar(2),
	HospitalServiceId varchar(3),
	ReadmissionInd bit,
	AdmitSourceId varchar(6),
	AmbulatoryStatusId varchar(2),
	VIPIndicator bit,
	PatientTypeId varchar(2),
	FinancialClassId int,
	ExternalHealthcareEntitiesId smallint,
	RaceId varchar(6),
	EthnicityId smallint,
	MaritalStatusId varchar,
	GenderId varchar,
	ReligionId varchar(3),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_PersonDemographics_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_PersonDemographics_StatusID default 1
		constraint FK_PersonDemographics_Status
			references refdatagnrl.Status
)
go

create index [INDX_PersonDemographics ]
	on persondata.PersonDemographics (PersonDemogDtlsId, PatientClassId, AdmissionTypeId, HospitalServiceId, ReadmissionInd, AdmitSourceId, AmbulatoryStatusId, VIPIndicator, PatientTypeId, FinancialClassId)
go

create index INDX_PersonDemographics2
	on persondata.PersonDemographics (ExternalHealthcareEntitiesId, RaceId, EthnicityId, MaritalStatusId, PersonId, StatusID, GenderId, ReligionId, HealthcareEntitiesID, PlatformAppsID)
go

create table persondata.PersonEmployers
(
	PersonEmployerId bigint identity
		constraint PK_PersonEmployer
			primary key,
	PersonId bigint
		constraint FK_PersonEmployer_Person
			references persondata.Persons,
	EmployerId bigint,
	EmployerCode varchar(20),
	EmployerName varchar(50),
	EmployerAddress varchar(120),
	EmployerCityStateZip varchar(120),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	JobTitle varchar(50),
	CreatedDate date constraint DF_PersonEmployers_EntryDate default getdate(),
	StatusId smallint constraint DF_PersonEmployers_StatusId default 1
		constraint FK_PersonEmployer_Status
			references refdatagnrl.Status
)
go

create index INDX_PersonEmployer
	on persondata.PersonEmployers (PersonEmployerId, PersonId, EmployerId, EmployerName, EmployerAddress, EmployerCityStateZip, HealthcareEntitiesID, PlatformAppsID, JobTitle, CreatedDate, StatusId, EmployerCode)
go

create table persondata.PersonOptInDiagnosis
(
	PersonOptInDiagnosisID bigint identity
		constraint PK_PersonOptInDiagnosis
			primary key,
	PersonID bigint
		constraint FK_PersonOptInDiagnosis_Persons
			references persondata.Persons,
	DiagnosisCode varchar(5)
		constraint FK_PersonOptInDiagnosis_Diagnosis
			references semanticterms.Diagnosis,
	CreatedDate date constraint DF_PersonOptInDiagnosis_CreatedDate default getdate(),
	EffectiveDate date,
	ExpirationDate date,
	StatusID smallint constraint DF_PersonOptInDiagnosis_StatusID default 1
		constraint FK_PersonOptInDiagnosis_Status
			references refdatagnrl.Status
)
go

create index IX_PersonOptInDiagnosis
	on persondata.PersonOptInDiagnosis (PersonOptInDiagnosisID, PersonID, DiagnosisCode, CreatedDate, EffectiveDate, ExpirationDate, StatusID)
go

create index INDX_Person
	on persondata.Persons (PersonId, NameFirst, NameMiddle, NameLast, NameSuffix, DLN, SSN, CompleteName, CreatedDate, DOB, Status, UID, HealthcareEntitiesID, PlatformAppsID)
go

create table clnclinterventions.Pharmacy
(
	clnclinterventionsPharmacyID bigint identity
		constraint PK_Pharmacy
			primary key,
	clnclinterventionsID bigint
		constraint FK_Pharmacy_clnclinterventions
			references clnclinterventions.Interventions,
	IncidentDate date,
	LineOrderID int,
	DrugCode varchar(8),
	DrugName varchar(249),
	DrugQuantity nvarchar(12),
	ScriptDate date,
	FilledDate date,
	NPI varchar(12),
	PhysicianName varchar(99),
	CreatedDate date constraint DF_Pharmacy_CreatedDate default getdate(),
	StatusID smallint not null
		constraint FK_Pharmacy_Status
			references refdatagnrl.Status
)
go

create table refdatagnrl.PhoneTypes
(
	PhoneTypeId smallint identity
		constraint PK_RefPhoneType
			primary key,
	PhoneTypeDesc varchar(20) not null,
	CreatedDate date constraint DF_PhoneTypes_CreatedDate default getdate(),
	Status smallint constraint DF_PhoneTypes_Status default 1
		constraint FK_PhoneTypes_Status
			references refdatagnrl.Status
)
go

create table persondata.PersonPhones
(
	PersonPhoneId bigint identity
		constraint PK_PersonPhone
			primary key,
	PersonId bigint not null
		constraint FK_PersonPhone_Person
			references persondata.Persons,
	PhoneTypeId smallint not null
		constraint FK_PersonPhone_RefPhoneType
			references refdatagnrl.PhoneTypes,
	PhoneNumber varchar(12) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_PersonPhones_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonPhones_StatusID default 1
		constraint FK_PersonPhones_Status
			references refdatagnrl.Status
)
go

create index INDX_PersonPhone
	on persondata.PersonPhones (PersonPhoneId, PersonId, PhoneTypeId, PhoneNumber, CreatedDate, StatusID)
go

create index IDX_RefPhoneType
	on refdatagnrl.PhoneTypes (PhoneTypeId, PhoneTypeDesc, CreatedDate, Status)
go

create table refdataclinical.PhysicianTypes
(
	PhysicianTypeId smallint identity
		constraint PK_PhysicianType
			primary key,
	PhysicianTypeCode varchar(20),
	PhysicianTypeDesc varchar(50),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_PhysicianTypes_CreatedDate default getdate(),
	StatusID smallint constraint DF_PhysicianTypes_Status default 1
		constraint FK_PhysicianTypes_Status
			references refdatagnrl.Status
)
go

create index IX_PhysicianType
	on refdataclinical.PhysicianTypes (PhysicianTypeId, PhysicianTypeCode, PhysicianTypeDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.PlatformAppType
(
	PlatformAppTypeID smallint identity
		constraint PK_PlatformAppType
			primary key,
	PlatformAppTypeName varchar(30),
	CreatedDate date constraint DF_PlatformAppType_CreatedDate default getdate(),
	StatusID smallint constraint DF_PlatformAppType_StatusID default 1
		constraint FK_PlatformAppType_Status
			references refdatagnrl.Status
)
go

create index INDX_PlatformAppType
	on refdatagnrl.PlatformAppType (PlatformAppTypeID, PlatformAppTypeName, CreatedDate, StatusID)
go

create table semanticterms.Procedures
(
	ProcedureCode varchar(5) not null
		constraint PK_Procedures
			primary key,
	ProcedureCodeShortDesc varchar(50),
	ProcedureCodeLongDesc varchar(125),
	IndustryVersion varchar(5),
	CreatedDate date constraint DF_Procedures_CreatedDate default getdate(),
	StatusID smallint constraint DF_Procedures_Status default 1
		constraint FK_Procedures_Status
			references refdatagnrl.Status
)
go

create table persondata.PersonImmunizations
(
	PersonToImmunizationID bigint identity
		constraint PK_PersonImmunizations
			primary key,
	PersonID bigint
		constraint FK_PersonImmunizations_Persons
			references persondata.Persons,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	ImmunizationCode varchar(5)
		constraint FK_PersonImmunizations_Procedures
			references semanticterms.Procedures,
	ImmunizationDesc varchar(75),
	ImmunizationDate varchar(12),
	ImmunizationTime varchar(18),
	CreatedDate date constraint DF_PersonImmunizations_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonImmunizations_StatusID default 1
		constraint FK_PersonImmunizations_Status
			references refdatagnrl.Status
)
go

create index INDX_PersonImmunizations
	on persondata.PersonImmunizations (PersonToImmunizationID, PersonID, HealthcareEntitiesID, PlatformAppsID, ImmunizationCode, ImmunizationDesc, ImmunizationDate, ImmunizationTime, CreatedDate, StatusID)
go

create table persondata.PersonOptInProcedures
(
	PersonOptInProcedureID bigint identity
		constraint PK_PersonOptInProcedures
			primary key,
	PersonID bigint
		constraint FK_PersonOptInProcedures_Persons
			references persondata.Persons,
	ProcedureCode varchar(5)
		constraint FK_PersonOptInProcedures_Procedures
			references semanticterms.Procedures,
	CreatedDate date constraint DF_PersonOptInProcedures_CreatedDate default getdate(),
	EffectiveDate date,
	ExpirationDate date,
	StatusID smallint constraint DF_PersonOptInProcedures_StatusID default 1
		constraint FK_PersonOptInProcedures_Status
			references refdatagnrl.Status
)
go

create index IX_PersonOptInProcedures
	on persondata.PersonOptInProcedures (PersonOptInProcedureID, PersonID, ProcedureCode, CreatedDate, EffectiveDate, ExpirationDate, StatusID)
go

create index INDX_Procedures
	on semanticterms.Procedures (ProcedureCode, ProcedureCodeLongDesc, ProcedureCodeShortDesc, IndustryVersion, CreatedDate, StatusID)
go

create table refdataclinical.Races
(
	RaceId varchar(6) not null
		constraint PK_Race
			primary key,
	RaceDesc varchar(45) not null,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Races_CreatedDate default getdate(),
	StatusID smallint constraint DF_Races_Status default 1
		constraint FK_Races_Status
			references refdatagnrl.Status
)
go

create index IX_Races
	on refdataclinical.Races (RaceId, RaceDesc, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.RelationshipCategoryType
(
	RelationshipCategoryTypeID smallint identity
		constraint PK_RelationshipCategoryType
			primary key,
	RelationshipCategoryTypeDesc varchar(30),
	CreatedDate date constraint DF_RelationshipCategoryType_CreatedDate default getdate(),
	StatusId smallint constraint DF_RelationshipCategoryType_StatusId default 1
		constraint FK_RelationshipCategoryType_Status
			references refdatagnrl.Status
)
go

create table refdatagnrl.RelationshipType
(
	RelationshipTypeID smallint identity
		constraint PK_RelationshipType
			primary key,
	RelationshipTypeDesc varchar(35),
	RelationshipCategoryTypeId smallint constraint DF_RelationshipType_RelationshipCategoryTypeId default 1
		constraint FK_RelationshipType_RelationshipCategoryType
			references refdatagnrl.RelationshipCategoryType,
	CreatedDate date constraint DF_RelationshipType_CreatedDate default getdate(),
	StatusID smallint constraint DF_RelationshipType_StatusID default 1
		constraint FK_RelationshipType_Status
			references refdatagnrl.Status
)
go

create table persondata.PersonToDataRequests
(
	PersonToDataRequestsID bigint identity
		constraint PK_PersonToDataRequests
			primary key,
	PersonID bigint
		constraint FK_PersonToDataRequests_PersonsRequesting
			references persondata.Persons,
	PersonAffiliatesID bigint
		constraint FK_PersonToDataRequests_PersonsAffiliates
			references persondata.Persons,
	RelationshipTypeId smallint
		constraint FK_PersonToDataRequests_RelationshipType
			references refdatagnrl.RelationshipType,
	InitialRequestedDateTime datetime,
	RequestValidationDateTime nchar(10),
	RevocationRequestDateTime datetime,
	InitialRequestId varchar(50),
	RequestValudationId varchar(50),
	RevocationRequestId varchar(50),
	CreatedDate date constraint DF_PersonToDataRequests_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonToDataRequests_StatusID default 1
		constraint FK_PersonToDataRequests_Status
			references refdatagnrl.Status
)
go

create index IX_PersonToDataRequests
	on persondata.PersonToDataRequests (PersonToDataRequestsID, PersonID, PersonAffiliatesID, RelationshipTypeId, InitialRequestedDateTime, RequestValidationDateTime, RevocationRequestDateTime, InitialRequestId, RequestValudationId, RevocationRequestId, CreatedDate, StatusID)
go

create index INDX_RelationshipType
	on refdatagnrl.RelationshipType (RelationshipTypeID, RelationshipTypeDesc, RelationshipCategoryTypeId, CreatedDate, StatusID)
go

create table clnclinterventions.Reports
(
	ReportsID bigint identity
		constraint PK_Reports
			primary key,
	clnclinterventionsID bigint,
	OrderID bigint
		constraint FK_Reports_Orders
			references clnclinterventions.Orders,
	LineOrderID int,
	clnclinterventionsNotesLink varchar(75),
	StatusID smallint constraint DF_Transcriptions_StatusID default 1
		constraint FK_Reports_Status
			references refdatagnrl.Status,
	DateCreated date constraint DF_Transcriptions_DateCreated default getdate()
)
go

create index INDX_Reports
	on clnclinterventions.Reports (ReportsID, clnclinterventionsNotesLink, clnclinterventionsID, LineOrderID, OrderID, DateCreated, StatusID)
go

create table refdatagnrl.ResourceType
(
	ResourceTypeID smallint identity
		constraint PK_ResourceType
			primary key,
	ResourceTypeDesc varchar(20),
	CreatedDate date constraint DF_ResourceType_CreatedDate default getdate(),
	Status smallint constraint DF_ResourceType_Status default 1
		constraint FK_ResourceType_Status
			references refdatagnrl.Status
)
go

create index INDX_ResourceType
	on refdatagnrl.ResourceType (ResourceTypeID, ResourceTypeDesc, CreatedDate, Status)
go

create table clnclinterventions.RptdAllergies
(
	AllergiesID bigint identity
		constraint PK_RptdAllergies
			primary key,
	PersonId bigint
		constraint FK_RptdAllergies_Persons
			references persondata.Persons,
	AllergyCode varchar(20),
	AllergyDesc varchar(100),
	LineOrderID smallint,
	HealthcareOrgName varchar(25),
	ClinicalDateTime varchar(15),
	DateReported varchar(10),
	CreatedDate date constraint DF_Allergies_CreatedDate default getdate(),
	Status smallint constraint DF_Allergies_Status default 1
		constraint FK_RptdAllergies_Status
			references refdatagnrl.Status
)
go

create index IX_RptdAllergies
	on clnclinterventions.RptdAllergies (AllergiesID, PersonId, AllergyCode, AllergyDesc, LineOrderID, HealthcareOrgName, ClinicalDateTime, CreatedDate, DateReported, Status)
go

create table clnclinterventions.RptdClinicalAddedDetails
(
	RptdClincalAddedDetailsID bigint identity
		constraint PK_RptdClinicalAddedDetails
			primary key,
	PersonId bigint
		constraint FK_RptdClinicalAddedDetails_Person
			references persondata.Persons,
	LineOrderID smallint not null,
	HealthcareOrgName varchar(25),
	ClinicalDetailNotes varchar(256),
	ClinicalDateTime varchar(15) constraint DF_ClinicalAddedDetails_ClinicalAddedDetailsDateTime default getdate(),
	CreatedDate date constraint DF_ClinicalAddedDetails_CreatedDate default getdate(),
	StatusId smallint constraint DF_ClinicalAddedDetails_StatusID default 1
		constraint FK_RptdClinicalAddedDetails_Status
			references refdatagnrl.Status
)
go

create index IX_RptdClinicalAddedDetails
	on clnclinterventions.RptdClinicalAddedDetails (RptdClincalAddedDetailsID, PersonId, LineOrderID, HealthcareOrgName, ClinicalDetailNotes, ClinicalDateTime, CreatedDate, StatusId)
go

create table persondata.RptdCommunications
(
	RptdCommunictionID bigint identity
		constraint PK_RptdCommunications
			primary key,
	CommunicationDateTime datetime constraint DF_Communications_CommunicationDateTime default getdate(),
	CommunicationType smallint constraint DF_Communications_CommunicationType default 1
		constraint FK_RptdCommunications_CommunicationType
			references refdatagnrl.CommunicationType,
	PersonID bigint
		constraint FK_RptdCommunications_Persons
			references persondata.Persons,
	CommunicationDetails varchar(1024),
	HealthcareEntitiesId bigint,
	PlatformAppsId smallint,
	CreatedDate date constraint DF_Communications_CreatedDate default getdate(),
	StatusID smallint constraint DF_Communications_Status default 1
		constraint FK_RptdCommunications_Status
			references refdatagnrl.Status
)
go

create index INDX_RptdCommunications
	on persondata.RptdCommunications (RptdCommunictionID, CommunicationDateTime, CommunicationType, PersonID, HealthcareEntitiesId, PlatformAppsId, CreatedDate, StatusID)
go

create table persondata.RptdDeviceAssociation
(
	DeviceAssociationID bigint identity
		constraint PK_DeviceAssociation
			primary key,
	DeviceAssociationDateTime datetime constraint DF_DeviceAssociation_DeviceAssociationDateTime default getdate(),
	DeviceID varchar(50),
	PersonID bigint
		constraint FK_RptdDeviceAssociation_Person
			references persondata.Persons,
	HealthcareEntitiesId bigint,
	PlatformAppsId smallint,
	CreatedDate date constraint DF_DeviceAssociation_CreatedDate default getdate(),
	StatusId smallint constraint DF_DeviceAssociation_Status default 1
		constraint FK_RptdDeviceAssociation_Status
			references refdatagnrl.Status
)
go

create index INDX_RptdDeviceAssociation
	on persondata.RptdDeviceAssociation (DeviceAssociationID, DeviceAssociationDateTime, DeviceID, PersonID, HealthcareEntitiesId, PlatformAppsId, CreatedDate, StatusId)
go

create table clnclinterventions.RptdDiagnosis
(
	RptdDiagnosisID bigint identity
		constraint PK_RptdDiagnosis
			primary key,
	Diagnosis varchar(5)
		constraint FK_RptdDiagnosis_DiagnosisCodes
			references semanticterms.Diagnosis,
	PersonID bigint
		constraint FK_RptdDiagnosis_Person
			references persondata.Persons,
	DiagnosisDate varchar(12),
	DiagnosisTime varchar(20),
	HealthcareOrgName varchar(25),
	ClinicalDateTime varchar(15) constraint DF_Diagnosis_DiagnosisDateTime default getdate(),
	CreatedDate date constraint DF_Diagnosis_CreatedDate default getdate(),
	StatusId smallint constraint DF_Diagnosis_StatusID default 1
		constraint FK_RptdDiagnosis_Status
			references refdatagnrl.Status
)
go

create index IX_RptdDiagnosis
	on clnclinterventions.RptdDiagnosis (RptdDiagnosisID, Diagnosis, PersonID, DiagnosisDate, DiagnosisTime, HealthcareOrgName, ClinicalDateTime, CreatedDate, StatusId)
go

create table persondata.RptdHeightsWeights
(
	RptdHeightWeightID bigint identity
		constraint PK_RptdHeightWeights
			primary key,
	PersonD bigint
		constraint FK_RptdHeightsWeights_Persons
			references persondata.Persons,
	DateReported varchar(10),
	TimeReported varchar(10),
	Height smallint,
	Weight smallint,
	WeightFactor nchar(10) constraint DF_clnclinterventionssHeightWeight_WeightFactor default N'clnclinterventionsWeight*.45',
	HeightFactor nchar(10) constraint DF_clnclinterventionssHeightWeight_HeightFactor default N'SQUARE(clnclinterventionsHeight*.025)',
	CalculatedBMI nchar(10) constraint DF_clnclinterventionssHeightWeight_CalculatedBMI default N'WeightFactor/HeightFactor',
	HealthcareEntitiesId bigint,
	PlatformAppsId smallint,
	StatusId smallint constraint DF_HeightWeights_StatusID default 1
		constraint FK_RptdHeightWeights_Status
			references refdatagnrl.Status,
	CreatedDate date constraint DF_HeightWeights_CreatedDate default getdate()
)
go

create index INDX_RptdHeightsWeights
	on persondata.RptdHeightsWeights (RptdHeightWeightID, PersonD, DateReported, TimeReported, Height, Weight, HeightFactor, WeightFactor, CalculatedBMI, HealthcareEntitiesId, PlatformAppsId, CreatedDate, StatusId)
go

create table clnclinterventions.RptdProcedures
(
	RptdProceduresID bigint identity
		constraint PK_RptdProcedures
			primary key,
	ProcedureCode varchar(5),
	ProcedureDesc varchar(99),
	PersonID bigint
		constraint FK_RptdProcedures_Person
			references persondata.Persons,
	HealthcareOrgName varchar(25),
	ProcedureDate varchar(12),
	ProcedureTime varchar(16),
	DateCreated date constraint DF_Procedures_DateCreated default getdate(),
	StatusId smallint constraint DF_Procedures_Status default 1
		constraint FK_RptdProcedures_Status
			references refdatagnrl.Status
)
go

create index IX_RptdProcedures
	on clnclinterventions.RptdProcedures (RptdProceduresID, ProcedureCode, ProcedureDesc, PersonID, HealthcareOrgName, ProcedureDate, ProcedureTime, DateCreated, StatusId)
go

create table semanticterms.RxNorms
(
	RXNormId varchar(8) not null
		constraint PK_RxNorm
			primary key,
	LAT varchar(3) default 'ENG' not null,
	RxNormDesc varchar(3000) not null,
	CreatedDate date constraint DF_RxNorms_CreatedDate default getdate(),
	StatusID smallint constraint DF_RxNorms_Status default 1
		constraint FK_RxNorms_Status
			references refdatagnrl.Status
)
go

create index INDX_RxNorm
	on semanticterms.RxNorms (RXNormId, LAT, CreatedDate, StatusID)
go

create table semanticterms.SnomedCodeset
(
	SnomedCodesetID varchar(8) not null
		constraint PK_SnomedCodeset
			primary key,
	CodesetDesc varchar(75),
	CodesetStatus varchar(10),
	CUILink varchar(8),
	Occurence varchar(2),
	Usage varchar(10),
	CreatedDate date constraint DF_SnomedCodeset_CreatedDate default getdate(),
	Status smallint constraint DF_SnomedCodeset_Status default 1
		constraint FK_SnomedCodeset_Status
			references refdatagnrl.Status
)
go

create index INDX_SnomedCodeset
	on semanticterms.SnomedCodeset (SnomedCodesetID, CUILink, Occurence, CodesetDesc, CodesetStatus, Usage, CreatedDate, Status)
go

create table semanticterms.SnomedProblems
(
	ProblemID varchar(8) not null
		constraint PK_SnomedProblems
			primary key,
	ProblemDesc varchar(75),
	ProblemIDStatus varchar(10),
	CUILink varchar(8),
	Occurence varchar(2),
	Usage varchar(10),
	CreatedDate date constraint DF_SnomedProblems_CreatedDate default getdate(),
	Status smallint constraint DF_SnomedProblems_Status default 1
		constraint FK_SnomedProblems_Status
			references refdatagnrl.Status
)
go

create table persondata.RptdProblems
(
	RptdPersonProblemID bigint identity
		constraint PK_PersonProblems
			primary key,
	PersonID bigint
		constraint FK_RptdPersonProblems_Person
			references persondata.Persons,
	ProblemID varchar(8)
		constraint FK_RptdPersonProblems_Problem
			references semanticterms.SnomedProblems,
	ProblemDesc varchar(50),
	HealthcareOrgName varchar(25),
	ClinicalDateTime varchar(15),
	CreatedDate date constraint DF__PersonPro__DateP__0F4D3C5F default getdate(),
	StatusId smallint constraint DF__PersonPro__Statu__10416098 default 1
		constraint FK_RptdmedicaldtlsProblems_Status
			references refdatagnrl.Status
)
go

create index INDX_SnomedProblems
	on semanticterms.SnomedProblems (ProblemID, CUILink, Occurence, ProblemDesc, ProblemIDStatus, Usage)
go

create table refdatagnrl.States
(
	StateId varchar(2) not null
		constraint PK_State
			primary key,
	StateDescription varchar(65) not null,
	CreatedDate date constraint DF_States_CreatedDate default getdate(),
	Status smallint constraint DF_States_Status default 1
		constraint FK_States_Status
			references refdatagnrl.Status
)
go

create table refdataclinical.Employers
(
	EmployerId bigint identity
		constraint PK_Employer
			primary key,
	EmployerExternalId varchar(10),
	EmployerName varchar(45),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2)
		constraint FK_Employer_State
			references refdatagnrl.States,
	CountryId varchar(3)
		constraint FK_Employer_Country
			references refdatagnrl.Countries,
	Zipcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Employers_CreatedDate default getdate(),
	StatusID smallint constraint DF_Employers_Status default 1
		constraint FK_Employers_Status
			references refdatagnrl.Status
)
go

create index IX_Employer
	on refdataclinical.Employers (EmployerId, EmployerExternalId, EmployerName, Address, Address2, City, StateId, Zipcode, PhoneNumber, FaxNumber, CountryId)
go

create index IX_Employers1
	on refdataclinical.Employers (EmployerId, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.Facilities
(
	FacilitiesID varchar(12) not null
		constraint PK_HealthcareEntities
			primary key,
	FacilitiesName varchar(25),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(40),
	State varchar(2)
		constraint FK_HealthcareEntities_States
			references refdatagnrl.States,
	Country varchar(3)
		constraint FK_HealthcareEntities_Countries
			references refdatagnrl.Countries,
	PostalCode varchar(12) not null,
	Notes varchar(256),
	LicenseNumber varchar(20),
	LicenseType varchar(20),
	LicensedState varchar(2)
		constraint FK_HealthcareEntities_StatesLicensed
			references refdatagnrl.States,
	OIDID varchar(50),
	CreatedDate date constraint DF_Facilities_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_Facilities_Status default 1
		constraint FK_HealthcareEntities_Status
			references refdatagnrl.Status
)
go

create index IX_Facilities
	on refdatagnrl.Facilities (FacilitiesID, FacilitiesName, Address, Address2, City, State, PostalCode, Country, Notes, CreatedDate, StatusID, LicenseNumber, LicensedState, OIDID)
go

create table refdataclinical.Insurances
(
	InsuranceId int identity
		constraint PK_Insurance
			primary key,
	InsuranceExternalId varchar(10),
	InsuranceCompanyName varchar(99),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2)
		constraint FK_Insurance_State
			references refdatagnrl.States,
	Postalcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	InsCompanyTypeId bigint
		constraint FK_Insurance_InsuranceType
			references refdataclinical.InsuranceTypes,
	CountryId varchar(3)
		constraint FK_Insurance_Country
			references refdatagnrl.Countries,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_Insurances_CreatedDate default getdate(),
	StatusID smallint constraint DF_Insurances_StatusID default 1
		constraint FK_Insurances_Status
			references refdatagnrl.Status
)
go

create index IX_Insurance
	on refdataclinical.Insurances (InsuranceId, InsuranceExternalId, InsuranceCompanyName, Address, Address2, City, StateId, Postalcode, PhoneNumber, FaxNumber, InsCompanyTypeId, CountryId, HealthcareEntitiesID, PlatformAppsID, CreatedDate, StatusID)
go

create table refdatagnrl.Organization
(
	OrganizationID varchar(12) not null
		constraint PK_Organization
			primary key,
	OrganizationName varchar(25),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(40),
	State varchar(2)
		constraint FK_Organization_States
			references refdatagnrl.States,
	Country varchar(3)
		constraint FK_Organization_Countries
			references refdatagnrl.Countries,
	PostalCode varchar(12) not null,
	Notes varchar(256),
	LicenseNumber varchar(20),
	LicenseType varchar(20),
	LicensedState varchar(2)
		constraint FK_Organization_StatesLicensed
			references refdatagnrl.States,
	IncorporatedState varchar(2)
		constraint FK_Organization_StatesIncorporated
			references refdatagnrl.States,
	OIDID varchar(50),
	CreatedDate date constraint DF_Organization_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_Organization_Status default 1
		constraint FK_Organization_Status
			references refdatagnrl.Status
)
go

create index IX_Organization
	on refdatagnrl.Organization (OrganizationID, OrganizationName, Address, Address2, City, State, PostalCode, Country, Notes, CreatedDate, StatusID, LicenseNumber, LicensedState, OIDID, IncorporatedState)
go

create table persondata.PersonAddresses
(
	PersonAddressId bigint identity
		constraint PK_PersonAddress
			primary key,
	PersonId bigint
		constraint FK_PersonAddress_Person
			references persondata.Persons,
	Address varchar(65),
	Address2 varchar(25),
	City varchar(45),
	StateId varchar(2)
		constraint FK_PersonAddress_State
			references refdatagnrl.States,
	PostalCode varchar(12),
	CountryId varchar(3)
		constraint FK_PersonAddress_Country
			references refdatagnrl.Countries,
	AddressTypeId bigint
		constraint FK_PersonAddresses_AddressTypes
			references refdatagnrl.AddressTypes,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date constraint DF_PersonAddresses_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonAddresses_Status default 1
		constraint FK_PersonAddresses_Status
			references refdatagnrl.Status
)
go

create index IDX_PersonAddress
	on persondata.PersonAddresses (PersonAddressId, PersonId, Address, Address2, City, StateId, PostalCode, AddressTypeId, CountryId, CreatedDate, StatusID, HealthcareEntitiesID, PlatformAppsID)
go

create table refdataclinical.Physicians
(
	PhysicianId int not null
		constraint PK_Physician
			primary key,
	PhysicianExternalId varchar(10),
	CompleteName as [Name_Last]+', '+[Name_First],
	Name_First varchar(45),
	Name_Middle varchar(45),
	Name_Last varchar(45),
	NPI varchar(12),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2)
		constraint FK_Physician_State
			references refdatagnrl.States,
	Postalcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	MobileNumber varchar(12),
	HCEntitiesID bigint,
	PlatformAppID smallint,
	CountryId varchar(3)
		constraint FK_Physician_Country
			references refdatagnrl.Countries,
	DateCreated date constraint DF_Physicians_DateCreated default getdate(),
	StatusID smallint constraint DF_Physicians_StatusID default 1
		constraint FK_Physicians_Status
			references refdatagnrl.Status
)
go

create index IX_Physician
	on refdataclinical.Physicians (PhysicianId, PhysicianExternalId, Name_First, Name_Middle, Name_Last, NPI, Address, CountryId, MobileNumber, FaxNumber, PhoneNumber, Postalcode, StateId, City, Address2, DateCreated)
go

create index IX_Physicians1
	on refdataclinical.Physicians (PhysicianId, StatusID, CompleteName, HCEntitiesID, PlatformAppID)
go

create index IDX_States
	on refdatagnrl.States (StateId, StateDescription, CreatedDate, Status)
go

create index IDX_RefStatus
	on refdatagnrl.Status (StatusID, StatusDescription, CreatedDate)
go

create table clnclinterventions.Vitals
(
	VitalsID bigint identity
		constraint PK_VitalsInt
			primary key,
	clnclinterventionsID bigint,
	LineOrderID int,
	BPSystolic int not null
		constraint CK_clnclinterventionssVitals_BPSystolic
			check ([BPSystolic]>=0 AND [BPSystolic]<=300),
	BPDiastolic int
		constraint CK_clnclinterventionssVitals_BPDiastolic
			check ([BPDiastolic]>=0 AND [BPDiastolic]<=300),
	BPDate date,
	BPTime time,
	ProcessdDateTime datetime constraint DF__CareIncid__Proce__40257DE4 default getdate(),
	StatusID smallint constraint DF_Vitals_StatusID default 1
		constraint FK_Vitals_Status
			references refdatagnrl.Status,
	DateCreated date constraint DF_Vitals_DateCreated default getdate()
)
go

create index INDX_Vitals
	on clnclinterventions.Vitals (VitalsID, clnclinterventionsID, BPDate, BPDiastolic, BPSystolic, BPTime, ProcessdDateTime, StatusID, DateCreated, LineOrderID)
go

