## 실습

1. 다음과 같은 관계성을 가지는 테이블을 생성하고, 아래 물음에 답하시오.
![image](https://user-images.githubusercontent.com/46713032/81185978-3e17f500-8fed-11ea-8d89-df64443e2b77.png)

```
CREATE TABLE 건물 (
번호 INT PRIMARY KEY AUTO_INCREMENT,
이름 VARCHAR(255) NOT NULL,
주소 VARCHAR(255) NOT NULL
);
```

![image](https://user-images.githubusercontent.com/46713032/81186044-51c35b80-8fed-11ea-8f34-e26b726b1b47.png)

```
INSERT INTO 건물(이름, 주소)
VALUES ('대양AI센터','세종대학교'),
('차세대에너지센터', '서울대학교'),
('블록체인서비스연구센터', '중앙대학교');
```

![image](https://user-images.githubusercontent.com/46713032/81186090-6142a480-8fed-11ea-804a-9787c11dafcb.png)

```
CREATE TABLE 방 (
방번호 INT PRIMARY KEY AUTO_INCREMENT,
방이름 VARCHAR(255) NOT NULL,
건물번호 INT NOT NULL,
FOREIGN KEY (건물번호)
REFERENCES 건물 (번호)
);
```

![image](https://user-images.githubusercontent.com/46713032/81186163-74557480-8fed-11ea-8b59-9a253e8fbf73.png)

```
INSERT INTO 방(방이름, 건물번호)
VALUES ('B111',1), ('B110',1), ('B112',1), ('A1201',2), ('C622',3);
```

![image](https://user-images.githubusercontent.com/46713032/81186193-7ddedc80-8fed-11ea-954b-573d55a8d85a.png)


2. '건물' 테이블에서 번호가 '2'인 건물을 삭제하여라.

```ALTER TABLE `방` DROP FOREIGN KEY `방_ibfk_1`;```

![image](https://user-images.githubusercontent.com/46713032/81186357-a2d34f80-8fed-11ea-8d96-a84201f1bdc2.png)

```DELETE FROM 건물 WHERE 번호 = 2;```

![image](https://user-images.githubusercontent.com/46713032/81186375-ab2b8a80-8fed-11ea-83c0-81c3f0b0b656.png)


3. '방' 테이블에서 건물번호가 '1'인 방들의 건물번호를 '4'로 수정하여라.

```
ALTER TABLE 건물 ADD FOREIGN KEY (번호) REFERENCES 방 (건물번호)
ON DELETE CASCADE ON UPDATE CASCADE;
UPDATE 방 SET 건물번호 = 4 WHERE 건물번호 = 1;
```

![image](https://user-images.githubusercontent.com/46713032/81186452-c3030e80-8fed-11ea-98d4-8883e9bfbaf9.png)

```
