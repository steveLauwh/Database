## Redis

### Redis 是什么？

Remote Dictionary Server(Redis) 是一个由 Salvatore Sanfilippo 写的 key-value 存储系统。

Redis 是一个开源的使用 ANSI C 语言编写、遵守 BSD 协议、支持网络、可基于内存亦可持久化的日志型、Key-Value 数据库，并提供多种语言的 API。

Redis 是当前比较热门的 NoSQL 系统之一。

和 Memcache 一样，Redis 数据都是缓存在计算机内存中，不同的是，Memcache 只能将数据缓存到内存中，无法自动定期写入硬盘，
这就表示，一断电或重启，内存清空，数据丢失。所以 Memcache 的应用场景适用于缓存无需持久化的数据。
而 Redis 不同的是它会周期性的把更新的数据写入磁盘或者把修改操作写入追加的记录文件，实现数据的持久化。

### Redis 特点

* Redis 支持数据的持久化，可以将内存中的数据保存在磁盘中，重启的时候可以再次加载进行使用
* Redis 不仅仅支持简单的 Key-Value 数据库，同时还提供 list，set，zset，hash 等数据结构的存储
* Redis 支持数据的备份，即 master-slave 模式的数据备份

### Redis 在 Ubuntu 环境下安装

Redis 在 Ubuntu 环境下安装非常方便，一种从官网 wget，解压后 make；另一种，用命令安装即可。

```shell
$sudo apt-get update
$sudo apt-get install redis-server
```

安装完成后，Redis 服务器会自动启动。

// 在终端中检查 Redis 服务器系统进程
`ps -aux|grep redis`

// 在终端中通过启动命令检查 Redis 服务器状态
`netstat -nlt|grep 6379`

// 通过启动命令检查 Redis 服务器状态
`sudo /etc/init.d/redis-server status`

安装 Redis 服务器，会自动地一起安装 Redis 命令行客户端程序。在本机输入 redis-cli 命令就可以启动，客户端程序访问 Redis 服务器。

// 查看 Redis 是否启动
`redis-cli`

127.0.0.1:6379>

// 127.0.0.1 是本机 IP ，6379 是 redis 服务端口。现在我们输入 ping 命令

127.0.0.1:6379> ping

PONG

说明已经成功安装 Redis。

## Redis 配置

用 vim 打开 Redis 服务器的配置文件 redis.conf：`vim /etc/redis/redis.conf`。

redis.conf 配置文件里有详细的参数说明。

默认情况下，访问 Redis 服务器是不需要密码的，为了增加安全性，修改 Redis 配置，可以修改访问密码。

在 redis.conf 配置文件里，取消注释 requirepass，把密码设置为 redis，`requirepass redis`。

修改完后，需要重启 Redis 服务器：`$sudo /etc/init.d/redis-server restart`。

登录 Redis 服务器，需要输入密码：`$redis-cli -a redis`。

如果让 Redis 服务器被远程访问，需要在 redis.conf 配置文件里，注释掉 `#bind 127.0.0.1`；修改后，重启 Redis 服务器。

通过 `$netstat -nlt|grep 6379`，查看 Redis 服务器占用端口，网络监听从 127.0.0.1:6379 变成 0 0.0.0.0:6379，表示 Redis 已经允许远程登陆访问。

在另一台 Linux 访问 Redis 服务器：`$redis-cli -a redis -h XX.XX.XX.XX`。

## [Redis 命令](https://github.com/steveLauwh/Database/blob/master/Redis/Redis%20%E5%91%BD%E4%BB%A4.md)

key 定义的注意点：

* 不要过长
* 不要过短
* 统一的命名规范

Redis 支持五种数据类型：string(字符串)，hash(哈希)，list(列表)，set(集合)，zset(sorted set: 有序集合)。

string 类型是 Redis 最基本的数据类型，一个键最大能存储 512MB。

hash 是一个 string 类型的 field 和 value 的映射表，hash 特别适合用于存储对象。

list 是简单的字符串列表，按照插入顺序排序。可以添加一个元素到列表的头部(左边)或者尾部(右边)。

set 是通过哈希表实现的，所以添加，删除，查找的复杂度都是 O(1)。

zset(sorted set) 与 set 一样也是 string 类型元素的集合，且不允许重复的成员。不同的是每个元素都会关联一个 double 类型的 score。
Redis 通过 score 来为集合中的成员进行从小到大的排序。

## Redis 的应用场景

* 缓存
* 任务队列(秒杀，抢购)
* 应用排行榜
* 网站访问统计
* 数据过期处理(精确毫秒)
* 分布式集群架构中的 session 分离

### 参考资料

* [Redis 的应用场景](http://blog.csdn.net/hguisu/article/details/8836819)
