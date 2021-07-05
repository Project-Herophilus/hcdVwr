create table refdatagnrl.Statuses
(
	StatusID smallint identity
		constraint PK_Status
			primary key,
	StatusDescription varchar(45) not null,
	CreatedDate date constraint DF_Status_CreatedDate default getdate()
)
go

create table refdatagnrl.AddressType
(
	AddressTypeId bigint identity
		constraint PK_AddressType
			primary key,
	AddressTypeDesc varchar(25) not null,
	CreatedDate date constraint DF_AddressTypes_CreatedDate default getdate(),
	Status smallint constraint DF_AddressTypes_Status default 1
		constraint FK_AddressTypes_Status
			references refdatagnrl.Statuses
)
go

create index IX_AddressType
	on refdatagnrl.AddressType (AddressTypeId, AddressTypeDesc, CreatedDate, Status)
go

create table refdatagnrl.Application
(
	ApplicationID varchar(12) not null
		constraint PK_Application
			primary key,
	ApplicationName varchar(35),
	CreatedDate date default getdate(),
	StatusID smallint default 1
		constraint FK_Application_Statuses
			references refdatagnrl.Statuses
)
go

create index IX_Application
	on refdatagnrl.Application (ApplicationID, ApplicationName, CreatedDate, StatusID)
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
			references refdatagnrl.Statuses
)
go

create index IX_CWETermGroup
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
			references refdatagnrl.Statuses
)
go

create index IX_CWETerms
	on semanticterms.CWETerms (CWETermID, Identifier, TermText, CWETermGroup, AlternativeID, AlternativeText, AlternativeTermGroup, CreatedDate, StatusID)
go

create table refdatagnrl.CommunicationType
(
	CommunicationTypeID smallint identity
		constraint PK_CommunicationType
			primary key,
	CommunicationTypeDesc varchar(50),
	CreatedDate date constraint DF_CommunicationType_CreatedDate default getdate(),
	StatusID smallint constraint DF_CommunicationType_Status default 1
		constraint FK_CommunicationType_Status
			references refdatagnrl.Statuses
)
go

create index IX_CommunicationType
	on refdatagnrl.CommunicationType (CommunicationTypeID, CommunicationTypeDesc, CreatedDate, StatusID)
go

create table refdatagnrl.ConfigurationSettingType
(
	ConfigurationSettingTypeID smallint identity
		constraint PK_ConfigurationSettingType_1
			primary key,
	ConfigurationSettingTypeDesc varchar(50) not null,
	CreatedDate date constraint DF_ConfigurationSettingType_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_ConfigurationSettingType_Status default 1 not null
		constraint FK_ConfigurationSettingType_Status
			references refdatagnrl.Statuses
)
go

create index IX_ConfigurationSettingType
	on refdatagnrl.ConfigurationSettingType (ConfigurationSettingTypeID, ConfigurationSettingTypeDesc, CreatedDate, StatusID)
go

create table refdatagnrl.Countries
(
	CountryID varchar(3) not null
		constraint PK_Country
			primary key,
	CountryName varchar(80) not null,
	CreatedDate date constraint DF_Countries_CreatedDate default getdate(),
	StatusID smallint constraint DF_Countries_Status default 1
		constraint FK_Countries_Status
			references refdatagnrl.Statuses
)
go

create index IX_Country
	on refdatagnrl.Countries (CountryID, CountryName, CreatedDate, StatusID)
go

create table refdatagnrl.DemographicInfoType
(
	DemographicInfoTypeID smallint identity
		constraint PK_DemographicInfoType
			primary key,
	DemographicInfoTypeDesc varchar(50),
	CreatedDate date constraint DF_DemographicInfoType_CreatedDate default getdate(),
	StatusID smallint constraint DF_DemographicInfoType_StatusID default 1
		constraint FK_DemographicInfoType_Statuses
			references refdatagnrl.Statuses
)
go

create index IX_DemographicInfoType
	on refdatagnrl.DemographicInfoType (DemographicInfoTypeID, DemographicInfoTypeDesc, CreatedDate, StatusID)
go

create table refdatagnrl.Department
(
	DepartmentID varchar(8) not null
		constraint PK_Department
			primary key,
	DepartmentDesc varchar(10) not null,
	CreatedDate date constraint DF_Department_CreatedDate default getdate(),
	StatusID smallint constraint DF_Department_Status default 1
		constraint FK_Department_Status
			references refdatagnrl.Statuses
)
go

create index IX_Department
	on refdatagnrl.Department (DepartmentID, DepartmentDesc, CreatedDate, StatusID)
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
			references refdatagnrl.Statuses
)
go

create index IX_Diagnosis
	on semanticterms.Diagnosis (DiagnosisCode, DiagnosisCodeLongDesc, DiagnosisCodeShortDesc, IndustryVersion, CreatedDate, StatusID)
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
			references refdatagnrl.Statuses
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
	StatusID smallint constraint DF_LOINCCodeset_Status default 1
		constraint FK_LOINCCodeset_Status
			references refdatagnrl.Statuses
)
go

create index IX_LOINC
	on semanticterms.LOINC (LOINCCodesetID, CUILink, Occurence, CodesetDesc, CodesetStatus, Usage, CreatedDate, StatusID)
go

create table refdatagnrl.NamePrefix
(
	NamePrefixId varchar(5) not null
		constraint PK_NamePrefix
			primary key,
	NamePrefixDesc varchar(10) not null,
	CreatedDate date constraint DF_NamePrefix_CreatedDate default getdate(),
	StatusID smallint constraint DF_NamePrefix_Status default 1
		constraint FK_NamePrefix_Status
			references refdatagnrl.Statuses
)
go

create index IX_NamePrefix
	on refdatagnrl.NamePrefix (NamePrefixId, NamePrefixDesc, CreatedDate, StatusID)
go

create table refdatagnrl.NameSuffix
(
	NameSuffixId varchar(5) not null
		constraint PK_NameSuffix
			primary key,
	NameSuffixDesc varchar(10) not null,
	CreatedDate date constraint DF_NameSuffix_CreatedDate default getdate(),
	StatusID smallint constraint DF_NameSuffix_Status default 1
		constraint FK_NameSuffix_Status
			references refdatagnrl.Statuses
)
go

create index IX_NameSuffix
	on refdatagnrl.NameSuffix (NameSuffixId, NameSuffixDesc, CreatedDate, StatusID)
go

create table refdatagnrl.OIDS
(
	OIDID varchar(50) not null
		constraint PK_OIDS
			primary key,
	OIDDesc varchar(499),
	CreatedDate date constraint DF_OIDS_CreatedDate default getdate(),
	StatusID smallint constraint DF_OIDS_StatusID default 1
		constraint FK_OIDS_Status
			references refdatagnrl.Statuses
)
go

create index IX_OIDS
	on refdatagnrl.OIDS (OIDID, OIDDesc, CreatedDate, StatusID)
go

create table refdatagnrl.PhoneType
(
	PhoneTypeId smallint identity
		constraint PK_PhoneType
			primary key,
	PhoneTypeDesc varchar(20) not null,
	CreatedDate date constraint DF_PhoneTypes_CreatedDate default getdate(),
	StatusID smallint constraint DF_PhoneTypes_Status default 1
		constraint FK_PhoneTypes_Status
			references refdatagnrl.Statuses
)
go

create index IX_PhoneType
	on refdatagnrl.PhoneType (PhoneTypeId, PhoneTypeDesc, CreatedDate, StatusID)
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
			references refdatagnrl.Statuses
)
go

create index IX_PlatformAppType
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
			references refdatagnrl.Statuses
)
go

create index IX_Procedures
	on semanticterms.Procedures (ProcedureCode, ProcedureCodeLongDesc, ProcedureCodeShortDesc, IndustryVersion, CreatedDate, StatusID)
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
			references refdatagnrl.Statuses
)
go

create index IX_RelationshipCategoryType
	on refdatagnrl.RelationshipCategoryType (RelationshipCategoryTypeID, RelationshipCategoryTypeDesc, CreatedDate, StatusId)
go

create table refdatagnrl.RelationshipType
(
	RelationshipTypeID smallint identity
		constraint PK_RelationshipType
			primary key,
	RelationshipTypeDesc varchar(35),
	RelationshipCategoryTypeID smallint constraint DF_RelationshipType_RelationshipCategoryTypeId default 1
		constraint FK_RelationshipType_RelationshipCategoryType
			references refdatagnrl.RelationshipCategoryType,
	CreatedDate date constraint DF_RelationshipType_CreatedDate default getdate(),
	StatusID smallint constraint DF_RelationshipType_StatusID default 1
		constraint FK_RelationshipType_Status
			references refdatagnrl.Statuses
)
go

create index IX_RelationshipType
	on refdatagnrl.RelationshipType (RelationshipTypeID, RelationshipTypeDesc, RelationshipCategoryTypeID, CreatedDate, StatusID)
go

create table refdatagnrl.ResourceType
(
	ResourceTypeID smallint identity
		constraint PK_ResourceType
			primary key,
	ResourceTypeDesc varchar(20),
	CreatedDate date constraint DF_ResourceType_CreatedDate default getdate(),
	StatusID smallint constraint DF_ResourceType_Status default 1
		constraint FK_ResourceType_Status
			references refdatagnrl.Statuses
)
go

create index IX_ResourceType
	on refdatagnrl.ResourceType (ResourceTypeID, ResourceTypeDesc, CreatedDate, StatusID)
go

create table semanticterms.RxNorms
(
	RXNormID varchar(8) not null
		constraint PK_RxNorm
			primary key,
	LAT varchar(3) default 'ENG' not null,
	RxNormDesc varchar(3000) not null,
	CreatedDate date constraint DF_RxNorms_CreatedDate default getdate(),
	StatusID smallint constraint DF_RxNorms_Status default 1
		constraint FK_RxNorms_Status
			references refdatagnrl.Statuses
)
go

create index IX_RxNorm
	on semanticterms.RxNorms (RXNormID, LAT, CreatedDate, StatusID)
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
	StatusID smallint constraint DF_SnomedCodeset_Status default 1
		constraint FK_SnomedCodeset_Status
			references refdatagnrl.Statuses
)
go

create index IX_SnomedCodeset
	on semanticterms.SnomedCodeset (SnomedCodesetID, CUILink, Occurence, CodesetDesc, CodesetStatus, Usage, CreatedDate, StatusID)
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
	StatusID smallint constraint DF_SnomedProblems_Status default 1
		constraint FK_SnomedProblems_Status
			references refdatagnrl.Statuses
)
go

create index IX_SnomedProblems
	on semanticterms.SnomedProblems (ProblemID, CUILink, Occurence, ProblemDesc, ProblemIDStatus, Usage)
go

create index IX_Status
	on refdatagnrl.Statuses (StatusID, StatusDescription, CreatedDate)
go

create table refdatagnrl.USStates
(
	StateID varchar(2) not null
		constraint PK_State
			primary key,
	StateDescription varchar(65) not null,
	CreatedDate date constraint DF_States_CreatedDate default getdate(),
	StatusID smallint constraint DF_States_Status default 1
		constraint FK_States_Status
			references refdatagnrl.Statuses
)
go

create table refdatagnrl.Facilities
(
	FacilitiesID varchar(12) not null
		constraint PK_Facilities
			primary key,
	FacilitiesName varchar(25),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(40),
	State varchar(2)
		constraint FK_Facilities_States
			references refdatagnrl.USStates,
	CountryID varchar(3)
		constraint FK_Facilities_Countries
			references refdatagnrl.Countries,
	PostalCode varchar(12) not null,
	Notes varchar(256),
	LicenseNumber varchar(20),
	LicenseType varchar(20),
	LicensedState varchar(2)
		constraint FK_Facilities_StatesLicensed
			references refdatagnrl.USStates,
	OIDID varchar(50),
	CreatedDate date constraint DF_Facilities_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_Facilities_Status default 1
		constraint FK_Facilities_Status
			references refdatagnrl.Statuses
)
go

create table semanticterms.Allergens
(
	AllergensD varchar(10) not null
		constraint PK_Allergens
			primary key,
	AllergyCode varchar(20),
	AllergyDesc varchar(100),
	TreatingFacilityID varchar(12)
		constraint FK_Allergens_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_Allergens_Application
			references refdatagnrl.Application,
	CreatedDate date constraint DF_Allergens_CreatedDate default getdate(),
	StatusID smallint constraint DF_Allergens_StatusID default 1
		constraint FK_Allergens_Status
			references refdatagnrl.Statuses
)
go

create index IX_Allergies
	on semanticterms.Allergens (AllergensD, AllergyCode, AllergyDesc, TreatingFacilityID, PlatformAppID, CreatedDate, StatusID)
go

create table refdataclinical.Employers
(
	EmployerID uniqueidentifier not null
		constraint PK_Employer
			primary key,
	EmployeeCode varchar(20),
	EmployerExternalID varchar(10),
	EmployerName varchar(45),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateID varchar(2)
		constraint FK_Employer_State
			references refdatagnrl.USStates,
	CountryID varchar(3)
		constraint FK_Employer_Country
			references refdatagnrl.Countries,
	Zipcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	TreatingFacilityID varchar(12)
		constraint FK_Employers_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_Employers_Application
			references refdatagnrl.Application,
	CreatedDate date constraint DF_Employers_CreatedDate default getdate(),
	StatusID smallint constraint DF_Employers_Status default 1
		constraint FK_Employers_Status
			references refdatagnrl.Statuses
)
go

create index IX_Employer
	on refdataclinical.Employers (EmployerID, EmployerExternalID, EmployerName, Address, Address2, City, StateID, Zipcode, PhoneNumber, FaxNumber, CountryID, CreatedDate, EmployeeCode, PlatformAppID, StatusID, TreatingFacilityID)
go

create index IX_Facilities
	on refdatagnrl.Facilities (FacilitiesID, FacilitiesName, Address, Address2, City, State, PostalCode, CountryID, Notes, CreatedDate, StatusID, LicenseNumber, LicensedState, OIDID)
go

create table refdatagnrl.FacilityRooms
(
	FacilityRoomId varchar(8) not null
		constraint PK_FacilityRooms
			primary key,
	FacilityRoomDesc varchar(10) not null,
	CreatedDate date constraint DF_FacilityRooms_CreatedDate default getdate(),
	StatusID smallint constraint DF_FacilityRooms_Status default 1
		constraint FK_FacilityRooms_Status
			references refdatagnrl.Statuses,
	TreatingFacilitiesID varchar(12)
		constraint FK_FacilityRooms_Facilities
			references refdatagnrl.Facilities
)
go

create index IX_FacilityRooms
	on refdatagnrl.FacilityRooms (FacilityRoomId, FacilityRoomDesc, TreatingFacilitiesID, CreatedDate, StatusID)
go

create table refdataclinical.Genders
(
	GenderId uniqueidentifier not null
		constraint PK_RefGender
			primary key,
	GenderValue varchar,
	GenderCode varchar(10),
	GenderDesc varchar(45) not null,
	TreatingFacilityID varchar(12)
		constraint FK_Genders_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_Genders_Application
			references refdatagnrl.Application,
	CreatedDate date constraint DF_Genders_CreatedDate default getdate(),
	StatusID smallint constraint DF_Genders_Status default 1
		constraint FK_Genders_Status
			references refdatagnrl.Statuses
)
go

create index IX_Genders
	on refdataclinical.Genders (GenderId, GenderCode, GenderDesc, TreatingFacilityID, PlatformAppID, CreatedDate, StatusID, GenderValue)
go

create table refdataclinical.Insurances
(
	InsuranceId uniqueidentifier not null
		constraint PK_Insurance
			primary key,
	InsuranceExternalId varchar(10),
	InsuranceCompanyName varchar(99),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2)
		constraint FK_Insurance_State
			references refdatagnrl.USStates,
	Postalcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	InsCompanyTypeId bigint
		constraint FK_Insurance_InsuranceType
			references refdataclinical.InsuranceTypes,
	CountryId varchar(3)
		constraint FK_Insurance_Country
			references refdatagnrl.Countries,
	TreatingFacilitiesID varchar(12)
		constraint FK_Insurances_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_Insurances_Application
			references refdatagnrl.Application,
	CreatedDate date constraint DF_Insurances_CreatedDate default getdate(),
	StatusID smallint constraint DF_Insurances_StatusID default 1
		constraint FK_Insurances_Status
			references refdatagnrl.Statuses
)
go

create index IX_Insurance
	on refdataclinical.Insurances (InsuranceId, InsuranceExternalId, InsuranceCompanyName, Address, Address2, City, StateId, Postalcode, PhoneNumber, FaxNumber, InsCompanyTypeId, CountryId, TreatingFacilitiesID, PlatformAppID, CreatedDate, StatusID)
go

create table refdataclinical.OrderControlTypes
(
	OrderControlTypeId uniqueidentifier not null
		constraint PK_OrderControlType
			primary key,
	OrderControlTypeCode varchar(2),
	OrderControlTypeDesc varchar(40),
	TreatingFacilityID varchar(12)
		constraint FK_OrderControlTypes_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_OrderControlTypes_Application
			references refdatagnrl.Application,
	DateCreated date constraint DF_OrderControlTypes_DateCreated default getdate(),
	StatusID smallint constraint DF_OrderControlTypes_StatusID default 1
		constraint FK_OrderControlTypes_Status
			references refdatagnrl.Statuses
)
go

create index IX_OrderControlType
	on refdataclinical.OrderControlTypes (OrderControlTypeId, OrderControlTypeDesc, TreatingFacilityID, PlatformAppID, DateCreated, StatusID, OrderControlTypeCode)
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
			references refdatagnrl.USStates,
	Country varchar(3)
		constraint FK_Organization_Countries
			references refdatagnrl.Countries,
	PostalCode varchar(12) not null,
	Notes varchar(256),
	LicenseNumber varchar(20),
	LicenseType varchar(20),
	LicensedState varchar(2)
		constraint FK_Organization_StatesLicensed
			references refdatagnrl.USStates,
	IncorporatedState varchar(2)
		constraint FK_Organization_StatesIncorporated
			references refdatagnrl.USStates,
	OIDID varchar(50),
	CreatedDate date constraint DF_Organization_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_Organization_Status default 1
		constraint FK_Organization_Status
			references refdatagnrl.Statuses
)
go

create index IX_Organization
	on refdatagnrl.Organization (OrganizationID, OrganizationName, Address, Address2, City, State, PostalCode, Country, Notes, CreatedDate, StatusID, LicenseNumber, LicensedState, OIDID, IncorporatedState)
go

create table persondata.Person
(
	PersonId bigint identity
		constraint PK_Person
			primary key,
	NameFirst varchar(35) not null,
	NameMiddle varchar,
	NameLast varchar(50) not null,
	NameSuffix varchar(8),
	CompleteName as [NameLast]+', '+[NameFirst],
	DLN varchar(25),
	DLSState varchar(2),
	SSN varchar(12),
	DOB varchar(14),
	TreatmentFacilityID varchar(12)
		constraint FK_Person_Facilities
			references refdatagnrl.Facilities,
	PlatformAppsID varchar(12)
		constraint FK_Person_Application
			references refdatagnrl.Application,
	UID varchar(149),
	CreatedDate date constraint DF__Persons__Created__51300E55 default getdate() not null,
	Status smallint constraint DF_Persons_Status default 1
		constraint FK_Person_Status
			references refdatagnrl.Statuses
)
go

create table persondata.ExtrnlCommunications
(
	ExtrnlCommunictionID bigint identity
		constraint PK_RptdCommunications
			primary key,
	PersonID bigint
		constraint FK_RptdCommunications_Persons
			references persondata.Person,
	CommunicationDateTime datetime constraint DF_Communications_CommunicationDateTime default getdate(),
	CommunicationType smallint constraint DF_Communications_CommunicationType default 1
		constraint FK_RptdCommunications_CommunicationType
			references refdatagnrl.CommunicationType,
	CommunicationDetails varchar(1024),
	CreatedDate date constraint DF_Communications_CreatedDate default getdate(),
	StatusID smallint constraint DF_Communications_Status default 1
		constraint FK_RptdCommunications_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdCommunications
	on persondata.ExtrnlCommunications (ExtrnlCommunictionID, PersonID, CommunicationType, CommunicationDateTime, CreatedDate, StatusID)
go

create table persondata.ExtrnlDeviceAssociation
(
	DeviceAssociationID bigint identity
		constraint PK_ExtrnlDeviceAssociation
			primary key,
	PersonID bigint
		constraint FK_RptdDeviceAssociation_Person
			references persondata.Person,
	DeviceAssociationDateTime datetime constraint DF_DeviceAssociation_DeviceAssociationDateTime default getdate(),
	DeviceID varchar(50),
	CreatedDate date constraint DF_DeviceAssociation_CreatedDate default getdate(),
	StatusID smallint constraint DF_DeviceAssociation_Status default 1
		constraint FK_RptdDeviceAssociation_Status
			references refdatagnrl.Statuses
)
go

create index IX_ExtrnlDeviceAssociation
	on persondata.ExtrnlDeviceAssociation (DeviceAssociationID, DeviceAssociationDateTime, DeviceID, PersonID, CreatedDate, StatusID)
go

create index IX_Person
	on persondata.Person (PersonId, NameFirst, NameMiddle, NameLast, NameSuffix, DLN, SSN, CompleteName, CreatedDate, DOB, Status, UID, TreatmentFacilityID, PlatformAppsID, DLSState)
go

create table persondata.PersonAccounts
(
	PersonAccountsID bigint identity
		constraint PK_PersonAccount
			primary key,
	PersonID bigint
		constraint FK_PersonAccount_Person
			references persondata.Person,
	PatientID varchar(20),
	AltPatientID varchar(20),
	AccountNumber varchar(30),
	CustomAccountNumber varchar(50),
	EMPI varchar(25),
	SelfSoveriegnID uniqueidentifier constraint DF_PersonAccounts_SelfSoveriegnID default newid(),
	CreatedDate date constraint DF_PersonAccount_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonAccounts_Status default 1
		constraint FK_PersonAccount_Status
			references refdatagnrl.Statuses
)
go

create table clnclinterventions.Interventions
(
	InterventionID bigint identity
		constraint PK_clnclinterventions
			primary key,
	AdmitDate varchar(10),
	AdmitTime varchar(12),
	DischargeDate varchar(10),
	DischargeTime varchar(12),
	AccountID bigint
		constraint FK_Interventions_Accounts
			references persondata.PersonAccounts,
	PersonID bigint
		constraint FK_Interventions_Persons
			references persondata.Person,
	TreatingFacility varchar(12)
		constraint FK_Interventions_Facilities
			references refdatagnrl.Facilities,
	PlatformAppsID varchar(12)
		constraint FK_Interventions_Application
			references refdatagnrl.Application,
	DateCreated date constraint DF_clnclinterventions_DateCreated default getdate(),
	StatusID smallint constraint DF_clnclinterventions_Status default 1
		constraint FK_Interventions_Status
			references refdatagnrl.Statuses
)
go

create index IDX_clnclinterventionss
	on clnclinterventions.Interventions (InterventionID, AdmitDate, AdmitTime, DischargeDate, DischargeTime, AccountID, PersonID, TreatingFacility, PlatformAppsID, DateCreated, StatusID)
go

create index IX_PersonAccounts
	on persondata.PersonAccounts (PersonAccountsID, PersonID, PatientID, AltPatientID, AccountNumber, CustomAccountNumber, EMPI, SelfSoveriegnID, CreatedDate, StatusID)
go

create table persondata.PersonAddresses
(
	PersonAddressID bigint identity
		constraint PK_PersonAddress
			primary key,
	PersonID bigint
		constraint FK_PersonAddress_Person
			references persondata.Person,
	Address varchar(65),
	Address2 varchar(25),
	City varchar(45),
	StateId varchar(2)
		constraint FK_PersonAddress_State
			references refdatagnrl.USStates,
	PostalCode varchar(12),
	CountryID varchar(3)
		constraint FK_PersonAddress_Country
			references refdatagnrl.Countries,
	AddressTypeID bigint
		constraint FK_PersonAddresses_AddressTypes
			references refdatagnrl.AddressType,
	CreatedDate date constraint DF_PersonAddresses_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonAddresses_Status default 1
		constraint FK_PersonAddresses_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonAddresses
	on persondata.PersonAddresses (PersonAddressID, PersonID, Address, Address2, City, StateId, PostalCode, CountryID, AddressTypeID, CreatedDate, StatusID)
go

create table persondata.PersonDemographics
(
	PersonDemographicID bigint identity
		constraint PK_PersonDemographics
			primary key,
	PersonID bigint
		constraint FK_PersonDemographics_Person
			references persondata.Person,
	DemographicInfoTypeID smallint
		constraint FK_PersonDemographics_DemographicInfoType
			references refdatagnrl.DemographicInfoType,
	CodeValue varchar(10),
	CodeDesc varchar(75),
	Address varchar(50),
	City varchar(6),
	StateID varchar(2),
	PhoneNumber varchar(14),
	CustomData varchar(25),
	CreatedDate date constraint DF_PersonDemographics_CreatedDate default getdate() not null,
	StatusID smallint constraint DF_PersonDemographics_StatusID default 1
		constraint FK_PersonDemographics_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonDemographics
	on persondata.PersonDemographics (PersonDemographicID, PersonID, DemographicInfoTypeID, CodeValue, CodeDesc, Address, City, StateID, PhoneNumber, CustomData, CreatedDate, StatusID)
go

create table persondata.PersonEmployers
(
	PersonEmployerId bigint identity
		constraint PK_PersonEmployer
			primary key,
	PersonID bigint
		constraint FK_PersonEmployer_Person
			references persondata.Person,
	EmployerCode varchar(20),
	EmployerName varchar(50),
	EmployerAddress varchar(120),
	EmployerCityStateZip varchar(120),
	JobTitle varchar(50),
	CreatedDate date constraint DF_PersonEmployers_EntryDate default getdate(),
	StatusID smallint constraint DF_PersonEmployers_StatusId default 1
		constraint FK_PersonEmployer_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonEmployers
	on persondata.PersonEmployers (PersonEmployerId, PersonID, EmployerCode, EmployerName, EmployerAddress, EmployerCityStateZip, JobTitle, CreatedDate, StatusID)
go

create table persondata.PersonImmunizations
(
	PersonToImmunizationID bigint identity
		constraint PK_PersonImmunizations
			primary key,
	PersonID bigint
		constraint FK_PersonImmunizations_Persons
			references persondata.Person,
	ImmunizationCode varchar(5),
	ImmunizationDesc varchar(75),
	ImmunizationDate varchar(12),
	ImmunizationTime varchar(18),
	CreatedDate date constraint DF_PersonImmunizations_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonImmunizations_StatusID default 1
		constraint FK_PersonImmunizations_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonImmunizations
	on persondata.PersonImmunizations (PersonToImmunizationID, PersonID, ImmunizationCode, ImmunizationDesc, ImmunizationDate, ImmunizationTime, CreatedDate, StatusID)
go

create table persondata.PersonOptInDiagnosis
(
	PersonOptInDiagnosisID bigint identity
		constraint PK_PersonOptInDiagnosis
			primary key,
	PersonID bigint
		constraint FK_PersonOptInDiagnosis_Persons
			references persondata.Person,
	DiagnosisCode varchar(5)
		constraint FK_PersonOptInDiagnosis_Diagnosis
			references semanticterms.Diagnosis,
	EffectiveDate date constraint DF_PersonOptInDiagnosis_EffectiveDate default getdate(),
	ExpirationDate date,
	CreatedDate date constraint DF_PersonOptInDiagnosis_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonOptInDiagnosis_StatusID default 1
		constraint FK_PersonOptInDiagnosis_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonOptInDiagnosis
	on persondata.PersonOptInDiagnosis (PersonOptInDiagnosisID, PersonID, DiagnosisCode, CreatedDate, EffectiveDate, ExpirationDate, StatusID)
go

create table persondata.PersonOptInProcedures
(
	PersonOptInProcedureID bigint identity
		constraint PK_PersonOptInProcedures
			primary key,
	PersonID bigint
		constraint FK_PersonOptInProcedures_Persons
			references persondata.Person,
	ProcedureCode varchar(5)
		constraint FK_PersonOptInProcedures_Procedures
			references semanticterms.Procedures,
	CreatedDate date constraint DF_PersonOptInProcedures_CreatedDate default getdate(),
	EffectiveDate date,
	ExpirationDate date,
	StatusID smallint constraint DF_PersonOptInProcedures_StatusID default 1
		constraint FK_PersonOptInProcedures_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonOptInProcedures
	on persondata.PersonOptInProcedures (PersonOptInProcedureID, PersonID, ProcedureCode, CreatedDate, EffectiveDate, ExpirationDate, StatusID)
go

create table persondata.PersonPhones
(
	PersonPhoneID bigint identity
		constraint PK_PersonPhone
			primary key,
	PersonID bigint not null
		constraint FK_PersonPhone_Person
			references persondata.Person,
	PhoneTypeID smallint not null
		constraint FK_PersonPhone_PhoneType
			references refdatagnrl.PhoneType,
	PhoneNumber varchar(12) not null,
	CreatedDate date constraint DF_PersonPhones_CreatedDate default getdate(),
	StatusID smallint constraint DF_PersonPhones_StatusID default 1
		constraint FK_PersonPhones_Status
			references refdatagnrl.Statuses
)
go

create index IX_PersonPhone
	on persondata.PersonPhones (PersonPhoneID, PersonID, PhoneTypeID, PhoneNumber, CreatedDate, StatusID)
go

create table persondata.PersonToDataRequests
(
	PersonToDataRequestsID bigint identity
		constraint PK_PersonToDataRequests
			primary key,
	PersonID bigint
		constraint FK_PersonToDataRequests_PersonsRequesting
			references persondata.Person,
	PersonAffiliatesID bigint
		constraint FK_PersonToDataRequests_PersonsAffiliates
			references persondata.Person,
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
			references refdatagnrl.Statuses
)
go

create index IX_PersonToDataRequests
	on persondata.PersonToDataRequests (PersonToDataRequestsID, PersonID, PersonAffiliatesID, RelationshipTypeId, InitialRequestedDateTime, RequestValidationDateTime, RevocationRequestDateTime, InitialRequestId, RequestValudationId, RevocationRequestId, CreatedDate, StatusID)
go

create table refdataclinical.Physician
(
	PhysicianId uniqueidentifier not null
		constraint PK_Physician
			primary key,
	PhysicianExternalId varchar(10),
	CompleteName as [NameLast]+', '+[NameFirst],
	NameFirst varchar(45),
	NameMiddle varchar(45),
	NameLast varchar(45),
	NPI varchar(12),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2)
		constraint FK_Physician_State
			references refdatagnrl.USStates,
	Postalcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	MobileNumber varchar(12),
	TreatingFacilityID varchar(12)
		constraint FK_Physicians_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_Physicians_Application
			references refdatagnrl.Application,
	CountryId varchar(3)
		constraint FK_Physician_Country
			references refdatagnrl.Countries,
	DateCreated date constraint DF_Physicians_DateCreated default getdate(),
	StatusID smallint constraint DF_Physicians_StatusID default 1
		constraint FK_Physicians_Status
			references refdatagnrl.Statuses
)
go

create index IX_Physician
	on refdataclinical.Physician (PhysicianId, PhysicianExternalId, NameFirst, NameMiddle, NameLast, NPI, Address, CountryId, MobileNumber, FaxNumber, PhoneNumber, Postalcode, StateId, City, Address2, DateCreated)
go

create index IX_Physicians1
	on refdataclinical.Physician (PhysicianId, StatusID, CompleteName, TreatingFacilityID, PlatformAppID)
go

create table refdataclinical.PhysicianType
(
	PhysicianTypeId uniqueidentifier not null
		constraint PK_PhysicianType
			primary key,
	PhysicianTypeCode varchar(20),
	PhysicianTypeDesc varchar(50),
	TreatingFacilityID varchar(12)
		constraint FK_PhysicianTypes_Facilities
			references refdatagnrl.Facilities,
	PlatformAppID varchar(12)
		constraint FK_PhysicianTypes_Application
			references refdatagnrl.Application,
	CreatedDate date constraint DF_PhysicianTypes_CreatedDate default getdate(),
	StatusID smallint constraint DF_PhysicianTypes_Status default 1
		constraint FK_PhysicianTypes_Status
			references refdatagnrl.Statuses
)
go

create index IX_PhysicianType
	on refdataclinical.PhysicianType (PhysicianTypeId, PhysicianTypeCode, PhysicianTypeDesc, TreatingFacilityID, PlatformAppID, CreatedDate, StatusID)
go

create table clnclinterventions.RptdAllergies
(
	AllergiesID bigint identity
		constraint PK_RptdAllergies
			primary key,
	InterventionID bigint
		constraint FK_RptdAllergies_Interventions
			references clnclinterventions.Interventions,
	AllergyCode varchar(20),
	AllergyDesc varchar(100),
	LineOrderID smallint,
	ClinicalDateTime varchar(15),
	DateReported varchar(10),
	CreatedDate date constraint DF_Allergies_CreatedDate default getdate(),
	StatusID smallint constraint DF_Allergies_Status default 1
		constraint FK_RptdAllergies_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdAllergies
	on clnclinterventions.RptdAllergies (AllergiesID, InterventionID, AllergyCode, AllergyDesc, LineOrderID, ClinicalDateTime, DateReported, CreatedDate, StatusID)
go

create table clnclinterventions.RptdClinicalAddedDetails
(
	RptdClincalAddedDetailsID bigint identity
		constraint PK_RptdClinicalAddedDetails
			primary key,
	InterventionID bigint
		constraint FK_RptdClinicalAddedDetails_Interventions
			references clnclinterventions.Interventions,
	LineOrderID smallint not null,
	HealthcareOrgName varchar(25),
	ClinicalDetailNotes varchar(256),
	ClinicalDateTime varchar(15) constraint DF_ClinicalAddedDetails_ClinicalAddedDetailsDateTime default getdate(),
	CreatedDate date constraint DF_ClinicalAddedDetails_CreatedDate default getdate(),
	StatusId smallint constraint DF_ClinicalAddedDetails_StatusID default 1
		constraint FK_RptdClinicalAddedDetails_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdClinicalAddedDetails
	on clnclinterventions.RptdClinicalAddedDetails (RptdClincalAddedDetailsID, InterventionID, LineOrderID, HealthcareOrgName, ClinicalDetailNotes, ClinicalDateTime, CreatedDate, StatusId)
go

create table clnclinterventions.RptdDiagnosis
(
	RptdDiagnosisID bigint identity
		constraint PK_RptdDiagnosis
			primary key,
	Diagnosis varchar(5)
		constraint FK_RptdDiagnosis_DiagnosisCodes
			references semanticterms.Diagnosis,
	InterventionID bigint
		constraint FK_RptdDiagnosis_Interventions
			references clnclinterventions.Interventions,
	DiagnosisDate varchar(12),
	DiagnosisTime varchar(20),
	ClinicalDateTime varchar(15) constraint DF_Diagnosis_DiagnosisDateTime default getdate(),
	CreatedDate date constraint DF_Diagnosis_CreatedDate default getdate(),
	StatusID smallint constraint DF_Diagnosis_StatusID default 1
		constraint FK_RptdDiagnosis_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdDiagnosis
	on clnclinterventions.RptdDiagnosis (RptdDiagnosisID, Diagnosis, InterventionID, DiagnosisDate, DiagnosisTime, ClinicalDateTime, CreatedDate, StatusID)
go

create table clnclinterventions.RptdGenomics
(
	GenomicsID bigint identity
		constraint PK_Genomics
			primary key,
	InterventionID bigint
		constraint FK_Genomics_Interventions
			references clnclinterventions.Interventions,
	GenomicsLink varchar(65),
	CreatedDate date constraint DF_Genomics_CreatedDate default getdate(),
	StatusID smallint constraint DF_Genomics_StatusID default 1
		constraint FK_Genomics_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdGenomics
	on clnclinterventions.RptdGenomics (GenomicsID, InterventionID, GenomicsLink, CreatedDate, StatusID)
go

create table clnclinterventions.RptdHeightsWeights
(
	RptdHeightWeightID bigint identity
		constraint PK_RptdHeightWeights
			primary key,
	InterventionID bigint
		constraint FK_RptdHeightsWeights_Interventions
			references clnclinterventions.Interventions,
	DateReported varchar(10),
	TimeReported varchar(10),
	Height smallint,
	Weight smallint,
	WeightFactor nchar(10) constraint DF_clnclinterventionssHeightWeight_WeightFactor default N'clnclinterventionsWeight*.45',
	HeightFactor nchar(10) constraint DF_clnclinterventionssHeightWeight_HeightFactor default N'SQUARE(clnclinterventionsHeight*.025)',
	CalculatedBMI nchar(10) constraint DF_clnclinterventionssHeightWeight_CalculatedBMI default N'WeightFactor/HeightFactor',
	StatusID smallint constraint DF_HeightWeights_StatusID default 1
		constraint FK_RptdHeightWeights_Status
			references refdatagnrl.Statuses,
	CreatedDate date constraint DF_HeightWeights_CreatedDate default getdate()
)
go

create index IX_RptdHeightsWeights
	on clnclinterventions.RptdHeightsWeights (RptdHeightWeightID, InterventionID, DateReported, TimeReported, Height, Weight, WeightFactor, HeightFactor, CalculatedBMI, CreatedDate, StatusID)
go

create table clnclinterventions.RptdOrders
(
	OrderNumberID bigint identity
		constraint PK_RptdOrders
			primary key,
	InterventionsID bigint
		constraint FK_RptdOrders_Interventions
			references clnclinterventions.Interventions,
	FillerOrderNumber bigint,
	FiillerGroupNumber bigint,
	OrderControlType uniqueidentifier
		constraint FK_RptdOrders_OrderControlType
			references refdataclinical.OrderControlTypes,
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
	StatusID smallint constraint DF_Orders_StatusID default 1
		constraint FK_RptdOrders_Status
			references refdatagnrl.Statuses,
	CreatedDate date constraint DF_Orders_CreatedDate default getdate()
)
go

create table clnclinterventions.RptdObservations
(
	ObservationsID bigint identity
		constraint PK_Observations
			primary key,
	InterventionsID bigint
		constraint FK_Observations_Interventions
			references clnclinterventions.Interventions,
	OrderNumberID bigint
		constraint FK_Observations_RptdOrders
			references clnclinterventions.RptdOrders,
	ObservationCode varchar(60),
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
	StatusID smallint constraint DF_Observations_StatusID default 1
		constraint FK_Observations_Status
			references refdatagnrl.Statuses,
	CreatedDate date constraint DF_Observations_CreatedDate default getdate()
)
go

create index IX_RptdObservations
	on clnclinterventions.RptdObservations (ObservationsID, InterventionsID, OrderNumberID, ObservationCode, ObservationUnit, ReferenceRange, AbnormalFlags, Probability, AbnormalTestNature, ProducerID, ObservationMethod, ValueType, ObservationDate, ObservationTime, CreatedDate, StatusID)
go

create index IX_RptdOrders
	on clnclinterventions.RptdOrders (OrderNumberID, InterventionsID, Confidentiality, FiillerGroupNumber, FillerOrderNumber, OrderControlReason, OrderControlType, OrderDate, OrderEffectiveDate, OrderingDevice, OrderingPhysicianID, OrderStatus, OrderStatusModifier, OrderTime, OrderType, CreatedDate)
go

create table clnclinterventions.RptdOrdersLabDtls
(
	InterventionOrdersToLabDtlID bigint identity
		constraint PK_RptdOrdersLabDtls
			primary key,
	InterventionID bigint not null
		constraint FK_RptdOrdersToLabTimes_Interventions
			references clnclinterventions.Interventions,
	OrderNumberID bigint
		constraint FK_RptdOrdersLabDtls_Orders
			references clnclinterventions.RptdOrders,
	LabTimesOrderID smallint not null,
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
		constraint FK_RptdOrdersToLabTimes_Status
			references refdatagnrl.Statuses,
	CreatedDate date constraint DF_OrdersToLabTimes_CreatedDate default getdate()
)
go

create index IX_RptdOrdersLabDtls
	on clnclinterventions.RptdOrdersLabDtls (InterventionOrdersToLabDtlID, InterventionID, OrderNumberID, LabTimesOrderID, Quantity, ExplicitTime, RelativeTimeUnits, ServiceDuration, DateTimeStart, DateTimeEnd, Priority, OccurenceDuration, TotalOccurences, CreatedDate, StatusID)
go

create table clnclinterventions.RptdPharmacy
(
	RptdPharmacyID bigint identity
		constraint PK_RptdPharmacy
			primary key,
	InterventionsID bigint
		constraint FK_RptdPharmacy_Interventions
			references clnclinterventions.Interventions,
	IncidentDate varchar(12),
	DrugCode varchar(8),
	DrugName varchar(249),
	DrugQuantity nvarchar(12),
	ScriptDate varchar(12),
	FilledDate varchar(12),
	NPI varchar(12),
	PhysicianName varchar(99),
	CreatedDate date constraint DF_Pharmacy_CreatedDate default getdate(),
	StatusID smallint not null
		constraint FK_RptdPharmacy_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdPharmacy
	on clnclinterventions.RptdPharmacy (RptdPharmacyID, InterventionsID, IncidentDate, DrugCode, DrugName, DrugQuantity, ScriptDate, FilledDate, NPI, PhysicianName, CreatedDate, StatusID)
go

create table clnclinterventions.RptdProblems
(
	RptdPersonProblemID bigint identity
		constraint PK_RptdProblems
			primary key,
	InterventionID bigint
		constraint FK_RptdProblems_Intervention
			references clnclinterventions.Interventions,
	ProblemID varchar(8)
		constraint FK_RptdProblems_Problem
			references semanticterms.SnomedProblems,
	ProblemDesc varchar(50),
	ClinicalDateTime varchar(15),
	CreatedDate date constraint DF__PersonPro__DateP__0F4D3C5F default getdate(),
	StatusId smallint constraint DF__PersonPro__Statu__10416098 default 1
		constraint FK_RptdProblems_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdProblems
	on clnclinterventions.RptdProblems (RptdPersonProblemID, InterventionID, ProblemID, ProblemDesc, ClinicalDateTime, CreatedDate, StatusId)
go

create table clnclinterventions.RptdProcedures
(
	RptdProceduresID bigint identity
		constraint PK_RptdProcedures
			primary key,
	InterventionID bigint
		constraint FK_RptdProcedures_Intervention
			references clnclinterventions.Interventions,
	ProcedureCode varchar(5),
	ProcedureDesc varchar(99),
	ProcedureDate varchar(12),
	ProcedureTime varchar(16),
	DateCreated date constraint DF_Procedures_DateCreated default getdate(),
	StatusId smallint constraint DF_Procedures_Status default 1
		constraint FK_RptdProcedures_Status
			references refdatagnrl.Statuses
)
go

create index IX_RptdProcedures
	on clnclinterventions.RptdProcedures (RptdProceduresID, InterventionID, ProcedureCode, ProcedureDesc, ProcedureDate, ProcedureTime, DateCreated, StatusId)
go

create table clnclinterventions.RptdReports
(
	ReportsID bigint identity
		constraint PK_RptdReports
			primary key,
	InterventionID bigint
		constraint FK_RptdReports_Interventions
			references clnclinterventions.Interventions,
	OrderID varchar(20),
	InterventionsNotesDetail varchar(175),
	StatusID smallint constraint DF_Transcriptions_StatusID default 1
		constraint FK_RptdReports_Status
			references refdatagnrl.Statuses,
	DateCreated date constraint DF_Transcriptions_DateCreated default getdate()
)
go

create index IX_RptdReports
	on clnclinterventions.RptdReports (ReportsID, InterventionID, OrderID, InterventionsNotesDetail, DateCreated, StatusID)
go

create table clnclinterventions.RptdVitals
(
	VitalsID bigint identity
		constraint PK_RptdVitals
			primary key,
	InterventionID bigint
		constraint FK_RptdVitals_Interventions
			references clnclinterventions.Interventions,
	BPSystolic int not null
		constraint CK_clnclinterventionssVitals_BPSystolic
			check ([BPSystolic]>=0 AND [BPSystolic]<=300),
	BPDiastolic int
		constraint CK_clnclinterventionssVitals_BPDiastolic
			check ([BPDiastolic]>=0 AND [BPDiastolic]<=300),
	BPDate varchar(12),
	BPTime varchar(10),
	ProcessdDateTime datetime constraint DF__CareIncid__Proce__40257DE4 default getdate(),
	StatusID smallint constraint DF_Vitals_StatusID default 1
		constraint FK_RptdVitals_Status
			references refdatagnrl.Statuses,
	DateCreated date constraint DF_Vitals_DateCreated default getdate()
)
go

create index IX_RptdVitals
	on clnclinterventions.RptdVitals (VitalsID, InterventionID, BPSystolic, BPDiastolic, BPDate, BPTime, ProcessdDateTime, DateCreated, StatusID)
go

create index IX_States
	on refdatagnrl.USStates (StateID, StateDescription, CreatedDate, StatusID)
go