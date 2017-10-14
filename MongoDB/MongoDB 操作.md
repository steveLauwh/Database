## MongoDB 操作

### 创建数据库

如果数据库不存在，则创建数据库：`use DATABASE_NAME`。

创建的数据库并不在数据库的列表中，要显示它，需要往数据库插入一些数据。

### 删除数据库

删除数据库：`db.dropDatabase()`。

删除集合：`db.collection.drop()`，collection 就是集合名。

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

在3.2版本开始，MongoDB 提供以下更新集合文档的方法：

* 向指定集合更新单个文档：`db.collection.updateOne()` 
* 向指定集合更新多个文档：`db.collection.updateMany()`

## 删除文档


