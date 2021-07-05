CREATE TABLE Employers (
	EmployerId bigint NOT NULL auto_increment,
	EmployerExternalId varchar(10),
	EmployerName varchar(45),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2),
	CountryId varchar(3),
	Zipcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (EmployerId)
);
CREATE TABLE Ethnicity (
	EthnicityId varchar(5) NOT NULL,
	EthnicityDesc varchar(50) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (EthnicityId)
);
CREATE TABLE FinancialClass (
	FinancialClassId varchar(5) NOT NULL,
	FinancialClassDesc varchar(50) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (FinancialClassId)
);
CREATE TABLE Genders (
	GenderId varchar(1) NOT NULL,
	GenderCode varchar(10),
	GenderDesc varchar(45) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (GenderId)
);
CREATE TABLE Insurances (
	InsuranceId integer NOT NULL auto_increment,
	InsuranceExternalId varchar(10),
	InsuranceCompanyName varchar(99),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2),
	Postalcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	InsCompanyTypeId bigint,
	CountryId varchar(3),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (InsuranceId)
);
CREATE TABLE InsuranceTypes (
	InsuranceTypeId bigint NOT NULL auto_increment,
	InsuranceTypeCode varchar(10),
	InsuranceTypeDesc varchar(30) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (InsuranceTypeId)
);
CREATE TABLE Languages (
	LanguageId varchar(7) NOT NULL,
	LanguageDesc varchar(45) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (LanguageId)
);
CREATE TABLE MaritalStatus (
	MaritalStatusId varchar(5) NOT NULL,
	MaritalStatusDesc varchar(50) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (MaritalStatusId)
);
CREATE TABLE OrderControlTypes (
	OrderControlTypeId varchar(2) NOT NULL,
	OrderControlTypeDesc varchar(40),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	DateCreated date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (OrderControlTypeId)
);
CREATE TABLE PatientClasses (
	PatientClassId varchar(5) NOT NULL,
	ClassificationDesc varchar(80) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PatientClassId)
);
CREATE TABLE Physicians (
	PhysicianId integer NOT NULL,
	PhysicianExternalId varchar(10),
	CompleteName varchar(92),
	Name_First varchar(45),
	Name_Middle varchar(45),
	Name_Last varchar(45),
	NPI varchar(12),
	Address varchar(60),
	Address2 varchar(25),
	City varchar(65),
	StateId varchar(2),
	Postalcode varchar(10),
	PhoneNumber varchar(12),
	FaxNumber varchar(12),
	MobileNumber varchar(12),
	HCEntitiesID bigint,
	PlatformAppID smallint,
	CountryId varchar(3),
	DateCreated date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PhysicianId)
);
CREATE TABLE PhysicianTypes (
	PhysicianTypeId smallint NOT NULL auto_increment,
	PhysicianTypeCode varchar(20),
	PhysicianTypeDesc varchar(50),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PhysicianTypeId)
);
CREATE TABLE Races (
	RaceId varchar(6) NOT NULL,
	RaceDesc varchar(45) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (RaceId)
);
ALTER TABLE Employers
	ADD FOREIGN KEY (CountryId) 
	REFERENCES Countries (CountryId);

ALTER TABLE Employers
	ADD FOREIGN KEY (StateId) 
	REFERENCES States (StateId);

ALTER TABLE Employers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Ethnicity
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE FinancialClass
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Genders
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Insurances
	ADD FOREIGN KEY (CountryId) 
	REFERENCES Countries (CountryId);

ALTER TABLE Insurances
	ADD FOREIGN KEY (InsCompanyTypeId) 
	REFERENCES InsuranceTypes (InsuranceTypeId);

ALTER TABLE Insurances
	ADD FOREIGN KEY (StateId) 
	REFERENCES States (StateId);

ALTER TABLE Insurances
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE InsuranceTypes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Languages
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE MaritalStatus
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE OrderControlTypes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PatientClasses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Physicians
	ADD FOREIGN KEY (CountryId) 
	REFERENCES Countries (CountryId);

ALTER TABLE Physicians
	ADD FOREIGN KEY (StateId) 
	REFERENCES States (StateId);

ALTER TABLE Physicians
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PhysicianTypes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Races
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


