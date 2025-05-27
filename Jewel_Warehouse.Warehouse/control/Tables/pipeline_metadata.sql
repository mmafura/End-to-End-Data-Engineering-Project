CREATE TABLE [control].[pipeline_metadata] (

	[table_name] varchar(100) NULL, 
	[schema_name] varchar(100) NULL, 
	[watermark_column_name] varchar(100) NULL, 
	[watermark_value] date NULL, 
	[insertion_date] date NULL, 
	[SQLQuery] varchar(max) NULL
);