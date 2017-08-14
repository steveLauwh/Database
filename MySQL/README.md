## MySQL

MySQL 是一种关系型数据库管理系统(Relational Database Management System)。所谓“关系型数据库”是建立在关系模型基础上的数据库。

数据是以表格的形式出现。一个关系型数据库由一个或数个表格组成，一个表格是由表头，列，行，值，键等组成。

### Windows 下 MySQL服务的命令

* 启动：`net start MySQL`
* 停止：`net stop MySQL`
* 卸载：`sc delete MySQL`

MySQL 安装成功后，默认 root 用户密码为空，使用下面命令创建 root 用户的密码为 123456：

`mysqladmin -u root password "123456"`

http://www.cnblogs.com/mr-wid/archive/2013/05/09/3068229.html
