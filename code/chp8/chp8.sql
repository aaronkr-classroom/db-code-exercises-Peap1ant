-- user, Same, Item, Play, userItem

CREATE TABLE users (
	user_id INT PRIMARY KEY,
	user_name VARCHAR(30) NOT NULL,
	nickname VARCHAR(30) NOT NULL,
	user_level INT,
	join_date DATE
);

CREATE TABLE games (
	game_id INT PRIMARY KEY,
	game_name VARCHAR(30) NOT NULL,
	genrs VARCHAR(30),
	release_date DATE
);

CREATE TABLE items (
	item_id INT PRIMARY KEY,
	item_name VARCHAR(30),
	price INT,
	grade VARCHAR(30) -- 'S'
);

CREATE TABLE plays (
	user_id INT,
	game_id INT,
	start_date DATE,
	play_time INT, -- 시작: Time.now(), 현재: Time.now()
	-- Time.now() = 176864523 - 176854321 = 10202 / 3600
	PRIMARY KEY (user_id, game_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE user_items (
	user_id INT,
	item_id INT,
	acquired_date DATE, 
	quantity INT,
	PRIMARY KEY (user_id, item_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (item_id) REFERENCES items(item_id)
);

TABLE users;
TABLE games;
TABLE items;
TABLE plays;
TABLE user_items;

-- INSERT VALUES
INSERT INTO users VALUES
(1, 'name1', 'nickname1', '10', '2024-01-01'),
(2, 'name2', 'nickname2', '20', '2024-01-02'),
(3, 'name3', 'nickname3', '30', '2024-01-03'),
(4, 'name4', 'nickname4', '40', '2024-01-04'),
(5, 'name5', 'nickname5', '50', '2024-01-05');

INSERT INTO games VALUES
(101, 'game1', 'etc1', '2020-01-01'),
(102, 'game2', 'etc2', '2020-01-02'),
(103, 'game3', 'etc3', '2020-01-03');

INSERT INTO items VALUES
(1001, 'item1', 1000, 'Normal'),
(1002, 'item2', 2000, 'Uncommon'),
(1003, 'item3', 3000, 'Rare'),
(1004, 'item4', 4000, 'Epic'),
(1005, 'item5', 5000, 'Legend');

INSERT INTO plays VALUES
(1, 101, '2026-01-01', 1),
(2, 102, '2026-01-02', 2),
(3, 103, '2026-01-03', 3),
(4, 102, '2026-01-04', 4),
(5, 101, '2026-01-05', 5);

INSERT INTO user_items VALUES
(1, 1001, '2026-01-01', 1),
(2, 1002, '2026-01-02', 2),
(3, 1003, '2026-01-03', 3),
(4, 1002, '2026-01-04', 4),
(5, 1001, '2026-01-05', 5);

TABLE users;
TABLE games;
TABLE items;
TABLE plays;
TABLE user_items;

-- 기본 조회 연습
-- 1. 전체 유저 조회

SELECT * FROM users;

-- 2. 레벨 높은 순서로 조회

SELECT * FROM users
ORDER BY user_level DESC;

-- 3. 레벨이 30 이상인 유저 조회

SELECT * FROM users
WHERE user_level >= 30;

-- 4. 등급 'Legend' 아이템 조회

SELECT * FROM items
WHERE grade = 'Legend';

-- 테이블 수정 할 때 (ALTER TABLE)
-- 1. 게임 회사에서 유저의 이메일도 저장함

ALTER TABLE users
ADD COLUMN email VARCHAR(50);
TABLE users;

-- 2. 유저의 현재 접속 상태를 저장

ALTER TABLE users
ADD COLUMN status_online VARCHAR(10) DEFAULT 'Offline';
TABLE users;

-- 3. 아이템 테이블의 판매 가능 여부를 추가

ALTER TABLE items
ADD COLUMN is_sellable BOOLEAN DEFAULT TRUE;
TABLE items;

-- 4. 게임 테이블에 게임 등급 정보를 추가

ALTER TABLE games
ADD COLUMN age_rating VARCHAR(50);
TABLE games;

-- 테이블에 잇는 값 변경할 때
-- UPDATE

-- 1. 아무 유저의 이메일 추가

UPDATE users
SET email = 'email@random.com'
WHERE user_id = '1';
TABLE users;

-- 2. 아무 유저의 레벨을 25로 조정

UPDATE users
SET user_level = '25'
WHERE user_id = '1';
TABLE users;

-- 3. 모든 유저의 기본 접속 상태를 온라인으로 변경

UPDATE users
SET status_online = 'Online';
TABLE users;


-- 4. 아무 유저의 접속 상태를 연결중으로 변경

UPDATE users
SET status_online = 'Connecting'
WHERE user_id = '3';
TABLE users;

-- 5. 아무 아이템의 가격을 10000으로 조정

UPDATE items
SET price = '10000'
WHERE item_id = '1001';
TABLE items;

-- 6. 아무 게임의 이용 연령 등급을 12세 이상으로 변경

UPDATE games
SET age_rating = '12+'
WHERE game_id = '101';
TABLE games;

--  주의 설명
-- DELETE는 데이터 삭제
-- DROP TABLE 테이블 삭제
-- ALTER TABLE은 데이블 구조 변경
-- UPDATE는 기존 데이터 수정