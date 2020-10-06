Drop View employee_info
Drop View Year_1986
Drop View manager
Drop View emp_dept
Drop View name_search
Drop View Sales
Drop View Sales_Dev
Drop View Last_Names

SELECT * FROM employees;


CREATE VIEW employee_info AS
SELECT e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
   FROM employees e
     LEFT JOIN salaries s ON s.emp_no = e.emp_no;


SELECT * FROM employee_info;


CREATE VIEW Year_1986 AS
SELECT first_name,last_name,hire_date
FROM employees 
Where hire_date between'1986-01-01'and '1986-12-31';

SELECT * FROM Year_1986;



CREATE VIEW manager AS
SELECT d.dept_no,
    dp.dept_name,
    d.emp_no,
    e.last_name,
    e.first_name
   FROM dept_manager d
     LEFT JOIN departments dp 
	 	ON dp.dept_no = d.dept_no
			Left Join employees e
				ON e.emp_no = d.emp_no;

SELECT * FROM manager;		



CREATE VIEW emp_dept AS
SELECT de.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
   FROM dept_emp de
     LEFT JOIN employees e 
	 ON e.emp_no = de.emp_no
	 	LEFT JOIN departments d
		ON d.dept_no = de.dept_no;
		
SELECT * FROM emp_dept;	



CREATE VIEW name_search AS
SELECT  first_name,
    last_name,
    sex
   From employees
   Where first_name LIKE 'Hercules' and last_name LIKE 'B%';
		
SELECT * FROM name_search;



CREATE VIEW Sales AS
SELECT * FROM emp_dept
Where dept_name = 'Sales';	

SELECT * FROM Sales;



CREATE VIEW Sales_Dev AS
SELECT * FROM emp_dept
Where dept_name = 'Sales' or dept_name = 'Development';	

SELECT * FROM Sales_Dev;



CREATE VIEW Last_Names AS
SELECT last_name, Count(last_name) AS "Last_Name_Frequency"
FROM employees
Group By last_name
Order By "Last_Name_Frequency" Desc;

SELECT * FROM Last_Names;

