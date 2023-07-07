
USE UKAccidentsNDS

GO

CREATE TABLE Source
(
	SourceID int identity(1,1),
	Name varchar(100),
	CONSTRAINT PK_S PRIMARY KEY(SourceID)
)


SET IDENTITY_INSERT [dbo].[Source] ON
GO
INSERT INTO Source (SourceId, Name) VALUES (1, 'Accidents-Casualties-Vehicles-Codebook');
INSERT INTO Source (SourceId, Name) VALUES (2, 'Postcodes-PCD_OA_LSOA_MSOA_LAD_AUG21_UK_LU');
SET IDENTITY_INSERT [dbo].[Source] OFF
GO

CREATE TABLE TimeOfDay 
(
	TimeOfDayKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_TOD PRIMARY KEY(TimeOfDayKey)
)

CREATE TABLE Gender 
(
	GenderKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_G PRIMARY KEY(GenderKey)
)

CREATE TABLE AgeBand 
(
	AgeBandKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_AB PRIMARY KEY(AgeBandKey)
)

CREATE TABLE AgeGroup
(
	AgeGroupKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_AG PRIMARY KEY(AgeGroupKey)
)

CREATE TABLE CasualtySeverity 
(
	CasualtySeverityKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_CS PRIMARY KEY(CasualtySeverityKey)
)

CREATE TABLE CasualtyType 
(
	CasualtyTypeKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_CT PRIMARY KEY(CasualtyTypeKey)
)

CREATE TABLE AccidentSeverity 
(
	AccidentSeverityKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_AS PRIMARY KEY(AccidentSeverityKey)
)

CREATE TABLE TownCity 
(
	TownCityKey int identity(1,1),
	Postcode varchar(10),
	lsoa varchar(10),
	CityName varchar(50),
	County int,
	SourceID int,
	[latitude] [varchar](50),
	[longitude] [varchar](50),
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_TC PRIMARY KEY(TownCityKey)
)

CREATE TABLE County 
(
	CountyKey int identity(1,1),
	CountyName varchar(50),
	Region int,
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_C PRIMARY KEY(CountyKey)
)

CREATE TABLE Region 
(
	RegionKey int identity(1,1),
	RegionCode varchar(10),
	RegionName varchar(50),
	Country int,
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_R PRIMARY KEY(RegionKey)
)

CREATE TABLE Country
(
	CountryKey int identity(1,1),
	CountryCode varchar(10),
	CountryName varchar(20),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_CY PRIMARY KEY(CountryKey)
)

CREATE TABLE LocalAuthorityDistrict
(
	LADKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_LAD PRIMARY KEY(LADKey)
)

CREATE TABLE UrbanOrRuralArea
(
	UrbanOrRuralKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_UORA PRIMARY KEY(UrbanOrRuralKey)
)

CREATE TABLE BuiltUpRoad
(
	BuiltUpRoadKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_BUR PRIMARY KEY(BuiltUpRoadKey)
)

CREATE TABLE RoadType
(
	RoadTypeKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_RT PRIMARY KEY(RoadTypeKey)
)

CREATE TABLE VehicleType
(
	VehicleTypeKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_VT PRIMARY KEY(VehicleTypeKey)
)

CREATE TABLE JourneyPurpose
(
	JourneyPurposeKey int identity(1,1),
	Code int,
	Label varchar(100),
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_JP PRIMARY KEY(JourneyPurposeKey)
)

CREATE TABLE Vehicles
(
	VehicleKey int identity(1,1),
	AccidentKey int,
	VehicleType int,
	JourneyPurpose int,
	SourceID int,
	VehicleReference int,
	CreatedAt datetime,
	UpdatedAt datetime
	CONSTRAINT PK_V PRIMARY KEY(VehicleKey)
)

CREATE TABLE Accidents
(
	AccidentKey int identity(1,1),
	AccidentIndex varchar(50),
	NumberOfVehicles int,
	NumberOfCasualties int,
	Time time,
	TimeOfDay int,
	Date Date,
	AccidentSeverity int,
	CityCode int,
	RoadType int,
	BuiltUpRoad int,
	UrbanOrRuralArea int,
	LAD int,
	Longitude float,
	Latitude float,
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime,
	CONSTRAINT PK_A PRIMARY KEY(AccidentKey)
)

CREATE TABLE Casualties
(
	CasualtyKey int identity(1,1),
	AccidentKey int,
	VehicleReference int,
	CasualtyReference int,
	SexOfCasualty int,
	AgeOfCasualty int,
	AgeGroupOfCasualty int,
	AgeBandOfCasualty int,
	CasualtySeverity int,
	CasualtyType int,
	SourceID int,
	CreatedAt datetime,
	UpdatedAt datetime,
	CONSTRAINT PK_CST PRIMARY KEY(CasualtyKey)
)

GO

--Khoa ngoai bang Gender
ALTER TABLE Gender
ADD CONSTRAINT FK_G_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang AgeBand
ALTER TABLE AgeBand
ADD CONSTRAINT FK_AB_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang CasualtySeverity
ALTER TABLE CasualtySeverity
ADD CONSTRAINT FK_CS_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang CasualtyType
ALTER TABLE CasualtyType
ADD CONSTRAINT FK_CT_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang AccidentSeverity
ALTER TABLE AccidentSeverity
ADD CONSTRAINT FK_AS_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang TownCity
ALTER TABLE TownCity
ADD CONSTRAINT FK_TC_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

ALTER TABLE TownCity
ADD CONSTRAINT FK_TC_C
FOREIGN KEY(County)
REFERENCES County(CountyKey)

--Khoa ngoai bang County
ALTER TABLE County
ADD CONSTRAINT FK_S_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

ALTER TABLE County
ADD CONSTRAINT FK_S_R
FOREIGN KEY(Region)
REFERENCES Region(RegionKey)

--Khoa ngoai bang Region
ALTER TABLE Region
ADD CONSTRAINT FK_R_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

ALTER TABLE Region
ADD CONSTRAINT FK_R_CY
FOREIGN KEY(Country)
REFERENCES Country(CountryKey)

--Khoa ngoai bang Country
ALTER TABLE Country
ADD CONSTRAINT FK_CY_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang LocalAuthorityDistrict
ALTER TABLE LocalAuthorityDistrict
ADD CONSTRAINT FK_LAD_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang UrbanOrRuralArea
ALTER TABLE UrbanOrRuralArea
ADD CONSTRAINT FK_UORA_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang RoadType
ALTER TABLE RoadType
ADD CONSTRAINT FK_RT_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang VehicleType
ALTER TABLE VehicleType
ADD CONSTRAINT FK_VT_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang JourneyPurpose
ALTER TABLE JourneyPurpose
ADD CONSTRAINT FK_JP_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

--Khoa ngoai bang Accidents
ALTER TABLE Accidents
ADD CONSTRAINT FK_A_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

ALTER TABLE Accidents
ADD CONSTRAINT FK_A_AS
FOREIGN KEY(AccidentSeverity)
REFERENCES AccidentSeverity(AccidentSeverityKey)

ALTER TABLE Accidents
ADD CONSTRAINT FK_A_RT
FOREIGN KEY(RoadType)
REFERENCES RoadType(RoadTypeKey)

ALTER TABLE Accidents
ADD CONSTRAINT FK_A_BUR
FOREIGN KEY(BuiltUpRoad)
REFERENCES BuiltUpRoad(BuiltUpRoadKey)

ALTER TABLE Accidents
ADD CONSTRAINT FK_A_UORA
FOREIGN KEY(UrbanOrRuralArea)
REFERENCES UrbanOrRuralArea(UrbanOrRuralKey)

ALTER TABLE Accidents
ADD CONSTRAINT FK_A_LAD
FOREIGN KEY(LAD)
REFERENCES LocalAuthorityDistrict(LADKey)

ALTER TABLE Accidents
ADD CONSTRAINT FK_A_TOD
FOREIGN KEY(TimeOfDay)
REFERENCES TimeOfDay(TimeOfDayKey)

--Khoa ngoai bang Casualties
ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)

ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_A
FOREIGN KEY(AccidentKey)
REFERENCES Accidents(AccidentKey)

ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_G
FOREIGN KEY(SexOfCasualty)
REFERENCES Gender(GenderKey)

ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_AG
FOREIGN KEY(AgeGroupOfCasualty)
REFERENCES AgeGroup(AgeGroupKey)

ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_AB
FOREIGN KEY(AgeBandOfCasualty)
REFERENCES AgeBand(AgeBandKey)

ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_CS
FOREIGN KEY(CasualtySeverity)
REFERENCES CasualtySeverity(CasualtySeverityKey)

ALTER TABLE Casualties
ADD CONSTRAINT FK_CST_CT
FOREIGN KEY(CasualtyType)
REFERENCES CasualtyType(CasualtyTypeKey)

--Khoa ngoai bang Vehicles
ALTER TABLE Vehicles
ADD CONSTRAINT FK_V_VT
FOREIGN KEY(VehicleType)
REFERENCES VehicleType(VehicleTypeKey)

ALTER TABLE Vehicles
ADD CONSTRAINT FK_V_A
FOREIGN KEY(AccidentKey)
REFERENCES Accidents(AccidentKey)

ALTER TABLE Vehicles
ADD CONSTRAINT FK_V_JP
FOREIGN KEY(JourneyPurpose)
REFERENCES JourneyPurpose(JourneyPurposeKey)

ALTER TABLE Vehicles
ADD CONSTRAINT FK_V_S
FOREIGN KEY(SourceID)
REFERENCES Source(SourceID)