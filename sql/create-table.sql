
/* Drop Tables */

DROP TABLE qwqna CASCADE CONSTRAINTS;
DROP TABLE qwadmin CASCADE CONSTRAINTS;
DROP TABLE qwbike CASCADE CONSTRAINTS;
DROP TABLE qworders CASCADE CONSTRAINTS;
DROP TABLE qwdelivery CASCADE CONSTRAINTS;
DROP TABLE qwstores CASCADE CONSTRAINTS;


/* Create Tables */

CREATE TABLE qwadmin
(
	id varchar2(20) NOT NULL,
	passwd varchar2(30) NOT NULL,
	fees number(5,0) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE qwbike
(
	id varchar2(20) NOT NULL,
	ins number NOT NULL,
	did number NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE qwdelivery
(
	did number NOT NULL,
	email varchar2(50) NOT NULL UNIQUE,
	passwd varchar2(15) NOT NULL,
	shop_name varchar2(50) NOT NULL,
	owner varchar2(30) NOT NULL,
	post number(5,0) NOT NULL,
	address varchar2(200) NOT NULL,
	tel varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	intro varchar2(1000),
	shop_num number(10,0) NOT NULL UNIQUE,
	lat number(10,7) NOT NULL,
	lng number(10,7) NOT NULL,
	dprice number(6,0) NOT NULL,
	bike number,
	imgpath varchar2(30),
	PRIMARY KEY (did)
);


CREATE TABLE qworders
(
	onum number NOT NULL,
	price number NOT NULL,
	state varchar2(20) NOT NULL,
	reg_time date NOT NULL,
	dprice number(4,0) NOT NULL,
	fees number(5,0) NOT NULL,
	limit_time date NOT NULL,
	res_limit_time date,
	opencheck char DEFAULT '1' NOT NULL,
	did number,
	sid number NOT NULL,
	PRIMARY KEY (onum)
);


CREATE TABLE qwqna
(
	no number NOT NULL,
	content varchar2(50) NOT NULL,
	writer varchar2(50) NOT NULL,
	subject varchar2(50) NOT NULL,
	reg_date date NOT NULL,
	re_step number NOT NULL,
	re_level number NOT NULL,
	refe number NOT NULL,
	readcount number NOT NULL,
	category number(2,0),
	sid number,
	did number,
	id varchar2(20),
	PRIMARY KEY (no)
);


CREATE TABLE qwstores
(
	sid number NOT NULL,
	email varchar2(50) NOT NULL UNIQUE,
	passwd varchar2(15) NOT NULL,
	shop_name varchar2(50) NOT NULL,
	owner varchar2(30) NOT NULL,
	post number(5,0) NOT NULL,
	address varchar2(200) NOT NULL,
	tel varchar2(30) NOT NULL,
	phone varchar2(20) NOT NULL,
	intro varchar2(1000),
	shop_num number(10,0) NOT NULL UNIQUE,
	lat number(10,7) NOT NULL,
	lng number(10,7) NOT NULL,
	max_price number(5,0),
	imgpath varchar2(30),
	PRIMARY KEY (sid)
);



/* Create Foreign Keys */

ALTER TABLE qwqna
	ADD FOREIGN KEY (id)
	REFERENCES qwadmin (id)
;


ALTER TABLE qwbike
	ADD FOREIGN KEY (did)
	REFERENCES qwdelivery (did)
;


ALTER TABLE qworders
	ADD FOREIGN KEY (did)
	REFERENCES qwdelivery (did)
;


ALTER TABLE qwqna
	ADD FOREIGN KEY (did)
	REFERENCES qwdelivery (did)
;


ALTER TABLE qworders
	ADD FOREIGN KEY (sid)
	REFERENCES qwstores (sid)
;


ALTER TABLE qwqna
	ADD FOREIGN KEY (sid)
	REFERENCES qwstores (sid)
;

/* ������ ���� */
drop sequence qna_seq;
drop sequence admin_seq;
drop sequence bike_seq;
drop sequence orders_seq;
drop sequence delivery_seq;
drop sequence stores_seq;


/* ������ ���� */
CREATE SEQUENCE qna_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;
           
CREATE SEQUENCE admin_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;

CREATE SEQUENCE bike_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;           
           
CREATE SEQUENCE orders_seq
           INCREMENT BY 1
           START WITH   1
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;
           
CREATE SEQUENCE delivery_seq
           INCREMENT BY 1
           START WITH 26
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;
           
CREATE SEQUENCE stores_seq
           INCREMENT BY 157
           START WITH   191
           MAXVALUE 999999
           NOCYCLE
           NOCACHE;           
