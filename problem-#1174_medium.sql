CREATE TABLE Delivery(
    delivery_id INT UNIQUE ,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

INSERT INTO Delivery VALUES (1,1,'2019-08-01', '2019-08-02'),
                            (2,2, '2019-08-02', '2019-08-02'),
                            (3,1,'2019-08-11', '2019-08-12'),
                            (4,3,'2019-08-24','2019-08-24'),
                            (5,3, '2019-08-21', '2019-08-22'),
                            (6,2, '2019-08-11', '2019-08-13'),
                            (7,4, '2019-08-09', '2019-08-09');
SELECT * FROM Delivery;

WITH FirstOrders AS (SELECT customer_id, MIN(order_date) AS first_order_date
                     FROM Delivery
                     GROUP BY customer_id
                     )
SELECT
ROUND(
        SUM(CASE WHEN D.order_date = D.customer_pref_delivery_date THEN 1 ELSE  0 END) *100 / COUNT(*), 2
) AS immediate_percentage
FROM Delivery D
JOIN FirstOrders F
ON D.customer_id = F.customer_id AND D.order_date = F.first_order_date;



