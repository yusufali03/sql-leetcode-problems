CREATE TABLE  Sales_3(
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,

    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (product_id) REFERENCES Product_3(product_id)
);


CREATE TABLE Product_3(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(30)
);

INSERT INTO Sales_3 VALUES (1,100,2008,10,5000),
                           (2,100,2009,12,5000),
                           (7,200,2011,15,9000);

INSERT INTO Product_3 VALUES (100, 'Nokia'),
                             (200, 'Apple'),
                             (300, 'Samsung');

SELECT * FROM Product_3;
SELECT * FROM Sales_3;

SELECT S.product_id, S.year AS first_year, S.quantity, S.price
FROM Sales_3 S
INNER JOIN(
    SELECT product_id, MIN(year) AS first_year
    FROM Sales_3
    GROUP BY product_id
    ) F
        ON S.product_id = F.product_id AND S.year = F.first_year
WHERE S.year
