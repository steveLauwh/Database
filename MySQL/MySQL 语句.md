## MySQL 语句

使用 MySQL 样本数据库 Sakila，练习 MySQL！

```sql
// Sakila
sakila-schema.sql // 数据库结构文件

sakila-data.sql // 数据文件
```
进入 MySQL 后;

```sql
source sakila-schema.sql // 将数据库结构还原到 mysql

source sakila-data.sql // 将数据写入到数据库
```

* `SHOW DATABASES;`  // 返回可用数据库的一个列表

* `USE mysql;` // 使用 mysql 数据库

* `SHOW TABLES;`  // 返回当前选择的数据库内可用表的列表

```
+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| columns_priv              |
| db                        |
| event                     |
| func                      |
| general_log               |
| help_category             |
| help_keyword              |
| help_relation             |
| help_topic                |
| host                      |
| ndb_binlog_index          |
| plugin                    |
| proc                      |
| procs_priv                |
| proxies_priv              |
| servers                   |
| slow_log                  |
| tables_priv               |
| time_zone                 |
| time_zone_leap_second     |
| time_zone_name            |
| time_zone_transition      |
| time_zone_transition_type |
| user                      |
+---------------------------+
```

* `SHOW COLUMNS FROM db;` 或者 `DESCRIBE db;` // 显示 db 表的所有列

* `HELP SHOW;`  // 显示允许的 SHOW 语句

* `SELECT first_name FROM actor;`  // 从 actor 表中检索一个名为 first_name 列

* `SELECT actor_id, first_name, last_name FROM actor;` // 从 actor 表中检索多个列

* `SELECT * FROM actor;`  // 检索 actor 表中所有列

* `SELECT DISTINCT country_id FROM city;`  // 使用 DISTINCT 关键字，检索 city 表中不同的 country_id 行

* `SELECT country_id FROM city LIMIT 5;`  // 显示不多于 5 行

* `SELECT country_id FROM city LIMIT 5, 5;`  // 显示从行 5 开始的 5 行

* `SELECT country_id FROM city LIMIT 0, 5;` // 显示从行 0 开始的 5 行，第一行为行 0

* `SELECT country_id FROM city LIMIT 3 OFFSET 4;`  // 从行 4 开始取 3 行

* `SELECT city.country_id FROM sakila.city;` // 使用完全限定的表名，sakila 为数据库名，city 为表名，county_id 为列

* `SELECT first_name FROM actor ORDER BY first_name;` // 在 actor 表中，对 first_name 列以字母顺序排序数据

* `SELECT first_name, last_name, last_update FROM actor ORDER BY first_name, last_name;` // 按多个列排序

* `SELECT first_name FROM actor ORDER BY first_name DESC;`  // 降序排序

* `SELECT first_name FROM actor ORDER BY first_name DESC LIMIT 2;` // 降序排序，只显示两行

* `SELECT * FROM payment WHERE amount = 2.99;` // WHERE 子句

* `SELECT * FROM payment WHERE amount <> 2.99;` // amount 不等于 2.99

* `SELECT * FROM payment WHERE amount BETWEEN 5 AND 10;` // amount 在 5 到 10 范围内检索

* `SELECT * FROM payment WHERE amount IS NULL;`  // amount 列中包含为 NULL 值

* `SELECT * FROM payment WHERE customer_id = 599 AND amount <= 2.99;`  // AND 操作

* `SELECT * FROM payment WHERE customer_id = 599 OR customer_id = 597;`  // OR 操作

* `SELECT * FROM payment WHERE (customer_id = 599 OR customer_id = 597) AND amount >= 6.99;` // 注意计算次序

* `SELECT payment_id, customer_id, amount FROM payment WHERE customer_id IN (597,599) ORDER BY payment_id;` // IN 操作，包含 597 或 599

* `SELECT payment_id, customer_id, amount FROM payment WHERE customer_id NOT IN (1,599) ORDER BY payment_id;` // NOT 操作，除了 1 或 599

* `SELECT * FROM city WHERE city LIKE 'z%';`  // % 表示任何字符出现任意次数

* `SELECT * FROM city WHERE city LIKE '_iangfan';` // _ 表示只匹配单个字符

* `SELECT * FROM city WHERE city REGEXP 'iangfan'; ` // 正则表达式 REGEXP
 
* `SELECT * FROM city WHERE city REGEXP BINARY 'xiangfan';`  // 区分大小写，用 BINARY

* `SELECT * FROM city WHERE country_id REGEXP '11|69';`  // 进行 OR 匹配

* `SELECT * FROM city WHERE country_id REGEXP '[1-9][3-9]';`  // 匹配范围

* `SELECT * FROM city WHERE country_id REGEXP '.';`  // . 匹配任意字符

* `SELECT * FROM city WHERE country_id REGEXP '\\.';` // 使用 \\ 为前导，匹配特殊字符，\\. 表示查找.

* `SELECT * FROM city WHERE country_id REGEXP '[a-zA-Z0-9]';`  // 任意字母和数字
