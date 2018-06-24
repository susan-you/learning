/*系统表
 

syscharsets  主数据库字符集与排序顺序

sysconfigures 主数据库配置选项

syscurconfigs 主数据库当前配置选项

  syslanguages 主数据库语言

  syslogins 主数据库登陆帐号信息

 sysoledbusers 主数据库链接服务器登陆信息

  sysprocesses 主数据库进程

  sysremotelogins主数据库远程登录帐号

  syscolumns 每个数据库列

  sysconstrains 每个数据库限制

  sysfilegroups 每个数据库文件组

  sysfiles 每个数据库文件

  sysforeignkeys 每个数据库外部关键字

  sysindexs 每个数据库索引

  sysmenbers 每个数据库角色成员



  syspermissions 每个数据库权限

  systypes 每个数据库用户定义数据类型

  sysusers 每个数据库用户*/select * from sysusers

----------------------------------------
-----------------系统表-----------------
----------------------------------------
-------主数据库服务器中的数据库
select * from sysdatabases 
-------主数据库保存数据库的文件
select * from sysaltfiles  
-------每个数据库所有数据库对象
select* from sysobjects 
----------------------------------------
-----------------常用SQL-----------------
----------------------------------------

 -----删除数据库库
 use master
 go
 if exists(select * from sysdatabases where name='DB_School')
 drop database DB_School
 go
 
  ----创建数据库
  create database DB_School on primary
  (
   name='DB_School',
   filename='E:\Program Files (x86)\Microsoft SQL Server\DB_School.mdf',
   size=5mb,
   maxsize=100mb,
   filegrowth=15%
   )
   log on
   (
   name='LOG_School',
   filename='E:\Program Files (x86)\Microsoft SQL Server\DB_School.ldf',
   size=2mb,
   filegrowth=1mb
   )

   --------创建表
   use DB_School
   go
   if exists(select * from sysobjects where name='instructor')
   drop table instructor
   create table instructor
   (
   id int identity(1,1) primary key,
   name varchar(30),
   dept_name varchar(100),
   salary float
   )
   go

   select * from instructor

   --------修改表，新增列
   alter table instructor add  xinzen varchar(100)
   --------修改表，删除列
   alter table instructor drop column xinzen
   --------修改表，修改列类型
   alter table instructor alter column xinzen int
   --------修改表，修改列的名称
   exec sp_rename 'instructor.xinzen','new'

   select * from sysobjects where name='instructor'

   -------选择前10条
   select top 10 * from sysobjects

   -------选择后10条？

  
   ------group by----------
   select 类别，sum（数量） as 数量之和  from A group by 类别 order by sum（数量）desc -------------group by
   select 类别，sum（数量） as 数量之和，摘要 from A group by all 类别，摘要--------------group by all

   avg（），sum（），max（），min（），count（）


   ------distinct

   ------order by

   ------desc、asc

   ------having
   --Having与Where的区别
   --where 子句的作用是在对查询结果进行分组前，将不符合where条件的行去掉，即在分组之前过滤数据，where条件中不能包含聚组函数，使用where条件过滤出特定的行。
   --having 子句的作用是筛选满足条件的组，即在分组之后过滤数据，条件中经常包含聚组函数，使用having 条件过滤出特定的组，也可以使用多个分组标准进行分组。
   select 类别, sum(数量) as 数量之和 from A group by 类别 having sum(数量) > 18
   select 类别, SUM(数量) from A where 数量 >8 group by 类别 having SUM(数量) > 10

   ------compute、compute by
   select * from A where 数量>8 compute max(数量),min(数量),avg(数量)
   --compute子句能够观察“查询结果”的数据细节或统计各列数据（如例10中max、min和avg），返回结果由select列表和compute统计结果组成。
   select * from A where 数量>8 order by 类别 compute max(数量),min(数量),avg(数量) by 类别


   ------like、not like

   ------连接

   ------union

   ------unique
   

   -------查询30天内的记录

   -------查询12小时内记录
   ------------------------
   --------日期函数--------
   ------------------------
   --------获取系统时间
   select getdate()
   
   ------- 返回天、月、年
   select day(crdate) from sysobjects
   select month(crdate) from sysobjects
   select year(crdate) from sysobjects

   --dateadd  在向指定日期加上一段时间的基础上，返回新的 datetime 值？？？
   select dateadd(day,30,'2017-03-13 ') 
   select dateadd(day,30,'2017-03-13 ') from sysobjects



   --查询某时间段内的数据
   select * from sysobjects where crdate between '2017-03-13 00:00:00' and '2017-12-30 23:59:59'
