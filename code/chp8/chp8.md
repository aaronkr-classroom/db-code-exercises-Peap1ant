# **Chp 8 Exercise**

# **수업 실습 예제: 게임 관리 데이터베이스**

## **1\. 요구사항**

게임 회사는 유저, 게임, 아이템, 유저의 아이템 보유 내역을 관리하려고 한다.

요구사항은 다음과 같다.

1. 유저는 유저ID, 이름, 닉네임, 레벨, 가입일 정보를 가진다.  
2. 게임은 게임ID, 게임명, 장르, 출시일 정보를 가진다.  
3. 아이템은 아이템ID, 아이템명, 가격, 등급 정보를 가진다.  
   1. 한 유저는 여러 게임을 플레이할 수 있다. (m:n)  
   2. 한 게임은 여러 유저가 플레이할 수 있다. (m:n)  
   3. 유저가 게임을 플레이한 시작일과 총 플레이 시간을 저장한다.  
      1. 한 유저는 여러 아이템을 가질 수 있다. (m:n)  
      2. 하나의 아이템은 여러 유저가 가질 수 있다. (m:n)  
      3. 유저가 아이템을 획득한 날짜와 수량을 저장한다.

---

# **2\. 엔티티와 속성**

## **유저(User)**

속성: 설명

1. user\_id \- PK  
2. user\_name \-  
3. nickname \-  
4. user\_level \-  
5. join\_date \- 

## **게임(Game)**

속성: 설명

1. game\_id \- PK  
2. game\_name   
3. genre  
4. release\_date

## **아이템(Item)**

속성: 설명

1. item\_id \- PK  
2. item\_name  
3. item\_price  
4. item\_grade

# **3\. 관계 정리**

| 관계 | 관계 유형 | 변환 방법 |
| :---- | :---- | :---- |
| 유저:게임 | m:n | 새로운 개체 Play 테이블 생성 |
| 유저:아이템 | m:n | 새로운 개체 UserItem 테이블 |

핵심 설명:

M:N 관계는 직접 테이블로 표현할 수 없으므로 중간 테이블을 만든다.

# **2b. 새로운 엔티티와 속성**

## **Play**

속성: 설명

1. user\_id \- FK  
2. game\_id \- FK  
3. start\_date  
4. play\_time

## **UserItem**

속성: 설명

1. user\_id \- FK  
2. item\_id \- FK  
3. acquired\_date   
4. quantity

# **4\. 릴레이션 스키마**

User( user\_id, user\_name, nickname, user\_level, join\_date )

Game( game\_id, game\_name, genre, release\_date )

Item( item\_id, item\_name, item\_price, item\_grade)

Play( user\_id (FK), game\_id (FK), start\_date, play\_time )

UserItem( user\_id (FK), item\_id (FK), acquired\_date, quantity )

# **5\. 최초 테이블 생성 SQL**

CREATE TABLE users (  
	…  
)

# **6\. 데이터 입력**

INSERT INTO users VALUES  
( … )  
