## MySQL 语句的规范

* 关键字与函数名称全部大写
* 数据库名称、表名称、字段名称全部大写
* SQL 语句必须以分号结尾

## 数据操作语言(DML) 和 数据定义语言(DDL)

| DDL 语句        | 含义   | 
| --------   | -----:  | 
| CREATE DATABASE      | 创建新数据库 |  
| ALTER DATABASE       | 修改数据库 | 
| DROP DATABASE        | 删除数据库 | 
| CREATE TABLE         | 创建新表|
| ALTER TABLE          | 变更(改变)数据库表 |
| DROP TABLE           | 删除表 |
| CREATE INDEX         | 创建索引(搜索键) |
| DROP INDEX           | 删除索引 |

| DML 语句        | 含义   | 
| --------   | -----:  | 
| SELECT      | 从数据库表中获取数据 |
| UPDATE      | 更新数据库表中的数据 |
| DELETE      | 从数据库表中删除数据 |
| INSERT INTO | 向数据库表中插入数据 |

## MySQL 数据类型

MySQL 支持多种类型，大致分为三类：数值、日期/时间、字符串(字符)类型。

| 数值类型        | 大小   | 
| --------   | -----:  | 
| TINYINT      | 1 字节 |
| SMALLINT      | 2 字节 |
| MEDIUMINT      | 3 字节 |
| INT  | 4 字节 |
| BIGINT      | 8 字节 |
| FLOAT      | 4 字节 |
| DOUBLE      | 8 字节 |

| 日期时间类型        | 大小   | 
| --------   | -----:  | 
| YEAR      | 1 字节 |
| TIME      | 3 字节 |
| DATE      | 3 字节 |
| DATETIME      | 8 字节 |
| TIMESTAMP      | 4 字节 |

| 字符类型        | 大小   | 
| --------   | -----:  | 
| CHAR      | M个字节, 0 <= M <= 255|
| VARCHAR      | 0-65535 字节 |
| TINYTEXT      | 短文本字符串 |
| TEXT      | 长文本数据 |
| MEDIUMTEXT      | 中等长度文本数据 |
| LONGTEXT      | 大文本数据 |




