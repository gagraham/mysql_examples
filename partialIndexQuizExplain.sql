select database_name, table_name, index_name, stat_value*@@innodb_page_size
from mysql.innodb_index_stats 
where stat_name='size' 
;

-- It's good to run ANALYZE TABLE before checking index or table size
ANALYZE TABLE `sample_staff`.`employee`;

SELECT /* Select all indexes from table 'employee' and their size */
sum(`stat_value`) AS pages,
`index_name` AS index_name,
sum(`stat_value`) * @@innodb_page_size / 1024 / 1024 AS size_mb
FROM `mysql`.`innodb_index_stats`
WHERE 1=1
AND `table_name` = 'employee'
AND `database_name` = 'sample_staff'
AND `stat_description` = 'Number of pages in the index' 
GROUP BY
`index_name`
;

DESCRIBE  `mysql`.`innodb_index_stats`;