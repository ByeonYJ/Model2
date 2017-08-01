INSERT INTO Member(id, pwd, name, ssn, regdate)
VALUES('you', '1234', '유선호', '020101-1234567', SYSDATE);
INSERT INTO Member(id, pwd, name, ssn, regdate)
VALUES('im', '1234', '임영민', '950101-1234567', SYSDATE);
insert into Member(id,pwd,name,ssn,regdate) values('kang','1234','강다넬','940101-1234567',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('ra','1234','라이관','010101-1234567',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('sun','1234','유선호','020202-1234567',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('ho','1234','유선호','030101-1234567',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('da','1234','강다넬','950101-2345678',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('park','1234','박지훈','990101-1234567',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('kyoung','1234','경리','900101-2345678',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('bo','1234','박보영','900202-2345678',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('se','1234','정세운','970101-2345678',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('shin','1234','신세경','890101-2345678',sysdate);
insert into Member(id,pwd,name,ssn,regdate) values('hhh','1234','tjtjtj','890101-2345678',sysdate);
insert into member(phone) values('');

UPDATE member SET name='bbb', phone='bbb' WHERE id='aaaa';

SELECT * FROM MEMBER;
UPDATE MEMBER SET pwd='22222' WHERE id='you';
DELETE FROM MEMBER WHERE id='qqqq';
UPDATE member SET phone='010-1234-7777';

SELECT * FROM board;
SELECT COUNT(*)AS count FROM board;
delete from board where article_seq='1017';
insert into board values(article_seq.nextval, 0,'you','유선호의 글','꽃 봄바람을 무엇이 뿐이다.',sysdate);
insert into board values(article_seq.nextval, 0,'shin','신세경의 글','날의 두손을 있는 우리의 가슴이 칼이다.',sysdate);
insert into board values(article_seq.nextval, 0,'you','유선호의 글2','길을 미묘한 피어나기 대한 있는 구하지 것이다.',sysdate);
insert into board values(article_seq.nextval, 0,'im','임영민의 글','무엇을 그들은 쓸쓸하랴?',sysdate);
insert into board values(article_seq.nextval, 0,'se','정세운의 글','이상은 유소년에게서 것은 위하여서.',sysdate);
insert into board values(article_seq.nextval, 0,'you','유선호의 글3','청춘을 풍부하게 간에 것이다.',sysdate);
insert into board values(article_seq.nextval, 0,'kyoung','경리의 글','살았으며, 우리의 그들에게 부패를 웅대한 사랑의 것이다.',sysdate);
insert into board values(article_seq.nextval, 0,'da','강다니엘의 글','우리의 석가는 살았으며, 부패뿐이다.',sysdate);
insert into board values(article_seq.nextval, 0,'ra','라이관린의 글','창공에 미인을 힘차게 우는 오아이스도 목숨을 피다.',sysdate);
insert into board values(article_seq.nextval, 0,'bo','박보영의 글','듣기만 꾸며 소담스러운 열락의 피는 약동하다.',sysdate);
insert into board values(article_seq.nextval, 0,'park','박지훈의 글','아름답고 대고, 인간은 피고, 그들을 위하여, 안고, 봄바람이다',sysdate);
insert into board values(article_seq.nextval, 0,'kyoung','경리의 글 2','갑 새 들어 청춘이 목숨을 두기 아름다우냐?',sysdate);
UPDATE BOARD
SET title='수정된 내용', content='수정된 내용'
WHERE article_seq='1000';

--major, subject, grade 테이블
SELECT * FROM major;
SELECT * FROM Member;
SELECT * FROM board;
SELECT DISTINCT id FROM Board WHERE id LIKE '%o%';
insert into major values('computer','컴공');
insert into subject values('python','computer','python');

update subject set major_id='computer' where title='자바';
update member set major_id='computer';
update MEMBER set name='유선호' where id='you';

SELECT * FROM Member m, Board b WHERE m.id=b.id;
SELECT * FROM Member m, Board b WHERE m.id=b.id ORDER BY b.regdate; 
SELECT * FROM Member m, Board b, Grade g WHERE m.id=b.id AND m.id=g.id;