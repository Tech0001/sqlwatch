﻿CREATE TABLE [dbo].[sqlwatch_logger_xes_long_queries](
	[long_query_id] bigint identity (1,1),
	--[activity_id] uniqueidentifier,
	--[activity_sequence] bigint,
	--[activity_id_xfer] uniqueidentifier,
	--[activity_sequence_xfer] bigint,
	--[event_time_start] datetime not null,
	[event_time] [datetime] not null,
	[event_name] [varchar](255) not null,
	[session_id] [bigint] not null,
	[database_name] [varchar](255) NULL,
	[cpu_time] [bigint] NULL,
	[physical_reads] [bigint] NULL,
	[logical_reads] [bigint] NULL,
	[writes] [bigint] NULL,
	[spills] [bigint] NULL,
	[offset] [bigint] NULL,
	[offset_end] [bigint] NULL,
	--[statement] [varchar](max) NULL,
	[username] [varchar](255) NULL,
	--[sql_text] [varchar](max) NULL,
	[object_name] [varchar](max) NULL,
	[client_hostname] [varchar](255) NULL,
	[client_app_name] [varchar](255) NULL,
	[duration_ms] [bigint] NULL,
	--[wait_type] [varchar](255) NULL,
	--[blocking_report] [xml] NULL,
	--[deadlock_report] [xml] NULL,
	[snapshot_time] datetime2(0) not null,
	[snapshot_type_id] tinyint not null constraint df_sqlwatch_logger_xes_long_queries_type default (7),
	[sql_instance] varchar(32) not null constraint df_sqlwatch_logger_xes_long_queries_sql_instance default (@@SERVERNAME),
	[sqlwatch_query_plan_id] int not null,
	[sqlwatch_query_id] int not null,

	attach_activity_id varchar(40),

	constraint fk_logger_perf_xes_long_queries foreign key ([snapshot_time],[sql_instance],[snapshot_type_id]) references [dbo].[sqlwatch_logger_snapshot_header]([snapshot_time],[sql_instance],[snapshot_type_id]) on delete cascade  on update cascade,
	constraint pk_logger_perf_xes_long_queries primary key nonclustered (
		[snapshot_time], [snapshot_type_id], [event_time], [event_name],[session_id]
	),
	constraint fk_sqlwatch_logger_xes_long_queries_server foreign key ([sql_instance])
		references [dbo].[sqlwatch_meta_server] ([servername]) on delete cascade
) ON [PRIMARY] 
