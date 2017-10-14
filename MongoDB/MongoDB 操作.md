## MongoDB 操作

连接默认主机和端口为：mongodb://localhost:27017

### 创建数据库

如果数据库不存在，则创建数据库：`use DATABASE_NAME`。

创建的数据库并不在数据库的列表中，要显示它，需要往数据库插入一些数据。

### 删除数据库

删除数据库：`db.dropDatabase()`。

删除集合：`db.collection.drop()`，**collection 就是集合名**。

### 插入文档

所有存储在集合中的数据都是 BSON 格式。BSON 是一种类 json 的一种二进制形式的存储格式,简称 Binary JSON。

插入文档：`db.COLLECTION_NAME.insert(document)`

查看已插入文档：`db.COLLECTION_NAME.find()`

如果集合不在该数据库中，MongoDB 会自动创建该集合并插入文档。

3.2 版本后还有以下几种语法可用于插入文档:

* 向指定集合中插入一条文档数据：`db.collection.insertOne()`
* 向指定集合中插入多条文档数据：`db.collection.insertMany()`

### 更新文档

MongoDB 使用 update() 和 save() 方法来更新集合中的文档。

`update()`：用于更新已存在的文档。

语法结构：
```
db.collection.update(
   <query>,
   <update>,
   {
     upsert: <boolean>,
     multi: <boolean>,
     writeConcern: <document>
   }
)
```
参数说明：

* query : update的查询条件，类似 sql update 查询内 where 后面的。
* update : update 的对象和一些更新的操作符（如$,$inc...）等，也可以理解为 sql update 查询内 set 后面的
* upsert : 可选，这个参数的意思是，如果不存在 update 的记录，是否插入 objNew, true 为插入，默认是 false，不插入。
* multi : 可选，mongodb 默认是 false,只更新找到的第一条记录，如果这个参数为 true,就把按条件查出来多条记录全部更新。
* writeConcern :可选，抛出异常的级别。

`save()`：通过传入的文档来替换已有文档。

```
db.collection.save(
   <document>,
   {
     writeConcern: <document>
   }
)
```
参数说明：

* document : 文档数据。
* writeConcern :可选，抛出异常的级别。

在 3.2 版本开始，MongoDB 提供以下更新集合文档的方法：

* 向指定集合更新单个文档：`db.collection.updateOne()` 
* 向指定集合更新多个文档：`db.collection.updateMany()`

### 删除文档

MongoDB remove() 函数是用来移除集合中的数据。

官方推荐使用 deleteOne() 和 deleteMany() 方法。

删除集合全部文档：`db.collection.deleteMany({})`。

删除 status 等于 A 的全部文档：`db.collection.deleteMand({status : "A"})`。

删除 status 等于 D 的一个文档：`db.collection.deleteOne({ status : "D" })`。

### 查询文档

MongoDB 查询文档使用 find() 方法。该方法以非结构化的方式来显示所有文档。

```
db.collection.find(query, projection)
```

参数说明：

* query ：可选，使用查询操作符指定查询条件
* projection ：可选，使用投影操作符指定返回的键。查询时返回文档中所有键值， 只需省略该参数即可（默认省略）。

为了易读，使用 pretty() 方法：`db.collection.find().pretty()`。

> MongoDB AND 条件

每个键以逗号隔开，如 `db.col.find({"name" : "steve", "age" : "26"}).pretty()`

> MongoDB OR 条件

使用了关键字 $or

```
db.col.find(
   {
      $or: [
         {key1: value1}, {key2:value2}
      ]
   }
).pretty()
```

### 条件操作符

```
$gt -------- greater than  >

$gte --------- gt equal  >=

$lt -------- less than  <

$lte --------- lt equal  <=

$ne ----------- not equal  !=

$eq  --------  equal  =
```

// 获取 "col" 集合中 "likes" 大于 100，小于 200 的数据
`db.col.find({likes : {$lt : 200, $gt : 100}})`

### $type 操作符

$type 操作符是基于 BSON 类型来检索集合中匹配的数据类型，并返回结果。

如：String 类型就是 2

// 获取 "col" 集合中 title 为 String 的数据
`db.col.find({"title" : {$type : 2}})`

### limit 与 skip 方法

读取指定数量的数据记录，用 limit() 方法，接受一个数字参数，该参数指定从 MongoDB 中读取的记录条数。

`db.COLLECTION_NAME.find().limit(NUMBER)`

// 显示 col 文档中的两条记录，_id 列不显示，title 列显示
`db.col.find({},{"title":1,_id:0}).limit(2)`

解释：
* 第一个 {} 放 where 条件，为空表示返回集合中所有文档。
* 第二个 {} 指定那些列显示和不显示(0 表示不显示，1 表示显示)。

使用 skip() 方法可以跳过指定数量的数据。

`db.COLLECTION_NAME.find().limit(NUMBER).skip(NUMBER)`

// 只会显示第二条文档数据
`db.col.find({},{"title":1,_id:0}).limit(1).skip(1)`

### 排序

在 MongoDB 中使用使用 sort() 方法对数据进行排序，sort() 方法可以通过参数指定排序的字段，并使用 1 和 -1 来指定排序的方式，其中 1 为升序排列，而-1是用于降序排列。

`db.COLLECTION_NAME.find().sort({KEY:1})`

### 索引

索引是特殊的数据结构，索引存储在一个易于遍历读取的数据集合中，索引是对数据库表中一列或多列的值进行排序的一种结构。

索引通常能够极大的提高查询的效率。

MongoDB 使用 ensureIndex() 方法来创建索引。

// key 值是创建的索引字段，1 为指定按升序创建索引，如果降序用 -1
`db.COLLECTION_NAME.ensureIndex({KEY:1})`

### 聚合

MongoDB 中聚合(aggregate)主要用于处理数据(诸如统计平均值，求和等)，并返回计算后的数据结果。

`db.COLLECTION_NAME.aggregate(AGGREGATE_OPERATION)`

MongoDB 的聚合管道将 MongoDB 文档在一个管道处理完毕后将结果传递给下一个管道处理。管道操作是可以重复的。
表达式：处理输入文档并输出。表达式是无状态的，只能用于计算当前聚合管道的文档，不能处理其它的文档。

### 复制

MongoDB 复制是将数据同步在多个服务器的过程。

复制提供了数据的冗余备份，并在多个服务器上存储数据副本，提高了数据的可用性， 并可以保证数据的安全性。

MongoDB 的复制至少需要两个节点。其中一个是主节点，负责处理客户端请求，其余的都是从节点，负责复制主节点上的数据。

主节点记录在其上的所有操作 oplog，从节点定期轮询主节点获取这些操作，然后对自己的数据副本执行这些操作，从而保证从节点的数据与主节点一致。

副本集添加成员：`rs.add(HOST_NAME:PORT)`

### 分片

在 Mongodb 里面存在另一种集群，就是分片技术，可以满足 MongoDB 数据量大量增长的需求。

当 MongoDB 存储海量的数据时，一台机器可能不足以存储数据，也可能不足以提供可接受的读写吞吐量。这时，我们就可以通过在多台机器上分割数据，使得数据库系统能存储和处理更多的数据。

### 数据备份

mongodump 命令来备份 MongoDB 数据。该命令可以导出所有数据到指定目录中。

`mongodump -h dbhost -d dbname -o dbdirectory`

### 数据恢复

使用 mongorestore 命令来恢复备份的数据。

`mongorestore -h <hostname><:port> -d dbname <path>`

### 监控

MongoDB 中提供了 mongostat 和 mongotop 两个命令来监控 MongoDB 的运行情况。

mongostat 是 MongoDB 自带的状态检测工具，在命令行下使用。它会间隔固定时间获取 MongoDB 的当前运行状态，并输出。

mongotop 提供了一个方法，用来跟踪一个 MongoDB 的实例，查看哪些大量的时间花费在读取和写入数据。


