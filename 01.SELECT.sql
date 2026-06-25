-- 주석기호 : 코드에 영향을 받지 않는다

desc employees; 

-- 부서 테이블의 구조를 확인해보자.
-- 직무 테이블의 구조를 확인해보자.

desc departments; 
desc jobs; 

/*
1.엔터티(Entity) -> 테이블(Table) -> 업무에 필요하고 유용한 정보 정리, 
                                   관리 "데이터의 집합"
-- employees, departments --

2.속성(Attribute) -> 컬럼(column) -> 엔터티가 가지는 특징, 엔터티 설명
-- employees 테이블의 속성 : employee_id, first_name...

3.인스턴스(instance)  -> 행(Row) -> 속성이 값을 가져서 실체화 된 것, 실제 데이터 값

*/ 

-- select문 사용하는 방법 : 데이터를 선택해서 가져오는 방법
-- select 조회하고자 하는 "컬럼의 정보"
-- from 데이터를 가져올 "데이터의 정보"

-- employes(직원테이블) 에서 employee_id, first_name, lasst_name 컬럼의 정보 조회.

select employee_id, first_name, last_name
from employees;

-- departments(부서테이블) 에서 부서id, 부서이름의 정보 조회
select department_id, department_name
from departments;

/*
1.SQL 문장에는 대소문자를 구분하지 않는다.
2.SQL 문장 끝에는 반드시 ;(세미콜론)을 작성해줘야 한다.
3.띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
4.SQL 실행 단축키 : ctrl + enter, F9

*/


-- 직원테이블에서 직원아이디, 직원이름, 핸드폰번호, 이메일 정보, 급여 정보를 조회하시오.
-- select 사용자가 조회하고자 하는 "컬럼의 정보"
-- from 컬럼의정보를 가져올 "테이블 정보"
select employee_id, first_name, phone_number, email, salary 
   from employees; 

--부서테이블에서 부서id, 부서이름, 위치id 정보를 조회하시오
select department_id, department_name, location_id
  from departments;
  
--직원테이블에서 직원id, 급여, 부서id 정보 조회
select employee_id, salary, department_id
   from employees;

--위치테이블에서 위치id, city컬럼 정보 조회
select location_id, city
  from locations;
  
  
--*(아스타리스크) : 전체조회

--부서테이블의 모든 정보 조회
select *
  from departments;

--직원테이블의 모든 정보 조회
select *
  from employees;
 
 
/*
[ SELECT 문 활용]
1. 전체 정보 조회하기 -> SELECT 절에 *(아스타리스크)를 작성한다.
                    ->*은 단독으로만 사용이 가능하다.
 
2. 중복을 제거하여 조회하기
SELECT 절에 DISTINCT 옵션을 사용하면 된다.
*/

--직원테이블에서 부서ID 컬럼의 정보 조회  
select department_id
  from employees;
  
--직원테이블 부서ID 컬럼의 중복 제거 후 정보 조회 
select distinct department_id
  from employees;
  
--직원테이블에서 job_id 컬럼 중복 제거 후 조회  
select distinct job_id
  from employees;
  
--3. 컬럼에 별칭 적용하기
/*
[컬럼의 별칭 사용 방법]
1.select 컬럼명 as 별칭
2.select 컬럼명 as "별칭"
3.select 컬럼명 별칭
4.select 컬럼명 "별칭"
별칭적용할 때 " "(쌍따옴표) 사용하는 이유는 별칭에 특수문자를 적용시키기 위함.
*/

select first_name, employee_id as "직원아이디", salary as "급여"
  from employees;

--직원테이블에서 직원id, 이름, 급여, 급여외추가수당,  부서id,  이메일정보를 조회하시오.
--단 급여외추가수당을 sal+라는 별칭을 적용하여 출력하시오
select employee_id as "직원id" 
       ,first_name as "이름"
       ,salary as "급여" 
       ,department_id as "부서id"
       ,email as "이메일"
       ,commission_pct as "sal+" 
  from employees;



-- 4. 컬럼의 자료형이 숫자형/날짜형 일 경우 산술 연산(+,-,*,/)이 가능하다

-- DESC(Describe) : 해당 테이블의 구조 확인하는 명령어
desc employees;

--직원테이블에서 직원id, 이름, 급여 정보 조회
select employee_id
       ,first_name
       ,salary
       ,salary * 12 as "ASL"
  from employees;

--order by 절 -> 특정 컬럼을 기준으로 정렬화, SQL 문에서 가장 마지막에 작성되고 가장 마지막에 실행 됨.
--ASC(ascending) : 오름차순 정렬 1,2,3,4,5...
--DESC(descending) : 내림차순 정렬 10,9,8,7...

/*

[Order by 절 개념]
select : 조회하고자 하는 "컬럼의 정보"
from : 컬럼의 정보를 가져올 "테이블의 정보"
order by : 특정 컬럼을 기준으로 "정렬화"

*/

-- 직원테이블의 모든 컬럼의 정보를 조회하시오. 단 급여가 낮은 순서대로 정렬하여 출력하시오.
select *
  from employees
order by salary asc,  

--직원테이블 직원id, 이름, 급여, 이메일, 부서 정보 조회. 단 부서id 가장 높은 순서대로 조회
select employee_id 
       ,first_name  
       ,salary 
       ,email 
       ,department_id  
  from employees
order by department_id desc;

-- 직원테이블 이름, 입사날짜, 급여 최근입사한 순서대로 작성, 입사날짜는 최신 순서대로.
select first_name
       ,salary
       ,hire_date as "입사정보"
from employees
order by hire_date desc;






