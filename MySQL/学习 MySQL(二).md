## 数据表

数据表 是数据库最重要的组成部分之一，是其他对象的基础。

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

