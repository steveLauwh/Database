## Redis 持久化

Redis 数据库的所有数据都存储在内存中。在一台普通的笔记本电脑上，Redis 可以在 1 秒内读写超过十万个键值。Redis 也提供了持久化的支持，即
将内存中的数据异步写入硬盘中，同时不影响继续提供服务。

持久化使用的方式：

* RDB 持久化：在指定的时间间隔内生成数据集的时间点快照（point-in-time snapshot）。
* AOF 持久化：记录服务器执行的所有写操作命令，并在服务器启动时，通过重新执行这些命令来还原数据集。
* 无持久化
* 同时使用 RDB 和 AOF 持久化

### RDB 持久化

### AOF 持久化
