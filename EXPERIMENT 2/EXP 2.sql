----------exp 2

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    ManagerID INT NULL  -- Self-reference to EmpID
);


ALTER TABLE Employee
ADD CONSTRAINT FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID);


-- Insert data into Employee table
INSERT INTO Employee (EmpID, EmpName, Department, ManagerID)
VALUES
(1, 'Alice', 'HR', NULL),        -- Top-level manager
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

SELECT E1.EmpName AS[Employee Name],E1.Department AS[EMployeeDept],E2.EmpName AS [ManagerName],E2.Department AS[MangaerDept]
FROM Employee AS E1
LEFT JOIN
Employee AS E2
ON
E1.ManagerID = E2.EmpID
/* We can use any join at place of self join because no keyword for self join*/
CREATE TABLE YEAR_TABLE(
ID INT,
YEAR INT,
NPV INT
);
INSERT INTO YEAR_TABLE(ID,YEAR,NPV)
VALUES
(1,2018,100),
(7,2020,30),
(13,2019,40),
(1,2019,13),
(2,2008,121),
(3,2009,12),
(11,2020,99),
(7,2019,0);

CREATE TABLE QUERIES_TABLE(
ID INT,
YEAR INT
);
INSERT INTO QUERIES_TABLE( ID,YEAR)
VALUES
(1,2019),
(2,2008),
(3,2009),
(7,2018),
(7,2019),
(7,2020),
(13,2019);

SELECT Q.ID,Q.YEAR,ISNULL(Y.NPV,0) AS[NPV]
FROM QUERIES_TABLE AS Q
LEFT OUTER JOIN
YEAR_TABLE AS Y
ON 
Q.ID = Y.ID
AND
Y.YEAR = Q.YEAR
