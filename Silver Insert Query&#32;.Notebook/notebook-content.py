# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "35592053-25a8-46ae-a874-803112914157",
# META       "default_lakehouse_name": "Jewel_Bronze_Lake",
# META       "default_lakehouse_workspace_id": "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584",
# META       "known_lakehouses": [
# META         {
# META           "id": "35592053-25a8-46ae-a874-803112914157"
# META         },
# META         {
# META           "id": "92617cbe-4a70-497c-a29c-d168e4cd3fc7"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC SELECT
# MAGIC e.BusinessEntityID As EmployeeId,
# MAGIC Null as ParentEmployeeId,
# MAGIC em.NationalIDNumber,
# MAGIC sp.TerritoryID as SalesTerritoryId,
# MAGIC pp.FirstName,
# MAGIC pp.LastName,
# MAGIC pp.MiddleName,
# MAGIC pp.NameStyle,
# MAGIC e.JobTitle AS Title,
# MAGIC e.HireDate,
# MAGIC e.BirthDate,
# MAGIC e.LoginID,
# MAGIC ea.EmailAddress,
# MAGIC ph.PhoneNumber AS Phone,
# MAGIC e.MaritalStatus,
# MAGIC pp.FirstName + ' ' + pp.LastName AS EmergencyContactName,
# MAGIC ph.PhoneNumber AS EmergencyContactPhone,
# MAGIC e.SalariedFlag,
# MAGIC e.Gender,
# MAGIC eph.PayFrequency,
# MAGIC eph.Rate AS BaseRate,
# MAGIC e.VacationHours,
# MAGIC e.SickLeaveHours,
# MAGIC e.CurrentFlag,
# MAGIC 
# MAGIC CASE WHEN sp.BusinessEntityID IS NOT NULL THEN 1 ELSE 0 END AS SalesPersonFlag,
# MAGIC 
# MAGIC d.Name AS DepartmentName,
# MAGIC edh.StartDate,
# MAGIC edh.EndDate,
# MAGIC CASE 
# MAGIC     WHEN edh.EndDate IS NULL THEN 'Current' 
# MAGIC         ELSE 'Former' 
# MAGIC     END AS Status
# MAGIC FROM bronze.employee e
# MAGIC JOIN bronze.person pp ON e.BusinessEntityID = pp.BusinessEntityID
# MAGIC LEFT JOIN bronze.emailaddress ea ON e.BusinessEntityID = ea.BusinessEntityID
# MAGIC LEFT JOIN bronze.personphone ph ON e.BusinessEntityID = ph.BusinessEntityID
# MAGIC LEFT JOIN bronze.employeepayhistory eph 
# MAGIC     ON e.BusinessEntityID = eph.BusinessEntityID 
# MAGIC     AND eph.RateChangeDate = (
# MAGIC         SELECT MAX(RateChangeDate) FROM bronze.employeepayhistory
# MAGIC         WHERE BusinessEntityID = e.BusinessEntityID
# MAGIC     )
# MAGIC LEFT JOIN bronze.employeedepartmenthistory edh 
# MAGIC     ON e.BusinessEntityID = edh.BusinessEntityID AND edh.EndDate IS NULL
# MAGIC LEFT JOIN bronze.department d ON edh.DepartmentID = d.DepartmentID
# MAGIC LEFT JOIN bronze.salesperson sp ON e.BusinessEntityID = sp.BusinessEntityID
# MAGIC LEFT JOIN bronze.employee ep ON e.BusinessEntityID = ep.BusinessEntityID
# MAGIC LEFT JOIN bronze.employee em ON e.BusinessEntityID = em.BusinessEntityID
# MAGIC ;

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }
