-- Внимание!!! Это только пример настройки.
-- Включение данной сессии может снизить производительность сервера.
-- Используйте с осторожность и пониманием что делайте.
CREATE EVENT SESSION QueryPlanAnalyze
ON SERVER
ADD EVENT sqlserver.query_pre_execution_showplan(
    ACTION (sqlserver.database_name,
			sqlserver.client_hostname,
			sqlserver.client_app_name,
            sqlserver.plan_handle,
            sqlserver.sql_text,
            sqlserver.tsql_stack,
            package0.callstack,
			sqlserver.query_hash,
			sqlserver.session_id,
            sqlserver.request_id)
	WHERE ([sqlserver.database_name] = '100_UT_OOO')),
ADD EVENT sqlserver.query_post_execution_showplan(
    ACTION (sqlserver.database_name,
			sqlserver.client_hostname,
			sqlserver.client_app_name,
            sqlserver.plan_handle,
            sqlserver.sql_text,
            sqlserver.tsql_stack,
            package0.callstack,
			sqlserver.query_hash,
			sqlserver.session_id,
            sqlserver.request_id)
	WHERE ([duration]>(500000) AND	[sqlserver.database_name] = '100_UT_OOO')),
-- Класс событий RPC:Completed указывает, что удаленный вызов процедуры завершен.
-- https://docs.microsoft.com/ru-ru/sql/relational-databases/event-classes/rpc-completed-event-class?view=sql-server-2017
ADD EVENT sqlserver.rpc_completed(
    ACTION(sqlserver.database_name,
			sqlserver.client_hostname,
			sqlserver.client_app_name,
            sqlserver.plan_handle,
            sqlserver.sql_text,
            sqlserver.tsql_stack,
            package0.callstack,
			sqlserver.query_hash,
			sqlserver.session_id,
            sqlserver.request_id)
    WHERE ([duration]>(500000) AND	[sqlserver.database_name] = '100_UT_OOO')),
-- Класс событий SQL:BatchCompleted указывает на завершение выполнения пакета языка Transact-SQL.
-- https://docs.microsoft.com/ru-ru/sql/relational-databases/event-classes/sql-batchcompleted-event-class?view=sql-server-2017
ADD EVENT sqlserver.sql_batch_completed(
    ACTION (sqlserver.database_name,
			sqlserver.client_hostname,
			sqlserver.client_app_name,
            sqlserver.plan_handle,
            sqlserver.sql_text,
            sqlserver.tsql_stack,
            package0.callstack,
			sqlserver.query_hash,
			sqlserver.session_id,
            sqlserver.request_id)
    WHERE ([duration]>(500000) AND	[sqlserver.database_name] = '100_UT_OOO'))
ADD TARGET package0.event_file(SET 
    -- Путь к файлу хранения логов. Если не указан, то используется путь к каталогу логов SQL Server
    filename=N'D:\Rogoznyak\SQL\Logs\QueryPlanAnalyze.xel',
    -- Максимальный размер файла в мегабайтах
    max_file_size=(1024),
    -- Максимальное количество файлов, после чего начнется перезапись логов в более старых файлах.
    max_rollover_files=(5))
WITH (
    MAX_MEMORY=8192 KB,
    EVENT_RETENTION_MODE=ALLOW_SINGLE_EVENT_LOSS,
    MAX_DISPATCH_LATENCY=15 SECONDS,
    STARTUP_STATE=OFF
)
