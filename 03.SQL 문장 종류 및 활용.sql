--03. SQL 문장 종류 및 활용
/*
1.DDL(Data Definition Language : 데이터 정의어
[DDL 명령어 종류]
CREATE : 테이블, user 같은 객체를 생성하는 명령어
ALTER : 테이블, user 같은 객체를 변경하는 명령어
DROP : 테이블, user 같은 객체를 삭제하는 명령어
TRUNCATE : 테이블 안에 있는 데이터를 영구 삭제하는 명령어
RENAME : 테이블의 이름을 변경하는 명령어

[계정(user) 생성 방법]
create user [계정 명] identified by [비밀번호]; 

DDL 목표
scott.emp, scott.dept 테이블 ai.soft 계정에 구현해보자.

테이블 구조 확인 방법 
1. desc 명령어 활용
desc [테이블 명]

2.해당 테이블명을 드래그 후 SHIFT + F4
emp : 직원들의 정보를 저장하고 관리하기 위한 테이블
dept : 직원들의 부서정보를 저장하고 관리히가 위한 테이블

*/

desc emp;
create table emp (
   empno number(4,0),
   ename varchar2(10 byte),
   job varchar2(9 byte),
   mgr number(4),
   hiredate date,
   sal number(7,2),
   comm number(7,2),
   deptno number(2,0)
);

--[테이블 생성시 사용하는 자료형 종류]
--VARCHAR2(N) : 가변 길이 문자열 정보로서, N만큼 최대 길이를 갖는 문자형 자료형.
--humber(P,s) : 정수, 실수 숫자 타입을 입력받는 숫자형 자료형이다. 
-->숫자형 값을 P자리 만큼 입력 받고, S자리 만큼 소수를 입력받는다
--DATE : SYSDATE(날짜형 함수)를 사용하여 현재 날짜 값을 받는 날짜형 자료형이다

desc dept;
create table dept (
  deptno number(2,0),
  dname varchar2(14 byte),
  loc varchar2(13 byte)
);

--제약조건이란 constraint 
--> 테이블에 저장되는 데이터의 정확성과 일관성 설정 규칙
--즉 잘못된 데이터가 들어오지 않도록 막아주는 안전장치이다.

--[제약조건의 종류]
--primary key(pk) : 기본키, 테이블에 반드시 있어야 하는 키다.
--> NOT NULL + UNIQUE --> NULL값 불가 + 중복 불가능
--UNIQUE KEY(UK) : 유일키, NULL값 허용 가능 단 중복 불가능
--NOT NULL : NULL값 불가능 --> 반드시 데이터가 포함이 되어야 할 때 사용한다.
-- CHECK : TRUE OR FALES --> 조건을 걸어줫 해당 조건에 맞는 데이터만 입력 가능하게 설정
-- FOREIGN KEY(FK) : 외래키, 테이블을 이어주는 키

--제약조건 지정하는 방법
--ALTER TABLE [테이블 명] ADD CONSTRAINT [제약조건 이름] [제약조건(해당컬럼)];


--ai_soft.emp 테이블에 pc 제약조건 걸어주기
alter table emp
  add constraint ai_soft_emp_empno_pk
  primary key (empno);

--제약조건 삭제하기
--alter table [테이블명] drop constraint [제약조건 이름];

alter table emp
   drop constraint AI_SOFT_EMP_EMPNO_PK;


--ai_soft.dept 테이블에서 deptno 컬럼을 pk 제약조건으로 설정하기
alter table dept
  add constraint ai_soft_dept_deptno_pk
  primary key (deptno);

--fk 제약조건 설정하는 방법
--alter table [테이블 명]
--add constraint [제약조건이름] [제약조건]
--references [참조테이블(참조컬럼명)];

alter table emp
  add constraint emp_deptno_fk  
  foreign key(deptno)
  references dept(deptno);

