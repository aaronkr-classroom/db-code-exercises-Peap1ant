# 📄 ER 모델 연습 2
Scenario 2 — 게임 유저 관리 시스템

## 1. Scenario 이해
게임 시스템에서 유저는 계정을 가지고 캐릭터를 생성합니다.
캐릭터는 아이템을 가질 수 있습니다.

## 2. Entity 도출
✏️ Answer:
1. User
2. Charater
3. Item
4. Inventory

## 3. 개념 구분
유저(User)와 캐릭터(Character)는 어떻게 다른가?
✏️ Answer: 유저는 현실 사람의 계정, 캐릭터는 게임 세계 내의 개체임

## 4. Attributes 정의
User
Attributes:
- username
- email
- password_hash
- created_at
PK: user_id

Character
Attributes:
- user_id(FK)
- name
- level
- job
PK: character_id

Item
Attributes:
- item_name
- item_type
PK: item_id

## 5. M:N 관계 해결
캐릭터와 아이템 사이의 관계는?
✏️ Answer: N:M relation, needs entity for both entity.
Type: N:M relation
Reason: Charater can have many item at once, and one type of item can be earned by many charater.

새로운 개체 생성
Name:
- Inventory
Attributes:
- charater_id(FK)
- item_id(FK)
- quantity
- equipped
PK: inventory_id

## 6. 관계 정의
| Entity A | Entity B | Relationship | Type |
| --- | --- | --- | --- |
| User | Character | Creates | 1:N |
| Charater | Inventory | Has | 1:N |
| Item | Inventory | Included in | 1:N |

## 7. ER 다이어그램 만들기

Check [HW_ER.png](./HW_ER.png)

## 8. SQL 작성
-- User

```sql
CREATE TABLE User (
    user_id     INT          PRIMARY KEY AUTO_INCREMENT,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    email       VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at  DATETIME     DEFAULT CURRENT_TIMESTAMP
);
```

-- Character

```sql
CREATE TABLE Character (
    character_id INT         PRIMARY KEY AUTO_INCREMENT,
    user_id      INT         NOT NULL,
    name         VARCHAR(50) NOT NULL,
    level        INT         DEFAULT 1,
    job          VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);
```

-- Item

```sql
CREATE TABLE Item (
    item_id      INT         PRIMARY KEY AUTO_INCREMENT,
    item_name    VARCHAR(100) NOT NULL,
    item_type    VARCHAR(30)
);
```

-- Inventory

```sql
CREATE TABLE Inventory (
    inventory_id  INT  PRIMARY KEY AUTO_INCREMENT,
    character_id  INT  NOT NULL,
    item_id       INT  NOT NULL,
    quantity      INT  DEFAULT 1,
    equipped      BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id)      REFERENCES Item(item_id)
);
```

# 🧠 Reflection (중요)

## 1. 공통점
두 시나리오의 공통점은 무엇인가?
✏️ Answer: 현실 세계의 정보를 개체와 관계로 추상화하는 ER 모델링을 따름.

## 2. 핵심 개념
M:N 관계는 어떻게 해결하는가?
✏️ Answer: 관계형 DB에서 표현 불가하니, 교차 엔티티를 이용해 해결함.

## 3. 가장 어려웠던 점
가장 어려웠던 부분은 무엇인가?
✏️ Answer: M:N 관계를 파악하고, 해당 개체 생성 과정이 어려웠다. 또한 ER 다이어그램 그리기도 조금 까다로웠다.