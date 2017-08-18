-- ********************** --
-- 2017.08.02
-- [1]MAJOR_TAB
-- [2]SUBJECT_TAB
-- [3]MEMBER_TAB
-- [4]PROF_TAB
-- [5]STUDENT_TAB
-- [6]GRADE_TAB
-- [7]BOARD_TAB
-- ********************** --
DROP SEQUENCE seq;

CREATE SEQUENCE seq
	START WITH 2000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
	
-- ********************** --
-- [1]MAJOR_TAB
-- 2017.08.02
-- article_seq,member_id,title,
-- content,hitcount,regdate
-- ********************** --
-- DDL
SELECT * FROM MAJOR;
ALTER TABLE Major ADD Member_id VARCHAR2(10);
ALTER TABLE Major ADD subj_id VARCHAR2(10);
CREATE TABLE Major(
	major_id VARCHAR2(10),
	title VARCHAR2(20),
	PRIMARY KEY(major_id)
);
	
CREATE TABLE Subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	major_id VARCHAR2(10),
	PRIMARY KEY(subj_id),
	FOREIGN KEY(major_id) REFERENCES Major(major_id) ON DELETE CASCADE
);

--DML
-- ********************** --
-- [3]MEMBER_TAB
-- 2017.08.02
-- member
--
--
CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	major_id VARCHAR2(10),
	phone VARCHAR2(20),
	email VARCHAR2(20),
	profile VARCHAR2(20),
	PRIMARY KEY(member_id),
	FOREIGN KEY(major_id) REFERENCES Major(major_id) ON DELETE CASCADE
);

CREATE TABLE Board(
   article_seq NUMBER,
   title VARCHAR2(30),
   content VARCHAR2(100),
   regdate DATE,
   hitcount NUMBER,
   member_id VARCHAR2(10),
   PRIMARY KEY (article_seq),
   FOREIGN KEY (member_id) REFERENCES Member(member_id)  ON DELETE CASCADE
);

SELECT * FROM Board;
DROP TABLE Board;
--DML
INSERT INTO Member(member_id,name,password,ssn,regdate,major_member_id,phone,email,profile) VALUES();
-- ********************** --
-- [4]PROF_TAB
-- 2017.08.02
-- member_member_id,salary
-- ********************** --
-- DDL
CREATE TABLE Prof (
   member_id varchar2(10),
   salary varchar2(10),
   PRIMARY KEY (member_id),
   FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);
SELECT * FROM Prof;
-- ********************** --
-- [5]STUDENT_TAB
-- 2017.08.02
-- member_member_id,stu_no
-- ********************** --
-- DDL
CREATE TABLE Student (
   member_id varchar2(10),
   stu_no varchar2(8),
   PRIMARY KEY (member_id),
   FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);
-- ********************** --
-- [6]GRADE_TAB
-- 2017.08.02
-- grade
--
--
CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(3),
	exam_date VARCHAR2(12),
	subj_id VARCHAR2(10),
	member_id VARCHAR2(10),
	PRIMARY KEY(grade_seq),
  	FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
	FOREIGN KEY(subj_id) REFERENCES Subject(subj_id) ON DELETE CASCADE
);

SELECT * FROM Grade;

SELECT DISTINCT 
m.member_member_id,m.name,mj.title,g.SCORE,sj,title AS 과목명 FROM member m,student s,grade g,subject sj,major mj
	WHERE m.member_member_id=s.member_member_id AND m.member_member_id=g.member_member_id AND sj.MAJOR_member_id=mj.MAJOR_member_id AND sj.subj_member_id=g.subj_member_id;

DROP TABLE Grade;
ALTER TABLE Grade RENAME COLUMN member_id TO member_id;
--DML
SELECT * FROM Major;

INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('joo','1234','주지훈','020101-1234567',SYSDATE,'computer','010-1234-1234','1@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('jung','1234','정우성','950101-1234567',SYSDATE,'computer','010-1234-1231','2@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('jang','1234','장동건','940101-1234567',SYSDATE,'art','010-1234-1232','3@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('han','1234','한민관','010101-1234567',SYSDATE,'tourism','010-1234-1233','4@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('yoo','1234','유재석','020202-1234567',SYSDATE,'economics','010-1234-1235','5@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('yoo2','1234','유재석','040202-1234567',SYSDATE,'economics','010-1111-1235','55@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('park','1234','박명수','030101-1234567',SYSDATE,'tourism','010-1234-1236','6@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('lee','1234','이재훈','950101-2345678',SYSDATE,'economics','010-1234-1237','7@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('kim','1234','김종국','990101-1234567',SYSDATE,'tourism','010-1234-1238','8@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('kim2','1234','김태희','900101-2345678',SYSDATE,'economics','010-1234-1239','9@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('park2','1234','박보영','900202-2345678',SYSDATE,'tourism','010-1234-1240','10@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('jung2','1234','정세운','970101-2345678',SYSDATE,'art','010-1234-1241','11@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('shin','1234','신세경','890101-2345678',SYSDATE,'tourism','010-1234-1242','12@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('park3','1234','박보검','890101-2345678',SYSDATE,'art','010-1234-1243','13@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('ha','1234','하동훈','800101-1834578',SYSDATE,'computer','010-9234-1243','14@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('kim3','1234','김래원','790101-1734678',SYSDATE,'computer','010-8234-1243','15@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('kang','1234','강호동','750101-1634678',SYSDATE,'computer','010-7234-1243','16@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('lee2','1234','이상민','760101-1534678',SYSDATE,'computer','010-6234-1243','17@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('kim4','1234','김희철','820101-1434678',SYSDATE,'computer','010-5234-1243','18@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('min','1234','민경훈','840101-1345698',SYSDATE,'computer','010-4234-1243','19@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('min2','1234','민경훈','841111-1345698',SYSDATE,'computer','010-9999-9943','19@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('hong','a','홍길동','861014-1045698',SYSDATE,'computer','010-4294-1249','28@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('hong2','a','홍길동','861024-1045698',SYSDATE,'computer','010-4494-1449','78@test.com','defaultimg.jpg');

INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('james','1234','제임스','550519-123456',SYSDATE,'computer','010-1111-1111','james@test.com','defaultimg.jpg');
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('bare','1234','베어','830105-123456',SYSDATE,'tourism','010-1234-5555','bare@test.com','defaultimg.jpg'); 
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('yong','1234','맨큐','830105-123456',SYSDATE,'economics','010-1234-7955','bare2@test.com','defaultimg.jpg'); 
INSERT INTO Member(member_id,password,name,ssn,regdate,major_id,phone,email,profile) VALUES('gogh','1234','고흐','530105-123456',SYSDATE,'art','010-1234-6666','gogh@test.com','defaultimg.jpg');

INSERT INTO Major(major_id, title) VALUES('economics','경제학');
INSERT INTO Major(major_id, title) VALUES('tourism','관광학');
INSERT INTO Major(major_id, title) VALUES('art','미술학');
INSERT INTO Major(major_id, title) VALUES('computer','컴퓨터공학');

INSERT INTO Prof(member_id,salary) VALUES('james','10000');
INSERT INTO Prof(member_id,salary) VALUES('bare','9000');
INSERT INTO Prof(member_id,salary) VALUES('yong','8000');
INSERT INTO Prof(member_id,salary) VALUES('gogh','1000');

INSERT INTO Student(member_id,stu_no) VALUES('ha','20171000');
INSERT INTO Student(member_id,stu_no) VALUES('kim3','20171001');
INSERT INTO Student(member_id,stu_no) VALUES('kang','20171002');
INSERT INTO Student(member_id,stu_no) VALUES('lee2','20171003');
INSERT INTO Student(member_id,stu_no) VALUES('kim4','20171004');
INSERT INTO Student(member_id,stu_no) VALUES('min','201710005');

INSERT INTO Subject(subj_id,title,major_id) VALUES('java','자바','computer');
INSERT INTO Subject(subj_id,title,major_id) VALUES('c++','씨++','computer');
INSERT INTO Subject(subj_id,title,major_id) VALUES('JSP','제이에스피','computer');
INSERT INTO Subject(subj_id,title,major_id) VALUES('Spring','스프링','computer');

INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'90','2017-03','java','ha');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'80','2017-04','java','ha');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'20','2017-05','java','ha');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'100','2017-03','java','min');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'90','2017-04','java','min');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'90','2017-05','java','min');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'70','2017-03','java','kang');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'40','2017-04','java','kang');
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id) VALUES(seq.nextval,'70','2017-05','java','kang');

SELECT * FROM grade;
UPDATE MEMBER SET password='22222' WHERE member_id='you';
UPDATE member SET phone='010-1234-7777';
UPDATE Member SET name='bbb', phone='bbb' WHERE member_id='aaaa';
DELETE FROM MEMBER WHERE member_id='qqqq';

SELECT * FROM board;
SELECT COUNT(*)AS count FROM board;
delete from board where seq='1017';
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'홍길동의 글','꽃 봄바람을 무엇이 뿐이다.',SYSDATE,0,'hong');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'신세경의 글','날의 두손을 있는 우리의 가슴이 칼이다.',SYSDATE,0,'shin');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'홍길동의 글2','길을 미묘한 피어나기 대한 있는 구하지 것이다.',SYSDATE,0,'hong2');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'강호동의 글','무엇을 그들은 쓸쓸하랴?',SYSDATE,0,'kang');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'민경훈의 글','이상은 유소년에게서 것은 위하여서.',SYSDATE,0,'min');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'장동건의 글','청춘을 풍부하게 간에 것이다.'SYSDATE,0,'jang');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'유재석의 글','살았으며, 우리의 그들에게 부패를 웅대한 사랑의 것이다.'SYSDATE,0,'yoo');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'유재석의 글2','우리의 석가는 살았으며, 부패뿐이다.',SYSDATE,0,'yoo');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'박명수의 글','창공에 미인을 힘차게 우는 오아이스도 목숨을 피다.'SYSDATE,0,'park');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'김종국의 글','듣기만 꾸며 소담스러운 열락의 피는 약동하다.'SYSDATE,0,'kim');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'민경훈의 글2','아름답고 대고, 인간은 피고, 그들을 위하여, 안고, 봄바람이다'SYSDATE,0,'min');
INSERT INTO board(article_seq,title,content,regdate,hitcount,member_id) VALUES(seq.nextval,'박보영의 글','갑 새 들어 청춘이 목숨을 두기 아름다우냐?'SYSDATE,0,'park2');

UPDATE BOARD SET title='수정된 내용', content='수정된 내용' WHERE article_seq='1000';

--major, subject, grade 테이블
SELECT * FROM Member;
SELECT * FROM subject;
SELECT * FROM grade;
INSERT INTO major VALUES('computer','컴공');
INSERT INTO subject VALUES('python','computer','python');

update subject set major_id='computer' where title='자바';
update member set major_id='computer';
update MEMBER set name='유선호' where member_id='you';

