# ETL-SSIS
BUILDING A DATA WAREHOUSE ON ROAD ACCIDENTS IN THE UNITED KINGDOM USING SSIS AND SSAS FOR VISUALIZATION.
## Introducing the dataset:
UK Car Accidents 2005 – 2015 Data:
Data Source: https://www.kaggle.com/datasets/silicon99/dft-accident-data
Overview: This dataset contains information about car accidents recorded in the United Kingdom between 2005 and 2015. It provides details regarding accident locations, timestamps, causes, and consequences of the accidents. Researchers commonly utilize this dataset for traffic safety studies and data analysis to devise measures for enhancing road safety.

LSOA-Postcode Mapping Data:
Data Source: https://geoportal.statistics.gov.uk/datasets/postcode-to-output-area-to-lower-layer-super-output-area-to-middle-layer-super-output-area-to-local-authority-district-august-2021-lookup-in-the-uk-1/about
Overview: The "LSOA-Postcode Mapping" is a dataset that provides mapping between postcode and LSOA (Lower Layer Super Output Area) codes in the United Kingdom. Postcode is a numerical code used to identify specific geographic areas, while LSOA code is a smaller geographical unit utilized for statistical and research purposes.

UK – Postcodes Data:
Data Source: https://github.com/academe/UK-Postcodes/blob/master/postcodes.csv
Overview: The "UK – Postcodes" dataset contains information about postcodes, corresponding geographic areas, geographical coordinates, cities or administrative regions, and other related attributes pertaining to postcodes in the United Kingdom.
##  Supporting Tools
Visual Studio 2019/2022 with integrated SSIS (SQL Server Integration Services) 
SSAS (SQL Server Analysis Services)
SQL Server Management Studio, SQL Server 2019.
Power BI.
# Data Warehouse:
### Star schema:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/9f550249-fc2e-422c-b190-b65a64473cc5)![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/c59b2651-558c-4d76-a73f-ba53adc76556)![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/47cceafc-2096-4645-94a4-8ce936bc84cf)
### Constellation Schema
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/1f2a41f7-9579-47ce-bd2d-e9fa9b7b4af2)
# SSIS (SQL Server Integration Services) Process:
## ETL Source to Stage
"Source to Stage" is the process of moving data from the original data sources (Source) to a Staging Area.
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/003932d4-8e92-4b30-be63-7921b81eda41)

### ETL process:
The package for this process is named "SourceStagePackage." In this stage, data is extracted from the Source and loaded into the Staging Area.
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/26119b87-3c29-447c-b6db-f2f2c5fbae6b)
#### Control Flow:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/200e86c0-76f3-4e2f-8f7a-15cdbe702394)
#### Accidents Data Flow:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/e2c6accd-f8f1-46e4-a0c1-adcaa3d08ebf)
#### Vehicles, Casualties Data Flow:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/4c587e6e-e521-400b-876a-a66784c1b59c)
#### Casualties
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/8f5dc151-9721-4208-9f76-09b4783b9529)
## ETL Stage to NDS:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/1af17c41-f2de-45d9-97d6-4cab84190742)
### ETL process (examples):
#### Master
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/84a8344b-6456-4096-ba3b-4cf6bad8efca)
#### Stage
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/dd99899c-c7b1-4e86-a616-d9e4adc16d06)
# ETL NDS to Data Warehouse:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/5879a6b7-3b1f-4c0d-b692-d046002c582a)


#### Dim table ETL:

![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/3614b438-73ea-4aa4-a506-e00364dcfa5c)![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/00f9b5f0-aa70-4b57-aa7d-8e540dcdf64f)![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/d4284827-6d68-4204-857b-cd24d591893a)![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/bd0608fb-026a-4c31-9026-4ae6838f6c92)
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/996ec637-07dd-4664-ac05-88bbeff5ccf6)
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/4fc432d7-c68a-44f0-974d-4f8a06e696c7)


#### Fact tanle ETL:

![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/caab32e6-f9ff-4ebb-a21b-185e95366323)

## SSAS process:
#### Data Source connect:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/6362afb9-682e-417f-87fb-f559fa023891)
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/35908b53-5005-4b6a-b0b1-e5f9cc5bfd6c)


#### Data Source View:


![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/e9ecabfc-bfd6-4454-a363-ee89f8f85933)
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/aa8c1a26-0f42-4983-9f07-966ba84770c2)

#### Create Cube:

![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/ecadec56-9c50-4b14-9c26-346f1cea8fea)


### DMX to query:
Report the number of casualties by Severity (Fatal, Serious, Slight) in the Local Authority Districts over years

![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/82e026ad-dc8a-4a86-a803-6e9e52961920)
Result:
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/a426e84b-49b3-4653-9d25-c39f9b3e0fbe)

Report the number of casualties by Severity (Fatal, Serious, Slight) in the Local Authority Districts by Quarter in years
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/f19e41e2-966b-44f3-b58c-42c9e53aa64c)

### Report using Power BI:
Perform the statistical analysis of the number of casualties by Severity (Fatal, Serious, Slight) in different Local Authorities (Local_Authority_(District)) across all years
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/d1e570e3-6a74-4a7f-b1c2-fd7f38808bde)
Perform the statistical analysis of the number of casualties by Severity in different Local Authorities (Local_Authority_(District)) for each Quarter (Quý) within each year
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/f20507a0-d707-412f-9319-c0023017a55e)

Perform the statistical analysis of the number of casualties by Severity, Casualty Type, and Age Group for each year
![image](https://github.com/NguyenThang-Nad/ETL-SSIS/assets/136436998/50153e1b-32aa-4141-b34f-7ef8989c83ef)

















