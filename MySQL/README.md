## MySQL

MySQL 是一个开源的关系型数据库管理系统(Relational Database Management System)。所谓“关系型数据库”是建立在关系模型基础上的数据库。

数据是以表格的形式出现。一个关系型数据库由一个或数个表格组成，一个表格是由表头，列，行，值，键等组成。

### Windows 下 MySQL 服务的命令

> **启动和关闭 MySQL 服务**

* 启动：`net start MySQL`
* 停止：`net stop MySQL`
* 卸载：`sc delete MySQL`

> **MySQL 登录**

| 参数        | 描述   | 
| --------   | -----:  | 
| -D     | 打开指定数据库 |  
| -h        |   服务器名称   | 
| -p        |    密码    |  
| -P        |   端口号   | 
| -u       |    用户名    |
| -V        |   输出版本信息并且退出   | 

如：MySQL 登录：`mysql -u root -p -P 3306`  MySQL 默认的端口号是 3306。

> **MySQL 退出**

* mysql > exit;
* mysql > quit;
* mysql > \q;

### 目录

* [学习 MySQL(一)——语句规范及数据类型](https://github.com/steveLauwh/Database/blob/master/MySQL/%E5%AD%A6%E4%B9%A0%20MySQL(%E4%B8%80).md)
* [学习 MySQL(二)——数据表及约束条件](https://github.com/steveLauwh/Database/blob/master/MySQL/%E5%AD%A6%E4%B9%A0%20MySQL(%E4%BA%8C).md)
* [学习 MySQL(三)——约束](https://github.com/steveLauwh/Database/blob/master/MySQL/%E5%AD%A6%E4%B9%A0%20MySQL(%E4%B8%89).md)
