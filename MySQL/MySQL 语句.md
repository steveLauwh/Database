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

```sql
SHOW COLUMNS FROM db;` 或者 `DESCRIBE db;  // 显示 db 表的所有列
``` 
```sql
HELP SHOW;  // 显示允许的 SHOW 语句
```

```sql
SELECT first_name FROM actor;  // 从 actor 表中检索一个名为 first_name 列
```

```sql
SELECT actor_id, first_name, last_name FROM actor; // 从 actor 表中检索多个列
```

```sql
SELECT * FROM actor;  // 检索 actor 表中所有列
```

```sql
SELECT DISTINCT country_id FROM city;  // 使用 DISTINCT 关键字，检索 city 表中不同的 country_id 行
```

```sql
SELECT country_id FROM city LIMIT 5;  // 显示不多于 5 行
```

```sql
SELECT country_id FROM city LIMIT 5, 5;  // 显示从行 5 开始的 5 行
```

```sql
SELECT country_id FROM city LIMIT 0, 5; // 显示从行 0 开始的 5 行，第一行为行 0
```

```sql
SELECT country_id FROM city LIMIT 3 OFFSET 4; // 从行 4 开始取 3 行
```

```sql
SELECT city.country_id FROM sakila.city; // 使用完全限定的表名，sakila 为数据库名，city 为表名，county_id 为列
```

```sql
SELECT first_name FROM actor ORDER BY first_name; // 在 actor 表中，对 first_name 列以字母顺序排序数据
```

```sql
SELECT first_name, last_name, last_update FROM actor ORDER BY first_name, last_name; // 按多个列排序
```

```sql
SELECT first_name FROM actor ORDER BY first_name DESC;  // 降序排序
```

```sql
SELECT first_name FROM actor ORDER BY first_name DESC LIMIT 2; // 降序排序，只显示两行
```

```sql
SELECT * FROM payment WHERE amount = 2.99; // WHERE 子句
```

```sql
SELECT * FROM payment WHERE amount <> 2.99; // amount 不等于 2.99
```

```sql
SELECT * FROM payment WHERE amount BETWEEN 5 AND 10; // amount 在 5 到 10 范围内检索
```

```sql
SELECT * FROM payment WHERE amount IS NULL; // amount 列中包含为 NULL 值
```

```sql
SELECT * FROM payment WHERE customer_id = 599 AND amount <= 2.99;  // AND 操作
```

```sql
SELECT * FROM payment WHERE customer_id = 599 OR customer_id = 597;  // OR 操作
```

```sql
SELECT * FROM payment WHERE (customer_id = 599 OR customer_id = 597) AND amount >= 6.99; // 注意计算次序
```

```sql
// IN 操作，包含 597 或 599
SELECT payment_id, customer_id, amount FROM payment 
       WHERE customer_id IN (597,599) 
       ORDER BY payment_id;
``` 
 
```sql
// NOT 操作，除了 1 或 599
SELECT payment_id, customer_id, amount FROM payment
       WHERE customer_id NOT IN (1,599) 
       ORDER BY payment_id;
``` 

```sql
SELECT * FROM city WHERE city LIKE 'z%';  // % 表示任何字符出现任意次数
```

```sql
SELECT * FROM city WHERE city LIKE '_iangfan'; // _ 表示只匹配单个字符
```

```sql
SELECT * FROM city WHERE city REGEXP 'iangfan';  // 正则表达式 REGEXP
```

```sql
SELECT * FROM city WHERE city REGEXP BINARY 'xiangfan'; // 区分大小写，用 BINARY
```

```sql
SELECT * FROM city WHERE country_id REGEXP '11|69';  // 进行 OR 匹配
```

```sql
SELECT * FROM city WHERE country_id REGEXP '[1-9][3-9]';  // 匹配范围
```

```sql
SELECT * FROM city WHERE country_id REGEXP '.';  // . 匹配任意字符
```

```sql
SELECT * FROM city WHERE country_id REGEXP '\\.'; // 使用 \\ 为前导，匹配特殊字符，\\. 表示查找.
```

```sql
SELECT * FROM city WHERE country_id REGEXP '[a-zA-Z0-9]';  // 任意字母和数字
```

```sql
SELECT Concat(city, ' (', country_id, ')') FROM city ORDER BY city;  // 拼接两个列
```

```sql
// RTrim() 函数去掉值右边的所有空格
SELECT Concat(RTrim(city), ' (', RTrim(country_id), ')') FROM city ORDER BY city;  
```

```sql
SELECT city_id, Upper(city) AS city_name_upcase FROM city ORDER BY city;  // Upper() 函数，转换大写
```

```sql
SELECT city_id, city FROM city WHERE Date(last_update) = '2016-02-14'; // Date() 函数，日期
```

```sql
SELECT AVG(amount) AS avg_amount FROM payment;  // AVG() 函数，返回某列的平均值
```

```sql
SELECT COUNT(*) AS num FROM payment;  // COUNT() 函数，统计行数
```

```sql
SELECT MAX(amount) AS max_amount FROM payment; // MAX() 函数，返回某列的最大值
```

```sql
SELECT MIN(amount) AS min_amount FROM payment; // MIN() 函数，返回某列的最小值
```

```sql
SELECT SUM(amount) AS sum_amount FROM payment; // SUM() 函数，返回某列的和
```

```sql
// DISTINCT 不同 amount 的值，再求和
SELECT AVG(DISTINCT amount) AS avg_amount FROM payment WHERE customer_id = 599;
``` 

```sql
// 组合聚集函数
SELECT COUNT(*) AS num_items,
       MAX(amount) AS max_amount,
       MIN(amount) AS min_amount, 
       AVG(amount) AS avg_amount 
FROM payment;
```

```sql
// GROUP BY 分组
SELECT customer_id, COUNT(*) AS num FROM payment GROUP BY customer_id;
```

```sql
// HAVING 过滤分组
SELECT customer_id, COUNT(*) AS num FROM payment GROUP BY customer_id HAVING COUNT(*) >= 30;
```

```sql
// ORDER BY 排序输出
SELECT customer_id, COUNT(*) AS num FROM payment GROUP BY customer_id HAVING COUNT(*) >= 30 ORDER BY num;
```

```sql
// WHERE 定义联结
SELECT staff_id, address, phone 
       FROM staff, address 
       WHERE staff.address_id = address.address_id 
       ORDER BY staff_id, address;
```

```sql
// 内部联结
SELECT staff_id, address, phone 
       FROM staff INNER JOIN address ON staff.address_id = address.address_id 
       ORDER BY staff_id, address;
```
