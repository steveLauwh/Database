# Database

* [MySQL](https://github.com/steveLauwh/Database/tree/master/MySQL)
* [Redis](https://github.com/steveLauwh/Database/tree/master/Redis)
* [MongoDB](https://github.com/steveLauwh/Database/tree/master/MongoDB)

Redis 存放在内存中，定期持久化到磁盘上，适用数据量较小，效率要求很高的场合。

MongoDB 主要解决海量数据的访问效率问题，存放在硬盘上。

NoSQL(Not Only SQL)：非关系型的数据库，包括 MongoDB、Redis 等，用于超大规模数据的存储。

分布式系统(distributed system)由多台计算机和通信的软件组件通过计算机网络连接（本地网络或广域网）组成。

分布式系统是建立在网络之上的软件系统。

## 关系型数据库 和 非关系型数据库

关系型数据库(如 MySQL)遵循 ACID 规则：
* A(Atomicity) 原子性：事务里的所有操作要么全部做完，要么都不做；只要有一个操作失败，整个事务就失败，需要回滚。
* C(Consistency) 一致性：数据库要一直处于一致的状态，事务的运行不会改变数据库原本的一致性约束。
* I(Isolation) 独立性：并发的事务之间不会互相影响。
* D(Durability) 持久性：一旦事务提交后，它所做的修改将会永久的保存在数据库上，即使出现宕机也不会丢失。

NoSQL(非关系型数据库)：对不同于传统的关系型数据库的数据库管理系统的统称。

为什么需要 NoSQL？

* 高并发读写(High performance)
* 海量数据的高效率存储和访问(Huge Storage)
* 高可扩展性和高可用性(High Scalability && High Availability)

NoSQL 特点

* 易扩展
* 大数据量，高性能
* 灵活的数据模型
* 高可用

NoSQL 数据库类型

* 列存储：如 Hbase，按列存储数据的。最大的特点是方便存储结构化和半结构化数据，方便做数据压缩，对针对某一列或者某几列的查询有非常大的IO优势。
* 文档存储：如 MongoDB，CouchDB。文档存储一般用类似 json 的格式存储，存储的内容是文档型的。这样也就有有机会对某些字段建立索引，实现关系数据库的某些功能。
* key-value 存储：如 Redis。可以通过 key 快速查询到其 value。
* 图形数据库

## [LeetCode-sql problems](https://github.com/steveLauwh/Database/tree/master/LeetCode-sql%20problems)

