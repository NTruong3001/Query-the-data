#cau 2
SELECT employee_id,first_name,last_name ,job_id,salary  FROM employees where salary = (SELECT MAX(salary) FROM employees);