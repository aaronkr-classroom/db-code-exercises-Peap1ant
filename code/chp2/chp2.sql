/*
[Entity: Player]

player_id(Primal Key): SERIAL # User AID
username: VARCHAR(30) # User name
level: INT # User current level
score: INT # Total score of user
character_class: VARCHAR(20) # Class of character
join_date_ DATE # Join date

For ER Diagram, check chp2ER.png at same directory.
*/

-- 테이블 생성
CREATE TABLE Player (
    player_id   SERIAL   PRIMARY KEY,
    username    VARCHAR(30)  NOT NULL,
    level   INT  DEFAULT 1,
    score   INT  DEFAULT 0,
    character_class VARCHAR(20) NOT NULL,
    join_date   DATE NOT NULL
);

-- 데이터 삽입
INSERT INTO Player (username, level, score, character_class, join_date) VALUES
    ('DragonSlayer', 45, 98200, '전사', '2024-01-15'),
    ('ShadowMage', 32, 75400, '마법사', '2024-03-02'),
    ('ArrowQueen', 28, 61000, '궁수', '2024-05-20'),
    ('HolyPriest', 51, 112300,'성직자', '2023-11-08'),
    ('NightRogue', 19, 34500, '도적', '2025-01-30'),
    ('IronKnight', 60, 140000,'전사', '2023-07-14');

-- a. 전체 조회
SELECT * FROM Player;

-- b. 정렬 (레벨 높은 순)
SELECT * FROM Player
ORDER BY level DESC;

-- c. 조건 검색 (레벨 30 이상인 유저)
SELECT * FROM Player
WHERE level >= 30;