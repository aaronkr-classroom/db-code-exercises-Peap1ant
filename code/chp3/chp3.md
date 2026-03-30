# 1. 주제

"Club"

# 2. 요구사항

## 사용자

 - 동아리 회장(동아리 및 회원 관리)
 - 일반 회원(동아리 가입 및 활동)

## 요구사항

 - 동아리 정보 등록 및 조회가 가능해야함
 - 회원 정보를 등록하고 조회가 가능해야함
 - 회원이 어느 동아리에 소속되었는지 확인 가능해야함
 - 동아리별 회원 목록을 조회 가능해야함
 - 특정 조건 기준으로 검색 가능해야함

# 3. 데이터 설계

\[Entity: Club\]

club_id: SERIAL # Club ID
slub_name: VARCHAR(30) # Club name
category: VARCHAR(30) # Club category
founded_date: DATE # Date of club foundering

\[Entity: Member\]

member_id: SERIAL # Id of member
name: VARCHAR(30) # Name of member
student_id: VARCHAR(10) # Student id of member
role: VARCHAR(20) # Member's role in club
join_date: DATE # Join date of club
club_id: INT # Club id

# 4. SQL 
```sql
-- 테이블 생성
CREATE TABLE Club (
    club_id SERIAL  PRIMARY KEY,
    club_name   VARCHAR(30) NOT NULL,
    category    VARCHAR(20) NOT NULL,
    founded_date    DATE    NOT NULL
);

CREATE TABLE Member (
    member_id   SERIAL   PRIMARY KEY,
    name    VARCHAR(20)  NOT NULL,
    student_id  VARCHAR(10)  NOT NULL,
    role    VARCHAR(10)  DEFAULT '부원',
    join_date   DATE NOT NULL,
    club_id INT  REFERENCES Club(club_id)
);

-- 데이터 삽입 - Club
INSERT INTO Club (club_name, category, founded_date) VALUES
    ('코딩클럽', '학술', '2020-03-02'),
    ('농구부', '스포츠', '2018-09-01'),
    ('사진동아리', '문화', '2021-03-05');

-- 데이터 삽입 - Member (5개 이상)
INSERT INTO Member (name, student_id, role, join_date, club_id) VALUES
    ('김민준', '2021001', '회장', '2021-03-10', 1),
    ('이서연', '2022003', '부원', '2022-03-15', 1),
    ('박지호', '2020010', '회장', '2020-09-05', 2),
    ('최유나', '2023007', '부원', '2023-03-08', 2),
    ('정하은', '2021015', '부원', '2021-04-01', 3),
    ('한도윤', '2022020', '회장', '2022-03-20', 3);

-- a. 전체 조회
SELECT * FROM Club;
SELECT * FROM Member;

-- b. 정렬 (가입일 오래된 순)
SELECT * FROM Member
ORDER BY join_date ASC;

-- c. 조건 검색 (회장만 조회)
SELECT * FROM Member
WHERE role = '회장';
```