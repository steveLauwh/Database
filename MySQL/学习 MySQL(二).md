## 数据表

数据表 是数据库最重要的组成部分之一，是其他对象的基础。

[] 表示可选。

### 创建数据表

```
CREATE TABLE [IF NOT EXISTS] table_name (
    column_name column_type,
    ...
);  
```

### 查看数据表

```
SHOW TABLES [FROM db_name];
```

### 查看数据表结构

```
SHOW COLUMNS FROM table_name;
```

### 删除数据表

```
DROP TABLE table_name;
```

### 插入数据

```
INSERT [INTO] table_name [ field1, field2,...fieldN ]
                       VALUES
                       ( value1, value2,...valueN );
```

### 查询数据

```
SELECT column_name,... FROM table_name;
```

### 空值与非空

* NULL, 字段值可以为空
* NOT NULL, 字段值禁止为空

### AUIO_INCREMENT

* 自动编号，且必须与主键组合使用
* 默认情况下，起始值为 1， 每次的增量为 1。

### PRIMARY KEY

* 主键约束
* 每张数据表只能存在一个主键
* 主键保证记录的唯一性
* 主键自动为 NOT NULL

### UNIQUE KEY

* 唯一约束
* 唯一约束可以保证记录的唯一性
* 唯一约束的字段可以为空值(NULL)
* 每张数据表可以存在多个唯一约束

### DEFAULT

* 默认值
* 当插入记录时，如果没有明确为字段赋值，则自动赋予默认值





