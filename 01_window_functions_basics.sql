CREATE employee_db;

SHOW TABLES;

USE employee_db;

SELECT * FROM employee_data;

/*=========================================================
Add a new numeric column to store cleaned salary values
=========================================================*/

ALTER TABLE employee_data
ADD COLUMN salary_numeric BIGINT;

/*=========================================================
Convert Annual Salary from text format
(e.g. "$120,000") to numeric format
=========================================================*/

UPDATE employee_data
SET salary_numeric =
CASE
    WHEN `Annual Salary` IS NULL
         OR `Annual Salary` = ''
    THEN NULL
    ELSE CAST(
            REPLACE(
                REPLACE(`Annual Salary`, '$', ''),
                ',',
                ''
            ) AS UNSIGNED
         )
END;

/*=========================================================
Verify the results
=========================================================*/

SELECT `Annual Salary`,
       salary_numeric
FROM employee_data;
/*=========================================================
Question 1: Department Average Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_avg_salary

Requirements:
- Show every employee.
- Calculate the average salary within the employee's department.
- Use a window function.
- Do not use GROUP BY.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       AVG(salary_numeric) OVER(PARTITION BY Department) AS department_avg_salary
FROM employee_data;



/*=========================================================
Question 2: Department Total Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_total_salary

Requirements:
- Show every employee.
- Calculate the total salary paid within the employee's department.
- Use a window function.
- Do not use GROUP BY.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       SUM(salary_numeric) OVER(PARTITION BY Department) AS department_total_salary
FROM employee_data;



/*=========================================================
Question 3: Department Maximum Salary And Minimum Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_max_salary

Requirements:
- Show every employee.
- Display the highest salary in the employee's department.
- Use a window function.
- Do not use GROUP BY.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       MAX(salary_numeric) OVER(PARTITION BY Department) AS department_max_salary
FROM employee_data;

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       MIN(salary_numeric) OVER(PARTITION BY Department) AS department_max_salary
FROM employee_data;

/*=========================================================
Question 4: Salary Rank Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- salary_rank_department

Requirements:
- Rank employees by salary within each department.
- Highest salary should receive rank 1.
- Employees with the same salary should receive the same rank.
- Ranking should contain gaps after ties.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       RANK() OVER(
           PARTITION BY Department
           ORDER BY salary_numeric DESC
       ) AS salary_rank_department
FROM employee_data;

/*=========================================================
Question 5: Dense Salary Rank Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- salary_dense_rank_department

Requirements:
- Rank employees by salary within each department.
- Highest salary should receive rank 1.
- Employees with the same salary should receive the same rank.
- Ranking should NOT contain gaps after ties.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       DENSE_RANK() OVER(
           PARTITION BY Department
           ORDER BY salary_numeric DESC
       ) AS salary_dense_rank_department
FROM employee_data;
