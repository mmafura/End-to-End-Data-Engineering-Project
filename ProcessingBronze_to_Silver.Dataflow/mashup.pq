[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared #"bronze department" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.department", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared #"bronze emailaddress" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.emailaddress", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "human_resource_employee_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared human_resource_employee = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.employee", ItemKind = "Table"]}[Data],
  #"Merged queries" = Table.NestedJoin(#"Navigation 2", {"BusinessEntityID"}, #"bronze person", {"BusinessEntityID"}, "bronze person", JoinKind.LeftOuter),
  #"Expanded bronze person" = Table.ExpandTableColumn(#"Merged queries", "bronze person", {"NameStyle", "FirstName", "MiddleName", "LastName"}, {"NameStyle", "FirstName", "MiddleName", "LastName"}),
  #"Removed duplicates" = Table.Distinct(#"Expanded bronze person", {"LoginID"}),
  #"Added custom" = Table.AddColumn(#"Removed duplicates", "EmmergencyContactName", each [FirstName] & " " & [LastName]),
  #"Merged queries 1" = Table.NestedJoin(#"Added custom", {"BusinessEntityID"}, #"bronze emailaddress", {"BusinessEntityID"}, "bronze emailaddress", JoinKind.LeftOuter),
  #"Expanded bronze emailaddress" = Table.ExpandTableColumn(#"Merged queries 1", "bronze emailaddress", {"EmailAddress"}, {"EmailAddress"}),
  #"Removed duplicates 1" = Table.Distinct(#"Expanded bronze emailaddress", {"NationalIDNumber"}),
  #"Merged queries 2" = Table.NestedJoin(#"Removed duplicates 1", {"BusinessEntityID"}, #"bronze employeepayhistory", {"BusinessEntityID"}, "bronze employeepayhistory", JoinKind.LeftOuter),
  #"Expanded bronze employeepayhistory" = Table.ExpandTableColumn(#"Merged queries 2", "bronze employeepayhistory", {"Rate", "PayFrequency"}, {"Rate", "PayFrequency"}),
  #"Removed duplicates 2" = Table.Distinct(#"Expanded bronze employeepayhistory", {"LoginID"}),
  #"Merged queries 3" = Table.NestedJoin(#"Removed duplicates 2", {"BusinessEntityID"}, #"bronze personphone", {"BusinessEntityID"}, "bronze personphone", JoinKind.LeftOuter),
  #"Expanded bronze personphone" = Table.ExpandTableColumn(#"Merged queries 3", "bronze personphone", {"PhoneNumber"}, {"PhoneNumber"}),
  #"Removed duplicates 3" = Table.Distinct(#"Expanded bronze personphone", {"NationalIDNumber"})
in
  #"Removed duplicates 3";
shared #"bronze employeepayhistory" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.employeepayhistory", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared #"bronze person" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.person", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared #"bronze personphone" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.personphone", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared #"bronze salesperson" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "35592053-25a8-46ae-a874-803112914157"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "bronze.salesperson", ItemKind = "Table"]}[Data]
in
  #"Navigation 2";
shared human_resource_employee_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "9e34e39b-3ea9-4c15-b9e0-6ee7c5391584"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "92617cbe-4a70-497c-a29c-d168e4cd3fc7"]}[Data],
  TableNavigation = Navigation_2{[Id = "human_resource_employee", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
