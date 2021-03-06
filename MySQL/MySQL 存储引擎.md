## MySQL 存储引擎

MySQL 可以将数据以不同的技术存储在文件(内存)中，这种技术就称为存储引擎。

每一种存储引擎使用不同的存储机制、索引技巧、锁定水平，最终提供广泛且不同的功能。

MySQL 支持的存储引擎包括：

* MyISAM
* InnoDB
* Memory
* CSV
* Archive

存储引擎是 MySQL 具体的与文件打交道的子系统。也是 MySQL 最具有特色的一个地方。存储引擎就是如何存储数据、如何为存储的数据建立索引和如何
更新、查询数据等技术的实现方法。

### 并发处理

并发控制：当多个连接对记录进行修改时保证数据的一致性和完整性。

锁：

* 共享锁(读锁)：在同一时间段内，多个用户可以读取同一资源，读取过程中数据不会发生任何变化。
* 排他锁(写锁)：在任何时候只能有一个用户写入资源，当进行写锁时会阻塞其他的读锁或者写锁操作。

锁颗粒：

* 表锁，是一种开销最小的锁策略。
* 行锁，是一种开销最大的锁策略。

### 事务处理

事务：事务用于保证数据库的完整性。

事务的特性：

* 原子性
* 一致性
* 隔离性
* 持久性

### 外键和索引

外键：保证数据一致性的策略。

索引：对数据表中一列或多列的值进行排序的一种结构。(快速查找特定信息)

* 普通索引
* 唯一索引
* 全文索引
* btree 索引
* hash 索引

### 各种存储引擎特点

![](https://github.com/steveLauwh/Database/raw/master/image/各种存储引擎特点.PNG)

MyISAM：不支持事务，表级锁，适用做很多 count 的计算，适用插入不频繁，查询非常频繁的情况。

InnoDB：适用于要求事务，可靠性要求比较高；需要有外键支持的情况。它不保存表的具体行数。

### 设置存储引擎

方法一：创建数据表命令实现

```sql
CREATE TABLE table_name(
...
...
)ENGINE = engine;
```

方法二：通过修改数据表命令实现

```sql
ALTER TABLE table_name ENGINE [=] engine_name;
```
