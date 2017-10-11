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



### 参考资料

* Redis 命令：https://redis.io/commands

