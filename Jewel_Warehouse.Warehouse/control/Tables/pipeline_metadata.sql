CREATE TABLE [control].[pipeline_metadata] (

	[table_name] varchar(100) NOT NULL, 
	[schema_name] varchar(100) NOT NULL, 
	[watermark_column_name] varchar(100) NOT NULL, 
	[watermark_value] date NOT NULL, 
	[insertion_date] date NOT NULL
);