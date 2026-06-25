-- 02.where 절


/*
[where 절 사용 방법]
select 조회하고자 하는 "컬럼의 정보"
from 데이터를 가져올 "테이블의 정보"
where 원하는 데이터(행)을 가져오기 위한 "조건식" 작성

*/

--emplyee_id가 100에 해당하는 직원의 직원id,이름,급여 정보를 조회하시오.
select employee_id
      ,first_name
      ,salary
   from employees
  where employee_id = 100;

/*
[비교 연산자]
= : 같다
> : 보다 크다
>= " 크거나 같다
< : 보다 작다
<= : 보다 작거나 같다

*/

--급여가 5000이상을 받고 있는 직원의 이름, 급여, 급여외보너스 정보를 조회하시오
select salary, employee_id, commission_pct
   from employees
  where salary >= 5000
  order by salary asc;

--부서id가 90에 해당하는 부서이름의 정보를 조회하시오
select department_id, department_name
   from departments
   where department_id = 90;
   
   

-- 위치ID가 1500에 해당하는 city의 이름을 조회하시오
select city, location_id
   from locations
   where location_id = 1500;
   
/*
[SQL에서 사용하는 자료형 정리]
1.문자형 자료형 : CHAR(N), VARCHAR2(N) -> 문자형 자료형을 읽기 위해서는 ' '(작은따옴표) 사용

2.숫자형 자료형 : NUMBER(N) -> 숫자형 자료형은 숫자 그대로 쓰면 된다.

3. 날짜형 자료형 : DATE -> 날짜형 자료형을 읽기 위해서는 ' '(작은따옴표) 감싸줘야 한다.
->stsdate 라는 날짜형 자료형으로 사용한다.
->stsdate는 시/분/초 까지 입력이 가능하다.
도구 -> 환경설정 -> 데이터베이스 -> NLS -> 날짜형식 -> YYYY-DD-MM HH24:MI:SS
*/

select 12345
       ,'ABCD'
       ,sysdate
    from dual;

-- 직원테이블에서 job_id가 st_clerk에 해당하는 직원 총 몇명인가
SELECT *       
  FROM EMPLOYEES
  WHERE JOB_ID = 'ST_CLERK';
  
  
-- job_id가 IT_PROG에 해당하는 직원의 이름, 직원ID,급여,이메일,부서ID 정보를 조사하시오
-- 급여 기준 내림차순  
select employee_id
       , first_name
       , salary
       , email
       , department_id
  from employees
where  job_id = 'IT_PROG'
order by salary desc;

/*
[부정 비교 연산자]
!=, <>, ^= : 같지 않다.
NOT A = B : 같지 않다.

[논리 연산자]
OR : 하나의 조건이라도 만족하면 TRUE 값을 반환해준다.
AND : 조건 모두 만족해야만 TRUE 값을 반환해준다. 

*/

-- 부서 ID가 50, 60에 해당하는 직원의 직원ID, 이름, 부서ID 정보를 조회하시오
select employee_id, department_id, first_name 
   from employees
where employee_id = 50 or employee_id = 60;

--부서 ID가 50에 소속되어 있고 급여는 5000이상 책정되어 있는 직원ID, 급여, 부서ID 정보를 조회하시오.
select employee_id, department_id, salary 
   from employees
where employee_id = 50 and salary >= 5000;


-- job_id가 it_prog 이거나 st_man에 속해 있는 모든 직원의 정보를 조회하시오

select *
  from employees
  where job_id = 'IT_PROG' or job_id = 'ST_MAN';

-- 부서 ID가 90이거나 30이거나 50인 직원의 직원ID, 부서ID, 이름, 이메일 정보를 조회
select employee_id, department_id, first_name, email
   from employees
  where employee_id = 90 or employee_id = 30 or employee_id = 50;

--부서 ID가 90이고, 급여가 20000 이상인 직원ID, 이름, 부서ID, 급여 정보를 조회하시오
select employee_id, department_id, first_name, salary
   from employees
   where employee_id = 90 and salary >= 20000;

--급여가 7000 이상이면서 job_id 가 'SA_REP'인 직원의 직원 id, 이름, 급여, job_id 정보 조회
-- 급여 기준으로 내림차순 정렬하고 job_id를 직책정보 라는 별칭으로 적용하여 출력

select employee_id as "직원 ID" 
       , first_name as "이름" 
       , salary as "급여"
       , job_id as "직책정보"
  from employees
  where salary >= 7000 and job_id = 'SA_REP'
  order by salary desc;

--급여가 10000미만이 아닌 직원의 직원id, 이름, 급여 정보 조회
select employee_id, first_name, salary
  from employees
  where NOT salary < 10000;




--NULL 개념 -> 비어있는 상태, 존재하지 않는 값
/*
[NULL의 특징]
1.NULL값은 산술 연산(+,-,*...)이 적용되지 않는다.
2.NULL값은 비교 연산(<,>,=..)이 적용되지 않는다.

*/

--[NULL 연산자] 
-- IS NULL : NULL값인 것을 조회하는 연산자
-- IS NOT NULL : NULL값이 아닌 것을 조회하는 연산자

--부서ID가 NULL인 직원의 first_name, emall, phone_number 컬럼의 정보를 조회.
select employee_id, first_name, email, phone_number
  from employees
  where employee_id is null;

--매니저ID가 NULL이 아닌 부서이름의 정보를 조회
select department_id, manager_id
  from employees
  where department_id is not null;  


/*
[IN 연산자 / BETWEEN 연산자]





*/

select *
from employees
 where department_id = 10
       or departmet_id = 20
       or department_id = 30
       or department_id = 40;
       
select *
  from departments 
  where department_id in (10,20,30,40,50,60,70);


--급여가 10000 이상 20000 이하의 범위의 값을 가진 직원의 모든 정보를 조회하시오
--급여 기준으로 오름차순 정렬하시오.
select *
  from employees  
  where salary >= 10000 and salary <=20000
  order by salary asc; 

select *
  from employees
  where salary between 10000 and 20000
  order by salary asc;
  
  
  
 
  