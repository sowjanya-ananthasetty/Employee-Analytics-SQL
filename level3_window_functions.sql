/*=========================================================
QUESTION 1: Department Average Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_avg_salary

Requirements:
- Show every employee.
- Calculate average salary within each department.
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
QUESTION 2: Department Total Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_total_salary

Requirements:
- Show every employee.
- Calculate total salary within each department.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       SUM(salary_numeric) OVER(PARTITION BY Department) AS department_total_salary
FROM employee_data;


/*=========================================================
QUESTION 3: Department Maximum Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_max_salary

Requirements:
- Show highest salary within each department.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       MAX(salary_numeric) OVER(PARTITION BY Department) AS department_max_salary
FROM employee_data;


/*=========================================================
QUESTION 4: Department Minimum Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- department_min_salary

Requirements:
- Show lowest salary within each department.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       MIN(salary_numeric) OVER(PARTITION BY Department) AS department_min_salary
FROM employee_data;


/*=========================================================
QUESTION 5: Employee Count Per Department

Display:
- Employee ID
- Full Name
- Department
- department_employee_count

Requirements:
- Count employees within each department.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       COUNT(*) OVER(PARTITION BY Department) AS department_employee_count
FROM employee_data;


/*=========================================================
QUESTION 6: Average Salary By Gender

Display:
- Employee ID
- Full Name
- Gender
- salary_numeric
- gender_avg_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Gender,
       salary_numeric,
       AVG(salary_numeric) OVER(PARTITION BY Gender) AS gender_avg_salary
FROM employee_data;


/*=========================================================
QUESTION 7: Average Salary By Country

Display:
- Employee ID
- Full Name
- Country
- salary_numeric
- country_avg_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Country,
       salary_numeric,
       AVG(salary_numeric) OVER(PARTITION BY Country) AS country_avg_salary
FROM employee_data;


/*=========================================================
QUESTION 8: Total Salary By Business Unit

Display:
- Employee ID
- Full Name
- Business Unit
- salary_numeric
- business_unit_total_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       `Business Unit`,
       salary_numeric,
       SUM(salary_numeric) OVER(PARTITION BY `Business Unit`) AS business_unit_total_salary
FROM employee_data;


/*=========================================================
QUESTION 9: Salary Rank Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- salary_rank_department

Requirements:
- Highest salary should get Rank 1.
- Equal salaries share the same rank.
- Rank should skip numbers after ties.
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
QUESTION 10: Dense Salary Rank Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- salary_dense_rank_department

Requirements:
- Highest salary should get Rank 1.
- Equal salaries share the same rank.
- No gaps after ties.
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


/*=========================================================
QUESTION 11: Row Number Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- salary_row_number_department

Requirements:
- Highest salary should get Row Number 1.
- Every row gets a unique number.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       ROW_NUMBER() OVER(
           PARTITION BY Department
           ORDER BY salary_numeric DESC
       ) AS salary_row_number_department
FROM employee_data;


/*=========================================================
QUESTION 12: Previous Salary

Display:
- Employee ID
- Full Name
- salary_numeric
- previous_salary

Requirements:
- Show previous employee salary based on salary order.
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       salary_numeric,
       LAG(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) AS previous_salary
FROM employee_data;


/*=========================================================
QUESTION 13: Previous Salary Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- previous_salary_in_department
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       LAG(salary_numeric) OVER(
           PARTITION BY Department
           ORDER BY salary_numeric
       ) AS previous_salary_in_department
FROM employee_data;


/*=========================================================
QUESTION 14: Next Salary

Display:
- Employee ID
- Full Name
- salary_numeric
- next_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       salary_numeric,
       LEAD(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) AS next_salary
FROM employee_data;


/*=========================================================
QUESTION 15: Next Salary Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- next_salary_in_department
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       LEAD(salary_numeric) OVER(
           PARTITION BY Department
           ORDER BY salary_numeric
       ) AS next_salary_in_department
FROM employee_data;


/*=========================================================
QUESTION 16: Previous And Next Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- previous_salary
- next_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       LAG(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) AS previous_salary,
       LEAD(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) AS next_salary
FROM employee_data;


/*=========================================================
QUESTION 17: Salary Difference From Previous Employee

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- salary_difference
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       salary_numeric -
       LAG(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) AS salary_difference
FROM employee_data;


/*=========================================================
QUESTION 18: Salary Growth Within Department

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- previous_salary_in_department
- salary_growth
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       LAG(salary_numeric) OVER(
           PARTITION BY Department
           ORDER BY salary_numeric
       ) AS previous_salary_in_department,
       salary_numeric -
       LAG(salary_numeric) OVER(
           PARTITION BY Department
           ORDER BY salary_numeric
       ) AS salary_growth
FROM employee_data;


/*=========================================================
QUESTION 19: Difference To Next Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- difference_to_next_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       LEAD(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) - salary_numeric AS difference_to_next_salary
FROM employee_data;


/*=========================================================
QUESTION 20: Difference From Previous Salary

Display:
- Employee ID
- Full Name
- Department
- salary_numeric
- difference_from_previous_salary
=========================================================*/

SELECT `Employee ID`,
       `Full Name`,
       Department,
       salary_numeric,
       salary_numeric -
       LAG(salary_numeric) OVER(
           ORDER BY salary_numeric
       ) AS difference_from_previous_salary
FROM employee_data;
