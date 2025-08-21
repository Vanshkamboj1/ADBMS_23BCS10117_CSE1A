--EASY PROBLEM--

use subqueries
CREATE TABLE EMP(
EMP_ID INT
)
INSERT INTO EMP (EMP_ID) 
VALUES (2), (4), (4), (6), (6), (7), (8), (8);

--SELECT *FROM EMP;


SELECT MAX(EMP_ID)  AS  [single_heghest]FROM EMP 
WHERE EMP_ID NOT IN(
SELECT EMP_ID FROM EMP
GROUP BY EMP_ID
HAVING COUNT(EMP_ID)>1)


--MEDIUM PROMBLEM--

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);


-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

SELECT E.name,E.salary,D.dept_name,D.id
FROM employee AS E
INNER JOIN
department as D
On
E.department_id=D.id
WHERE E.salary IN
(
    SELECT MAX(E2.SALARY)
    FROM employee as E2
    WHERE E2.department_id =E.department_id
)
ORDER BY D.dept_name


--HARD PROBLEM --
CREATE TABLE TABLE1(
 EMPID INT,
 Ename VARCHAR(20),
 Salary INT
)
CREATE TABLE TABLE2(
 EMPID INT,
 Ename VARCHAR(20),
 Salary INT
)

INSERT INTO TABLE1(EMPID,Ename,Salary) VALUES
(1,'AA',1000),
(2,'BB',300);

INSERT INTO TABLE2(EMPID,Ename,Salary) VALUES
(2,'BB',400),
(3,'CC',100);


SELECT EMPID,min(Ename) as Ename,MIN(Salary) as Salary
FROM
(
SELECT *FROM TABLE1 
UNION
SELECT *FROM TABLE2
) AS RES
GROUP BY EMPID

