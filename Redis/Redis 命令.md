## Redis 命令

Redis 命令用于在 Redis 服务上执行操作。

启动 Redis 客户端，打开终端并输入命令 `redis-cli`。该命令会连接本地的 Redis 服务。

在远程服务上执行命令：`redis-cli -h host -p port -a password`。

如：`redis-cli -h 127.0.0.1 -p 6379 -a "mypass"`

### Redis 键(key)

Redis 键命令的基本语法：`COMMAND KEY_NAME`。

`DEL key`：在 key 存在时删除 key。

`EXISTS key`：检查给定 key 是否存在。

`TYPE key`：返回 key 所储存的值的类型。

`MOVE key db`：将当前数据库的 key 移动到给定的数据库 db 当中。

`RENAME key newkey`：修改 key 的名称。

### Redis 字符串(string)

Redis 字符串数据类型的相关命令用于管理 Redis 字符串值。

`SET key value`：设置指定 key 的值。

`GET key`：获取指定 key 的值。

`GETRANGE key start end`：返回 key 中字符串值的子字符。

`STRLEN key`：返回 key 所储存的字符串值的长度。

### Redis 哈希(hash)

Redis 中每个 hash 可以存储 2^32 - 1 键值对。

hash 的 field 和 value 都是 string 类型。

`HMSET key field1 value1 [field2 value2 ]`：同时将多个 field-value (域-值)对设置到哈希表 key 中。

`HGETALL key`：获取在哈希表中指定 key 的所有字段和值。

`HGET key field`：获取存储在哈希表中指定字段的值。

`HSET key field value`：将哈希表 key 中的字段 field 的值设为 value。

### Redis 列表(list)

Redis 列表是简单的字符串列表，按照插入顺序排序。

`LPUSH key value1 [value2]`：将一个或多个值插入到列表头部。

`LRANGE key start stop`：获取列表指定范围内的元素。

`LINDEX key index`：通过索引获取列表中的元素。

`LPOP key`：移出并获取列表的第一个元素。

`RPUSH key value1 [value2]`：在列表中添加一个或多个值。

### Redis 集合(set)

Redis 的 set 是 string 类型的无序集合。集合成员是唯一的，这就意味着集合中不能出现重复的数据。

Redis 中集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是 O(1)。

集合中最大的成员数为 2^32 - 1。

`SADD key member1 [member2]`：向集合添加一个或多个成员。

`SMEMBERS key`：返回集合中的所有成员。

`SISMEMBER key member`：判断 member 元素是否是集合 key 的成员。

`SCARD key`：获取集合的成员数。

### Redis 有序集合(sorted set)

Redis 有序集合和集合一样也是 string 类型元素的集合,且不允许重复的成员。

不同的是每个元素都会关联一个 double 类型的分数。Redis 正是通过分数来为集合中的成员进行从小到大的排序。

有序集合的成员是唯一的,但分数(score)却可以重复。

集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是 O(1)。 集合中最大的成员数为 2^32 - 1。

`ZADD key score1 member1 [score2 member2]`：向有序集合添加一个或多个成员，或者更新已存在成员的分数。

`ZRANGE key start stop [WITHSCORES]`：通过索引区间返回有序集合成指定区间内的成员。

`ZRANK key member`：返回有序集合中指定成员的索引。

### Redis HyperLogLog(基数统计)

Redis 在 2.8.9 版本添加了 HyperLogLog 结构。

Redis HyperLogLog 是用来做基数统计的算法，HyperLogLog 的优点是，在输入元素的数量或者体积非常非常大时，计算基数所需的空间总是固定的、并且是很小的。

基数集的元素没有重复元素。

`PFADD key element [element ...]`：添加指定元素到 HyperLogLog 中。

`PFCOUNT key [key ...]`：返回给定 HyperLogLog 的基数估算值。

### Redis pub/sub(发布/订阅)

Redis 发布/订阅(pub/sub)是一种消息通信模式：发送者(pub)发送消息，订阅者(sub)接收消息。

Redis 客户端可以订阅任意数量的频道。

`PUBLISH channel message`：将信息发送到指定的频道。

`SUBSCRIBE channel [channel ...]`：订阅给定的一个或多个频道的信息。

### Redis 事务

Redis 事务可以一次执行多个命令，并且带有以下两个重要的保证：

* 事务是一个单独的隔离操作：事务中的所有命令都会序列化、按顺序地执行。事务在执行的过程中，不会被其他客户端发送来的命令请求所打断。
* 事务是一个原子操作：事务中的命令要么全部被执行，要么全部都不执行。

一个事务从开始到执行会经历以下三个阶段：

* 开始事务。
* 命令入队。
* 执行事务。

`MULTI`：标记一个事务块的开始。

`EXEC`：执行所有事务块内的命令。

`DISCARD`：取消事务，放弃执行事务块内的所有命令。

`UNWATCH`：取消 WATCH 命令对所有 key 的监视。

`WATCH key [key ...]`：监视一个(或多个) key ，如果在事务执行之前这个(或这些) key 被其他命令所改动，那么事务将被打断。

### Redis 脚本

Redis 脚本使用 Lua 解释器来执行脚本。 Reids 2.6 版本通过内嵌支持 Lua 环境。执行脚本的常用命令为 EVAL。

`EVAL script numkeys key [key ...] arg [arg ...]`：执行 Lua 脚本。

`SCRIPT KILL`：杀死当前正在运行的 Lua 脚本。

`SCRIPT FLUSH`：从脚本缓存中移除所有脚本。

### Redis 连接

Redis 连接命令主要是用于连接 Redis 服务。

`AUTH password`：验证密码是否正确。

`ECHO message`：打印字符串。

`PING`：查看服务是否运行。

`QUIT`：关闭当前连接。

`SELECT index`：切换到指定的数据库。

### Redis 服务器

Redis 服务器命令主要是用于管理 Redis 服务。

`INFO`：获取 Redis 服务器的统计信息。

### Redis 数据备份与恢复

Redis `SAVE` 命令用于创建当前数据库的备份。该命令将在 Redis 安装目录中创建 dump.rdb 文件。

获取 Redis 目录可以使用 CONFIG 命令：`CONFIG GET dir`。

恢复数据：只需将备份文件 (dump.rdb) 移动到 Redis 安装目录并启动服务即可。

`Bgsave`：创建 redis 备份文件，在后台执行。

### Redis 安全

`CONFIG get requirepass`：查看是否设置了密码验证。

`CONFIG set requirepass "xxx"`：设置密码。

### Redis 性能测试

Redis 性能测试是通过同时执行多个命令实现的。

`redis-benchmark [option] [option value]`

### Redis 客户端连接

Redis 通过监听一个 TCP 端口或者 Unix socket 的方式来接收来自客户端的连接，当一个连接建立后，Redis 内部会进行以下一些操作：

首先，客户端 socket 会被设置为非阻塞模式，因为 Redis 在网络事件处理上采用的是非阻塞多路复用模型；

然后为这个 socket 设置 TCP_NODELAY 属性，禁用 Nagle 算法；

然后创建一个可读的文件事件用于监听这个客户端 socket 的数据发送。

`config get maxclients`：获取最大连接数，可在 redis.conf 修改。

`redis-server --maxclients xxx`：在服务启动时设置最大连接数。

`CLIENT LIST`：返回连接到 redis 服务的客户端列表。

`CLIENT KILL`：关闭客户端连接。

## Redis 管道技术

Redis 是一种基于客户端-服务端模型以及请求/响应协议的 TCP 服务。这意味着通常情况下一个请求会遵循以下步骤：

* 客户端向服务端发送一个查询请求，并监听 Socket 返回，通常是以阻塞模式，等待服务端响应。
* 服务端处理命令，并将结果返回给客户端。

Redis 管道技术可以在服务端未响应时，客户端可以继续向服务端发送请求，并最终一次性读取所有服务端的响应。

## Redis 分区

分区是分割数据到多个 Redis 实例的处理过程，因此每个实例只保存 key 的一个子集。

分区的优势

* 通过利用多台计算机内存的和值，允许我们构造更大的数据库。
* 通过多核和多台计算机，允许我们扩展计算能力；通过多台计算机和网络适配器，允许我们扩展网络带宽。

## 参考资料

* Redis 命令：https://redis.io/commands

