# Memcached 使用

## Memcached 是什么

Memcached 是一个高性能的分布式内存对象缓存系统，用于动态 Web 应用以减轻数据库负载。

它是基于内存的 key-value 存储，用来存储小块的任意数据（字符串、对象）。这些数据可以是数据库调用、API 调用或者是页面渲染的结果。

## Linux 下安装 Memcached

[README](https://github.com/steveLauwh/Database/blob/master/Memcached/Linux%20%E4%B8%8B%20Memcached%20%E5%AE%89%E8%A3%85.md)

## Memcached 命令

### Memcached 存储命令

> **set**

用于将 value(数据值) 存储在指定的 key(键) 中。

如果 set 的 key 已经存在，该命令可以更新该 key 所对应的原来的数据，也就是实现更新的作用。

```shell
set key flags exptime bytes [noreply] 
value 
```
参数说明如下：

* key：键值 key-value 结构中的 key，用于查找缓存值
* flags：可以包括键值对的整型参数，客户端使用它存储关于键值对的额外信息 
* exptime：在缓存中保存键值对的时间长度（以秒为单位，0 表示永远）
* bytes：在缓存中存储的字节数
* noreply（可选）：该参数告知服务器不需要返回数据
* value：存储的值（始终位于第二行）（可直接理解为 key-value 结构中的 value）

例如：

```shell
set firstname 0 60 3
Lau
```
> **add**

用于将 value(数据值) 存储在指定的 key(键) 中。

如果 add 的 key 已经存在，则不会更新数据(过期的 key 会更新)，保持之前的值。

```shell
add key flags exptime bytes [noreply]
value
```

例如：

```shell
add lastname 0 60 5
steve
```
> **replace**

用于替换已存在的 key(键) 的 value(数据值)。

如果 key 不存在，则替换失败，并且获得响应 NOT_STORED。

```shell
replace key flags exptime bytes [noreply]
value
```

例如：

```shell
replace lastname 0 60 4
poly
```

> **append**

用于向已存在 key(键) 的 value(数据值) 后面追加数据。

```shell
append key flags exptime bytes [noreply]
value
```

例如：

```shell
append lastname 0 60 4
redis
```

> **prepend**

用于向已存在 key(键) 的 value(数据值) 前面追加数据 。

```shell
prepend key flags exptime bytes [noreply]
value
```

例如：

```shell
prepend lastname 0 60 8
monogodb
```

> **CAS**

CAS(Check-And-Set 或 Compare-And-Swap)。

用于执行一个"检查并设置"的操作，它仅在当前客户端最后一次取值后，该 key 对应的值没有被其他客户端修改的情况下，才能够将值写入。

unique_cas_token 通过 gets 命令获取的一个唯一的64位值。

```shell
cas key flags exptime bytes unique_cas_token [noreply]
value
```

例如：

```shell
set tp 0 900 9
memcached
STORED

gets tp
VALUE tp 0 9 1
memcached
END

cas tp 0 900 5 1
redis
STORED

get tp
VALUE tp 0 5
redis
END
```

### Memcached 查找命令

### Memcached 统计命令


