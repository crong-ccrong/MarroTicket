--������ ���� ������ ������ ��
drop table payment purge;
drop table reservation purge;
drop table play purge;
drop table umember_auth purge;
drop table tmember_auth purge;
drop table umember purge;
drop table tmember purge;

--������ ��� ���� ���̺���
drop table tfaq purge;
drop table ufaq purge;
drop table notice purge;

--������ ����
drop sequence notice_seq;
drop sequence tfaq_seq;
drop sequence ufaq_seq;
drop sequence pay_seq;
drop sequence play_seq;
drop sequence reservation_seq;
drop sequence tmember_seq;
drop sequence umember_seq;

--�Ϲ� ȸ�� ���̺�
create table UMEMBER(
u_number number(38)NOT NULL primary KEY ,--�Ϲ� ȸ�� ��ȣ
u_id VARCHAR2(20) UNIQUE NOT NULL,--���̵�
u_password VARCHAR2(100) NOT NULL,--��й�ȣ
u_name VARCHAR2(20) NOT NULL ,--�̸�
u_phoneNumber VARCHAR2(11) NOT NULL,-- �Ϲ� ����� �޴���ȭ ��ȣ
u_birthday VARCHAR2(10) NOT NULL,--�������
u_gender VARCHAR2(10) NOT NULL,--����
u_email VARCHAR2(50) NOT NULL,--�̸���
u_joinDate date DEFAULT sysdate NOT NULL,--������
u_unjoin VARCHAR2(10),--Ż�𿩺�
u_unjoinDate date DEFAULT sysdate,--Ż����
u_genre VARCHAR2(1) NOT NULL,--���� �帣
u_agree VARCHAR2(1) NOT NULL--��� ���ǿ���
);

--�Ϲ� ȸ�� ������ ���� 
create sequence UMEMBER_seq
start with 1
increment by 1;

--�Ϲ� ȸ�� ���� ���̺�
CREATE TABLE umember_auth (
u_number NUMBER(38) NOT NULL,
umember_auth VARCHAR2(50) NOT NULL,
FOREIGN KEY ( u_number ) REFERENCES umember ( u_number )
);

--�ش� ȸ�� ���̺�
create table TMEMBER(
t_number number(38)NOT NULL primary KEY,--�ش� ȸ�� ��ȣ
t_id VARCHAR2(20) UNIQUE NOT NULL,--���̵�
t_password VARCHAR2(100) NOT NULL,--��й���ȣ
t_name VARCHAR2(50) NOT NULL ,--�شܸ�
t_address VARCHAR2(100) NOT NULL,--�ش��ּ�
t_ownerName VARCHAR2(20) NOT NULL,--��ǥ�ڸ�
t_ownerPhoneNumber VARCHAR2(11) NOT NULL,--��ǥ�� �޴���ȭ��ȣ
t_ownerEmail VARCHAR2(50) NOT NULL,--��ǥ�� �̸���
t_businessRegistration VARCHAR2(1) NOT NULL,--����� ��� ���� (����/���)
t_businessRegistrationNumber VARCHAR2(10) NOT NULL,--����� ��Ϲ�ȣ
t_establishmentDate date DEFAULT sysdate NOT NULL,--������
t_bank VARCHAR2(50) NOT NULL,--�ŷ� ����
t_bankNumber VARCHAR2(50) NOT NULL,--���¹�ȣ
t_bankOwner VARCHAR2(50) NOT NULL,--������
t_businessRegistrationImage VARCHAR2(100) NOT NULL,--����ڵ���� �纻
t_fileurl VARCHAR2(100) NOT NULL ,
t_filename VARCHAR2(100) NOT NULL,
t_auth  VARCHAR2(10) NOT NULL,--�ش� ȸ�� ����(���Խ��ο���/���Խ��οϷ�/�������
t_agree VARCHAR2(1) NOT NULL--��� ���ǿ���
);
-- �ش� ȸ�� ������ ���� 
create sequence TMEMBER_seq
start with 1
increment by 1;


--�ش� ȸ�� ���� ���̺�
CREATE TABLE tmember_auth (
t_number NUMBER(38) NOT NULL,
tmember_auth VARCHAR2(50) NOT NULL,
FOREIGN KEY ( t_number ) REFERENCES tmember ( t_number )
);

--PLAY(����) ���̺�
CREATE TABLE play (
    p_number                 NUMBER(38) NOT NULL, --���� ��ȣ
    p_name                   VARCHAR2(50) NOT NULL, --���ظ�
    p_startdate              DATE NOT NULL, --���� ������
    p_closedate              DATE NOT NULL, --���� ������
    p_runningtime            VARCHAR2(3) NOT NULL, --���� �ҿ�ð�(����Ÿ��)
    p_theatername            VARCHAR2(20) NOT NULL, --���� �̸�
    p_theateraddress         VARCHAR2(100) NOT NULL, --���� �ּ�
    p_theatermapurl     VARCHAR2(100) NOT NULL,--���� �൵ url
    p_agency                 VARCHAR2(20) NOT NULL, --��ȹ�� ����
    p_ratings                VARCHAR2(1) NOT NULL, --���� ���
    p_casting                VARCHAR2(2000) NOT NULL, --ĳ���� ������
    p_ticketopendate         DATE NOT NULL, --���� ���� �����
    p_plot                   VARCHAR2(4000) NOT NULL, --���� �ٰŸ�
    p_seatnumber             NUMBER(20) NOT NULL, --�¼� ����
    p_ticketprice            NUMBER(7) NOT NULL, --Ƽ�� ����
    p_genre                  VARCHAR2(1) NOT NULL, --�帣 ����
    p_posterurl         VARCHAR2(100) NOT NULL, --���� ������ url
    p_amendmentapproved      VARCHAR2(1), --���� ���� ���� ����
    p_registrationapproval   VARCHAR2(1), --���� ��� ���� ����
    p_firststarttime         VARCHAR2(10) NOT NULL, -- 1ȸ�� �� ���� �ð� 
    p_secondstarttime        VARCHAR2(10), -- 2ȸ�� �� ���� �ð� 
    p_agree                  VARCHAR2(1) NOT NULL, --��� ���� ����
    t_number                 NUMBER(38) NOT NULL, --�ش� ȸ�� ��ȣ
    PRIMARY KEY ( p_number ),
    FOREIGN KEY ( t_number )
        REFERENCES tmember ( t_number )
);


--���� ������ ���� 
CREATE SEQUENCE play_seq START WITH 1 INCREMENT BY 1;


--���� ���̺� ����
CREATE TABLE RESERVATION (
R_NUMBER NUMBER(38) NOT NULL PRIMARY KEY, -- ���Ź�ȣ
R_DATE DATE default sysdate NOT NULL, -- ������
R_PAYSTATE NUMBER(5) NOT NULL, -- ���������� ����
R_FEE NUMBER(3) NOT NULL, -- ���� ������
R_CANCELSTATE NUMBER(5) NOT NULL, -- ���� ��� ����
R_CANCELDATE DATE, -- ���� �����
R_TICKETFIRST VARCHAR2(500) NOT NULL, -- Ƽ�Ϲ�ȣ1
R_TICKETSECOND VARCHAR2(500), -- Ƽ�Ϲ�ȣ2
R_TICKETTHIRD VARCHAR2(500), -- Ƽ�Ϲ�ȣ3
R_TICKETFORTH VARCHAR2(500), -- Ƽ�Ϲ�ȣ4
R_TOTALPAYMENT NUMBER(10) NOT NULL, -- ���� �Ѿ�
R_SEATNUMBER VARCHAR2(150) NOT NULL, -- ���� �Ѿ�
U_NUMBER NUMBER(38) NOT NULL, -- �Ϲ� ȸ�� ��ȣ
P_NUMBER NUMBER(38) NOT NULL, -- ���ع�ȣ

FOREIGN KEY(U_NUMBER) REFERENCES UMEMBER(U_NUMBER), -- �Ϲ� ȸ�� ��ȣ �ܷ�Ű ����
FOREIGN KEY(P_NUMBER) REFERENCES PLAY(P_NUMBER) -- ���� ��ȣ �ܷ�Ű ����
);
-- ���� ������ ����
CREATE SEQUENCE RESERVATION_SEQ
START WITH 1 INCREMENT BY 1;

--���� ���̺� ����
CREATE TABLE PAYMENT (
PAY_NUMBER NUMBER(38) NOT NULL PRIMARY KEY, -- ���� ��ȣ
PAY_CALCULATE DATE DEFAULT sysDate NOT NULL, -- ���� ����
PAY_PAYDATE DATE NOT NULL, -- ������
PAY_PAYMENT NUMBER(20) NOT NULL, -- �ݾ�
P_NUMBER NUMBER(38) NOT NULL, -- ���� ��ȣ
R_NUMBER NUMBER(38) NOT NULL, -- ���� ��ȣ
T_NUMBER NUMBER(38) NOT NULL, -- �ش� ȸ�� ��ȣ

FOREIGN KEY(P_NUMBER) REFERENCES PLAY(P_NUMBER), -- ���� ��ȣ �ܷ�Ű ����
FOREIGN KEY(R_NUMBER) REFERENCES RESERVATION(R_NUMBER), -- ���� ��ȣ �ܷ�Ű ����
FOREIGN KEY(T_NUMBER) REFERENCES TMEMBER(T_NUMBER) -- �ش� ȸ�� ��ȣ �ܷ�Ű ����
);

-- ���� ������ ����
CREATE SEQUENCE PAY_SEQ
START WITH 1 INCREMENT BY 1;

--�Ϲ�ȸ�� FAQ ���̺� ����
CREATE TABLE UFAQ(
UF_number number(38) not null, --�Խñ� ��ȣ/PK
UF_title varchar2(100) not null, -- �� ����
UF_content varchar2(4000) not null, -- �� ����
UF_date Date DEFAULT sysdate  not null, -- �����
primary key(UF_number)
);
--�Ϲ�ȸ�� FAQ ������ ����
CREATE SEQUENCE ufaq_seq START WITH 1 INCREMENT BY 1;


--�ش�ȸ�� FAQ ���̺� ����
CREATE TABLE TFAQ(
TF_number number(38) not null, --�Խñ� ��ȣ/PK
TF_title varchar2(100) not null, -- �� ����
TF_content varchar2(4000) not null, -- �� ����
TF_date Date DEFAULT sysdate not null, -- �����
primary key(TF_number)
);
--�ش�ȸ�� FAQ ������ ����
CREATE SEQUENCE tfaq_seq START WITH 1 INCREMENT BY 1;

--�������� ���̺� ����
CREATE TABLE NOTICE(
N_number number(38) not null, --�Խñ� ��ȣ/PK
N_title varchar2(100) not null, -- �� ����
N_content varchar2(4000) not null, -- �� ����
N_date Date DEFAULT sysdate not null, -- �����
primary key(N_number)
);
--�������� ������ ����
CREATE SEQUENCE notice_seq START WITH 1 INCREMENT BY 1;

--��Ű ���� ���̺�
CREATE TABLE persistent_logins (
username VARCHAR2(64) NOT NULL,
series VARCHAR2(64) NOT NULL,
token VARCHAR2(64) NOT NULL,
last_used DATE NOT NULL,
PRIMARY KEY (series)
);

-- ������ ��ȣ �Ѿ�� ���� ����
alter sequence notice_seq nocache;
alter sequence tfaq_seq nocache;
alter sequence ufaq_seq nocache;
alter sequence pay_seq nocache;
alter sequence play_seq nocache;
alter sequence reservation_seq nocache;
alter sequence tmember_seq nocache;
alter sequence umember_seq nocache;

