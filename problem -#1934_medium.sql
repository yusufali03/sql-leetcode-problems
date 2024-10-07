 CREATE TABLE Signups(
     user_id INT UNIQUE ,
     time_stamp DATETIME
 );

CREATE TABLE Confirmations(
    user_id INT,
    time_stamp DATETIME,
    action ENUM('confirmed', 'timeout')
);

INSERT INTO Signups VALUES (7, '2020-01-04 13:57:59'),
                           (2,'2020-07-29 23:09:44'),
                           (6, '2020-12-09 10:39:37');

SELECT * FROM Signups;

INSERT INTO Confirmations VALUES (3,'2021-01-06 03:30:46','timeout'),
                                 (3, '2021-07-14 14:00:00','timeout'),
                                 (7, '2021-06-12 11:57:29', 'confirmed'),
                                 (7, '2021-06-13 12:58:28', 'confirmed'),
                                 (7, '2021-06-14 13:59:27', 'confirmed'),
                                 (2, '2021-01-22 00:00:00', 'confirmed'),
                                 (2, '2021-02-28 23:59:59', 'timeout');

SELECT * FROM Confirmations;

SELECT S.user_id,
       COALESCE(ROUND(SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END ) / COUNT(C.user_id), 2), 0) AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C on S.user_id = C.user_id
GROUP BY user_id;