CREATE TABLE Employee_TABLE (
        id INT PRIMARY KEY,
        name VARCHAR(30),
        department VARCHAR(30),
        manager_id INT
);

INSERT INTO Employee_TABLE VALUES (101, 'John', 'A', NULL),
                                  (102, 'Dan', 'A', 101),
                                  (103, 'James', 'A', 101),
                                  (104, 'Amy', 'A', 101),
                                  (105, 'Anne', 'A',101),
                                  (106, 'Ron', 'B', 101);

SELECT e1.name FROM Employee_TABLE e1
INNER JOIN Employee_TABLE e2 ON e1.id = e2.manager_id
GROUP BY  e1.id, e1.name
HAVING COUNT(e2.id) >=5;