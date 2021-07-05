CREATE TABLE Genomics (
	GenomicsID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint,
	GenomicsLink varchar(65),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (GenomicsID)
);
CREATE TABLE Interventions (
	InterventionID bigint NOT NULL auto_increment,
	AdmitDate varchar(10),
	AdmitTime varchar(12),
	DischargeDate varchar(10),
	DischargeTime varchar(12),
	AccountID bigint,
	PersonID bigint,
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	StatusId smallint DEFAULT ((1)),
	DateCreated date DEFAULT (getdate()),
	PRIMARY KEY (InterventionID)
);
CREATE TABLE Observations (
	ObservationsID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint,
	OrderNumberID bigint,
	ObservationID smallint,
	LineOrderID integer,
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
	StatusId smallint DEFAULT ((1)),
	CreatedDate date DEFAULT (getdate()),
	PRIMARY KEY (ObservationsID)
);
CREATE TABLE Orders (
	OrderNumberID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint,
	FillerOrderNumber bigint,
	FiillerGroupNumber bigint,
	OrderControlType varchar(2),
	LineOrderID integer,
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
	StatusId smallint DEFAULT ((1)),
	CreatedDate date DEFAULT (getdate()),
	PRIMARY KEY (OrderNumberID)
);
CREATE TABLE OrdersLabDtls (
	clnclinterventionsOrdersToLabDtlID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint NOT NULL,
	OrderNumberID bigint,
	LabTimesOrderID smallint NOT NULL,
	LineOrderID integer,
	Quantity varchar(20) NOT NULL,
	ExplicitTime varchar(20) NOT NULL,
	RelativeTimeUnits varchar(20) NOT NULL,
	ServiceDuration varchar(20) NOT NULL,
	DateTimeStart varchar(26) NOT NULL,
	DateTimeEnd varchar(26) NOT NULL,
	Priority varchar(250) NOT NULL,
	OccurenceDuration varchar(20) NOT NULL,
	TotalOccurences varchar(10) NOT NULL,
	StatusID smallint DEFAULT ((1)),
	CreatedDate date DEFAULT (getdate()),
	PRIMARY KEY (clnclinterventionsOrdersToLabDtlID)
);
CREATE TABLE Pharmacy (
	clnclinterventionsPharmacyID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint,
	IncidentDate date,
	LineOrderID integer,
	DrugCode varchar(8),
	DrugName varchar(249),
	DrugQuantity varchar(12),
	ScriptDate date,
	FilledDate date,
	NPI varchar(12),
	PhysicianName varchar(99),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint NOT NULL,
	PRIMARY KEY (clnclinterventionsPharmacyID)
);
CREATE TABLE Reports (
	ReportsID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint,
	OrderID bigint,
	LineOrderID integer,
	clnclinterventionsNotesLink varchar(75),
	StatusID smallint DEFAULT ((1)),
	DateCreated date DEFAULT (getdate()),
	PRIMARY KEY (ReportsID)
);
CREATE TABLE RptdAllergies (
	AllergiesID bigint NOT NULL auto_increment,
	PersonId bigint,
	AllergyCode varchar(20),
	AllergyDesc varchar(100),
	LineOrderID smallint,
	HealthcareOrgName varchar(25),
	ClinicalDateTime varchar(15),
	DateReported varchar(10),
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (AllergiesID)
);
CREATE TABLE RptdClinicalAddedDetails (
	RptdClincalAddedDetailsID bigint NOT NULL auto_increment,
	PersonId bigint,
	LineOrderID smallint NOT NULL,
	HealthcareOrgName varchar(25),
	ClinicalDetailNotes varchar(256),
	ClinicalDateTime varchar(15) DEFAULT getdate(),
	CreatedDate date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (RptdClincalAddedDetailsID)
);
CREATE TABLE RptdDiagnosis (
	RptdDiagnosisID bigint NOT NULL auto_increment,
	Diagnosis varchar(5),
	PersonID bigint,
	DiagnosisDate varchar(12),
	DiagnosisTime varchar(20),
	HealthcareOrgName varchar(25),
	ClinicalDateTime varchar(15) DEFAULT getdate(),
	CreatedDate date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (RptdDiagnosisID)
);
CREATE TABLE RptdProcedures (
	RptdProceduresID bigint NOT NULL auto_increment,
	ProcedureCode varchar(5),
	ProcedureDesc varchar(99),
	PersonID bigint,
	HealthcareOrgName varchar(25),
	ProcedureDate varchar(12),
	ProcedureTime varchar(16),
	DateCreated date DEFAULT (getdate()),
	StatusId smallint DEFAULT ((1)),
	PRIMARY KEY (RptdProceduresID)
);
CREATE TABLE Vitals (
	VitalsID bigint NOT NULL auto_increment,
	clnclinterventionsID bigint,
	LineOrderID integer,
	BPSystolic integer NOT NULL,
	BPDiastolic integer,
	BPDate date,
	BPTime varchar(25),
	ProcessdDateTime datetime DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	DateCreated date DEFAULT (getdate()),
	PRIMARY KEY (VitalsID)
);
ALTER TABLE Genomics
	ADD FOREIGN KEY (clnclinterventionsID) 
	REFERENCES Interventions (InterventionID);

ALTER TABLE Genomics
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Interventions
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);

ALTER TABLE Interventions
	ADD FOREIGN KEY (AccountID) 
	REFERENCES PersonAccounts (PersonAccountsID);

ALTER TABLE Interventions
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE Interventions
	ADD FOREIGN KEY (InterventionID) 
	REFERENCES Interventions (InterventionID);


ALTER TABLE Observations
	ADD FOREIGN KEY (clnclinterventionsID) 
	REFERENCES Interventions (InterventionID);

ALTER TABLE Observations
	ADD FOREIGN KEY (OrderNumberID) 
	REFERENCES Orders (OrderNumberID);

ALTER TABLE Observations
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE Orders
	ADD FOREIGN KEY (clnclinterventionsID) 
	REFERENCES Interventions (InterventionID);

ALTER TABLE Orders
	ADD FOREIGN KEY (OrderControlType) 
	REFERENCES OrderControlTypes (OrderControlTypeId);

ALTER TABLE Orders
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE OrdersLabDtls
	ADD FOREIGN KEY (OrderNumberID) 
	REFERENCES Orders (OrderNumberID);

ALTER TABLE OrdersLabDtls
	ADD FOREIGN KEY (clnclinterventionsID) 
	REFERENCES Interventions (InterventionID);

ALTER TABLE OrdersLabDtls
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Pharmacy
	ADD FOREIGN KEY (clnclinterventionsID) 
	REFERENCES Interventions (InterventionID);

ALTER TABLE Pharmacy
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Reports
	ADD FOREIGN KEY (OrderID) 
	REFERENCES Orders (OrderNumberID);

ALTER TABLE Reports
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdAllergies
	ADD FOREIGN KEY (PersonId) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdAllergies
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdClinicalAddedDetails
	ADD FOREIGN KEY (PersonId) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdClinicalAddedDetails
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdDiagnosis
	ADD FOREIGN KEY (Diagnosis) 
	REFERENCES Diagnosis (DiagnosisCode);

ALTER TABLE RptdDiagnosis
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdDiagnosis
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE RptdProcedures
	ADD FOREIGN KEY (PersonID) 
	REFERENCES Persons (PersonId);

ALTER TABLE RptdProcedures
	ADD FOREIGN KEY (StatusId) 
	REFERENCES Status (StatusID);


ALTER TABLE Vitals
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


