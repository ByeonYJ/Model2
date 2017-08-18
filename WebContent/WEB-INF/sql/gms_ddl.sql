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

SELECT * FROM student;
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

CREATE VIEW student (num,id,name,ssn,regdate,phone,email,title)
AS
SELECT rownum, t.*
FROM (SELECT a.member_id, a.name,rpad(substr(a.ssn,1,7),14,'*') ssn,to_char(a.regdate,'yyyy-MM-dd') regdate,
        a.phone,a.email,listagg(s.title,',') within GROUP(ORDER BY s.title) 과목
    FROM member a
        LEFT JOIN major m ON a.member_id LIKE m.member_id
        left join subject s on m.subj_id LIKE s.subj_id
        GROUP BY a.member_id, a.name, a.ssn,a.regdate,a.phone,a.email
        ORDER BY regdate
) t
  	ORDER BY rownum DESC
;

drop view student;

create view student(num,id,name,ssn,regdate,phone,email,title)
as
select rownum, t.*
from (
    select a.member_id, a.name, a.ssn, a.phone, a.email, LISTAGG(m.SUBJ_ID, ',') within group (order by m.SUBJ_ID) title, to_char(a.regdate,'yyyy-MM-dd') regdate 
    from member a
        left outer join major m on a.member_id = m.member_id
     --   left join subject s on m.subj_id = s.subj_id
    group by a.member_id, a.name, a.ssn, a.phone, a.email,a.regdate  
    order by regdate 
) t
order by rownum desc;
  
select * from student;

SELECT * FROM student--Paging : 한 페이지에 5명까지만 출력
WHERE rownum <= 5;
--SELECT *
--FROM (SELECT * FROM student
--WHERE num >(SELECT count(*) FROM student)-5);

SELECT t.*
FROM (SELECT rownum rnum, s.*
	FROM student s)t
	WHERE t.rnum BETWEEN 1 AND 5;

DROP VIEW Student;
SELECT * FROM student; 
--기존 테이블에 없는 칼럼을 추가해서 fk로 만드는 로직
ALTER TABLE member ADD profile VARCHAR2(30);

ALTER TABLE member
ADD CONSTRAINT member_fk_major
FOREIGN KEY (major_id) REFERENCES major(major_id);
