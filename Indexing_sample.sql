CREATE TABLE Players(
    id INT AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(50),
    age INT,
    date_birth DATE,
    nationality VARCHAR(50),
    height INT,
    weight INT,
    club VARCHAR(50),
    international_rep INT,
    overall_rating INT,
    team_jersey_number INT,
    physic INT
);

SELECT * FROM Players;
INSERT INTO Players (name, age, date_birth, nationality, height, weight, club, international_rep, overall_rating, team_jersey_number, physic)
SELECT short_name, age, dob, nationality, height_cm, weight_kg, club, international_reputation, overall, team_jersey_number, physic
FROM players_2;

CREATE INDEX idx_Players ON Players (age ASC)

