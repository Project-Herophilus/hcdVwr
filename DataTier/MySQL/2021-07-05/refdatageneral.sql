CREATE TABLE AddressTypes (
	AddressTypeId bigint NOT NULL auto_increment,
	AddressTypeDesc varchar(25) NOT NULL,
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (AddressTypeId)
);
CREATE TABLE AuditLoggingEventTypes (
	AuditLoggingEventTypeId smallint NOT NULL auto_increment,
	AuditLoggingEventTypeDesc varchar(20),
	CreatedDate date,
	Status smallint,
	PRIMARY KEY (AuditLoggingEventTypeId)
);
CREATE TABLE CommunicationType (
	CommunicationTypeID smallint NOT NULL auto_increment,
	CommunicationTypeDesc varchar(50),
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (CommunicationTypeID)
);
CREATE TABLE ConfigurationSettingType (
	ConfigurationSettingTypeID smallint NOT NULL auto_increment,
	ConfigurationSettingTypeDesc varchar(50) NOT NULL,
	CreatedDate date DEFAULT (getdate()) NOT NULL,
	Status smallint DEFAULT ((1)) NOT NULL,
	PRIMARY KEY (ConfigurationSettingTypeID)
);
CREATE TABLE Countries (
	CountryId varchar(3) NOT NULL,
	CountryName varchar(80) NOT NULL,
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (CountryId)
);
CREATE TABLE Department (
	DepartmentId varchar(8) NOT NULL,
	DepartmentDesc varchar(10) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (DepartmentId)
);
CREATE TABLE Facilities (
	FacilitiesID varchar(12) NOT NULL,
	FacilitiesName varchar(25),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(40),
	State varchar(2),
	Country varchar(3),
	PostalCode varchar(12) NOT NULL,
	Notes varchar(256),
	LicenseNumber varchar(20),
	LicenseType varchar(20),
	LicensedState varchar(2),
	OIDID varchar(50),
	CreatedDate date DEFAULT (getdate()) NOT NULL,
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (FacilitiesID)
);
CREATE TABLE FacilityRooms (
	FacilityRoomId varchar(8) NOT NULL,
	FacilityRoomDesc varchar(10) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	FacilitiesID varchar(10),
	PRIMARY KEY (FacilityRoomId)
);
CREATE TABLE NamePrefix (
	NamePrefixId varchar(5) NOT NULL,
	NamePrefixDesc varchar(10) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (NamePrefixId)
);
CREATE TABLE NameSuffix (
	NameSuffixId varchar(5) NOT NULL,
	NameSuffixDesc varchar(10) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (NameSuffixId)
);
CREATE TABLE OIDS (
	OIDID varchar(50) NOT NULL,
	OID varchar(50),
	OIDDesc varchar(499),
	CompleteOID varchar(550),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (OIDID)
);
CREATE TABLE Organization (
	OrganizationID varchar(12) NOT NULL,
	OrganizationName varchar(25),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(40),
	State varchar(2),
	Country varchar(3),
	PostalCode varchar(12) NOT NULL,
	Notes varchar(256),
	LicenseNumber varchar(20),
	LicenseType varchar(20),
	LicensedState varchar(2),
	IncorporatedState varchar(2),
	OIDID varchar(50),
	CreatedDate date DEFAULT (getdate()) NOT NULL,
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (OrganizationID)
);
CREATE TABLE PhoneTypes (
	PhoneTypeId smallint NOT NULL auto_increment,
	PhoneTypeDesc varchar(20) NOT NULL,
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (PhoneTypeId)
);
CREATE TABLE PlatformAppType (
	PlatformAppTypeID smallint NOT NULL auto_increment,
	PlatformAppTypeName varchar(30),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PlatformAppTypeID)
);
CREATE TABLE RelationshipCategoryType (
	RelationshipCategoryTypeID smallint NOT NULL auto_increment,
	RelationshipCategoryTypeDesc varchar(30),
	CreatedDate date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (RelationshipCategoryTypeID)
);
CREATE TABLE RelationshipType (
	RelationshipTypeID smallint NOT NULL auto_increment,
	RelationshipTypeDesc varchar(35),
	RelationshipCategoryTypeId smallint DEFAULT ((1)),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (RelationshipTypeID)
);
CREATE TABLE ResourceType (
	ResourceTypeID smallint NOT NULL auto_increment,
	ResourceTypeDesc varchar(20),
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (ResourceTypeID)
);
CREATE TABLE States (
	StateId varchar(2) NOT NULL,
	StateDescription varchar(65) NOT NULL,
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (StateId)
);
CREATE TABLE Status (
	StatusID smallint NOT NULL auto_increment,
	StatusDescription varchar(45) NOT NULL,
	CreatedDate date DEFAULT (getdate()),
	PRIMARY KEY (StatusID)
);
ALTER TABLE AddressTypes
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE AuditLoggingEventTypes
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE CommunicationType
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE ConfigurationSettingType
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE Countries
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE Department
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Facilities
	ADD FOREIGN KEY (Country) 
	REFERENCES Countries (CountryId);

ALTER TABLE Facilities
	ADD FOREIGN KEY (State) 
	REFERENCES States (StateId);

ALTER TABLE Facilities
	ADD FOREIGN KEY (LicensedState) 
	REFERENCES States (StateId);

ALTER TABLE Facilities
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE FacilityRooms
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE NamePrefix
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE NameSuffix
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE OIDS
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Organization
	ADD FOREIGN KEY (Country) 
	REFERENCES Countries (CountryId);

ALTER TABLE Organization
	ADD FOREIGN KEY (State) 
	REFERENCES States (StateId);

ALTER TABLE Organization
	ADD FOREIGN KEY (IncorporatedState) 
	REFERENCES States (StateId);

ALTER TABLE Organization
	ADD FOREIGN KEY (LicensedState) 
	REFERENCES States (StateId);

ALTER TABLE Organization
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PhoneTypes
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE PlatformAppType
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE RelationshipCategoryType
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE RelationshipType
	ADD FOREIGN KEY (RelationshipCategoryTypeId) 
	REFERENCES RelationshipCategoryType (RelationshipCategoryTypeID);

ALTER TABLE RelationshipType
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE ResourceType
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE States
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


