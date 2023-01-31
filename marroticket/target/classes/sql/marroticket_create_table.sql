--삭제는 다음 순서에 따르면 됨
drop table payment purge;
drop table reservation purge;
drop table play purge;
drop table umember_auth purge;
drop table tmember_auth purge;
drop table umember purge;
drop table tmember purge;

--순서에 상관 없는 테이블들
drop table tfaq purge;
drop table notice purge;
drop table ufaq purge;

--시퀀스 삭제
drop sequence notice_seq;
drop sequence tfaq_seq;
drop sequence ufaq_seq;
drop sequence pay_seq;
drop sequence play_seq;
drop sequence reservation_seq;
drop sequence tmember_seq;
drop sequence umember_seq;

--일반 회원 테이블
create table UMEMBER(
u_number number(38)NOT NULL primary KEY ,--일반 회원 번호
u_id VARCHAR2(20) UNIQUE NOT NULL,--아이디
u_password VARCHAR2(100) NOT NULL,--비밀번호
u_name VARCHAR2(20) NOT NULL ,--이름
u_phoneNumber VARCHAR2(11) NOT NULL,-- 일반 사용자 휴대전화 번호
u_birthday VARCHAR2(10) NOT NULL,--생년월일
u_gender VARCHAR2(10) NOT NULL,--성별
u_email VARCHAR2(50) NOT NULL,--이메일
u_joinDate date DEFAULT sysdate NOT NULL,--가입일
u_unjoin VARCHAR2(10),--탈퇴여부
u_unjoinDate date DEFAULT sysdate,--탈퇴일
u_genre VARCHAR2(1) NOT NULL,--관심 장르
u_agree VARCHAR2(1) NOT NULL--약관 동의여부
);

--일반 회원 시퀀스 생성 
create sequence UMEMBER_seq
start with 1
increment by 1;

--일반 회원 권한 테이블
CREATE TABLE umember_auth (
u_number NUMBER(5) NOT NULL,
u_auth VARCHAR2(50) NOT NULL,
FOREIGN KEY ( u_number ) REFERENCES umember ( u_number )
);

--극단 회원 테이블
create table TMEMBER(
t_number number(38)NOT NULL primary KEY,--극단 회원 번호
t_id VARCHAR2(20) UNIQUE NOT NULL,--아이디
t_password VARCHAR2(100) NOT NULL,--비밀번단호
t_name VARCHAR2(50) NOT NULL ,--극단명
t_address VARCHAR2(100) NOT NULL,--극단주소
t_ownerName VARCHAR2(20) NOT NULL,--대표자명
t_ownerPhoneNumber VARCHAR2(11) NOT NULL,--대표자 휴대전화번호
t_ownerEmail VARCHAR2(50) NOT NULL,--대표자 이메일
t_businessRegistration VARCHAR2(1) NOT NULL,--사업자 등록 구분 (개인/기업)
t_businessRegistrationNumber VARCHAR2(10) NOT NULL,--사업자 등록번호
t_establishmentDate date DEFAULT sysdate NOT NULL,--설립일
t_bank VARCHAR2(50) NOT NULL,--거래 은행
t_bankNumber VARCHAR2(50) NOT NULL,--계좌번호
t_bankOwner VARCHAR2(50) NOT NULL,--예금주
t_businessRegistrationImage VARCHAR2(100) NOT NULL,--사업자등록증 사본
t_auth  VARCHAR2(10) NOT NULL,--극단 회원 상태(가입승인예정/가입승인완료/계약종료
t_agree VARCHAR2(1) NOT NULL--약관 동의여부
);
-- 극단 회원 시퀀스 생성 
create sequence TMEMBER_seq
start with 1
increment by 1;


--극단 회원 권한 테이블
CREATE TABLE tmember_auth (
t_number NUMBER(5) NOT NULL,
t_auth VARCHAR2(50) NOT NULL,
FOREIGN KEY ( t_number ) REFERENCES tmember ( t_number )
);


--PLAY(연극) 테이블
CREATE TABLE play (
    p_number                     NUMBER(38) NOT NULL, --연극 번호
    p_name                       VARCHAR2(50) NOT NULL, --연극명
    p_startdate                  DATE NOT NULL, --연극 시작일
    p_closedate                  DATE NOT NULL, --연극 종료일
    p_runningtime                NUMBER(3) NOT NULL, --연극 소요시간(러닝타임)
    p_theatername                VARCHAR2(20) NOT NULL, --극장 이름
    p_theateraddress             VARCHAR2(100) NOT NULL, --극장 주소
    p_theatermap                 VARCHAR2(100) NOT NULL, --극장 약도 이미지
    p_agency                     VARCHAR2(20) NOT NULL, --기획사 정보
    p_ratings                    NUMBER(1) NOT NULL, --관람 등급
    p_casting                    VARCHAR2(2000) NOT NULL, --캐스팅 데이터
    p_ticketopendate             DATE NOT NULL, --예매 오픈 희망일
    p_plot                       VARCHAR2(4000) NOT NULL, --공연 줄거리
    p_seattype                   VARCHAR2(10) NOT NULL, --좌석 종류
    p_seatnumber                 NUMBER(20) NOT NULL, --좌석 개수
    p_ticketprice                NUMBER(7) NOT NULL, --티켓 가격
    p_genre                      NUMBER(1) NOT NULL, --장르 정보
    p_poster                     VARCHAR2(100) NOT NULL, --연극 포스터
    p_amendmentapproved          NUMBER(1), --공연 수정 승인 여부
    p_registrationapproval       NUMBER(1), --공연 등록 승인 여부
    p_eachdateone                DATE NOT NULL, -- 상연 날짜 1
    p_eachdatetwo                DATE, -- 상연 날짜 2
    p_eachdatethree              DATE, -- 상연 날짜 3
    p_eachdatefour               DATE, -- 상연 날짜 4
    p_eachdatefive               DATE, -- 상연 날짜 5
    p_eachdatesix                DATE, -- 상연 날짜 6
    p_eachdateseven              DATE, -- 상연 날짜 7
    p_eachdateeight              DATE, -- 상연 날짜 8
    p_eachdatenine               DATE, -- 상연 날짜 9
    p_eachdateten                DATE, -- 상연 날짜 10
    p_eachdateeleven             DATE, -- 상연 날짜 11
    p_eachdatetwelve             DATE, -- 상연 날짜 12
    p_eachdatethirteen           DATE, -- 상연 날짜 13
    p_eachdatefourteen           DATE, -- 상연 날짜 14
    p_eachdatefifteen            DATE, -- 상연 날짜 15
    p_eachdatesixteen            DATE, -- 상연 날짜 16
    p_eachdateseventeen          DATE, -- 상연 날짜 17
    p_eachdateeighteen           DATE, -- 상연 날짜 18
    p_eachdatenineteen           DATE, -- 상연 날짜 19
    p_eachdatetwenty             DATE, -- 상연 날짜 20
    p_eachdatetwentyone          DATE, -- 상연 날짜 21
    p_eachdatetwentytwo          DATE, -- 상연 날짜 22
    p_eachdatetwentythree        DATE, -- 상연 날짜 23
    p_eachdatetwentyfour         DATE, -- 상연 날짜 24
    p_eachdatetwentyfive         DATE, -- 상연 날짜 25
    p_eachdatetwentysix          DATE, -- 상연 날짜 26
    p_eachdatetwentyseven        DATE, -- 상연 날짜 27
    p_eachdatetwentyeight        DATE, -- 상연 날짜 28
    p_eachdatetwentynine         DATE, -- 상연 날짜 29
    p_eachdatethirty             DATE, -- 상연 날짜 30
    p_eachdatethirtyone          DATE, -- 상연 날짜 31
    p_eachdatethirtytwo          DATE, -- 상연 날짜 32
    p_eachdatethirtythree        DATE, -- 상연 날짜 33
    p_eachdatethirtyfour         DATE, -- 상연 날짜 34
    p_eachdatethirtyfive         DATE, -- 상연 날짜 35
    p_eachdatethirtysix          DATE, -- 상연 날짜 36
    p_eachdatethirtyseven        DATE, -- 상연 날짜 37
    p_eachdatethirtyeight        DATE, -- 상연 날짜 38
    p_eachdatethirtynine         DATE, -- 상연 날짜 39
    p_eachdateforty              DATE, -- 상연 날짜 40
    p_eachdatefortyone           DATE, -- 상연 날짜 41
    p_eachdatefortytwo           DATE, -- 상연 날짜 42
    p_eachdatefortythree         DATE, -- 상연 날짜 43
    p_eachdatefortyfour          DATE, -- 상연 날짜 44
    p_eachdatefortyfive          DATE, -- 상연 날짜 45
    p_eachdatefortysix           DATE, -- 상연 날짜 46
    p_eachdatefortyseven         DATE, -- 상연 날짜 47
    p_eachdatefortyeight         DATE, -- 상연 날짜 48
    p_eachdatefortynine          DATE, -- 상연 날짜 49
    p_eachdatefifty              DATE, -- 상연 날짜 50
    p_eachdatefiftyone           DATE, -- 상연 날짜 51
    p_eachdatefiftytwo           DATE, -- 상연 날짜 52
    p_eachdatefiftythree         DATE, -- 상연 날짜 53
    p_eachdatefiftyfour          DATE, -- 상연 날짜 54
    p_eachdatefiftyfive          DATE, -- 상연 날짜 55
    p_eachdatefiftysix           DATE, -- 상연 날짜 56
    p_eachdatefiftyseven         DATE, -- 상연 날짜 57
    p_eachdatefiftyeight         DATE, -- 상연 날짜 58
    p_eachdatefiftynine          DATE, -- 상연 날짜 59
    p_eachdatesixty              DATE, -- 상연 날짜 60

    p_firststarttimeone          VARCHAR2(10) NOT NULL, -- 1회차 상연 시작 시각 1
    p_firststarttimetwo          VARCHAR2(10), -- 1회차 상연 시작 시각 2
    p_firststarttimethree        VARCHAR2(10), -- 1회차 상연 시작 시각 3
    p_firststarttimefour         VARCHAR2(10), -- 1회차 상연 시작 시각 4
    p_firststarttimefive         VARCHAR2(10), -- 1회차 상연 시작 시각 5
    p_firststarttimesix          VARCHAR2(10), -- 1회차 상연 시작 시각 6
    p_firststarttimeseven        VARCHAR2(10), -- 1회차 상연 시작 시각 7
    p_firststarttimeeight        VARCHAR2(10), -- 1회차 상연 시작 시각 8
    p_firststarttimenine         VARCHAR2(10), -- 1회차 상연 시작 시각 9
    p_firststarttimeten          VARCHAR2(10), -- 1회차 상연 시작 시각 10
    p_firststarttimeeleven       VARCHAR2(10), -- 1회차 상연 시작 시각 11
    p_firststarttimetwelve       VARCHAR2(10), -- 1회차 상연 시작 시각 12
    p_firststarttimethirteen     VARCHAR2(10), -- 1회차 상연 시작 시각 13
    p_firststarttimefourteen     VARCHAR2(10), -- 1회차 상연 시작 시각 14
    p_firststarttimefifteen      VARCHAR2(10), -- 1회차 상연 시작 시각 15
    p_firststarttimesixteen      VARCHAR2(10), -- 1회차 상연 시작 시각 16
    p_firststarttimeseventeen    VARCHAR2(10), -- 1회차 상연 시작 시각 17
    p_firststarttimeeighteen     VARCHAR2(10), -- 1회차 상연 시작 시각 18
    p_firststarttimenineteen     VARCHAR2(10), -- 1회차 상연 시작 시각 19
    p_firststarttimetwenty       VARCHAR2(10), -- 1회차 상연 시작 시각 20
    p_firststarttimetwentyone    VARCHAR2(10), -- 1회차 상연 시작 시각 21
    p_firststarttimetwentytwo    VARCHAR2(10), -- 1회차 상연 시작 시각 22
    p_firststarttimetwentythree  VARCHAR2(10), -- 1회차 상연 시작 시각 23
    p_firststarttimetwentyfour   VARCHAR2(10), -- 1회차 상연 시작 시각 24
    p_firststarttimetwentyfive   VARCHAR2(10), -- 1회차 상연 시작 시각 25
    p_firststarttimetwentysix    VARCHAR2(10), -- 1회차 상연 시작 시각 26
    p_firststarttimetwentyseven  VARCHAR2(10), -- 1회차 상연 시작 시각 27
    p_firststarttimetwentyeight  VARCHAR2(10), -- 1회차 상연 시작 시각 28
    p_firststarttimetwentynine   VARCHAR2(10), -- 1회차 상연 시작 시각 29
    p_firststarttimethirty       VARCHAR2(10), -- 1회차 상연 시작 시각 30
    p_firststarttimethirtyone    VARCHAR2(10), -- 1회차 상연 시작 시각 31
    p_firststarttimethirtytwo    VARCHAR2(10), -- 1회차 상연 시작 시각 32
    p_firststarttimethirtythree  VARCHAR2(10), -- 1회차 상연 시작 시각 33
    p_firststarttimethirtyfour   VARCHAR2(10), -- 1회차 상연 시작 시각 34
    p_firststarttimethirtyfive   VARCHAR2(10), -- 1회차 상연 시작 시각 35
    p_firststarttimethirtysix    VARCHAR2(10), -- 1회차 상연 시작 시각 36
    p_firststarttimethirtyseven  VARCHAR2(10), -- 1회차 상연 시작 시각 37
    p_firststarttimethirtyeight  VARCHAR2(10), -- 1회차 상연 시작 시각 38
    p_firststarttimethirtynine   VARCHAR2(10), -- 1회차 상연 시작 시각 39
    p_firststarttimeforty        VARCHAR2(10), -- 1회차 상연 시작 시각 40
    p_firststarttimefortyone     VARCHAR2(10), -- 1회차 상연 시작 시각 41
    p_firststarttimefortytwo     VARCHAR2(10), -- 1회차 상연 시작 시각 42
    p_firststarttimefortythree   VARCHAR2(10), -- 1회차 상연 시작 시각 43
    p_firststarttimefortyfour    VARCHAR2(10), -- 1회차 상연 시작 시각 44
    p_firststarttimefortyfive    VARCHAR2(10), -- 1회차 상연 시작 시각 45
    p_firststarttimefortysix     VARCHAR2(10), -- 1회차 상연 시작 시각 46
    p_firststarttimefortyseven   VARCHAR2(10), -- 1회차 상연 시작 시각 47
    p_firststarttimefortyeight   VARCHAR2(10), -- 1회차 상연 시작 시각 48
    p_firststarttimefortynine    VARCHAR2(10), -- 1회차 상연 시작 시각 49
    p_firststarttimefifty        VARCHAR2(10), -- 1회차 상연 시작 시각 50
    p_firststarttimefiftyone     VARCHAR2(10), -- 1회차 상연 시작 시각 51
    p_firststarttimefiftytwo     VARCHAR2(10), -- 1회차 상연 시작 시각 52
    p_firststarttimefiftythree   VARCHAR2(10), -- 1회차 상연 시작 시각 53
    p_firststarttimefiftyfour    VARCHAR2(10), -- 1회차 상연 시작 시각 54
    p_firststarttimefiftyfive    VARCHAR2(10), -- 1회차 상연 시작 시각 55
    p_firststarttimefiftysix     VARCHAR2(10), -- 1회차 상연 시작 시각 56
    p_firststarttimefiftyseven   VARCHAR2(10), -- 1회차 상연 시작 시각 57
    p_firststarttimefiftyeight   VARCHAR2(10), -- 1회차 상연 시작 시각 58
    p_firststarttimefiftynine    VARCHAR2(10), -- 1회차 상연 시작 시각 59
    p_firststarttimesixty        VARCHAR2(10), -- 1회차 상연 시작 시각 60
    p_secondstarttimeone         VARCHAR2(10), -- 2회차 상연 시작 시각 1
    p_secondstarttimetwo         VARCHAR2(10), -- 2회차 상연 시작 시각 2
    p_secondstarttimethree       VARCHAR2(10), -- 2회차 상연 시작 시각 3
    p_secondstarttimefour        VARCHAR2(10), -- 2회차 상연 시작 시각 4
    p_secondstarttimefive        VARCHAR2(10), -- 2회차 상연 시작 시각 5
    p_secondstarttimesix         VARCHAR2(10), -- 2회차 상연 시작 시각 6
    p_secondstarttimeseven       VARCHAR2(10), -- 2회차 상연 시작 시각 7
    p_secondstarttimeeight       VARCHAR2(10), -- 2회차 상연 시작 시각 8
    p_secondstarttimenine        VARCHAR2(10), -- 2회차 상연 시작 시각 9
    p_secondstarttimeten         VARCHAR2(10), -- 2회차 상연 시작 시각 10
    p_secondstarttimeeleven      VARCHAR2(10), -- 2회차 상연 시작 시각 11
    p_secondstarttimetwelve      VARCHAR2(10), -- 2회차 상연 시작 시각 12
    p_secondstarttimethirteen    VARCHAR2(10), -- 2회차 상연 시작 시각 13
    p_secondstarttimefourteen    VARCHAR2(10), -- 2회차 상연 시작 시각 14
    p_secondstarttimefifteen     VARCHAR2(10), -- 2회차 상연 시작 시각 15
    p_secondstarttimesixteen     VARCHAR2(10), -- 2회차 상연 시작 시각 16
    p_secondstarttimeseventeen   VARCHAR2(10), -- 2회차 상연 시작 시각 17
    p_secondstarttimeeighteen    VARCHAR2(10), -- 2회차 상연 시작 시각 18
    p_secondstarttimenineteen    VARCHAR2(10), -- 2회차 상연 시작 시각 19
    p_secondstarttimetwenty      VARCHAR2(10), -- 2회차 상연 시작 시각 20
    p_secondstarttimetwentyone   VARCHAR2(10), -- 2회차 상연 시작 시각 21
    p_secondstarttimetwentytwo   VARCHAR2(10), -- 2회차 상연 시작 시각 22
    p_secondstarttimetwentythree VARCHAR2(10), -- 2회차 상연 시작 시각 23
    p_secondstarttimetwentyfour  VARCHAR2(10), -- 2회차 상연 시작 시각 24
    p_secondstarttimetwentyfive  VARCHAR2(10), -- 2회차 상연 시작 시각 25
    p_secondstarttimetwentysix   VARCHAR2(10), -- 2회차 상연 시작 시각 26
    p_secondstarttimetwentyseven VARCHAR2(10), -- 2회차 상연 시작 시각 27
    p_secondstarttimetwentyeight VARCHAR2(10), -- 2회차 상연 시작 시각 28
    p_secondstarttimetwentynine  VARCHAR2(10), -- 2회차 상연 시작 시각 29
    p_secondstarttimethirty      VARCHAR2(10), -- 2회차 상연 시작 시각 30
    p_secondstarttimethirtyone   VARCHAR2(10), -- 2회차 상연 시작 시각 31
    p_secondstarttimethirtytwo   VARCHAR2(10), -- 2회차 상연 시작 시각 32
    p_secondstarttimethirtythree VARCHAR2(10), -- 2회차 상연 시작 시각 33
    p_secondstarttimethirtyfour  VARCHAR2(10), -- 2회차 상연 시작 시각 34
    p_secondstarttimethirtyfive  VARCHAR2(10), -- 2회차 상연 시작 시각 35
    p_secondstarttimethirtysix   VARCHAR2(10), -- 2회차 상연 시작 시각 36
    p_secondstarttimethirtyseven VARCHAR2(10), -- 2회차 상연 시작 시각 37
    p_secondstarttimethirtyeight VARCHAR2(10), -- 2회차 상연 시작 시각 38
    p_secondstarttimethirtynine  VARCHAR2(10), -- 2회차 상연 시작 시각 39
    p_secondstarttimeforty       VARCHAR2(10), -- 2회차 상연 시작 시각 40
    p_secondstarttimefortyone    VARCHAR2(10), -- 2회차 상연 시작 시각 41
    p_secondstarttimefortytwo    VARCHAR2(10), -- 2회차 상연 시작 시각 42
    p_secondstarttimefortythree  VARCHAR2(10), -- 2회차 상연 시작 시각 43
    p_secondstarttimefortyfour   VARCHAR2(10), -- 2회차 상연 시작 시각 44
    p_secondstarttimefortyfive   VARCHAR2(10), -- 2회차 상연 시작 시각 45
    p_secondstarttimefortysix    VARCHAR2(10), -- 2회차 상연 시작 시각 46
    p_secondstarttimefortyseven  VARCHAR2(10), -- 2회차 상연 시작 시각 47
    p_secondstarttimefortyeight  VARCHAR2(10), -- 2회차 상연 시작 시각 48
    p_secondstarttimefortynine   VARCHAR2(10), -- 2회차 상연 시작 시각 49
    p_secondstarttimefifty       VARCHAR2(10), -- 2회차 상연 시작 시각 50
    p_secondstarttimefiftyone    VARCHAR2(10), -- 2회차 상연 시작 시각 51
    p_secondstarttimefiftytwo    VARCHAR2(10), -- 2회차 상연 시작 시각 52
    p_secondstarttimefiftythree  VARCHAR2(10), -- 2회차 상연 시작 시각 53
    p_secondstarttimefiftyfour   VARCHAR2(10), -- 2회차 상연 시작 시각 54
    p_secondstarttimefiftyfive   VARCHAR2(10), -- 2회차 상연 시작 시각 55
    p_secondstarttimefiftysix    VARCHAR2(10), -- 2회차 상연 시작 시각 56
    p_secondstarttimefiftyseven  VARCHAR2(10), -- 2회차 상연 시작 시각 57
    p_secondstarttimefiftyeight  VARCHAR2(10), -- 2회차 상연 시작 시각 58
    p_secondstarttimefiftynine   VARCHAR2(10), -- 2회차 상연 시작 시각 59
    p_secondstarttimesixty       VARCHAR2(10), -- 2회차 상연 시작 시각 60
    p_seatcolumn                 NUMBER(2), --좌석 세로열
    p_seatrow                    NUMBER(2), --좌석 가로행
    p_agree                      NUMBER(1) NOT NULL, --약관 동의 여부
    t_number                     NUMBER(38) NOT NULL, --극단 회원 번호
    PRIMARY KEY ( p_number ),
    FOREIGN KEY ( t_number ) REFERENCES tmember ( t_number )
);

--연극 시퀀스 생성 
CREATE SEQUENCE play_seq START WITH 1 INCREMENT BY 1;


--예매 테이블 생성
CREATE TABLE RESERVATION (
R_NUMBER NUMBER(38) NOT NULL PRIMARY KEY, -- 예매번호
R_DATE DATE default sysdate NOT NULL, -- 예매일
R_PAYSTATE VARCHAR2(10) NOT NULL, -- 예매진행중 여부
R_FEE NUMBER(3) NOT NULL, -- 예매 수수료
R_CANCELSTATE VARCHAR2(10) NOT NULL, -- 예매 취소 여부
R_CANCELDATE DATE, -- 예매 취소일
R_TICKETFIRST VARCHAR2(10) NOT NULL, -- 티켓번호1
R_TICKETSECOND VARCHAR2(10), -- 티켓번호2
R_TICKETTHIRD VARCHAR2(10), -- 티켓번호3
R_TICKETFORTH VARCHAR2(10), -- 티켓번호4
R_TOTALPAYMENT NUMBER(38) NOT NULL, -- 결제 총액
U_NUMBER NUMBER(38) NOT NULL, -- 일반 회원 번호
P_NUMBER NUMBER(38) NOT NULL, -- 연극번호

FOREIGN KEY(U_NUMBER) REFERENCES UMEMBER(U_NUMBER), -- 일반 회원 번호 외래키 설정
FOREIGN KEY(P_NUMBER) REFERENCES PLAY(P_NUMBER) -- 연극 번호 외래키 설정
);
-- 예매 시퀀스 생성
CREATE SEQUENCE RESERVATION_SEQ
START WITH 1 INCREMENT BY 1;

--정산 테이블 생성
CREATE TABLE PAYMENT (
PAY_NUMBER NUMBER(38) NOT NULL PRIMARY KEY, -- 정산 번호
PAY_CALCULATE DATE DEFAULT sysDate NOT NULL, -- 정산 일자
PAY_PAYDATE DATE NOT NULL, -- 지급일
PAY_PAYMENT NUMBER(20) NOT NULL, -- 금액
P_NUMBER NUMBER(38) NOT NULL, -- 연극 번호
R_NUMBER NUMBER(38) NOT NULL, -- 예매 번호
T_NUMBER NUMBER(38) NOT NULL, -- 극단 회원 번호

FOREIGN KEY(P_NUMBER) REFERENCES PLAY(P_NUMBER), -- 연극 번호 외래키 설정
FOREIGN KEY(R_NUMBER) REFERENCES RESERVATION(R_NUMBER), -- 예매 번호 외래키 설정
FOREIGN KEY(T_NUMBER) REFERENCES TMEMBER(T_NUMBER) -- 극단 회원 번호 외래키 설정
);

-- 정산 시퀀스 생성
CREATE SEQUENCE PAY_SEQ
START WITH 1 INCREMENT BY 1;

--일반회원 FAQ 테이블 생성
CREATE TABLE UFAQ(
UF_number number(38) not null, --게시글 번호/PK
UF_title varchar2(100) not null, -- 글 제목
UF_content varchar2(4000) not null, -- 글 내용
UF_date Date DEFAULT sysdate  not null, -- 등록일
primary key(UF_number)
);
--일반회원 FAQ 시퀀스 생성
CREATE SEQUENCE ufaq_seq START WITH 1 INCREMENT BY 1;


--극단회원 FAQ 테이블 생성
CREATE TABLE TFAQ(
TF_number number(38) not null, --게시글 번호/PK
TF_title varchar2(100) not null, -- 글 제목
TF_content varchar2(4000) not null, -- 글 내용
TF_date Date DEFAULT sysdate not null, -- 등록일
primary key(TF_number)
);
--극단회원 FAQ 시퀀스 생성
CREATE SEQUENCE tfaq_seq START WITH 1 INCREMENT BY 1;

--공지사항 테이블 생성
CREATE TABLE NOTICE(
N_number number(38) not null, --게시글 번호/PK
N_title varchar2(100) not null, -- 글 제목
N_content varchar2(4000) not null, -- 글 내용
N_date Date DEFAULT sysdate not null, -- 등록일
primary key(N_number)
);
--공지사항 시퀀스 생성
CREATE SEQUENCE notice_seq START WITH 1 INCREMENT BY 1;