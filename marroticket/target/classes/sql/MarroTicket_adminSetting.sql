--마로티켓 관리자 생성
--c:\oradata\marroticket 폴더생성
create tablespace marroticket
DataFile 'C:\oradata\marroticket\marroticket_db.dbf'
SIZE 10M
AUTOEXTEND on
next 5m
maxsize 20M;

alter session set "_ORACLE_SCRIPT"=true;

create user marro
IDENTIFIED BY marro1234
default tablespace marroticket
TEMPORARY tablespace temp;

Grant connect, resource, dba to marro;
grant create view, create synonym to marro;
grant unlimited tablespace to marro;
alter user marro account unlock;