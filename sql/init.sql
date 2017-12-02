--创建早餐店管理系统
--员工类型表
CREATE TABLE staff_type
(
  id       NUMBER(10) PRIMARY KEY,
  name     VARCHAR2(32) UNIQUE   NOT NULL,
  isdelete NUMBER(1) DEFAULT (1) NOT NULL
);
--员工表
CREATE TABLE staff_info
(
  id       NUMBER(10) PRIMARY KEY,
  name     VARCHAR2(32)                          NOT NULL,
  username VARCHAR2(32) UNIQUE                   NOT NULL,
  password VARCHAR2(32)                          NOT NULL,
  type_id  NUMBER(10) REFERENCES staff_type (id) NOT NULL,
  isdelete NUMBER(1) DEFAULT (1)                 NOT NULL
);
--食品类型
CREATE TABLE food_type
(
  id       NUMBER(10) PRIMARY KEY,
  name     VARCHAR2(32) UNIQUE      NOT NULL,
  isdelete NUMBER(1) DEFAULT (1)    NOT NULL
);
--食品
CREATE TABLE food
(
  id       NUMBER(10) PRIMARY KEY,
  name     VARCHAR2(32) UNIQUE                  NOT NULL,
  price    NUMBER(10, 2)                        NOT NULL,
  typeid   NUMBER(10) REFERENCES food_type (id) NOT NULL,
  isdelete NUMBER(1) DEFAULT (1)                NOT NULL
);
--订单主表
CREATE TABLE order_main
(
  id          NUMBER(10) PRIMARY KEY,
  staff_id    NUMBER(10) REFERENCES staff_info (id) NOT NULL,
  create_DATE DATE DEFAULT (SYSDATE)                NOT NULL,
  isdelete    NUMBER(1) DEFAULT (1)                 NOT NULL
);
--订单详细表
CREATE TABLE order_list
(
  id       NUMBER(10) PRIMARY KEY,
  order_id NUMBER(10) REFERENCES order_main(id)  NOT NULL,
  food_id  NUMBER(10) REFERENCES food (id)       NOT NULL,
  food_number NUMBER(10)                         NOT NULL,
  isdelete NUMBER(1) DEFAULT (1)                 NOT NULL
);

----员工类型序列
CREATE SEQUENCE staff_type_seq
START WITH 1
INCREMENT BY 1
CACHE 10;
--员工表序列
CREATE SEQUENCE staff_info_seq
START WITH 1
INCREMENT BY 1
CACHE 10;
--食品类型序列
CREATE SEQUENCE food_type_seq
START WITH 1
INCREMENT BY 1
CACHE 10;
--食品序列
CREATE SEQUENCE food_seq
START WITH 1
INCREMENT BY 1
CACHE 10;
--订单主表序列
CREATE SEQUENCE order_main_seq
START WITH 1
INCREMENT BY 1
CACHE 10;
--订单详细表序列
CREATE SEQUENCE order_list_seq
START WITH 1
INCREMENT BY 1
CACHE 10;

--添加数据
--用户类型
INSERT INTO staff_type (id, name) VALUES (staff_type_seq.nextval, '管理员');
INSERT INTO staff_type (id, name) VALUES (staff_type_seq.nextval, '店长');
INSERT INTO staff_type (id, name) VALUES (staff_type_seq.nextval, '店员');
INSERT INTO staff_type (id, name) VALUES (staff_type_seq.nextval, '顾客');

--用户
INSERT INTO staff_info (id, name, username, password, type_id)
VALUES (staff_info_seq.nextval,'牛逼闪闪的管理员','admin','password',1);

--食品类型
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'包子');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'馒头');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'饺子');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'面条');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'米饭');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'饮料');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'酒');
INSERT INTO food_type (id, name) VALUES (food_type_seq.nextval,'茶');

--食品
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'猪肉包子',2,1);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'鸡肉包子',2,1);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'白面馒头',1,2);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'荞麦馒头',2,2);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'猪肉白菜水饺',9,3);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'红肉抄手',6,3);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'麻油拌面',5,4);
INSERT INTO food (id, name, price, typeid) VALUES (food_seq.nextval,'雪菜肉丝面',8,4);

