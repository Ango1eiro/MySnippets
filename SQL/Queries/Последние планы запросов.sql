-- Удостоверимся, что LWP включен (должен быть включен по-умолчанию)
--alter database scoped configuration set LIGHTWEIGHT_QUERY_PROFILING = ON;
-- включим глобально флаг трассировки
-- Enables the equivalent of the last actual execution plan in sys.dm_exec_query_plan_stats.
dbcc traceon (2451, -1);
select
    ps.query_plan
from
    sys.dm_exec_cached_plans cp
    cross apply sys.dm_exec_query_plan_stats(cp.plan_handle) ps
    cross apply sys.dm_exec_sql_text(cp.plan_handle) st
where
	st.text like '%InfoRg8616%' and -- Условие по таблице, например
  st.text not like '%dm[_]exec[_]cached[_]plans%' -- Исключаем собственный запрос
