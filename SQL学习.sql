/*ϵͳ��
 

syscharsets  �����ݿ��ַ���������˳��

sysconfigures �����ݿ�����ѡ��

syscurconfigs �����ݿ⵱ǰ����ѡ��

  syslanguages �����ݿ�����

  syslogins �����ݿ��½�ʺ���Ϣ

 sysoledbusers �����ݿ����ӷ�������½��Ϣ

  sysprocesses �����ݿ����

  sysremotelogins�����ݿ�Զ�̵�¼�ʺ�

  syscolumns ÿ�����ݿ���

  sysconstrains ÿ�����ݿ�����

  sysfilegroups ÿ�����ݿ��ļ���

  sysfiles ÿ�����ݿ��ļ�

  sysforeignkeys ÿ�����ݿ��ⲿ�ؼ���

  sysindexs ÿ�����ݿ�����

  sysmenbers ÿ�����ݿ��ɫ��Ա



  syspermissions ÿ�����ݿ�Ȩ��

  systypes ÿ�����ݿ��û�������������

  sysusers ÿ�����ݿ��û�*/select * from sysusers

----------------------------------------
-----------------ϵͳ��-----------------
----------------------------------------
-------�����ݿ�������е����ݿ�
select * from sysdatabases 
-------�����ݿⱣ�����ݿ���ļ�
select * from sysaltfiles  
-------ÿ�����ݿ��������ݿ����
select* from sysobjects 
----------------------------------------
-----------------����SQL-----------------
----------------------------------------

 -----ɾ�����ݿ��
 use master
 go
 if exists(select * from sysdatabases where name='DB_School')
 drop database DB_School
 go
 
  ----�������ݿ�
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

   --------������
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

   --------�޸ı�������
   alter table instructor add  xinzen varchar(100)
   --------�޸ı�ɾ����
   alter table instructor drop column xinzen
   --------�޸ı��޸�������
   alter table instructor alter column xinzen int
   --------�޸ı��޸��е�����
   exec sp_rename 'instructor.xinzen','new'

   select * from sysobjects where name='instructor'

   -------ѡ��ǰ10��
   select top 10 * from sysobjects

   -------ѡ���10����

  
   ------group by----------
   select ���sum�������� as ����֮��  from A group by ��� order by sum��������desc -------------group by
   select ���sum�������� as ����֮�ͣ�ժҪ from A group by all ���ժҪ--------------group by all

   avg������sum������max������min������count����


   ------distinct

   ------order by

   ------desc��asc

   ------having
   --Having��Where������
   --where �Ӿ���������ڶԲ�ѯ������з���ǰ����������where��������ȥ�������ڷ���֮ǰ�������ݣ�where�����в��ܰ������麯����ʹ��where�������˳��ض����С�
   --having �Ӿ��������ɸѡ�����������飬���ڷ���֮��������ݣ������о����������麯����ʹ��having �������˳��ض����飬Ҳ����ʹ�ö�������׼���з��顣
   select ���, sum(����) as ����֮�� from A group by ��� having sum(����) > 18
   select ���, SUM(����) from A where ���� >8 group by ��� having SUM(����) > 10

   ------compute��compute by
   select * from A where ����>8 compute max(����),min(����),avg(����)
   --compute�Ӿ��ܹ��۲조��ѯ�����������ϸ�ڻ�ͳ�Ƹ������ݣ�����10��max��min��avg�������ؽ����select�б��computeͳ�ƽ����ɡ�
   select * from A where ����>8 order by ��� compute max(����),min(����),avg(����) by ���


   ------like��not like

   ------����

   ------union

   ------unique
   

   -------��ѯ30���ڵļ�¼

   -------��ѯ12Сʱ�ڼ�¼
   ------------------------
   --------���ں���--------
   ------------------------
   --------��ȡϵͳʱ��
   select getdate()
   
   ------- �����졢�¡���
   select day(crdate) from sysobjects
   select month(crdate) from sysobjects
   select year(crdate) from sysobjects

   --dateadd  ����ָ�����ڼ���һ��ʱ��Ļ����ϣ������µ� datetime ֵ������
   select dateadd(day,30,'2017-03-13 ') 
   select dateadd(day,30,'2017-03-13 ') from sysobjects



   --��ѯĳʱ����ڵ�����
   select * from sysobjects where crdate between '2017-03-13 00:00:00' and '2017-12-30 23:59:59'
