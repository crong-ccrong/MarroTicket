--삭제는 다음 순서에 따르면 됨
drop table payment purge;
drop table reservation purge;
drop table play purge;
drop table umember purge;
drop table tmember purge;

--순서에 상관 없는 테이블들
drop table notice purge;
drop table tfaq purge;
drop table ufaq purge;

--시퀀스 삭제
drop sequence notice_seq;
drop sequence tfaq_seq;
drop sequence ufaq_seq;
drop sequence payment_seq;
drop sequence play_seq;
drop sequence reservation_seq;
drop sequence tmember_seq;
drop sequence umember_seq;

--일반 회원 테이블
CREATE TABLE umember (
    u_number      NUMBER(38) NOT NULL PRIMARY KEY,--일반 회원 번호
    u_id          VARCHAR2(20) UNIQUE NOT NULL,--아이디
    u_password    VARCHAR2(20) NOT NULL,--비밀번호
    u_name        VARCHAR2(20) NOT NULL,--이름
    u_phonenumber VARCHAR2(11) NOT NULL,-- 일반 사용자 휴대전화 번호
    u_birthday    VARCHAR2(8) NOT NULL,--생년월일
    u_gender      VARCHAR2(10) NOT NULL,--성별
    u_email       VARCHAR2(50) NOT NULL,--이메일
    u_joindate    DATE DEFAULT sysdate NOT NULL,--가입일
    u_unjoin      VARCHAR2(10),--탈퇴여부
    u_unjoindate  DATE DEFAULT sysdate,--탈퇴일
    u_genre       NUMBER(1) NOT NULL,--관심 장르
    u_agree       NUMBER(1) NOT NULL--약관 동의여부
);

--일반 회원 시퀀스 생성 
CREATE SEQUENCE umember_seq START WITH 1 INCREMENT BY 1;

--극단 회원 테이블
CREATE TABLE tmember (
    t_number                     NUMBER(38) NOT NULL PRIMARY KEY,--극단 회원 번호
    t_id                         VARCHAR2(20) UNIQUE NOT NULL,--아이디
    t_password                   VARCHAR2(20) NOT NULL,--비밀번단호
    t_name                       VARCHAR2(50) NOT NULL,--극단명
    t_address                    VARCHAR2(100) NOT NULL,--극단주소
    t_ownername                  VARCHAR2(20) NOT NULL,--대표자명
    t_ownerphonenumber           VARCHAR2(11) NOT NULL,--대표자 휴대전화번호
    t_owneremail                 VARCHAR2(50) NOT NULL,--대표자 이메일
    t_businessregistration       NUMBER(1) NOT NULL,--사업자 등록 구분 (개인/기업)
    t_businessregistrationnumber VARCHAR2(10) NOT NULL,--사업자 등록번호
    t_establishmentdate          DATE DEFAULT sysdate NOT NULL,--설립일
    t_bank                       VARCHAR2(50) NOT NULL,--거래 은행
    t_banknumber                 VARCHAR2(50) NOT NULL,--계좌번호
    t_bankowner                  VARCHAR2(50) NOT NULL,--예금주
    t_businessregistrationimage  VARCHAR2(100) NOT NULL,--사업자등록증 사본
    t_fileurl                    VARCHAR2(100) NOT NULL, --파일 경로 
    t_filename                   VARCHAR2(100) NOT NULL, --파일 이름 
    t_auth                       VARCHAR2(10) NOT NULL, --극단 가입 승인 여부
    t_agree                      NUMBER(1) NOT NULL--약관 동의여부
);

-- 극단 회원 시퀀스 생성 
CREATE SEQUENCE tmember_seq START WITH 1 INCREMENT BY 1;

--PLAY(연극) 테이블
CREATE TABLE play (
    p_number                 NUMBER(38) NOT NULL, --연극 번호
    p_name                   VARCHAR2(50) NOT NULL, --연극명
    p_startdate              DATE NOT NULL, --연극 시작일
    p_closedate              DATE NOT NULL, --연극 종료일
    p_runningtime            VARCHAR2(3) NOT NULL, --연극 소요시간(러닝타임)
    p_theatername            VARCHAR2(20) NOT NULL, --극장 이름
    p_theateraddress         VARCHAR2(100) NOT NULL, --극장 주소
    p_theatermapurl     VARCHAR2(100) NOT NULL,--극장 약도 url
    p_agency                 VARCHAR2(20) NOT NULL, --기획사 정보
    p_ratings                VARCHAR2(1) NOT NULL, --관람 등급
    p_casting                VARCHAR2(2000) NOT NULL, --캐스팅 데이터
    p_ticketopendate         DATE NOT NULL, --예매 오픈 희망일
    p_plot                   VARCHAR2(4000) NOT NULL, --공연 줄거리
    p_seatnumber             NUMBER(20) NOT NULL, --좌석 개수
    p_ticketprice            NUMBER(7) NOT NULL, --티켓 가격
    p_genre                  VARCHAR2(1) NOT NULL, --장르 정보
    p_posterurl         VARCHAR2(100) NOT NULL, --연극 포스터 url
    p_amendmentapproved      VARCHAR2(1), --공연 수정 승인 여부
    p_registrationapproval   VARCHAR2(1), --공연 등록 승인 여부
    p_firststarttime         VARCHAR2(10) NOT NULL, -- 1회차 상연 시작 시각 
    p_secondstarttime        VARCHAR2(10), -- 2회차 상연 시작 시각 
    p_agree                  VARCHAR2(1) NOT NULL, --약관 동의 여부
    t_number                 NUMBER(38) NOT NULL, --극단 회원 번호
    PRIMARY KEY ( p_number ),
    FOREIGN KEY ( t_number )
        REFERENCES tmember ( t_number )
);

--연극 시퀀스 생성 
CREATE SEQUENCE play_seq START WITH 1 INCREMENT BY 1;

--예매 테이블 생성
CREATE TABLE reservation (
    r_number       NUMBER(38) NOT NULL PRIMARY KEY, -- 예매번호
    r_date         DATE NOT NULL, -- 예매일
    r_paystate     VARCHAR2(10) NOT NULL, -- 예매진행중 여부
    r_fee          NUMBER(3) NOT NULL, -- 예매 수수료
    r_cancelstate  VARCHAR2(10) NOT NULL, -- 예매 취소 여부
    r_canceldate   DATE, -- 예매 취소일
    r_ticketfirst  VARCHAR2(10) NOT NULL, -- 티켓번호1
    r_ticketsecond VARCHAR2(10), -- 티켓번호2
    r_ticketthird  VARCHAR2(10), -- 티켓번호3
    r_ticketforth  VARCHAR2(10), -- 티켓번호4
    r_totalpayment NUMBER(38) NOT NULL, -- 결제 총액
    u_number       NUMBER(38) NOT NULL, -- 일반 회원 번호
    p_number       NUMBER(38) NOT NULL, -- 연극번호

    FOREIGN KEY ( u_number )
        REFERENCES umember ( u_number ), -- 일반 회원 번호 외래키 설정
    FOREIGN KEY ( p_number )
        REFERENCES play ( p_number ) -- 연극 번호 외래키 설정
);
-- 예매 시퀀스 생성
CREATE SEQUENCE reservation_seq START WITH 1 INCREMENT BY 1;

--정산 테이블 생성
CREATE TABLE payment (
    pay_number        NUMBER(38) NOT NULL PRIMARY KEY, -- 정산 번호
    pay_calculatedate DATE NOT NULL, -- 정산 일자
    pay_paydate       DATE NOT NULL, -- 지급일
    pay_payment       NUMBER(20) NOT NULL, -- 금액
    p_number          NUMBER(38) NOT NULL, -- 연극 번호
    r_number          NUMBER(38) NOT NULL, -- 예매 번호
    t_number          NUMBER(38) NOT NULL, -- 극단 회원 번호

    FOREIGN KEY ( p_number )
        REFERENCES play ( p_number ), -- 연극 번호 외래키 설정
    FOREIGN KEY ( r_number )
        REFERENCES reservation ( r_number ), -- 예매 번호 외래키 설정
    FOREIGN KEY ( t_number )
        REFERENCES tmember ( t_number ) -- 극단 회원 번호 외래키 설정
);

-- 정산 시퀀스 생성
CREATE SEQUENCE payment_seq START WITH 1 INCREMENT BY 1;

--일반회원 FAQ 테이블 생성
CREATE TABLE ufaq (
    uf_number  NUMBER(38) NOT NULL, --게시글 번호/PK
    uf_title   VARCHAR2(100) NOT NULL, -- 글 제목
    uf_content VARCHAR2(4000) NOT NULL, -- 글 내용
    uf_date    DATE DEFAULT sysdate, -- 등록일
    PRIMARY KEY ( uf_number )
);
--일반회원 FAQ 시퀀스 생성
CREATE SEQUENCE ufaq_seq START WITH 1 INCREMENT BY 1;


--극단회원 FAQ 테이블 생성
CREATE TABLE tfaq (
    tf_number  NUMBER(38) NOT NULL, --게시글 번호/PK
    tf_title   VARCHAR2(100) NOT NULL, -- 글 제목
    tf_content VARCHAR2(4000) NOT NULL, -- 글 내용
    tf_date    DATE DEFAULT sysdate, -- 등록일
    PRIMARY KEY ( tf_number )
);
--극단회원 FAQ 시퀀스 생성
CREATE SEQUENCE tfaq_seq START WITH 1 INCREMENT BY 1;

--공지사항 테이블 생성
CREATE TABLE notice (
    n_number  NUMBER(38) NOT NULL, --게시글 번호/PK
    n_title   VARCHAR2(100) NOT NULL, -- 글 제목
    n_content VARCHAR2(4000) NOT NULL, -- 글 내용
    n_date    DATE DEFAULT sysdate, -- 등록일
    PRIMARY KEY ( n_number )
);
--공지사항 시퀀스 생성
CREATE SEQUENCE notice_seq START WITH 1 INCREMENT BY 1;