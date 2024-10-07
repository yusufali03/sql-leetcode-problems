CREATE TABLE Activity_med(
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,

    PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activity_med VALUES (1,2,'2016-03-01', 5),
                                (1,2,'2016-03-02',6),
                                (2,3,'2017-06-25', 1),
                                (3, 1, '2016-03-02', 0),
                                (3, 4,'2018-07-03',5);

SELECT * FROM Activity_med;

SELECT
    ROUND(
         (SELECT COUNT(DISTINCT a.player_id)
         FROM Activity_med a
         WHERE EXISTS(SELECT 1
                      FROM Activity_med b
                      WHERE a.player_id = b.player_id
                        AND b.event_date = DATE_ADD(
                            (SELECT MIN(event_date)
                            FROM Activity_med c
                          WHERE c.player_id = a.player_id), INTERVAL 1 DAY))
                      ) / (SELECT COUNT(DISTINCT player_id) FROM Activity_med),2
    ) AS fraction


