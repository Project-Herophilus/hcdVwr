CREATE TABLE PersonAccounts (
	PersonAccountsID bigint NOT NULL auto_increment,
	PersonID bigint,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	AccountNumber bigint,
	EMPI varchar(25),
	CustomAccountNumber varchar(50),
	SelfSoveriegnID varchar(250) DEFAULT (newid()),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonAccountsID)
);
CREATE TABLE PersonAddresses (
	PersonAddressId bigint NOT NULL auto_increment,
	PersonId bigint,
	Address varchar(65),
	Address2 varchar(25),
	City varchar(45),
	StateId varchar(2),
	PostalCode varchar(12),
	CountryId varchar(3),
	AddressTypeId bigint,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonAddressId)
);
CREATE TABLE PersonDemographics (
	PersonDemogDtlsId bigint NOT NULL auto_increment,
	PersonId bigint,
	PatientClassId varchar(1),
	AdmissionTypeId varchar(2),
	HospitalServiceId varchar(3),
	ReadmissionInd smallint,
	AdmitSourceId varchar(6),
	AmbulatoryStatusId varchar(2),
	VIPIndicator smallint,
	PatientTypeId varchar(2),
	FinancialClassId integer,
	ExternalHealthcareEntitiesId smallint,
	RaceId varchar(6),
	EthnicityId smallint,
	MaritalStatusId varchar(1),
	GenderId varchar(1),
	ReligionId varchar(3),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()) NOT NULL,
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonDemogDtlsId)
);
CREATE TABLE PersonEmployers (
	PersonEmployerId bigint NOT NULL auto_increment,
	PersonId bigint,
	EmployerId bigint,
	EmployerCode varchar(20),
	EmployerName varchar(50),
	EmployerAddress varchar(120),
	EmployerCityStateZip varchar(120),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	JobTitle varchar(50),
	CreatedDate date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (PersonEmployerId)
);
CREATE TABLE PersonImmunizations (
	PersonToImmunizationID bigint NOT NULL auto_increment,
	PersonID bigint,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	ImmunizationCode varchar(5),
	ImmunizationDesc varchar(75),
	ImmunizationDate varchar(12),
	ImmunizationTime varchar(18),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonToImmunizationID)
);
CREATE TABLE PersonOptInDiagnosis (
	PersonOptInDiagnosisID bigint NOT NULL auto_increment,
	PersonID bigint,
	DiagnosisCode varchar(5),
	CreatedDate date DEFAULT (getdate()),
	EffectiveDate date,
	ExpirationDate date,
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonOptInDiagnosisID)
);
CREATE TABLE PersonOptInProcedures (
	PersonOptInProcedureID bigint NOT NULL auto_increment,
	PersonID bigint,
	ProcedureCode varchar(5),
	CreatedDate date DEFAULT (getdate()),
	EffectiveDate date,
	ExpirationDate date,
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonOptInProcedureID)
);
CREATE TABLE PersonPhones (
	PersonPhoneId bigint NOT NULL auto_increment,
	PersonId bigint NOT NULL,
	PhoneTypeId smallint NOT NULL,
	PhoneNumber varchar(12) NOT NULL,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonPhoneId)
);
CREATE TABLE Persons (
	PersonId bigint NOT NULL auto_increment,
	NameFirst varchar(25) NOT NULL,
	NameMiddle varchar(1),
	NameLast varchar(45) NOT NULL,
	NameSuffix varchar(8),
	DLN varchar(25),
	SSN varchar(12),
	CompleteName varchar(72) NOT NULL,
	DOB date,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	CreatedDate date DEFAULT (getdate()) NOT NULL,
	Status smallint DEFAULT ((1)),
	UID varchar(149),
	PRIMARY KEY (PersonId)
);
CREATE TABLE PersonToDataRequests (
	PersonToDataRequestsID bigint NOT NULL auto_increment,
	PersonID bigint,
	PersonAffiliatesID bigint,
	RelationshipTypeId smallint,
	InitialRequestedDateTime datetime,
	RequestValidationDateTime char(10),
	RevocationRequestDateTime datetime,
	InitialRequestId varchar(50),
	RequestValudationId varchar(50),
	RevocationRequestId varchar(50),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (PersonToDataRequestsID)
);
CREATE TABLE RptdCommunications (
	RptdCommunictionID bigint NOT NULL auto_increment,
	CommunicationDateTime datetime DEFAULT (getdate()),
	CommunicationType smallint DEFAULT ((1)),
	PersonID bigint,
	CommunicationDetails varchar(1024),
	HealthcareEntitiesId bigint,
	PlatformAppsId smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (RptdCommunictionID)
);
CREATE TABLE RptdDeviceAssociation (
	DeviceAssociationID bigint NOT NULL auto_increment,
	DeviceAssociationDateTime datetime DEFAULT (getdate()),
	DeviceID varchar(50),
	PersonID bigint,
	HealthcareEntitiesId bigint,
	PlatformAppsId smallint,
	CreatedDate date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (DeviceAssociationID)
);
CREATE TABLE RptdHeightsWeights (
	RptdHeightWeightID bigint NOT NULL auto_increment,
	PersonD bigint,
	DateReported varchar(10),
	TimeReported varchar(10),
	Height smallint,
	Weight smallint,
	WeightFactor char(10) DEFAULT N'clnclinterventionsWeight*.45',
	HeightFactor char(10) DEFAULT N'SQUARE(clnclinterventionsHeight*.025)',
	CalculatedBMI char(10) DEFAULT N'WeightFactor/HeightFactor',
	HealthcareEntitiesId bigint,
	PlatformAppsId smallint,
	StatusId smallint DEFAULT ((1)),
	CreatedDate date DEFAULT (getdate()),
	PRIMARY KEY (RptdHeightWeightID)
);
CREATE TABLE RptdProblems (
	RptdPersonProblemID bigint NOT NULL auto_increment,
	PersonID bigint,
	ProblemID varchar(8),
	ProblemDesc varchar(50),
	HealthcareOrgName varchar(25),
	ClinicalDateTime varchar(15),
	CreatedDate date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (RptdPersonProblemID)
);
ALTER TABLE PersonAccounts
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonAccounts
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonAddresses
	ADD FOREIGN KEY (CountryId) 
	REFERENCES Countries (CountryId);

ALTER TABLE PersonAddresses
	ADD FOREIGN KEY (PersonId) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonAddresses
	ADD FOREIGN KEY (StateId) 
	REFERENCES States (StateId);

ALTER TABLE PersonAddresses
	ADD FOREIGN KEY (AddressTypeId) 
	REFERENCES AddressTypes (AddressTypeId);

ALTER TABLE PersonAddresses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonDemographics
	ADD FOREIGN KEY (PersonId) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonDemographics
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonEmployers
	ADD FOREIGN KEY (PersonId) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonEmployers
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonImmunizations
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonImmunizations
	ADD FOREIGN KEY (ImmunizationCode) 
	REFERENCES Procedures (ProcedureCode);

ALTER TABLE PersonImmunizations
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonOptInDiagnosis
	ADD FOREIGN KEY (DiagnosisCode) 
	REFERENCES Diagnosis (DiagnosisCode);

ALTER TABLE PersonOptInDiagnosis
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonOptInDiagnosis
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonOptInProcedures
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonOptInProcedures
	ADD FOREIGN KEY (ProcedureCode) 
	REFERENCES Procedures (ProcedureCode);

ALTER TABLE PersonOptInProcedures
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonPhones
	ADD FOREIGN KEY (PersonId) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonPhones
	ADD FOREIGN KEY (PhoneTypeId) 
	REFERENCES PhoneTypes (PhoneTypeId);

ALTER TABLE PersonPhones
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Persons
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE PersonToDataRequests
	ADD FOREIGN KEY (PersonAffiliatesID) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonToDataRequests
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE PersonToDataRequests
	ADD FOREIGN KEY (RelationshipTypeId) 
	REFERENCES RelationshipType (RelationshipTypeID);

ALTER TABLE PersonToDataRequests
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdCommunications
	ADD FOREIGN KEY (CommunicationType) 
	REFERENCES CommunicationType (CommunicationTypeID);

ALTER TABLE RptdCommunications
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdCommunications
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdDeviceAssociation
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdDeviceAssociation
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdHeightsWeights
	ADD FOREIGN KEY (PersonD) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdHeightsWeights
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdProblems
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);

ALTER TABLE RptdProblems
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdProblems
	ADD FOREIGN KEY (ProblemID) 
	REFERENCES SnomedProblems (ProblemID);


