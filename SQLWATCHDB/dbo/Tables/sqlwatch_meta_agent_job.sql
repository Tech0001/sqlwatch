﻿CREATE TABLE [dbo].[sqlwatch_meta_agent_job]
(
	[sql_instance] nvarchar(25) not null,
	[job_name] nvarchar(128) not null,
	[job_create_date] datetime not null,
	[sqlwatch_job_id] smallint identity (-32768,1),
	constraint pk_sqlwatch_meta_agent_job primary key (
		[sql_instance], [sqlwatch_job_id]
		),
	constraint uq_sqlwatch_meta_agent_job_name unique([sql_instance],job_name,[job_create_date])   
)