drop table product;
drop table member;
drop table board;
drop table order_table;
drop table chat;
drop table receive;
drop table chat_content;
drop table animal;
drop table file_TABLE;

DROP SEQUENCE PRODUCT_NUM_SEQ;
DROP SEQUENCE BOARD_NO_SEQ;
DROP SEQUENCE BOARD_FREE_NO_SEQ;
DROP SEQUENCE BOARD_NOTICE_SEQ;
DROP SEQUENCE BOARD_QNA_SEQ;
DROP SEQUENCE BOARD_DEC_SEQ;
DROP SEQUENCE BOARD_GROUPNO_SEQ;
DROP SEQUENCE BOARD_QNA_GROUPNO_SEQ;
DROP SEQUENCE ORDER_NUM_SEQ;
DROP SEQUENCE CHAT_NUM_SEQ;
DROP SEQUENCE ANIMAL_NO_SEQ;
DROP SEQUENCE FILE_NUM_SEQ;


CREATE SEQUENCE PRODUCT_NUM_SEQ;
CREATE SEQUENCE BOARD_NO_SEQ;
CREATE SEQUENCE BOARD_FREE_NO_SEQ;
CREATE SEQUENCE BOARD_NOTICE_SEQ;
CREATE SEQUENCE BOARD_QNA_SEQ;
CREATE SEQUENCE BOARD_DEC_SEQ;
CREATE SEQUENCE BOARD_GROUPNO_SEQ;
CREATE SEQUENCE BOARD_QNA_GROUPNO_SEQ;
CREATE SEQUENCE ORDER_NUM_SEQ;
CREATE SEQUENCE CHAT_NUM_SEQ;
CREATE SEQUENCE ANIMAL_NO_SEQ;
CREATE SEQUENCE FILE_NUM_SEQ;


CREATE TABLE PRODUCT(
	PROD_NUM NUMBER PRIMARY KEY,
	PROD_NAME VARCHAR2(1000) NOT NULL,
	PROD_EXPLAIN VARCHAR2(2000) NOT NULL,
	PROD_SALE NUMBER,
	PROD_PRICE NUMBER NOT NULL,
	PROD_RECOMM NUMBER NOT NULL,
	PROD_STOCK NUMBER NOT NULL,
	PROD_CATEGORY VARCHAR2(1000) NOT NULL,
	PROD_IN NUMBER NOT NULL,
	PROD_OUT NUMBER NOT NULL,
	PROD_INDATE DATE NOT NULL,
	PROD_OUTDATE DATE NOT NULL,
	PROD_MFR VARCHAR2(100),
	PROD_CLIENT VARCHAR2(2000)
);

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


CREATE TABLE ORDER_TABLE(
	ORDER_NUM NUMBER PRIMARY KEY,
	ORDER_DATE DATE NOT NULL,
	ORDER_QUANTITY NUMBER NOT NULL,
	ORDER_PRICE NUMBER NOT NULL,
	ORDER_STEP VARCHAR2(100) NOT NULL,
	ORDER_PAY VARCHAR2(2) NOT NULL,
	PROD_NUM NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	CONSTRAINT ORDER_TABLE_ORDER_STEP_CHK CHECK (ORDER_STEP IN ('결제완료','배송준비중','배송중','배송완료')),
	CONSTRAINT ORDER_TABLE_ORDER_PAY_CHK CHECK (ORDER_PAY IN ('Y','N')),
	CONSTRAINT ORDER_TABLE_PROD_NUM_FK FOREIGN KEY (PROD_NUM) REFERENCES PRODUCT (PROD_NUM),
	CONSTRAINT ORDER_TABLE_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID)
	
);

CREATE TABLE CHAT (
	CH_NUM NUMBER PRIMARY KEY,
	CH_NAME VARCHAR2(20) NOT NULL,
	CH_DATE DATE NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	CONSTRAINT CHAT_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID)
);

CREATE TABLE RECEIVE(
	ORDER_NUM NUMBER PRIMARY KEY,
	RECEIVE_NAME VARCHAR2(20) NOT NULL,
	RECEIVE_ADDR VARCHAR2(20) NOT NULL,
	RECEIVE_PHONE VARCHAR2(20) NOT NULL,
	RECEIVE_MEMO VARCHAR2(300),
	CONSTRAINT RECEIVE_ORDER_NUM_FK FOREIGN KEY (ORDER_NUM) REFERENCES ORDER_TABLE (ORDER_NUM)
);

CREATE TABLE CHAT_CONTENT(
	CH_NUM NUMBER PRIMARY KEY,
	MEMBER_NICNAME VARCHAR2(20) NOT NULL,
	CH_CONTENT VARCHAR2(4000) NOT NULL,
	CH_CONTENT_DATE DATE NOT NULL,
	CONSTRAINT CHAT_CONTENT_CH_NUM_FK FOREIGN KEY (CH_NUM) REFERENCES CHAT (CH_NUM)
);

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
	FILE_PATH VARCHAR2(100) NOT NULL,
	FILE_ORI_NAME VARCHAR2(30) NOT NULL,
	FILE_NEW_NAME VARCHAR2(30) NOT NULL,
	FILE_TYPE VARCHAR2(10) NOT NULL,
	FILE_DATE DATE NOT NULL,
	FILE_SIZE VARCHAR2(40) NOT NULL,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	BOARD_NO NUMBER NOT NULL,
	CH_NUM NUMBER NOT NULL,
	ANIMAL_NO NUMBER NOT NULL,
	CONSTRAINT FILE_TALBE_MEMBER_ID_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER (MEMBER_ID),
	CONSTRAINT FILE_TABLE_BOARD_NO_FK FOREIGN KEY (BOARD_NO) REFERENCES BOARD (BOARD_NO),
	CONSTRAINT FILE_TABLE_CH_NUM_FK FOREIGN KEY (CH_NUM) REFERENCES CHAT (CH_NUM),
	CONSTRAINT FILE_TABLE_ANIMAL_NO_KF FOREIGN KEY (ANIMAL_NO) REFERENCES ANIMAL (ANIMAL_NO)
);
select * from member;  dhksdn486 