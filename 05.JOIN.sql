-- 05. JOIN

--JOIN 이란 
--두 개 이상의 테이블을 연결하여 관련이 있는 테이블을
--하나의 결과 값으로 조회할 수 있게 해주는 기술이다.


-- [등가조인 하는 방법]
--select [테이블a.컬럼명], [테이블b.컬럼명]
--from [테이블a], [테이블b]
--where [테이블a.컬럼명] = [테이블b.컬렴명];



select employees.salary,
       employees.employee_id
       employees.first_name,
       employees.department_id,
       departments.department_name
  from employees, departments
  where employees.department_id = departments.department_id;
 
  



--[조인 프로세스]
--1.조인할 대상 테이블의 정보를 확인 -> 관계
--2.FROM절에 조인할 테이블을 ,(컴마) 기준으로 작성
--3.WHERE절에 조인 조건이 되는 특정 컬럼을 확인하여, 조인 조건을 작성
-->조인 조건이 되는 특정 컬럼 : 조이할 테이블 간의 같은 결과 값을 가지는 컬럼
-->주로 PK-FK 관계로 이루어짐, 단 다 그런것은 아니다
--4.SELECT절에 출력하고자 하는 컬럼명을 .(경로)와 함께 작성

--직원ID, FIRST_NAME, job_id, job_title 정보를 조회하시오
--조인할 테이블의 정보 : employees, jobs

select employees.employee_id
       ,employees.first_name
       ,employees.job_id
       ,jobs.job_title
  from employees, jobs
  where employees.job_id = jobs.job_id
  order by employees.employee_id asc;
  
--테이블에 별칭 적용
--AS 키워드 사용불가, 공백으로 별칭 적용
--테이블 별칭 사용시 이후에 실행되는 절에는 반드시 별칭으로만 사용해야 함.

select e.employee_id
       ,e.first_name
       ,e.job_id
       ,j.job_title
  from employees e, jobs j
  where e.job_id = j.job_id;

-- 부서ID, DEPARTMENT_NAME, LOCAION_ID, POSTAL_CODE, CITY
select d.department_id
       ,d.department_name
       ,d.location_id
       ,l.postal_code
       ,l.city
  from departments d, locations l
  where d.location_id = l.location_id
  order by d.department_id;


--단독으로 존재하는 컬럼은 .(경로)를 삭제해도 상관 없다
--> 하지만 코드의 가독성을 위해서 .(경로)를 적어주는 것이 좋다


--직원 ID, 이름, 급여, 부서ID, 부서명의 정보를 출력하시오.
--부서ID가 90에 해당하는 직원의 정보만 조회하시오.
select e.employee_id
       ,e.first_name
       ,e.salary
       ,e.department_id
       ,d.department_name
  from employees e, departments d 
  where e.department_id = d.department_id and e.department_id = 90;
  
--직원ID, 이름, 급여, job_id, job_title의 정보를 조회하시오
--급여가 10000 이상인 직원들의 정보만 조회하시오
--급여 기준으로 내림차순 정렬하고, job_title 정렬의 정보를 직업정보 라는 별칭을 적용하시오
select e.employee_id
       ,e.first_name
       ,e.salary
       ,j.job_id
       ,j.job_title as "직업정보"
  from employees e, jobs j
  where e.job_id = j.job_id and salary >= 10000
  order by e.salary desc;


--ansi 조인문법 : 미국 표준협회에서 만든 표준 조인 문법
-->모든 DBMS에서 사용할 수 있는 표준 문법이다.

--select [테이블.A컬럼명], [테이블B.컬럼명]
--from [테이블A] inner join [테이블b]
--     on (테이블A.컬럼 = 테이블B.컬럼)
--where 일반 조건절;


--직원ID, 이름, 급여, job_id, job_title의 정보를 조회하시오
--급여가 10000 이상인 직원들의 정보만 조회하시오
--급여 기준으로 내림차순 정렬하고, job_title 정렬의 정보를 직업정보 라는 별칭을 적용하시오

select e.employee_id
       ,e.first_name
       ,e.salary
       ,j.job_id
       ,j.job_title as "직업정보"
  from employees e inner join jobs j
    on e.job_id = j.job_id
  where salary >= 10000
  order by e.salary desc;
