CREATE TABLE Allergens (
	AllergensD integer NOT NULL auto_increment,
	AllergyCode varchar(20),
	AllergyDesc varchar(100),
	HealthcareEntitiesID bigint,
	PlatformAppsID smallint,
	StatusID smallint DEFAULT ((1)),
	CreatedDate date DEFAULT (getdate()),
	PRIMARY KEY (AllergensD)
);
CREATE TABLE CWETermGroups (
	CWETermGroupId varchar(20) NOT NULL,
	CWETermGroupDesc varchar(100),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (CWETermGroupId)
);
CREATE TABLE CWETerms (
	CWETermID bigint NOT NULL,
	Identifier varchar(20),
	TermText varchar(199),
	CWETermGroup varchar(20),
	AlternativeID varchar(20),
	AlternativeText varchar(199),
	AlternativeTermGroup varchar(20),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (CWETermID)
);
CREATE TABLE Diagnosis (
	DiagnosisCode varchar(5) NOT NULL,
	DiagnosisCodeShortDesc varchar(50),
	DiagnosisCodeLongDesc varchar(125),
	IndustryVersion varchar(5),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (DiagnosisCode)
);
CREATE TABLE LOINC (
	LOINCCodesetID varchar(8) NOT NULL,
	CodesetDesc varchar(75),
	CodesetStatus varchar(10),
	CUILink varchar(8),
	Occurence varchar(2),
	`Usage` varchar(10),
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (LOINCCodesetID)
);
CREATE TABLE Procedures (
	ProcedureCode varchar(5) NOT NULL,
	ProcedureCodeShortDesc varchar(50),
	ProcedureCodeLongDesc varchar(125),
	IndustryVersion varchar(5),
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (ProcedureCode)
);
CREATE TABLE RxNorms (
	RXNormId varchar(8) NOT NULL,
	LAT varchar(3) DEFAULT 'ENG' NOT NULL,
	RxNormDesc varchar(3000) NOT NULL,
	CreatedDate date DEFAULT (getdate()),
	StatusID smallint DEFAULT ((1)),
	PRIMARY KEY (RXNormId)
);
CREATE TABLE SnomedCodeset (
	SnomedCodesetID varchar(8) NOT NULL,
	CodesetDesc varchar(75),
	CodesetStatus varchar(10),
	CUILink varchar(8),
	Occurence varchar(2),
	`Usage` varchar(10),
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (SnomedCodesetID)
);
CREATE TABLE SnomedProblems (
	ProblemID varchar(8) NOT NULL,
	ProblemDesc varchar(75),
	ProblemIDStatus varchar(10),
	CUILink varchar(8),
	Occurence varchar(2),
	`Usage` varchar(10),
	CreatedDate date DEFAULT (getdate()),
	Status smallint DEFAULT ((1)),
	PRIMARY KEY (ProblemID)
);
ALTER TABLE Allergens
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE CWETermGroups
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE CWETerms
	ADD FOREIGN KEY (AlternativeTermGroup) 
	REFERENCES CWETermGroups (CWETermGroupId);

ALTER TABLE CWETerms
	ADD FOREIGN KEY (CWETermGroup) 
	REFERENCES CWETermGroups (CWETermGroupId);

ALTER TABLE CWETerms
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE Diagnosis
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE LOINC
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE Procedures
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE RxNorms
	ADD FOREIGN KEY (StatusID) 
	REFERENCES Status (StatusID);


ALTER TABLE SnomedCodeset
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


ALTER TABLE SnomedProblems
	ADD FOREIGN KEY (Status) 
	REFERENCES Status (StatusID);


