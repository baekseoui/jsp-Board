--------------------------------------------------------
--  ���̺� ���� �� ����
--------------------------------------------------------
drop table mvc_board;
drop sequence mvc_board_seq;

--------------------------------------------------------
--  �Խ��� ���̺� ����
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
--  id�� �ڵ������� ���� sequence ����  
--------------------------------------------------------
create SEQUENCE mvc_board_seq
start with 1
increment by 1
maxvalue 10000;

--------------------------------------------------------
--  ������ insert   
--------------------------------------------------------
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'�׽�Ʈ1','�׽�Ʈ1Title','merong',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'����','�ȳ��ϼ���','�ݰ����ϴ�',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'����','�������','���ֺƾ��',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','���� �ֽ��ϴ�','��۴޾��ּ���',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','�������̳׿�','�ð��� �� �����',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','�� ���� �Ϳ�','�� ���ľ� ���ٵ�...',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','�ܿ��� ���ƿ�','������ �ʹ� �����󱸿�',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','��ø���','��ٷ��ּ���',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','�źε� �ý� ������~','��� Ÿ��??',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'��','���ɽð� ��ú����ΰ���?','�谡 �ʹ� ���Ŀ�...',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'����','�ٵ� �ݰ�����','�������~',
mvc_board_seq.currval,0,0);
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
values (mvc_board_seq.nextval,'�޸�','õ�� �޸ձ�������','�ڹ� ��ũ��Ʈ',
mvc_board_seq.currval,0,0);

--------------------------------------------------------
--  ������ ����   
--------------------------------------------------------
select * from mvc_board order by bGroup desc, bStep asc;

--------------------------------------------------------
--  �׽�Ʈ�� ���� ������ ����  
--------------------------------------------------------
insert into mvc_board(bId,bName,bTitle,bContent,bGroup,bStep,bIndent)
(select mvc_board_seq.nextval,bName,bTitle,bContent,
mvc_board_seq.currval,0,0 from mvc_board);

--------------------------------------------------------
--  ����¡ ó��   
--------------------------------------------------------
select * from(select rownum m, sub.*
from (select * from mvc_board 
order by bgroup desc, bStep asc) sub
where rownum <= 2*10)
where m>=(2-1)*10+1;

commit;