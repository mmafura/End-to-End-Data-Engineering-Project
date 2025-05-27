# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "92617cbe-4a70-497c-a29c-d168e4cd3fc7",
# META       "default_lakehouse_name": "Jewel_Silver_Lakehouse",
# META       "default_lakehouse_workspace_id": "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584",
# META       "known_lakehouses": [
# META         {
# META           "id": "92617cbe-4a70-497c-a29c-d168e4cd3fc7"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC create table dbo.employee
# MAGIC (
# MAGIC EmployeeKey VARCHAR(50),
# MAGIC EmployeeNationalID VARCHAR (15),
# MAGIC FirstName varchar(50),
# MAGIC LastName varchar(50),
# MAGIC MiddleName varchar(50),
# MAGIC NameStyle int,
# MAGIC Title varchar(50),
# MAGIC HireDate date,
# MAGIC BirthDate date,
# MAGIC LoginID varchar(256),
# MAGIC EmailAddress varchar(50),
# MAGIC Phone varchar(25),
# MAGIC MaritalStatus char(1),
# MAGIC EmergencyContactName varchar(50),
# MAGIC EmergencyContactPhone varchar(25),
# MAGIC SalariedFlag int,
# MAGIC Gender char(1),
# MAGIC PayFrequency tinyint,
# MAGIC BaseRate DECIMAL,
# MAGIC VacationHours smallint,
# MAGIC SickLeaveHours smallint,
# MAGIC CurrentFlag int,
# MAGIC SalesPersonFlag int,
# MAGIC DepartmentName varchar(50),
# MAGIC StartDate date,
# MAGIC EndDate date,
# MAGIC Status varchar(50)
# MAGIC )

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }
