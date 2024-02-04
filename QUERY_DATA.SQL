#cau 1
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE first_name LIKE 'S%'
ORDER BY salary DESC, first_name,last_name;
#cau 2
SELECT employee_id,first_name,last_name ,job_id,salary  FROM employees where salary = (SELECT MAX(salary) FROM employees);
# cau 3
SELECT employee_id,first_name, last_name, job_id,salary from employees WHERE salary=(SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) from employees ));
#cau 4
SELECT employee_id,first_name, last_name, job_id,salary from employees WHERE salary =(SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees)));

#CAU 5
SELECT  CONCAT(e.first_name," ", e.last_name) as employee, e.salary asemp_sal, CONCAT(m.first_name, ' ', m.last_name) as manager,m.salary as mgr_sal
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id;

#Cau 6
SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, COUNT(*) AS number_of_reportees
FROM employees e
JOIN employees m ON e.employee_id = m.manager_id
GROUP BY manager_name
ORDER BY  number_of_reportees DESC, e.employee_id ASC;

#cau 7
SELECT d.department_name as department_name , count(*) as emp_count from departments d
JOIN employees e ON e.department_id=d.department_id
GROUP BY e.department_id
ORDER BY emp_count  DESC;
 

#cau 8
SELECT YEAR(hire_date) AS hired_year, COUNT(*) AS employees_hired_count
FROM employees
GROUP BY hired_year
ORDER BY employees_hired_count DESC, hired_year ASC;

#cau 9
SELECT MIN(salary) as min_sal , MAX(salary) as max_sal , round(AVG(salary))as avg_sal
from employees;


#cau 10
SELECT 
    CONCAT(first_name, ' ', last_name) AS employee, salary,
    CASE 
        WHEN salary >= 2000 AND salary <5000 THEN 'LOW'
        WHEN salary >= 5000 AND salary < 10000 THEN 'MID'
        ELSE 'HIGHT'
    END AS salary_level
FROM 
    employees
GROUP BY 
    salary_level, employee
ORDER BY 
    employee ASC;  

#cau 11
SELECT CONCAT(first_name, ' ', last_name) AS employee,
       CONCAT( SUBSTR(phone_number, 1, 3),'-',
              SUBSTR(phone_number, 5, 3),'-',
              SUBSTR(phone_number, 9, 4)) AS phone_number
FROM employees;

#cau 12 
SELECT CONCAT(first_name, ' ', last_name) AS employee, hire_date
FROM employees
WHERE hire_date >= '1994-08-01' AND hire_date <= '1994-08-31';


#cau 13
SELECT CONCAT(e.first_name, e.last_name) as name,e.employee_id as employee_id ,d.department_name as deparment, e.department_id as department_id, e.salary as salary
FROM employees e
JOIN departments d on d.department_id =e.department_id 
WHERE e.salary > (SELECT AVG(salary) FROM employees)
ORDER BY department_id ASC; 

#cau 14
SELECT e.department_id, d.department_name asdepartment,  MAX(e.salary) AS maximum_salary
FROM employees e
JOIN departments d on d.department_id=e.department_id
GROUP BY department_id
ORDER BY department_id ASC;
 
#cau 15 
SELECT first_name,last_name,employee_id,salary from employees
ORDER BY salary ASC LIMIT 5; 

#cau 16
SELECT LOWER(first_name )as name ,LOWER(REVERSE(first_name)) AS name_in_reverse from employees;

#cau 17
SELECT employee_id , CONCAT(first_name,' ' , last_name ) as employee  ,hire_date from employees
WHERE DAY(hire_date)>15;

#cau 18
SELECT  CONCAT(e2.first_name, ' ', e2.last_name) AS manager,CONCAT(e1.first_name, ' ', e1.last_name) AS employee,e2.department_id,e1.department_id
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE e1.department_id <> e2.department_id
ORDER BY manager ASC;