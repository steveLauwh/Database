## MongoDB

MongoDB 是一个基于分布式文件存储的数据库。由 C++ 语言编写。旨在为 WEB 应用提供可扩展的高性能数据存储解决方案。

MongoDB 是一个介于关系数据库和非关系数据库之间的产品，是非关系数据库当中功能最丰富，最像关系数据库的。

MongoDB 将数据存储为一个文档，数据结构由键值(key => value)对组成。

MongoDB 文档类似于 JSON 对象。字段值可以包含其他文档，数组及文档数组。

MongoDB 支持丰富的查询表达式，支持对数据建立索引。

```json
// field:value
{
    name:"steve",
    age: 26,
    status: "A",
    groups: ["news", "sports"]
}
```

## Linux 环境下的 MongoDB

Ubuntu 下安装 MongoDB 直接使用 apt-get 命令进行安装：`apt-get install mongodb`。

安装完成后，查看 MongoDB 版本：`mongo -version`。

启动和关闭 MongoDB：
```
service mongodb start
service mongodb stop
```

查看 MongoDB 是否启动：`pgrep mongo -l`。

MongoDB 配置文件目录：`/etc/mongodb.conf`。

在终端输入：`mongo`，进入 MongoDB  shell命令模式。

## [MongoDB 操作](https://github.com/steveLauwh/Database/blob/master/MongoDB/MongoDB%20%E6%93%8D%E4%BD%9C.md)

执行`db`命令可以显示当前数据库对象或集合。

运行`use`命令，可以连接到一个指定的数据库。

MongoDB 概念：

> document 文档

文档 是一组键值(key-value)对;有序的；区分类型和大小写；不能有重复的键；文档的键是字符串。

MongoDB 的文档类似于 RDBMS 的行。

> collection 集合

集合 就是 MongoDB 文档组，类似于 RDBMS 的表格。

集合存在于数据库中，集合没有固定的结构。

capped collections 是固定大小的 collection，单位是字节，其数据存储空间值提前分配的。

## 参考资料

* https://docs.mongodb.com/manual/
