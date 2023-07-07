Create database UKAccidentsDDS
go
Use UKAccidentsDDS
go
Create table FactCasualties(
	CasualtyKey int,
	AccidentKey int,
	VehicleKey int,
	LADKey int,
	CasualtySeverityKey int,
	CasualtyTypeKey int,
	GenderKey int,
	AgeBandKey int,
	AgeGroupKey int,
	DateKey int,
	PRIMARY KEY (CasualtyKey)
)
go
Create table FactAccidents(
	AccidentKey int,
	AccidentSeverityKey int,
	DateKey int,
	TimeOfDayKey int,
	UrbanOrRuralAreaKey int,
	RoadTypeKey int,
	TownCityKey int,
	PRIMARY KEY (AccidentKey)
)
go
Create table FactVehicles(
	VehicleKey int,
	AccidentSeverityKey int,
	JourneyPurposeKey int,
	BuiltUpRoadKey int,
	VehicleTypeKey int,
	DateKey int,
	PRIMARY KEY (VehicleKey)
)
go
Create table DimTimeOfDay(
	TimeOfDayKey int,
	TimeOfDayCode int,
	TimeOfDayLabel varchar(100),
	PRIMARY KEY (TimeOfDayKey)
)
go
Create table DimAgeBand(
	AgeBandKey int,
	AgeBandCode int,
	AgeBandLabel varchar(100),
	PRIMARY KEY (AgeBandKey)
)
go
Create table DimJourneyPurpose(
	JourneyPurposeKey int,
	JourneyPurposeCode int,
	JourneyPurposeLabel varchar(100),
	PRIMARY KEY (JourneyPurposeKey)
)
go
Create table DimRoadType(
	RoadTypeKey int,
	RoadTypeCode int,
	RoadTypeLabel varchar(100),
	PRIMARY KEY (RoadTypeKey)
)
Go
Create table DimVehicleType(
	VehicleTypeKey int,
	VehicleTypeCode int,
	VehicleTypeLabel varchar(100),
	PRIMARY KEY (VehicleTypeKey)
)
Go
Create table DimCasualtySeverity(
	CasualtySeverityKey int,
	CasualtySeverityCode int,
	CasualtySeverityLabel varchar(100),
	PRIMARY KEY (CasualtySeverityKey)
)
Go
Create table DimAccidentSeverity(
	AccidentSeverityKey int,
	AccidentSeverityCode int,
	AccidentSeverityLabel varchar(100),
	PRIMARY KEY (AccidentSeverityKey)
)
Go
Create table DimDate(
	DateKey int,
	FullDate date,
	DayNumberOfMonth int,
	MonthNumberOfYear int,
	CalendarQuarter int,
	CalendarYear int,
	PRIMARY KEY (DateKey)
)
Go
Create table DimCountry(
	CountryKey int,
	CountryCode varchar(20),
	CountryName Varchar(20),
	PRIMARY KEY (CountryKey)
)
Go
Create table DimRegion(
	RegionKey int,
	RegionCode varchar(20),
	RegionName varchar(50),
	CountryKey int,
	PRIMARY KEY (RegionKey)
)
Go
Create table DimCounty(
	CountyKey int,
	CountyName varchar(50),
	RegionKey int,
	PRIMARY KEY (CountyKey)
)
Go
Create table DimTownCity(
	TownCityKey int,
	Postcode varchar(20),
	LSOA varchar(20),
	CityName Varchar(50),
	CountyKey int,
	latitude varchar(50),
	longitude varchar(50),
	PRIMARY KEY (TownCityKey)
)
Go
Create table DimAgeGroup(
	AgeGroupKey int,
	AgeGroupCode int,
	AgeGroupLabel varchar(100),
	PRIMARY KEY (AgeGroupKey)
)
Go
Create table DimLocalAuthorityDistrict(
	LADKey int,
	LADCode int,
	LADLabel varchar(100),
	PRIMARY KEY (LADKey)
)
Go
Create table DimUrbanRural(
	UrbanRuralKey int,
	UrbanOrRuralCode int,
	UrbanOrRuralLabel varchar(100),
	PRIMARY KEY (UrbanRuralKey)
)
Go
Create table DimBuiltUpRoad(
	BuiltUpRoadKey int,
	BuiltUpRoadCode int,
	BuiltUpRoadLabel varchar(100),
	PRIMARY KEY (BuiltUpRoadKey)
)
Go
Create table DimGender(
	GenderKey int,
	GenderCode int,
	GenderLabel varchar(100),
	PRIMARY KEY (GenderKey)
)
Go
Create table DimCasualtyType(
	CasualtyTypeKey int,
	CasualtyTypeCode int,
	CasualtyTypeLabel varchar(100),
	PRIMARY KEY (CasualtyTypeKey)
)
Go

ALTER TABLE FactAccidents
ADD CONSTRAINT fk_Accidents_TimeOfDay
  FOREIGN KEY (TimeOfDayKey)
  REFERENCES DimTimeOfDay (TimeOfDayKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_CasualtyType
  FOREIGN KEY (CasualtyTypeKey)
  REFERENCES DimCasualtyType (CasualtyTypeKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_AgeBand
  FOREIGN KEY (AgeBandKey)
  REFERENCES DimAgeBand (AgeBandKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_Gender
  FOREIGN KEY (GenderKey)
  REFERENCES DimGender (GenderKey);

ALTER TABLE FactVehicles
ADD CONSTRAINT fk_Vehicles_JourneyPurpose
  FOREIGN KEY (JourneyPurposeKey)
  REFERENCES DimJourneyPurpose (JourneyPurposeKey);

ALTER TABLE FactVehicles
ADD CONSTRAINT fk_Vehicles_BuiltUpRoad
  FOREIGN KEY (BuiltUpRoadKey)
  REFERENCES DimBuiltUpRoad (BuiltUpRoadKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_AgeGroup
  FOREIGN KEY (AgeGroupKey)
  REFERENCES DimAgeGroup (AgeGroupKey);

ALTER TABLE FactAccidents
ADD CONSTRAINT fk_Accidents_RoadType
  FOREIGN KEY (RoadTypeKey)
  REFERENCES DimRoadType (RoadTypeKey);

ALTER TABLE FactAccidents
ADD CONSTRAINT fk_Accidents_UrbanOrRuralArea
  FOREIGN KEY (UrbanOrRuralAreaKey)
  REFERENCES DimUrbanRural (UrbanRuralKey);

ALTER TABLE FactVehicles
ADD CONSTRAINT fk_Vehicles_VehicleType
  FOREIGN KEY (VehicleTypeKey)
  REFERENCES DimVehicleType (VehicleTypeKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_LocalAuthorityDistrict
  FOREIGN KEY (LADKey)
  REFERENCES DimLocalAuthorityDistrict (LADKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_CasualtySeverity
  FOREIGN KEY (CasualtySeverityKey)
  REFERENCES DimCasualtySeverity (CasualtySeverityKey);

ALTER TABLE FactCasualties
ADD CONSTRAINT fk_Casualties_Day
  FOREIGN KEY (DateKey)
  REFERENCES DimDate (DateKey);

ALTER TABLE FactAccidents
ADD CONSTRAINT fk_Accidents_Day
  FOREIGN KEY (DateKey)
  REFERENCES DimDate (DateKey);

ALTER TABLE FactVehicles
ADD CONSTRAINT fk_Vehicles_Day
  FOREIGN KEY (DateKey)
  REFERENCES DimDate (DateKey);

ALTER TABLE FactAccidents
ADD CONSTRAINT fk_Accidents_AccidentSeverity
  FOREIGN KEY (AccidentSeverityKey)
  REFERENCES DimAccidentSeverity (AccidentSeverityKey);

ALTER TABLE FactVehicles
ADD CONSTRAINT fk_Vehicles_AccidentSeverity
  FOREIGN KEY (AccidentSeverityKey)
  REFERENCES DimAccidentSeverity (AccidentSeverityKey);

ALTER TABLE DimTownCity
ADD CONSTRAINT fk_DimTownCity_County
  FOREIGN KEY (CountyKey)
  REFERENCES DimCounty (CountyKey);

ALTER TABLE DimCounty
ADD CONSTRAINT fk_County_Region
  FOREIGN KEY (RegionKey)
  REFERENCES DimRegion (RegionKey);

ALTER TABLE DimRegion
ADD CONSTRAINT fk_Region_Country
  FOREIGN KEY (CountryKey)
  REFERENCES DimCountry (CountryKey);

INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110101, '2011-01-01', 1, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110102, '2011-01-02', 2, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110103, '2011-01-03', 3, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110104, '2011-01-04', 4, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110105, '2011-01-05', 5, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110106, '2011-01-06', 6, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110107, '2011-01-07', 7, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110108, '2011-01-08', 8, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110109, '2011-01-09', 9, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110110, '2011-01-10', 10, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110111, '2011-01-11', 11, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110112, '2011-01-12', 12, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110113, '2011-01-13', 13, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110114, '2011-01-14', 14, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110115, '2011-01-15', 15, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110116, '2011-01-16', 16, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110117, '2011-01-17', 17, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110118, '2011-01-18', 18, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110119, '2011-01-19', 19, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110120, '2011-01-20', 20, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110121, '2011-01-21', 21, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110122, '2011-01-22', 22, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110123, '2011-01-23', 23, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110124, '2011-01-24', 24, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110125, '2011-01-25', 25, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110126, '2011-01-26', 26, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110127, '2011-01-27', 27, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110128, '2011-01-28', 28, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110129, '2011-01-29', 29, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110130, '2011-01-30', 30, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110131, '2011-01-31', 31, 1, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110201, '2011-02-01', 1, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110202, '2011-02-02', 2, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110203, '2011-02-03', 3, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110204, '2011-02-04', 4, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110205, '2011-02-05', 5, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110206, '2011-02-06', 6, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110207, '2011-02-07', 7, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110208, '2011-02-08', 8, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110209, '2011-02-09', 9, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110210, '2011-02-10', 10, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110211, '2011-02-11', 11, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110212, '2011-02-12', 12, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110213, '2011-02-13', 13, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110214, '2011-02-14', 14, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110215, '2011-02-15', 15, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110216, '2011-02-16', 16, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110217, '2011-02-17', 17, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110218, '2011-02-18', 18, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110219, '2011-02-19', 19, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110220, '2011-02-20', 20, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110221, '2011-02-21', 21, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110222, '2011-02-22', 22, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110223, '2011-02-23', 23, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110224, '2011-02-24', 24, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110225, '2011-02-25', 25, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110226, '2011-02-26', 26, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110227, '2011-02-27', 27, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110228, '2011-02-28', 28, 2, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110301, '2011-03-01', 1, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110302, '2011-03-02', 2, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110303, '2011-03-03', 3, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110304, '2011-03-04', 4, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110305, '2011-03-05', 5, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110306, '2011-03-06', 6, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110307, '2011-03-07', 7, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110308, '2011-03-08', 8, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110309, '2011-03-09', 9, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110310, '2011-03-10', 10, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110311, '2011-03-11', 11, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110312, '2011-03-12', 12, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110313, '2011-03-13', 13, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110314, '2011-03-14', 14, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110315, '2011-03-15', 15, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110316, '2011-03-16', 16, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110317, '2011-03-17', 17, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110318, '2011-03-18', 18, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110319, '2011-03-19', 19, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110320, '2011-03-20', 20, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110321, '2011-03-21', 21, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110322, '2011-03-22', 22, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110323, '2011-03-23', 23, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110324, '2011-03-24', 24, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110325, '2011-03-25', 25, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110326, '2011-03-26', 26, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110327, '2011-03-27', 27, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110328, '2011-03-28', 28, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110329, '2011-03-29', 29, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110330, '2011-03-30', 30, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110331, '2011-03-31', 31, 3, 1, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110401, '2011-04-01', 1, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110402, '2011-04-02', 2, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110403, '2011-04-03', 3, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110404, '2011-04-04', 4, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110405, '2011-04-05', 5, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110406, '2011-04-06', 6, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110407, '2011-04-07', 7, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110408, '2011-04-08', 8, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110409, '2011-04-09', 9, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110410, '2011-04-10', 10, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110411, '2011-04-11', 11, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110412, '2011-04-12', 12, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110413, '2011-04-13', 13, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110414, '2011-04-14', 14, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110415, '2011-04-15', 15, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110416, '2011-04-16', 16, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110417, '2011-04-17', 17, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110418, '2011-04-18', 18, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110419, '2011-04-19', 19, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110420, '2011-04-20', 20, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110421, '2011-04-21', 21, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110422, '2011-04-22', 22, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110423, '2011-04-23', 23, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110424, '2011-04-24', 24, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110425, '2011-04-25', 25, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110426, '2011-04-26', 26, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110427, '2011-04-27', 27, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110428, '2011-04-28', 28, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110429, '2011-04-29', 29, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110430, '2011-04-30', 30, 4, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110501, '2011-05-01', 1, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110502, '2011-05-02', 2, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110503, '2011-05-03', 3, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110504, '2011-05-04', 4, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110505, '2011-05-05', 5, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110506, '2011-05-06', 6, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110507, '2011-05-07', 7, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110508, '2011-05-08', 8, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110509, '2011-05-09', 9, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110510, '2011-05-10', 10, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110511, '2011-05-11', 11, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110512, '2011-05-12', 12, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110513, '2011-05-13', 13, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110514, '2011-05-14', 14, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110515, '2011-05-15', 15, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110516, '2011-05-16', 16, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110517, '2011-05-17', 17, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110518, '2011-05-18', 18, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110519, '2011-05-19', 19, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110520, '2011-05-20', 20, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110521, '2011-05-21', 21, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110522, '2011-05-22', 22, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110523, '2011-05-23', 23, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110524, '2011-05-24', 24, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110525, '2011-05-25', 25, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110526, '2011-05-26', 26, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110527, '2011-05-27', 27, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110528, '2011-05-28', 28, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110529, '2011-05-29', 29, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110530, '2011-05-30', 30, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110531, '2011-05-31', 31, 5, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110601, '2011-06-01', 1, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110602, '2011-06-02', 2, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110603, '2011-06-03', 3, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110604, '2011-06-04', 4, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110605, '2011-06-05', 5, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110606, '2011-06-06', 6, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110607, '2011-06-07', 7, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110608, '2011-06-08', 8, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110609, '2011-06-09', 9, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110610, '2011-06-10', 10, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110611, '2011-06-11', 11, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110612, '2011-06-12', 12, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110613, '2011-06-13', 13, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110614, '2011-06-14', 14, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110615, '2011-06-15', 15, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110616, '2011-06-16', 16, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110617, '2011-06-17', 17, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110618, '2011-06-18', 18, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110619, '2011-06-19', 19, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110620, '2011-06-20', 20, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110621, '2011-06-21', 21, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110622, '2011-06-22', 22, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110623, '2011-06-23', 23, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110624, '2011-06-24', 24, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110625, '2011-06-25', 25, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110626, '2011-06-26', 26, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110627, '2011-06-27', 27, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110628, '2011-06-28', 28, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110629, '2011-06-29', 29, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110630, '2011-06-30', 30, 6, 2, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110701, '2011-07-01', 1, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110702, '2011-07-02', 2, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110703, '2011-07-03', 3, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110704, '2011-07-04', 4, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110705, '2011-07-05', 5, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110706, '2011-07-06', 6, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110707, '2011-07-07', 7, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110708, '2011-07-08', 8, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110709, '2011-07-09', 9, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110710, '2011-07-10', 10, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110711, '2011-07-11', 11, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110712, '2011-07-12', 12, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110713, '2011-07-13', 13, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110714, '2011-07-14', 14, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110715, '2011-07-15', 15, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110716, '2011-07-16', 16, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110717, '2011-07-17', 17, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110718, '2011-07-18', 18, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110719, '2011-07-19', 19, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110720, '2011-07-20', 20, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110721, '2011-07-21', 21, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110722, '2011-07-22', 22, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110723, '2011-07-23', 23, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110724, '2011-07-24', 24, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110725, '2011-07-25', 25, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110726, '2011-07-26', 26, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110727, '2011-07-27', 27, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110728, '2011-07-28', 28, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110729, '2011-07-29', 29, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110730, '2011-07-30', 30, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110731, '2011-07-31', 31, 7, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110801, '2011-08-01', 1, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110802, '2011-08-02', 2, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110803, '2011-08-03', 3, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110804, '2011-08-04', 4, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110805, '2011-08-05', 5, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110806, '2011-08-06', 6, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110807, '2011-08-07', 7, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110808, '2011-08-08', 8, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110809, '2011-08-09', 9, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110810, '2011-08-10', 10, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110811, '2011-08-11', 11, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110812, '2011-08-12', 12, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110813, '2011-08-13', 13, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110814, '2011-08-14', 14, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110815, '2011-08-15', 15, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110816, '2011-08-16', 16, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110817, '2011-08-17', 17, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110818, '2011-08-18', 18, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110819, '2011-08-19', 19, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110820, '2011-08-20', 20, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110821, '2011-08-21', 21, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110822, '2011-08-22', 22, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110823, '2011-08-23', 23, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110824, '2011-08-24', 24, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110825, '2011-08-25', 25, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110826, '2011-08-26', 26, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110827, '2011-08-27', 27, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110828, '2011-08-28', 28, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110829, '2011-08-29', 29, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110830, '2011-08-30', 30, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110831, '2011-08-31', 31, 8, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110901, '2011-09-01', 1, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110902, '2011-09-02', 2, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110903, '2011-09-03', 3, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110904, '2011-09-04', 4, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110905, '2011-09-05', 5, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110906, '2011-09-06', 6, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110907, '2011-09-07', 7, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110908, '2011-09-08', 8, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110909, '2011-09-09', 9, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110910, '2011-09-10', 10, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110911, '2011-09-11', 11, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110912, '2011-09-12', 12, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110913, '2011-09-13', 13, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110914, '2011-09-14', 14, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110915, '2011-09-15', 15, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110916, '2011-09-16', 16, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110917, '2011-09-17', 17, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110918, '2011-09-18', 18, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110919, '2011-09-19', 19, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110920, '2011-09-20', 20, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110921, '2011-09-21', 21, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110922, '2011-09-22', 22, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110923, '2011-09-23', 23, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110924, '2011-09-24', 24, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110925, '2011-09-25', 25, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110926, '2011-09-26', 26, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110927, '2011-09-27', 27, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110928, '2011-09-28', 28, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110929, '2011-09-29', 29, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20110930, '2011-09-30', 30, 9, 3, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111001, '2011-10-01', 1, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111002, '2011-10-02', 2, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111003, '2011-10-03', 3, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111004, '2011-10-04', 4, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111005, '2011-10-05', 5, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111006, '2011-10-06', 6, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111007, '2011-10-07', 7, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111008, '2011-10-08', 8, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111009, '2011-10-09', 9, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111010, '2011-10-10', 10, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111011, '2011-10-11', 11, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111012, '2011-10-12', 12, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111013, '2011-10-13', 13, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111014, '2011-10-14', 14, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111015, '2011-10-15', 15, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111016, '2011-10-16', 16, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111017, '2011-10-17', 17, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111018, '2011-10-18', 18, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111019, '2011-10-19', 19, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111020, '2011-10-20', 20, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111021, '2011-10-21', 21, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111022, '2011-10-22', 22, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111023, '2011-10-23', 23, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111024, '2011-10-24', 24, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111025, '2011-10-25', 25, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111026, '2011-10-26', 26, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111027, '2011-10-27', 27, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111028, '2011-10-28', 28, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111029, '2011-10-29', 29, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111030, '2011-10-30', 30, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111031, '2011-10-31', 31, 10, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111101, '2011-11-01', 1, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111102, '2011-11-02', 2, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111103, '2011-11-03', 3, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111104, '2011-11-04', 4, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111105, '2011-11-05', 5, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111106, '2011-11-06', 6, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111107, '2011-11-07', 7, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111108, '2011-11-08', 8, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111109, '2011-11-09', 9, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111110, '2011-11-10', 10, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111111, '2011-11-11', 11, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111112, '2011-11-12', 12, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111113, '2011-11-13', 13, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111114, '2011-11-14', 14, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111115, '2011-11-15', 15, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111116, '2011-11-16', 16, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111117, '2011-11-17', 17, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111118, '2011-11-18', 18, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111119, '2011-11-19', 19, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111120, '2011-11-20', 20, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111121, '2011-11-21', 21, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111122, '2011-11-22', 22, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111123, '2011-11-23', 23, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111124, '2011-11-24', 24, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111125, '2011-11-25', 25, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111126, '2011-11-26', 26, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111127, '2011-11-27', 27, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111128, '2011-11-28', 28, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111129, '2011-11-29', 29, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111130, '2011-11-30', 30, 11, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111201, '2011-12-01', 1, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111202, '2011-12-02', 2, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111203, '2011-12-03', 3, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111204, '2011-12-04', 4, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111205, '2011-12-05', 5, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111206, '2011-12-06', 6, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111207, '2011-12-07', 7, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111208, '2011-12-08', 8, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111209, '2011-12-09', 9, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111210, '2011-12-10', 10, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111211, '2011-12-11', 11, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111212, '2011-12-12', 12, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111213, '2011-12-13', 13, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111214, '2011-12-14', 14, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111215, '2011-12-15', 15, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111216, '2011-12-16', 16, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111217, '2011-12-17', 17, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111218, '2011-12-18', 18, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111219, '2011-12-19', 19, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111220, '2011-12-20', 20, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111221, '2011-12-21', 21, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111222, '2011-12-22', 22, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111223, '2011-12-23', 23, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111224, '2011-12-24', 24, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111225, '2011-12-25', 25, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111226, '2011-12-26', 26, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111227, '2011-12-27', 27, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111228, '2011-12-28', 28, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111229, '2011-12-29', 29, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111230, '2011-12-30', 30, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20111231, '2011-12-31', 31, 12, 4, 2011);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120101, '2012-01-01', 1, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120102, '2012-01-02', 2, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120103, '2012-01-03', 3, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120104, '2012-01-04', 4, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120105, '2012-01-05', 5, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120106, '2012-01-06', 6, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120107, '2012-01-07', 7, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120108, '2012-01-08', 8, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120109, '2012-01-09', 9, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120110, '2012-01-10', 10, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120111, '2012-01-11', 11, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120112, '2012-01-12', 12, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120113, '2012-01-13', 13, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120114, '2012-01-14', 14, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120115, '2012-01-15', 15, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120116, '2012-01-16', 16, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120117, '2012-01-17', 17, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120118, '2012-01-18', 18, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120119, '2012-01-19', 19, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120120, '2012-01-20', 20, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120121, '2012-01-21', 21, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120122, '2012-01-22', 22, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120123, '2012-01-23', 23, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120124, '2012-01-24', 24, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120125, '2012-01-25', 25, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120126, '2012-01-26', 26, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120127, '2012-01-27', 27, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120128, '2012-01-28', 28, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120129, '2012-01-29', 29, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120130, '2012-01-30', 30, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120131, '2012-01-31', 31, 1, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120201, '2012-02-01', 1, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120202, '2012-02-02', 2, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120203, '2012-02-03', 3, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120204, '2012-02-04', 4, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120205, '2012-02-05', 5, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120206, '2012-02-06', 6, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120207, '2012-02-07', 7, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120208, '2012-02-08', 8, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120209, '2012-02-09', 9, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120210, '2012-02-10', 10, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120211, '2012-02-11', 11, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120212, '2012-02-12', 12, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120213, '2012-02-13', 13, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120214, '2012-02-14', 14, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120215, '2012-02-15', 15, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120216, '2012-02-16', 16, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120217, '2012-02-17', 17, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120218, '2012-02-18', 18, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120219, '2012-02-19', 19, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120220, '2012-02-20', 20, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120221, '2012-02-21', 21, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120222, '2012-02-22', 22, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120223, '2012-02-23', 23, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120224, '2012-02-24', 24, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120225, '2012-02-25', 25, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120226, '2012-02-26', 26, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120227, '2012-02-27', 27, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120228, '2012-02-28', 28, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120229, '2012-02-29', 29, 2, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120301, '2012-03-01', 1, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120302, '2012-03-02', 2, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120303, '2012-03-03', 3, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120304, '2012-03-04', 4, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120305, '2012-03-05', 5, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120306, '2012-03-06', 6, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120307, '2012-03-07', 7, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120308, '2012-03-08', 8, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120309, '2012-03-09', 9, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120310, '2012-03-10', 10, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120311, '2012-03-11', 11, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120312, '2012-03-12', 12, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120313, '2012-03-13', 13, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120314, '2012-03-14', 14, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120315, '2012-03-15', 15, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120316, '2012-03-16', 16, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120317, '2012-03-17', 17, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120318, '2012-03-18', 18, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120319, '2012-03-19', 19, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120320, '2012-03-20', 20, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120321, '2012-03-21', 21, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120322, '2012-03-22', 22, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120323, '2012-03-23', 23, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120324, '2012-03-24', 24, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120325, '2012-03-25', 25, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120326, '2012-03-26', 26, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120327, '2012-03-27', 27, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120328, '2012-03-28', 28, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120329, '2012-03-29', 29, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120330, '2012-03-30', 30, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120331, '2012-03-31', 31, 3, 1, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120401, '2012-04-01', 1, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120402, '2012-04-02', 2, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120403, '2012-04-03', 3, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120404, '2012-04-04', 4, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120405, '2012-04-05', 5, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120406, '2012-04-06', 6, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120407, '2012-04-07', 7, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120408, '2012-04-08', 8, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120409, '2012-04-09', 9, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120410, '2012-04-10', 10, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120411, '2012-04-11', 11, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120412, '2012-04-12', 12, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120413, '2012-04-13', 13, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120414, '2012-04-14', 14, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120415, '2012-04-15', 15, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120416, '2012-04-16', 16, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120417, '2012-04-17', 17, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120418, '2012-04-18', 18, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120419, '2012-04-19', 19, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120420, '2012-04-20', 20, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120421, '2012-04-21', 21, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120422, '2012-04-22', 22, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120423, '2012-04-23', 23, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120424, '2012-04-24', 24, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120425, '2012-04-25', 25, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120426, '2012-04-26', 26, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120427, '2012-04-27', 27, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120428, '2012-04-28', 28, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120429, '2012-04-29', 29, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120430, '2012-04-30', 30, 4, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120501, '2012-05-01', 1, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120502, '2012-05-02', 2, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120503, '2012-05-03', 3, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120504, '2012-05-04', 4, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120505, '2012-05-05', 5, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120506, '2012-05-06', 6, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120507, '2012-05-07', 7, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120508, '2012-05-08', 8, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120509, '2012-05-09', 9, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120510, '2012-05-10', 10, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120511, '2012-05-11', 11, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120512, '2012-05-12', 12, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120513, '2012-05-13', 13, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120514, '2012-05-14', 14, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120515, '2012-05-15', 15, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120516, '2012-05-16', 16, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120517, '2012-05-17', 17, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120518, '2012-05-18', 18, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120519, '2012-05-19', 19, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120520, '2012-05-20', 20, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120521, '2012-05-21', 21, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120522, '2012-05-22', 22, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120523, '2012-05-23', 23, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120524, '2012-05-24', 24, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120525, '2012-05-25', 25, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120526, '2012-05-26', 26, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120527, '2012-05-27', 27, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120528, '2012-05-28', 28, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120529, '2012-05-29', 29, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120530, '2012-05-30', 30, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120531, '2012-05-31', 31, 5, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120601, '2012-06-01', 1, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120602, '2012-06-02', 2, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120603, '2012-06-03', 3, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120604, '2012-06-04', 4, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120605, '2012-06-05', 5, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120606, '2012-06-06', 6, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120607, '2012-06-07', 7, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120608, '2012-06-08', 8, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120609, '2012-06-09', 9, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120610, '2012-06-10', 10, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120611, '2012-06-11', 11, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120612, '2012-06-12', 12, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120613, '2012-06-13', 13, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120614, '2012-06-14', 14, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120615, '2012-06-15', 15, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120616, '2012-06-16', 16, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120617, '2012-06-17', 17, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120618, '2012-06-18', 18, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120619, '2012-06-19', 19, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120620, '2012-06-20', 20, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120621, '2012-06-21', 21, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120622, '2012-06-22', 22, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120623, '2012-06-23', 23, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120624, '2012-06-24', 24, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120625, '2012-06-25', 25, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120626, '2012-06-26', 26, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120627, '2012-06-27', 27, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120628, '2012-06-28', 28, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120629, '2012-06-29', 29, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120630, '2012-06-30', 30, 6, 2, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120701, '2012-07-01', 1, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120702, '2012-07-02', 2, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120703, '2012-07-03', 3, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120704, '2012-07-04', 4, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120705, '2012-07-05', 5, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120706, '2012-07-06', 6, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120707, '2012-07-07', 7, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120708, '2012-07-08', 8, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120709, '2012-07-09', 9, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120710, '2012-07-10', 10, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120711, '2012-07-11', 11, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120712, '2012-07-12', 12, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120713, '2012-07-13', 13, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120714, '2012-07-14', 14, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120715, '2012-07-15', 15, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120716, '2012-07-16', 16, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120717, '2012-07-17', 17, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120718, '2012-07-18', 18, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120719, '2012-07-19', 19, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120720, '2012-07-20', 20, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120721, '2012-07-21', 21, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120722, '2012-07-22', 22, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120723, '2012-07-23', 23, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120724, '2012-07-24', 24, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120725, '2012-07-25', 25, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120726, '2012-07-26', 26, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120727, '2012-07-27', 27, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120728, '2012-07-28', 28, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120729, '2012-07-29', 29, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120730, '2012-07-30', 30, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120731, '2012-07-31', 31, 7, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120801, '2012-08-01', 1, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120802, '2012-08-02', 2, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120803, '2012-08-03', 3, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120804, '2012-08-04', 4, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120805, '2012-08-05', 5, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120806, '2012-08-06', 6, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120807, '2012-08-07', 7, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120808, '2012-08-08', 8, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120809, '2012-08-09', 9, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120810, '2012-08-10', 10, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120811, '2012-08-11', 11, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120812, '2012-08-12', 12, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120813, '2012-08-13', 13, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120814, '2012-08-14', 14, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120815, '2012-08-15', 15, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120816, '2012-08-16', 16, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120817, '2012-08-17', 17, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120818, '2012-08-18', 18, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120819, '2012-08-19', 19, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120820, '2012-08-20', 20, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120821, '2012-08-21', 21, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120822, '2012-08-22', 22, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120823, '2012-08-23', 23, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120824, '2012-08-24', 24, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120825, '2012-08-25', 25, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120826, '2012-08-26', 26, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120827, '2012-08-27', 27, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120828, '2012-08-28', 28, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120829, '2012-08-29', 29, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120830, '2012-08-30', 30, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120831, '2012-08-31', 31, 8, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120901, '2012-09-01', 1, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120902, '2012-09-02', 2, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120903, '2012-09-03', 3, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120904, '2012-09-04', 4, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120905, '2012-09-05', 5, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120906, '2012-09-06', 6, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120907, '2012-09-07', 7, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120908, '2012-09-08', 8, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120909, '2012-09-09', 9, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120910, '2012-09-10', 10, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120911, '2012-09-11', 11, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120912, '2012-09-12', 12, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120913, '2012-09-13', 13, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120914, '2012-09-14', 14, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120915, '2012-09-15', 15, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120916, '2012-09-16', 16, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120917, '2012-09-17', 17, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120918, '2012-09-18', 18, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120919, '2012-09-19', 19, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120920, '2012-09-20', 20, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120921, '2012-09-21', 21, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120922, '2012-09-22', 22, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120923, '2012-09-23', 23, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120924, '2012-09-24', 24, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120925, '2012-09-25', 25, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120926, '2012-09-26', 26, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120927, '2012-09-27', 27, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120928, '2012-09-28', 28, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120929, '2012-09-29', 29, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20120930, '2012-09-30', 30, 9, 3, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121001, '2012-10-01', 1, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121002, '2012-10-02', 2, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121003, '2012-10-03', 3, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121004, '2012-10-04', 4, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121005, '2012-10-05', 5, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121006, '2012-10-06', 6, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121007, '2012-10-07', 7, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121008, '2012-10-08', 8, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121009, '2012-10-09', 9, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121010, '2012-10-10', 10, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121011, '2012-10-11', 11, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121012, '2012-10-12', 12, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121013, '2012-10-13', 13, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121014, '2012-10-14', 14, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121015, '2012-10-15', 15, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121016, '2012-10-16', 16, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121017, '2012-10-17', 17, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121018, '2012-10-18', 18, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121019, '2012-10-19', 19, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121020, '2012-10-20', 20, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121021, '2012-10-21', 21, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121022, '2012-10-22', 22, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121023, '2012-10-23', 23, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121024, '2012-10-24', 24, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121025, '2012-10-25', 25, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121026, '2012-10-26', 26, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121027, '2012-10-27', 27, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121028, '2012-10-28', 28, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121029, '2012-10-29', 29, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121030, '2012-10-30', 30, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121031, '2012-10-31', 31, 10, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121101, '2012-11-01', 1, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121102, '2012-11-02', 2, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121103, '2012-11-03', 3, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121104, '2012-11-04', 4, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121105, '2012-11-05', 5, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121106, '2012-11-06', 6, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121107, '2012-11-07', 7, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121108, '2012-11-08', 8, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121109, '2012-11-09', 9, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121110, '2012-11-10', 10, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121111, '2012-11-11', 11, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121112, '2012-11-12', 12, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121113, '2012-11-13', 13, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121114, '2012-11-14', 14, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121115, '2012-11-15', 15, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121116, '2012-11-16', 16, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121117, '2012-11-17', 17, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121118, '2012-11-18', 18, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121119, '2012-11-19', 19, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121120, '2012-11-20', 20, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121121, '2012-11-21', 21, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121122, '2012-11-22', 22, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121123, '2012-11-23', 23, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121124, '2012-11-24', 24, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121125, '2012-11-25', 25, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121126, '2012-11-26', 26, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121127, '2012-11-27', 27, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121128, '2012-11-28', 28, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121129, '2012-11-29', 29, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121130, '2012-11-30', 30, 11, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121201, '2012-12-01', 1, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121202, '2012-12-02', 2, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121203, '2012-12-03', 3, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121204, '2012-12-04', 4, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121205, '2012-12-05', 5, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121206, '2012-12-06', 6, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121207, '2012-12-07', 7, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121208, '2012-12-08', 8, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121209, '2012-12-09', 9, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121210, '2012-12-10', 10, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121211, '2012-12-11', 11, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121212, '2012-12-12', 12, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121213, '2012-12-13', 13, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121214, '2012-12-14', 14, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121215, '2012-12-15', 15, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121216, '2012-12-16', 16, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121217, '2012-12-17', 17, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121218, '2012-12-18', 18, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121219, '2012-12-19', 19, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121220, '2012-12-20', 20, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121221, '2012-12-21', 21, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121222, '2012-12-22', 22, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121223, '2012-12-23', 23, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121224, '2012-12-24', 24, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121225, '2012-12-25', 25, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121226, '2012-12-26', 26, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121227, '2012-12-27', 27, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121228, '2012-12-28', 28, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121229, '2012-12-29', 29, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121230, '2012-12-30', 30, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20121231, '2012-12-31', 31, 12, 4, 2012);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130101, '2013-01-01', 1, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130102, '2013-01-02', 2, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130103, '2013-01-03', 3, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130104, '2013-01-04', 4, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130105, '2013-01-05', 5, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130106, '2013-01-06', 6, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130107, '2013-01-07', 7, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130108, '2013-01-08', 8, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130109, '2013-01-09', 9, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130110, '2013-01-10', 10, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130111, '2013-01-11', 11, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130112, '2013-01-12', 12, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130113, '2013-01-13', 13, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130114, '2013-01-14', 14, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130115, '2013-01-15', 15, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130116, '2013-01-16', 16, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130117, '2013-01-17', 17, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130118, '2013-01-18', 18, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130119, '2013-01-19', 19, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130120, '2013-01-20', 20, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130121, '2013-01-21', 21, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130122, '2013-01-22', 22, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130123, '2013-01-23', 23, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130124, '2013-01-24', 24, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130125, '2013-01-25', 25, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130126, '2013-01-26', 26, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130127, '2013-01-27', 27, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130128, '2013-01-28', 28, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130129, '2013-01-29', 29, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130130, '2013-01-30', 30, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130131, '2013-01-31', 31, 1, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130201, '2013-02-01', 1, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130202, '2013-02-02', 2, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130203, '2013-02-03', 3, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130204, '2013-02-04', 4, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130205, '2013-02-05', 5, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130206, '2013-02-06', 6, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130207, '2013-02-07', 7, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130208, '2013-02-08', 8, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130209, '2013-02-09', 9, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130210, '2013-02-10', 10, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130211, '2013-02-11', 11, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130212, '2013-02-12', 12, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130213, '2013-02-13', 13, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130214, '2013-02-14', 14, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130215, '2013-02-15', 15, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130216, '2013-02-16', 16, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130217, '2013-02-17', 17, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130218, '2013-02-18', 18, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130219, '2013-02-19', 19, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130220, '2013-02-20', 20, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130221, '2013-02-21', 21, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130222, '2013-02-22', 22, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130223, '2013-02-23', 23, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130224, '2013-02-24', 24, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130225, '2013-02-25', 25, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130226, '2013-02-26', 26, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130227, '2013-02-27', 27, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130228, '2013-02-28', 28, 2, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130301, '2013-03-01', 1, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130302, '2013-03-02', 2, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130303, '2013-03-03', 3, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130304, '2013-03-04', 4, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130305, '2013-03-05', 5, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130306, '2013-03-06', 6, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130307, '2013-03-07', 7, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130308, '2013-03-08', 8, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130309, '2013-03-09', 9, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130310, '2013-03-10', 10, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130311, '2013-03-11', 11, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130312, '2013-03-12', 12, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130313, '2013-03-13', 13, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130314, '2013-03-14', 14, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130315, '2013-03-15', 15, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130316, '2013-03-16', 16, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130317, '2013-03-17', 17, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130318, '2013-03-18', 18, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130319, '2013-03-19', 19, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130320, '2013-03-20', 20, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130321, '2013-03-21', 21, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130322, '2013-03-22', 22, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130323, '2013-03-23', 23, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130324, '2013-03-24', 24, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130325, '2013-03-25', 25, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130326, '2013-03-26', 26, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130327, '2013-03-27', 27, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130328, '2013-03-28', 28, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130329, '2013-03-29', 29, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130330, '2013-03-30', 30, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130331, '2013-03-31', 31, 3, 1, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130401, '2013-04-01', 1, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130402, '2013-04-02', 2, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130403, '2013-04-03', 3, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130404, '2013-04-04', 4, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130405, '2013-04-05', 5, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130406, '2013-04-06', 6, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130407, '2013-04-07', 7, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130408, '2013-04-08', 8, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130409, '2013-04-09', 9, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130410, '2013-04-10', 10, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130411, '2013-04-11', 11, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130412, '2013-04-12', 12, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130413, '2013-04-13', 13, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130414, '2013-04-14', 14, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130415, '2013-04-15', 15, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130416, '2013-04-16', 16, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130417, '2013-04-17', 17, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130418, '2013-04-18', 18, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130419, '2013-04-19', 19, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130420, '2013-04-20', 20, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130421, '2013-04-21', 21, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130422, '2013-04-22', 22, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130423, '2013-04-23', 23, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130424, '2013-04-24', 24, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130425, '2013-04-25', 25, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130426, '2013-04-26', 26, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130427, '2013-04-27', 27, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130428, '2013-04-28', 28, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130429, '2013-04-29', 29, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130430, '2013-04-30', 30, 4, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130501, '2013-05-01', 1, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130502, '2013-05-02', 2, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130503, '2013-05-03', 3, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130504, '2013-05-04', 4, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130505, '2013-05-05', 5, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130506, '2013-05-06', 6, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130507, '2013-05-07', 7, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130508, '2013-05-08', 8, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130509, '2013-05-09', 9, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130510, '2013-05-10', 10, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130511, '2013-05-11', 11, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130512, '2013-05-12', 12, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130513, '2013-05-13', 13, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130514, '2013-05-14', 14, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130515, '2013-05-15', 15, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130516, '2013-05-16', 16, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130517, '2013-05-17', 17, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130518, '2013-05-18', 18, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130519, '2013-05-19', 19, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130520, '2013-05-20', 20, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130521, '2013-05-21', 21, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130522, '2013-05-22', 22, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130523, '2013-05-23', 23, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130524, '2013-05-24', 24, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130525, '2013-05-25', 25, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130526, '2013-05-26', 26, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130527, '2013-05-27', 27, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130528, '2013-05-28', 28, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130529, '2013-05-29', 29, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130530, '2013-05-30', 30, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130531, '2013-05-31', 31, 5, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130601, '2013-06-01', 1, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130602, '2013-06-02', 2, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130603, '2013-06-03', 3, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130604, '2013-06-04', 4, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130605, '2013-06-05', 5, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130606, '2013-06-06', 6, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130607, '2013-06-07', 7, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130608, '2013-06-08', 8, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130609, '2013-06-09', 9, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130610, '2013-06-10', 10, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130611, '2013-06-11', 11, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130612, '2013-06-12', 12, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130613, '2013-06-13', 13, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130614, '2013-06-14', 14, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130615, '2013-06-15', 15, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130616, '2013-06-16', 16, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130617, '2013-06-17', 17, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130618, '2013-06-18', 18, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130619, '2013-06-19', 19, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130620, '2013-06-20', 20, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130621, '2013-06-21', 21, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130622, '2013-06-22', 22, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130623, '2013-06-23', 23, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130624, '2013-06-24', 24, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130625, '2013-06-25', 25, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130626, '2013-06-26', 26, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130627, '2013-06-27', 27, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130628, '2013-06-28', 28, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130629, '2013-06-29', 29, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130630, '2013-06-30', 30, 6, 2, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130701, '2013-07-01', 1, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130702, '2013-07-02', 2, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130703, '2013-07-03', 3, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130704, '2013-07-04', 4, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130705, '2013-07-05', 5, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130706, '2013-07-06', 6, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130707, '2013-07-07', 7, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130708, '2013-07-08', 8, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130709, '2013-07-09', 9, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130710, '2013-07-10', 10, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130711, '2013-07-11', 11, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130712, '2013-07-12', 12, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130713, '2013-07-13', 13, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130714, '2013-07-14', 14, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130715, '2013-07-15', 15, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130716, '2013-07-16', 16, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130717, '2013-07-17', 17, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130718, '2013-07-18', 18, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130719, '2013-07-19', 19, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130720, '2013-07-20', 20, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130721, '2013-07-21', 21, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130722, '2013-07-22', 22, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130723, '2013-07-23', 23, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130724, '2013-07-24', 24, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130725, '2013-07-25', 25, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130726, '2013-07-26', 26, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130727, '2013-07-27', 27, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130728, '2013-07-28', 28, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130729, '2013-07-29', 29, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130730, '2013-07-30', 30, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130731, '2013-07-31', 31, 7, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130801, '2013-08-01', 1, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130802, '2013-08-02', 2, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130803, '2013-08-03', 3, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130804, '2013-08-04', 4, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130805, '2013-08-05', 5, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130806, '2013-08-06', 6, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130807, '2013-08-07', 7, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130808, '2013-08-08', 8, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130809, '2013-08-09', 9, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130810, '2013-08-10', 10, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130811, '2013-08-11', 11, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130812, '2013-08-12', 12, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130813, '2013-08-13', 13, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130814, '2013-08-14', 14, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130815, '2013-08-15', 15, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130816, '2013-08-16', 16, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130817, '2013-08-17', 17, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130818, '2013-08-18', 18, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130819, '2013-08-19', 19, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130820, '2013-08-20', 20, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130821, '2013-08-21', 21, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130822, '2013-08-22', 22, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130823, '2013-08-23', 23, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130824, '2013-08-24', 24, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130825, '2013-08-25', 25, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130826, '2013-08-26', 26, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130827, '2013-08-27', 27, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130828, '2013-08-28', 28, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130829, '2013-08-29', 29, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130830, '2013-08-30', 30, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130831, '2013-08-31', 31, 8, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130901, '2013-09-01', 1, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130902, '2013-09-02', 2, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130903, '2013-09-03', 3, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130904, '2013-09-04', 4, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130905, '2013-09-05', 5, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130906, '2013-09-06', 6, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130907, '2013-09-07', 7, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130908, '2013-09-08', 8, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130909, '2013-09-09', 9, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130910, '2013-09-10', 10, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130911, '2013-09-11', 11, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130912, '2013-09-12', 12, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130913, '2013-09-13', 13, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130914, '2013-09-14', 14, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130915, '2013-09-15', 15, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130916, '2013-09-16', 16, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130917, '2013-09-17', 17, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130918, '2013-09-18', 18, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130919, '2013-09-19', 19, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130920, '2013-09-20', 20, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130921, '2013-09-21', 21, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130922, '2013-09-22', 22, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130923, '2013-09-23', 23, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130924, '2013-09-24', 24, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130925, '2013-09-25', 25, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130926, '2013-09-26', 26, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130927, '2013-09-27', 27, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130928, '2013-09-28', 28, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130929, '2013-09-29', 29, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20130930, '2013-09-30', 30, 9, 3, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131001, '2013-10-01', 1, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131002, '2013-10-02', 2, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131003, '2013-10-03', 3, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131004, '2013-10-04', 4, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131005, '2013-10-05', 5, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131006, '2013-10-06', 6, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131007, '2013-10-07', 7, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131008, '2013-10-08', 8, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131009, '2013-10-09', 9, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131010, '2013-10-10', 10, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131011, '2013-10-11', 11, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131012, '2013-10-12', 12, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131013, '2013-10-13', 13, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131014, '2013-10-14', 14, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131015, '2013-10-15', 15, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131016, '2013-10-16', 16, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131017, '2013-10-17', 17, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131018, '2013-10-18', 18, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131019, '2013-10-19', 19, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131020, '2013-10-20', 20, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131021, '2013-10-21', 21, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131022, '2013-10-22', 22, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131023, '2013-10-23', 23, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131024, '2013-10-24', 24, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131025, '2013-10-25', 25, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131026, '2013-10-26', 26, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131027, '2013-10-27', 27, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131028, '2013-10-28', 28, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131029, '2013-10-29', 29, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131030, '2013-10-30', 30, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131031, '2013-10-31', 31, 10, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131101, '2013-11-01', 1, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131102, '2013-11-02', 2, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131103, '2013-11-03', 3, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131104, '2013-11-04', 4, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131105, '2013-11-05', 5, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131106, '2013-11-06', 6, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131107, '2013-11-07', 7, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131108, '2013-11-08', 8, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131109, '2013-11-09', 9, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131110, '2013-11-10', 10, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131111, '2013-11-11', 11, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131112, '2013-11-12', 12, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131113, '2013-11-13', 13, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131114, '2013-11-14', 14, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131115, '2013-11-15', 15, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131116, '2013-11-16', 16, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131117, '2013-11-17', 17, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131118, '2013-11-18', 18, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131119, '2013-11-19', 19, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131120, '2013-11-20', 20, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131121, '2013-11-21', 21, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131122, '2013-11-22', 22, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131123, '2013-11-23', 23, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131124, '2013-11-24', 24, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131125, '2013-11-25', 25, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131126, '2013-11-26', 26, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131127, '2013-11-27', 27, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131128, '2013-11-28', 28, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131129, '2013-11-29', 29, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131130, '2013-11-30', 30, 11, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131201, '2013-12-01', 1, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131202, '2013-12-02', 2, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131203, '2013-12-03', 3, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131204, '2013-12-04', 4, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131205, '2013-12-05', 5, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131206, '2013-12-06', 6, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131207, '2013-12-07', 7, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131208, '2013-12-08', 8, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131209, '2013-12-09', 9, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131210, '2013-12-10', 10, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131211, '2013-12-11', 11, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131212, '2013-12-12', 12, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131213, '2013-12-13', 13, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131214, '2013-12-14', 14, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131215, '2013-12-15', 15, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131216, '2013-12-16', 16, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131217, '2013-12-17', 17, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131218, '2013-12-18', 18, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131219, '2013-12-19', 19, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131220, '2013-12-20', 20, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131221, '2013-12-21', 21, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131222, '2013-12-22', 22, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131223, '2013-12-23', 23, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131224, '2013-12-24', 24, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131225, '2013-12-25', 25, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131226, '2013-12-26', 26, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131227, '2013-12-27', 27, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131228, '2013-12-28', 28, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131229, '2013-12-29', 29, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131230, '2013-12-30', 30, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20131231, '2013-12-31', 31, 12, 4, 2013);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140101, '2014-01-01', 1, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140102, '2014-01-02', 2, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140103, '2014-01-03', 3, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140104, '2014-01-04', 4, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140105, '2014-01-05', 5, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140106, '2014-01-06', 6, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140107, '2014-01-07', 7, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140108, '2014-01-08', 8, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140109, '2014-01-09', 9, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140110, '2014-01-10', 10, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140111, '2014-01-11', 11, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140112, '2014-01-12', 12, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140113, '2014-01-13', 13, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140114, '2014-01-14', 14, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140115, '2014-01-15', 15, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140116, '2014-01-16', 16, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140117, '2014-01-17', 17, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140118, '2014-01-18', 18, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140119, '2014-01-19', 19, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140120, '2014-01-20', 20, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140121, '2014-01-21', 21, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140122, '2014-01-22', 22, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140123, '2014-01-23', 23, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140124, '2014-01-24', 24, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140125, '2014-01-25', 25, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140126, '2014-01-26', 26, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140127, '2014-01-27', 27, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140128, '2014-01-28', 28, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140129, '2014-01-29', 29, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140130, '2014-01-30', 30, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140131, '2014-01-31', 31, 1, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140201, '2014-02-01', 1, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140202, '2014-02-02', 2, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140203, '2014-02-03', 3, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140204, '2014-02-04', 4, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140205, '2014-02-05', 5, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140206, '2014-02-06', 6, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140207, '2014-02-07', 7, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140208, '2014-02-08', 8, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140209, '2014-02-09', 9, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140210, '2014-02-10', 10, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140211, '2014-02-11', 11, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140212, '2014-02-12', 12, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140213, '2014-02-13', 13, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140214, '2014-02-14', 14, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140215, '2014-02-15', 15, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140216, '2014-02-16', 16, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140217, '2014-02-17', 17, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140218, '2014-02-18', 18, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140219, '2014-02-19', 19, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140220, '2014-02-20', 20, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140221, '2014-02-21', 21, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140222, '2014-02-22', 22, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140223, '2014-02-23', 23, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140224, '2014-02-24', 24, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140225, '2014-02-25', 25, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140226, '2014-02-26', 26, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140227, '2014-02-27', 27, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140228, '2014-02-28', 28, 2, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140301, '2014-03-01', 1, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140302, '2014-03-02', 2, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140303, '2014-03-03', 3, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140304, '2014-03-04', 4, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140305, '2014-03-05', 5, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140306, '2014-03-06', 6, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140307, '2014-03-07', 7, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140308, '2014-03-08', 8, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140309, '2014-03-09', 9, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140310, '2014-03-10', 10, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140311, '2014-03-11', 11, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140312, '2014-03-12', 12, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140313, '2014-03-13', 13, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140314, '2014-03-14', 14, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140315, '2014-03-15', 15, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140316, '2014-03-16', 16, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140317, '2014-03-17', 17, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140318, '2014-03-18', 18, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140319, '2014-03-19', 19, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140320, '2014-03-20', 20, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140321, '2014-03-21', 21, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140322, '2014-03-22', 22, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140323, '2014-03-23', 23, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140324, '2014-03-24', 24, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140325, '2014-03-25', 25, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140326, '2014-03-26', 26, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140327, '2014-03-27', 27, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140328, '2014-03-28', 28, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140329, '2014-03-29', 29, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140330, '2014-03-30', 30, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140331, '2014-03-31', 31, 3, 1, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140401, '2014-04-01', 1, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140402, '2014-04-02', 2, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140403, '2014-04-03', 3, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140404, '2014-04-04', 4, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140405, '2014-04-05', 5, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140406, '2014-04-06', 6, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140407, '2014-04-07', 7, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140408, '2014-04-08', 8, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140409, '2014-04-09', 9, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140410, '2014-04-10', 10, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140411, '2014-04-11', 11, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140412, '2014-04-12', 12, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140413, '2014-04-13', 13, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140414, '2014-04-14', 14, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140415, '2014-04-15', 15, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140416, '2014-04-16', 16, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140417, '2014-04-17', 17, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140418, '2014-04-18', 18, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140419, '2014-04-19', 19, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140420, '2014-04-20', 20, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140421, '2014-04-21', 21, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140422, '2014-04-22', 22, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140423, '2014-04-23', 23, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140424, '2014-04-24', 24, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140425, '2014-04-25', 25, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140426, '2014-04-26', 26, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140427, '2014-04-27', 27, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140428, '2014-04-28', 28, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140429, '2014-04-29', 29, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140430, '2014-04-30', 30, 4, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140501, '2014-05-01', 1, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140502, '2014-05-02', 2, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140503, '2014-05-03', 3, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140504, '2014-05-04', 4, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140505, '2014-05-05', 5, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140506, '2014-05-06', 6, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140507, '2014-05-07', 7, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140508, '2014-05-08', 8, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140509, '2014-05-09', 9, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140510, '2014-05-10', 10, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140511, '2014-05-11', 11, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140512, '2014-05-12', 12, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140513, '2014-05-13', 13, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140514, '2014-05-14', 14, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140515, '2014-05-15', 15, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140516, '2014-05-16', 16, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140517, '2014-05-17', 17, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140518, '2014-05-18', 18, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140519, '2014-05-19', 19, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140520, '2014-05-20', 20, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140521, '2014-05-21', 21, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140522, '2014-05-22', 22, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140523, '2014-05-23', 23, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140524, '2014-05-24', 24, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140525, '2014-05-25', 25, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140526, '2014-05-26', 26, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140527, '2014-05-27', 27, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140528, '2014-05-28', 28, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140529, '2014-05-29', 29, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140530, '2014-05-30', 30, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140531, '2014-05-31', 31, 5, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140601, '2014-06-01', 1, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140602, '2014-06-02', 2, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140603, '2014-06-03', 3, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140604, '2014-06-04', 4, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140605, '2014-06-05', 5, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140606, '2014-06-06', 6, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140607, '2014-06-07', 7, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140608, '2014-06-08', 8, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140609, '2014-06-09', 9, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140610, '2014-06-10', 10, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140611, '2014-06-11', 11, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140612, '2014-06-12', 12, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140613, '2014-06-13', 13, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140614, '2014-06-14', 14, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140615, '2014-06-15', 15, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140616, '2014-06-16', 16, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140617, '2014-06-17', 17, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140618, '2014-06-18', 18, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140619, '2014-06-19', 19, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140620, '2014-06-20', 20, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140621, '2014-06-21', 21, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140622, '2014-06-22', 22, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140623, '2014-06-23', 23, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140624, '2014-06-24', 24, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140625, '2014-06-25', 25, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140626, '2014-06-26', 26, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140627, '2014-06-27', 27, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140628, '2014-06-28', 28, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140629, '2014-06-29', 29, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140630, '2014-06-30', 30, 6, 2, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140701, '2014-07-01', 1, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140702, '2014-07-02', 2, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140703, '2014-07-03', 3, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140704, '2014-07-04', 4, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140705, '2014-07-05', 5, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140706, '2014-07-06', 6, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140707, '2014-07-07', 7, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140708, '2014-07-08', 8, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140709, '2014-07-09', 9, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140710, '2014-07-10', 10, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140711, '2014-07-11', 11, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140712, '2014-07-12', 12, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140713, '2014-07-13', 13, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140714, '2014-07-14', 14, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140715, '2014-07-15', 15, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140716, '2014-07-16', 16, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140717, '2014-07-17', 17, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140718, '2014-07-18', 18, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140719, '2014-07-19', 19, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140720, '2014-07-20', 20, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140721, '2014-07-21', 21, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140722, '2014-07-22', 22, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140723, '2014-07-23', 23, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140724, '2014-07-24', 24, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140725, '2014-07-25', 25, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140726, '2014-07-26', 26, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140727, '2014-07-27', 27, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140728, '2014-07-28', 28, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140729, '2014-07-29', 29, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140730, '2014-07-30', 30, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140731, '2014-07-31', 31, 7, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140801, '2014-08-01', 1, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140802, '2014-08-02', 2, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140803, '2014-08-03', 3, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140804, '2014-08-04', 4, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140805, '2014-08-05', 5, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140806, '2014-08-06', 6, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140807, '2014-08-07', 7, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140808, '2014-08-08', 8, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140809, '2014-08-09', 9, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140810, '2014-08-10', 10, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140811, '2014-08-11', 11, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140812, '2014-08-12', 12, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140813, '2014-08-13', 13, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140814, '2014-08-14', 14, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140815, '2014-08-15', 15, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140816, '2014-08-16', 16, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140817, '2014-08-17', 17, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140818, '2014-08-18', 18, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140819, '2014-08-19', 19, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140820, '2014-08-20', 20, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140821, '2014-08-21', 21, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140822, '2014-08-22', 22, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140823, '2014-08-23', 23, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140824, '2014-08-24', 24, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140825, '2014-08-25', 25, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140826, '2014-08-26', 26, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140827, '2014-08-27', 27, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140828, '2014-08-28', 28, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140829, '2014-08-29', 29, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140830, '2014-08-30', 30, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140831, '2014-08-31', 31, 8, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140901, '2014-09-01', 1, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140902, '2014-09-02', 2, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140903, '2014-09-03', 3, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140904, '2014-09-04', 4, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140905, '2014-09-05', 5, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140906, '2014-09-06', 6, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140907, '2014-09-07', 7, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140908, '2014-09-08', 8, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140909, '2014-09-09', 9, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140910, '2014-09-10', 10, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140911, '2014-09-11', 11, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140912, '2014-09-12', 12, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140913, '2014-09-13', 13, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140914, '2014-09-14', 14, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140915, '2014-09-15', 15, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140916, '2014-09-16', 16, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140917, '2014-09-17', 17, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140918, '2014-09-18', 18, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140919, '2014-09-19', 19, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140920, '2014-09-20', 20, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140921, '2014-09-21', 21, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140922, '2014-09-22', 22, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140923, '2014-09-23', 23, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140924, '2014-09-24', 24, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140925, '2014-09-25', 25, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140926, '2014-09-26', 26, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140927, '2014-09-27', 27, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140928, '2014-09-28', 28, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140929, '2014-09-29', 29, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20140930, '2014-09-30', 30, 9, 3, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141001, '2014-10-01', 1, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141002, '2014-10-02', 2, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141003, '2014-10-03', 3, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141004, '2014-10-04', 4, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141005, '2014-10-05', 5, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141006, '2014-10-06', 6, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141007, '2014-10-07', 7, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141008, '2014-10-08', 8, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141009, '2014-10-09', 9, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141010, '2014-10-10', 10, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141011, '2014-10-11', 11, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141012, '2014-10-12', 12, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141013, '2014-10-13', 13, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141014, '2014-10-14', 14, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141015, '2014-10-15', 15, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141016, '2014-10-16', 16, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141017, '2014-10-17', 17, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141018, '2014-10-18', 18, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141019, '2014-10-19', 19, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141020, '2014-10-20', 20, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141021, '2014-10-21', 21, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141022, '2014-10-22', 22, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141023, '2014-10-23', 23, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141024, '2014-10-24', 24, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141025, '2014-10-25', 25, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141026, '2014-10-26', 26, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141027, '2014-10-27', 27, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141028, '2014-10-28', 28, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141029, '2014-10-29', 29, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141030, '2014-10-30', 30, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141031, '2014-10-31', 31, 10, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141101, '2014-11-01', 1, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141102, '2014-11-02', 2, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141103, '2014-11-03', 3, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141104, '2014-11-04', 4, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141105, '2014-11-05', 5, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141106, '2014-11-06', 6, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141107, '2014-11-07', 7, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141108, '2014-11-08', 8, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141109, '2014-11-09', 9, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141110, '2014-11-10', 10, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141111, '2014-11-11', 11, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141112, '2014-11-12', 12, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141113, '2014-11-13', 13, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141114, '2014-11-14', 14, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141115, '2014-11-15', 15, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141116, '2014-11-16', 16, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141117, '2014-11-17', 17, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141118, '2014-11-18', 18, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141119, '2014-11-19', 19, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141120, '2014-11-20', 20, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141121, '2014-11-21', 21, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141122, '2014-11-22', 22, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141123, '2014-11-23', 23, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141124, '2014-11-24', 24, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141125, '2014-11-25', 25, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141126, '2014-11-26', 26, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141127, '2014-11-27', 27, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141128, '2014-11-28', 28, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141129, '2014-11-29', 29, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141130, '2014-11-30', 30, 11, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141201, '2014-12-01', 1, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141202, '2014-12-02', 2, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141203, '2014-12-03', 3, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141204, '2014-12-04', 4, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141205, '2014-12-05', 5, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141206, '2014-12-06', 6, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141207, '2014-12-07', 7, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141208, '2014-12-08', 8, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141209, '2014-12-09', 9, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141210, '2014-12-10', 10, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141211, '2014-12-11', 11, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141212, '2014-12-12', 12, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141213, '2014-12-13', 13, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141214, '2014-12-14', 14, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141215, '2014-12-15', 15, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141216, '2014-12-16', 16, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141217, '2014-12-17', 17, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141218, '2014-12-18', 18, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141219, '2014-12-19', 19, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141220, '2014-12-20', 20, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141221, '2014-12-21', 21, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141222, '2014-12-22', 22, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141223, '2014-12-23', 23, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141224, '2014-12-24', 24, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141225, '2014-12-25', 25, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141226, '2014-12-26', 26, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141227, '2014-12-27', 27, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141228, '2014-12-28', 28, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141229, '2014-12-29', 29, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141230, '2014-12-30', 30, 12, 4, 2014);
INSERT INTO DimDate (DateKey, FullDate, DayNumberOfMonth, MonthNumberOfYear, CalendarQuarter, CalendarYear) VALUES (20141231, '2014-12-31', 31, 12, 4, 2014);
