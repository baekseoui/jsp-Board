맨 첫 실행화면

create table mvc_board(
  bId number(4) primary key,
  bName varchar2(20),
  bTitle varchar2(100),
  bContent varchar2(300),
  bHit number(4) default 0,
  bGroup number(4),
  bIndent number(4),
  bDate date
);

create SEQUENCE mvc_board_seq
start with 1
increment by 1
maxvalue 10000;

insert into mvc_board 
values(mvc_board_seq.nextval,'asdf','is title','is content',0,
mvc_board_seq.currval,0);

select * from mvc_board;
desc mvc_board;
commit;