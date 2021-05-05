drop table product;
drop table member;
drop table board;
drop table order_table;
drop table chat;
drop table receive;
drop table chat_content;
drop table animal;
drop table file_TABLE;
drop table hospital;
DROP TABLE BOARD_REPLY;

DROP SEQUENCE PRODUCT_NUM_SEQ;
DROP SEQUENCE BOARD_NO_SEQ;
DROP SEQUENCE BOARD_FREE_NO_SEQ;
DROP SEQUENCE BOARD_NOTICE_SEQ;
DROP SEQUENCE BOARD_QNA_SEQ;
DROP SEQUENCE BOARD_DEC_SEQ;
DROP SEQUENCE BOARD_GROUPNO_SEQ;
DROP SEQUENCE BOARD_QNA_GROUPNO_SEQ;
DROP SEQUENCE ORDER_NUM_SEQ;
DROP SEQUENCE ORDER_GROUP_SEQ;
DROP SEQUENCE CHAT_NUM_SEQ;
DROP SEQUENCE ANIMAL_NO_SEQ;
DROP SEQUENCE FILE_NUM_SEQ;
DROP SEQUENCE HOSPITAL_NUM_SEQ;
DROP SEQUENCE REPLY_NO_SEQ;
DROP SEQUENCE REPLY_GROUPNO_SEQ;


CREATE SEQUENCE PRODUCT_NUM_SEQ;
CREATE SEQUENCE BOARD_NO_SEQ;
CREATE SEQUENCE BOARD_FREE_NO_SEQ;
CREATE SEQUENCE BOARD_NOTICE_SEQ;
CREATE SEQUENCE BOARD_QNA_SEQ;
CREATE SEQUENCE BOARD_DEC_SEQ;
CREATE SEQUENCE BOARD_GROUPNO_SEQ;
CREATE SEQUENCE BOARD_QNA_GROUPNO_SEQ;
CREATE SEQUENCE ORDER_NUM_SEQ;
CREATE SEQUENCE ORDER_GROUP_SEQ;
CREATE SEQUENCE CHAT_NUM_SEQ;
CREATE SEQUENCE ANIMAL_NO_SEQ;
CREATE SEQUENCE FILE_NUM_SEQ;
CREATE SEQUENCE HOSPITAL_NUM_SEQ;
CREATE SEQUENCE REPLY_NO_SEQ;
CREATE SEQUENCE REPLY_GROUPNO_SEQ;

CREATE TABLE PRODUCT(
	PROD_NUM NUMBER PRIMARY KEY,
	PROD_NAME VARCHAR2(1000) NOT NULL,
	PROD_EXPLAIN VARCHAR2(2000) NOT NULL,
	PROD_SALE NUMBER,
	PROD_PRICE NUMBER NOT NULL,
	PROD_RECOMM NUMBER NOT NULL,
	PROD_STOCK NUMBER NOT NULL,
	PROD_CATEGORY VARCHAR2(1000) NOT NULL,
	PROD_IN NUMBER,
	PROD_OUT NUMBER,
	PROD_INDATE DATE,
	PROD_OUTDATE DATE,
	PROD_MFR VARCHAR2(100),
	PROD_CLIENT VARCHAR2(2000)
);
select * from product;
CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR2(500) PRIMARY KEY,
	MEMBER_PASSWORD VARCHAR2(500) NOT NULL,
	MEMBER_NAME VARCHAR2(1000) NOT NULL,
	MEMBER_NICNAME VARCHAR2(1000) NOT NULL,
	MEMBER_EMAIL VARCHAR2(1000) NOT NULL,
	MEMBER_PHONE VARCHAR2(100) NOT NULL,
	MEMBER_ADDR VARCHAR2(2000) NOT NULL,
	MEMBER_GRADE VARCHAR2(500) NOT NULL,
	MEMBER_JOIN VARCHAR2(2) NOT NULL,
	MEMBER_ANIMAL VARCHAR2(2) NOT NULL,
	MEMBER_POINT NUMBER,
	MEMBER_DR_INFO VARCHAR2(1000),
	MEMBER_NOTIFY VARCHAR2(2) NOT NULL,
	CONSTRAINT MEMBER_MEMBER_JOIN_CHK CHECK(MEMBER_JOIN IN ('Y', 'N')),
	CONSTRAINT MEMBER_MEMBER_ANIMAL_CHK CHECK(MEMBER_ANIMAL IN ('Y', 'N')),
	CONSTRAINT MEMBER_MEMBER_NOTIFY_CHK CHECK(MEMBER_NOTIFY IN ('Y', 'N'))
);

select * from board order by board_readcount desc;
		
		SELECT
		A.board_no,A.board_free_no,A.board_notice_no,A.board_qna_no,A.board_dec_no,
		A.board_title,A.board_content,A.board_regdate,A.board_readcount,
		A.board_groupno,A.board_groupseq,A.board_titletab,A.member_id
		FROM (
		SELECT
		b.board_no,b.board_free_no,b.board_notice_no,b.board_qna_no,b.board_dec_no,
		b.board_title,b.board_content,b.board_regdate,b.board_readcount,
		b.board_groupno,b.board_groupseq,b.board_titletab,m.member_nicname as
		member_id
		FROM BOARD b, MEMBER m
		WHERE m.member_id = b.member_id and b.board_category = 'F'
		ORDER BY BOARD_readcount DESC
		) A
		WHERE ROWNUM <5
		
insert into member values('admin','admin','관리자','관리자','admin@admin.com','010-0000-0000','관리시 관리동','관리자','Y','N',0,NULL,'Y');
update member set member_animal = 'N' where member_id = '1';
select * from member;
select * from animal;
delete from animal where member_id='111';

CREATE TABLE BOARD(
	BOARD_NO NUMBER PRIMARY KEY,
	BOARD_FREE_NO NUMBER,
	BOARD_NOTICE_NO NUMBER,
	BOARD_QNA_NO NUMBER,
	BOARD_DEC_NO NUMBER,
	BOARD_TITLE VARCHAR2(1000) NOT NULL,
	BOARD_CONTENT VARCHAR2(2000) NOT NULL,
	BOARD_REGDATE DATE NOT NULL,
	BOARD_READCOUNT NUMBER NOT NULL,
	BOARD_GROUPNO NUMBER NOT NULL,
	BOARD_GROUPSEQ NUMBER NOT NULL,
	BOARD_TITLETAB NUMBER NOT NULL,
	BOARD_DELFLAG VARCHAR2(2) NOT NULL,
	BOARD_CATEGORY VARCHAR2(100) NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
 	CONSTRAINT BOARD_BOARD_DELFLAG_CHK CHECK (BOARD_DELFLAG IN ('Y','N')),
	CONSTRAINT BOARD_BOARD_CATEGORY_CHK CHECK (BOARD_CATEGORY IN ('F','N','Q','D')),
	CONSTRAINT BOARD_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID)
	REFERENCES MEMBER (MEMBER_ID)
);
select * from BOARD;

CREATE TABLE ORDER_TABLE(
	ORDER_NUM NUMBER PRIMARY KEY,
	ORDER_DATE DATE NOT NULL,
	ORDER_QUANTITY NUMBER NOT NULL,
	ORDER_PRICE NUMBER NOT NULL,
	ORDER_STEP VARCHAR2(100) NOT NULL,
	ORDER_PAY VARCHAR2(2) NOT NULL,
	ORDER_GROUP NUMBER NOT NULL,
	PROD_NUM NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	CONSTRAINT ORDER_TABLE_ORDER_STEP_CHK CHECK (ORDER_STEP IN ('미결제','결제완료','배송준비중','배송중','배송완료','취소요청')),
	CONSTRAINT ORDER_TABLE_ORDER_PAY_CHK CHECK (ORDER_PAY IN ('Y','N')),
	CONSTRAINT ORDER_TABLE_PROD_NUM_FK FOREIGN KEY (PROD_NUM) REFERENCES PRODUCT (PROD_NUM),
	CONSTRAINT ORDER_TABLE_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID)
);
SELECT COLUMN_NAME, DATA_TYPE FROM all_tab_columns where table_name='ORDER_TABLE'; 

select * from ORDER_TABLE;
select * from PRODUCT;

INSERT INTO ORDER_TABLE
		VALUES(ORDER_NUM_SEQ.nextval, sysdate, '2', '20000', 
		'미결제', 'N','30' ,12, 'test');
SELECT COLUMN_NAME, DATA_TYPE FROM all_tab_columns where table_name='ORDER_TABLE';
UPDATE ORDER_TABLE SET ORDER_STEP = ''
WHERE ORDER_GROUP = '1';
select * from order_table;
select * from order_table where order_group='40' and order_step = '미결제';

CREATE TABLE CHAT (
	CH_NUM NUMBER NOT NULL,
	DOCTOR_ID VARCHAR2(500) NOT NULL,
	CH_DATE DATE NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	CONSTRAINT CHAT_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
	CONSTRAINT CH_NUM_UK UNIQUE (CH_NUM),
	CONSTRAINT CHAT_PK PRIMARY KEY (DOCTOR_ID,MEMBER_ID)
);
select * from order_table
select * from chat;
CREATE TABLE RECEIVE(
	ORDER_NUM NUMBER PRIMARY KEY,
	RECEIVE_NAME VARCHAR2(20) NOT NULL,
	RECEIVE_ADDR VARCHAR2(20) NOT NULL,
	RECEIVE_PHONE VARCHAR2(20) NOT NULL,
	RECEIVE_MEMO VARCHAR2(300),
	CONSTRAINT RECEIVE_ORDER_NUM_FK FOREIGN KEY (ORDER_NUM) REFERENCES ORDER_TABLE (ORDER_NUM)
);

CREATE TABLE CHAT_CONTENT(
	CH_NUM NUMBER NOT NULL,
	MEMBER_NICNAME VARCHAR2(20) NOT NULL,
	CH_CONTENT VARCHAR2(4000) NOT NULL,
	CH_CONTENT_DATE DATE NOT NULL,
	CONSTRAINT CHAT_CONTENT_CH_NUM_FK FOREIGN KEY (CH_NUM) REFERENCES CHAT (CH_NUM)
);
select * from chat_content;
CREATE TABLE ANIMAL(
	ANIMAL_NO NUMBER PRIMARY KEY,
	ANIMAL_NAME VARCHAR2(100) NOT NULL,
	ANIMAL_GEN  VARCHAR2(2) NOT NULL,
	ANIMAL_TYPE VARCHAR2(500),
	ANIMAL_AGE NUMBER,
	ANIMAL_WEIGHT NUMBER,
	ANIMAL_UNQ VARCHAR2(2000),
	MEMBER_ID VARCHAR2(500) NOT NULL,
	CONSTRAINT ANIMAL_ANIMAL_GEN_CHK CHECK (ANIMAL_GEN IN ('M','F')),
	CONSTRAINT ANIMAL_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID)
);


CREATE TABLE FILE_TABLE(
	FILE_NUM NUMBER PRIMARY KEY,
	FILE_PATH VARCHAR2(500) NOT NULL,
	FILE_ORI_NAME VARCHAR2(500) NOT NULL,
	FILE_NEW_NAME VARCHAR2(500) NOT NULL,
	FILE_TYPE VARCHAR2(500) NOT NULL,
	FILE_DATE DATE NOT NULL,
	FILE_SIZE VARCHAR2(500) NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	BOARD_NO NUMBER ,
	CH_NUM NUMBER,
	ANIMAL_NO NUMBER ,
	CONSTRAINT FILE_TALBE_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
	CONSTRAINT FILE_TABLE_BOARD_NO_FK FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO),
	CONSTRAINT FILE_TABLE_CH_NUM_FK FOREIGN KEY (CH_NUM) REFERENCES CHAT (CH_NUM),
	CONSTRAINT FILE_TABLE_ANIMAL_NO_KF FOREIGN KEY (ANIMAL_NO) REFERENCES ANIMAL (ANIMAL_NO)
);

select * from file_table; where member_id = 'test' and ch_num is null;
CREATE TABLE BOARD_REPLY (
	REPLY_NO NUMBER PRIMARY KEY,
	REPLY_GROUPNO NUMBER NOT NULL,
	REPLY_GROUPSEQ NUMBER NOT NULL,
	REPLY_TAB NUMBER NOT NULL,
	REPLY_DELFLAG VARCHAR2(2) NOT NULL,
	REPLY_CONTENT VARCHAR2(2000) NOT NULL,
	REPLY_REGDATE DATE NOT NULL,
	BOARD_NO NUMBER NOT NULL,
	REPLY_NICNAME VARCHAR2(1000) NOT NULL,
	CONSTRAINT BOARD_REPLY_REPLY_DELFLAG_CHK CHECK (REPLY_DELFLAG IN ('Y', 'N')),
	CONSTRAINT BOARD_REPLY_BOARD_NO_FK FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO)
);

CREATE TABLE HOSPITAL(
	HOSPITAL_NUM NUMBER PRIMARY KEY,
	HOSPITAL_NAME VARCHAR2(500) NOT NULL,
	HOSPITAL_ADDR VARCHAR2(500) NOT NULL,
	HOSPITAL_PHONE VARCHAR2(100)
);

alter table file_table add prod_num number;
alter table file_table add constraint FILE_TABLE_PROD_NUM FOREIGN KEY (PROD_NUM) REFERENCES PRODUCT(PROD_NUM); 

SELECT * FROM FILE_TABLE;

SELECT * FROM MEMBER;


delete from file_table where prod_num = '12';
update order_table set order_step = '결제완료' where member_id = 'test';
select * from member m , file_table f
where m.member_id = f.member_id
and board_no = '64';
select * from member;  dhksdn486  
select * from board;
select * from file_table
SELECT * FROM ANIMAL;
delete from member where member_grade = '전문의';
select * from member where member_grade = '전문의';
select * from chat;
select * from CHAT_CONTENT;
update member set member_grade = '관리자' where member_id = 'admin';
select * from product;
select * from order_table;
update order_table set order_step = '결제완료' where order_num = '24';


select * from product;
select count(*) from hospital order by hospital_num desc;
select * from member;  
select * from file_table;
select * from board order by board_no desc;


SELECT X.rnum, X.board_no,X.board_free_no,X.board_notice_no,X.board_qna_no,X.board_dec_no,
		X.board_title,X.board_content,X.board_regdate,X.board_readcount,
		X.board_groupno,X.board_groupseq,X.board_titletab,X.member_id
		FROM (
		SELECT ROWNUM AS rnum, A.board_no,A.board_free_no,A.board_notice_no,A.board_qna_no,A.board_dec_no,
		A.board_title,A.board_content,A.board_regdate,A.board_readcount,
		A.board_groupno,A.board_groupseq,A.board_titletab,A.member_id
		FROM (
		SELECT b.board_no,b.board_free_no,b.board_notice_no,b.board_qna_no,b.board_dec_no,
		b.board_title,b.board_content,b.board_regdate,b.board_readcount,
		b.board_groupno,b.board_groupseq,b.board_titletab,m.member_nicname as
		member_id
		FROM BOARD b, MEMBER m
		WHERE BOARD_CATEGORY = 'F'
		and m.member_id = b.member_id
		ORDER BY BOARD_REGDATE DESC
		) A
		WHERE ROWNUM <= 15
		) X
		WHERE X.rnum >= 1

		select
		b.rnum,b.hospital_num,b.hospital_name,b.hospital_addr,b.hospital_phone
		from
		(select rownum as rnum ,
		a.hospital_num,a.hospital_name,a.hospital_addr,a.hospital_phone
		from
		(select
		hospital_num,hospital_name,hospital_addr,hospital_phone
		from
		hospital
		order by hospital_num desc)a
		where rownum <=
		20)b
		where b.rnum >=
		11 
		SELECT DISTINCT * FROM BOARD WHERE BOARD_FREE_NO > 0 AND MEMBER_ID LIKE '%ss%'
select * from board where board_free_no > 0 and member_id like '%ss%' order by board_no;
select * from board where board_free_no > 0 and member_id like '%ss%' order by board_no;
select * from board where board_free_no > 0 and member_id like '%'||#member_id#||'%' order by board_no;
delete from member where member_id='1702707258'
SELECT FILE_NUM, FILE_PATH, FILE_ORI_NAME, FILE_NEW_NAME,
		FILE_TYPE, FILE_DATE, FILE_SIZE, MEMBER_ID, BOARD_NO, CH_NUM,
		ANIMAL_NO
		FROM FILE_TABLE
		WHERE BOARD_NO = '73'
SELECT  board_no
		FROM board 
		WHERE BOARD_FREE_NO > 0 AND MEMBER_ID LIKE '%ss%'
		order by board_no desc

--실종신고 위치 정보 받아오기
DROP SEQUENCE LOST_NO_SEQ;
DROP TABLE LOST_ANIMAL;
CREATE SEQUENCE LOST_NO_SEQ;
CREATE TABLE LOST_ANIMAL(
	LOST_NO NUMBER PRIMARY KEY,
	LOST_LAT NUMBER NOT NULL,
	LOST_LNG NUMBER NOT NULL,
	BOARD_NO NUMBER NOT NULL,
	CONSTRAINT LOST_ANIMAL_BOARD_NO_FK FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO)
);
select * from lost_animal;
SELECT o.ORDER_NUM, o.ORDER_DATE, o.ORDER_QUANTITY, o.ORDER_PRICE, o.ORDER_STEP, o.ORDER_PAY, o.order_group, p.PROD_NAME, o.MEMBER_ID
		FROM ORDER_TABLE o, product p
		WHERE o.MEMBER_ID = 'test'
		and o.prod_num = p.prod_num
		AND o.ORDER_STEP != '미결제'
		ORDER BY ORDER_NUM DESC
