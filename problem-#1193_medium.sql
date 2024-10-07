CREATE TABLE Transactions_Monthly(
    id INT PRIMARY KEY ,
    country VARCHAR(30),
    state ENUM('approved', 'declined'),
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions_Monthly VALUES (121, 'US','approved', 1000, '2018-12-18'),
                                        (122, 'US', 'declined', 2000, '2018-12-19'),
                                        (123, 'US', 'approved', 2000, '2019-01-01'),
                                        (124, 'DE', 'approved', 2000, '2019-01-07');
SELECT * FROM Transactions_Monthly;

SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
      country,
      COUNT(*) AS trans_count,
      SUM(CASE WHEN state ='approved' THEN 1 ELSE 0 END) AS approved_count,
      SUM(amount) AS trans_total_amount,
      SUM(CASE WHEN state ='approved' THEN amount ELSE 0 END ) AS approved_total_amount
FROM Transactions_Monthly
GROUP BY month, country
ORDER BY month;
