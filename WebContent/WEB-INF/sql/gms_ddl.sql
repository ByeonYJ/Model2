SELECT * FROM TAB;
CREATE SEQUENCE article_seq
	START WITH 1000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
CREATE SEQUENCE grade_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
-- id, pwd, name, ssn, regdate
CREATE table Member(
	id VARCHAR2(10), 
	pwd VARCHAR2(10), 
	name VARCHAR2(20), 
	ssn VARCHAR2(15),
	regdate DATE,
	primary key(id)
);
SELECT * FROM member;

--phone, email,major,subject
ALTER TABLE member ADD phone VARCHAR(13);
ALTER TABLE member ADD email VARCHAR(30);

CREATE TABLE Board(
	article_seq NUMBER,
	hitcount NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	primary key(article_seq),
	FOREIGN KEY(id) REFERENCES MEMBER(id) ON DELETE CASCADE
);

SELECT * FROM major;
drop table grade;

CREATE TABLE major(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	primary key(major_id)
);
SELECT * FROM major;


CREATE TABLE subject(
	subj_id VARCHAR2(10),
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	primary key(subj_id),
	foreign key(major_id) references major(major_id) ON DELETE CASCADE
);
SELECT * FROM subject;

CREATE TABLE grade(
	grade_seq NUMBER,
	id VARCHAR2(10),
	subj_id VARCHAR2(10),
	score VARCHAR2(10),
	exam_date VARCHAR2(10),
	primary key(grade_seq),
	foreign key(subj_id) references subject(subj_id) ON DELETE CASCADE,
	foreign key(id) references member(id) ON DELETE CASCADE
);
SELECT * FROM grade;

--기존 테이블에 없는 칼럼을 추가해서 fk로 만드는 로직
ALTER TABLE member ADD profile VARCHAR2(30);

ALTER TABLE member
ADD CONSTRAINT member_fk_major
FOREIGN KEY (major_id) REFERENCES major(major_id);
