--------------------------------------------------------
--  테이블 생성 및 제거
--------------------------------------------------------
drop table mvc_board;
drop sequence mvc_board_seq;

--------------------------------------------------------
--  게시판 테이블 생성
--------------------------------------------------------
create table mvc_board(
bId number(4) primary key,
bName varchar2(20),
bTitle varchar2(200),
bContent varchar2(800),
bDate Date default sysdate,
bHit number(4) default 0,
bGroup number(4),
bStep number(4),
bIndent number(4)
);

--------------------------------------------------------
--  id값 자동증가를 위한 sequence 생성  
--------------------------------------------------------
create SEQUENCE mvc_board_seq
start with 1
increment by 1
maxvalue 10000;

--------------------------------------------------------
--  데이터 insert   
--------------------------------------------------------
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'테스트1','테스트1Title','merong',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'샛별','안녕하세요','반갑습니다',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'은별','어서오세요','자주뵈어요',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'김','질문 있습니다','답글달아주세요',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'이','수요일이네요','시간이 참 빨라요',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'박','비가 많이 와요','얼른 그쳐야 할텐데...',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'최','겨울이 좋아요','여름은 너무 덥더라구요',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'구','잠시만요','기다려주세요',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'지','신부동 택시 질문요~','어디서 타요??',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'한','점심시간 몇시부터인가요?','배가 너무 고파요...',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'은수','다들 반가워요','어서오세요~',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'휴먼','천안 휴먼교육센터','자바 스크립트',
mvc_board_seq.currval,0,0);

--------------------------------------------------------
--  데이터 정렬   
--------------------------------------------------------
select * from mvc_board order by bGroup desc, bStep asc;

--------------------------------------------------------
--  테스트를 위한 데이터 삽입  
--------------------------------------------------------
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
(select mvc_board_seq.nextval,bName,bTitle,bContent,
mvc_board_seq.currval,0,0 from mvc_board);

--------------------------------------------------------
--  페이징 처리   
--------------------------------------------------------
select * from(select rownum m, sub.*
from (select * from mvc_board 
order by bgroup desc, bStep asc) sub
where rownum <= 2*10)
where m>=(2-1)*10+1;

commit;