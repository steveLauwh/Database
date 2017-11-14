## MySQL 优化

### 数据库优化的目的

* 避免出现页面访问错误：由于数据库连接 timeout 产生页面 5xx 错误；由于慢查询造成页面无法加载、由于阻塞造成数据无法提交
* 增加数据库的稳定性：很多数据库问题都是由于低效的查询引起的
* 优化用户体验：流畅页面的访问速度、良好的网站功能体验

### 从那几个方面进行数据库优化

硬件的优化，成本最高

SQL 及索引的优化，效果最好

* SQL 及索引
* 数据库表结构
* 系统配置
* 硬件

### 数据库样本

[Example Databases](https://dev.mysql.com/doc/index-other.html)

使用 MySQL 样本数据库 Sakila：

1. 解压 unzip sakila-db.zip，包含 sakila-schema.sql, sakila-data.sql, and sakila.mwb 
2. 进入 MySQL 后，source sakila-schema.sql(绝对路径)
3. 进入 MySQL 后，source sakila-data.sql

### 
