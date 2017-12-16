--创建早餐店管理系统
--员工类型表
CREATE TABLE staff_type
(
  id       INT(10) PRIMARY KEY AUTO_INCREMENT,
  name     VARCHAR(32) UNIQUE   NOT NULL,
  isdelete INT(1) DEFAULT 1     NOT NULL
);
--员工表
CREATE TABLE staff_info
(
  id       INT(10) PRIMARY KEY AUTO_INCREMENT,
  name     VARCHAR(32)                          NOT NULL,
  username VARCHAR(32) UNIQUE                   NOT NULL,
  password VARCHAR(32)                          NOT NULL,
  type_id  INT(10)                              NOT NULL,
  isdelete INT(1) DEFAULT 1                     NOT NULL,
  CONSTRAINT fk_staff_type_id FOREIGN KEY (type_id)
  REFERENCES staff_type (id)
);
--食品类型
CREATE TABLE food_type
(
  id       INT(10) PRIMARY KEY AUTO_INCREMENT,
  name     VARCHAR(32) UNIQUE      NOT NULL,
  isdelete INT(1) DEFAULT 1        NOT NULL
);
--食品
CREATE TABLE food
(
  id       INT(10) PRIMARY KEY AUTO_INCREMENT,
  name     VARCHAR(32) UNIQUE                  NOT NULL,
  price    FLOAT                               NOT NULL,
  type_id  INT(10)                             NOT NULL,
  isdelete INT(1) DEFAULT 1                    NOT NULL,
  CONSTRAINT fk_food_type_id FOREIGN KEY (type_id)
  REFERENCES food_type (id)
);
--订单主表
-- #mysql 5.65以上支持DATETIME 字段 以下请使用TIMESTAMP
CREATE TABLE order_main
(
  id          INT(10) PRIMARY KEY AUTO_INCREMENT,
  staff_id    INT(10)                                 NOT NULL,
  create_DATE DATETIME DEFAULT now()                  NOT NULL,
  isdelete    INT(1) DEFAULT 1                        NOT NULL,
  CONSTRAINT fk_staff_info_id FOREIGN KEY (staff_id)
  REFERENCES staff_info (id)
);
--订单详细表
CREATE TABLE order_list
(
  id       INT(10) PRIMARY KEY AUTO_INCREMENT,
  order_id INT(10)                            NOT NULL,
  food_id  INT(10)                            NOT NULL,
  food_number   INT(10)                            NOT NULL,
  isdelete INT(1) DEFAULT 1                   NOT NULL,
  CONSTRAINT fk_order_main_id FOREIGN KEY (order_id)
  REFERENCES order_main (id),
  CONSTRAINT fk_food_id FOREIGN KEY (food_id)
  REFERENCES food (id)
);

--添加数据
--用户类型
INSERT INTO staff_type (name) VALUES ('管理员');
INSERT INTO staff_type (name) VALUES ('店长');
INSERT INTO staff_type (name) VALUES ('店员');
INSERT INTO staff_type (name) VALUES ('顾客');

--用户
INSERT INTO staff_info (name, username, password, type_id)
VALUES
  ('牛逼闪闪的管理员', 'admin', 'password',
   1);

--食品类型
INSERT INTO food_type (name)
VALUES ('包子');
INSERT INTO food_type (name)
VALUES ('馒头');
INSERT INTO food_type (name)
VALUES ('饺子');
INSERT INTO food_type (name)
VALUES ('面条');
INSERT INTO food_type (name)
VALUES ('米饭');
INSERT INTO food_type (name)
VALUES ('饮料');
INSERT INTO food_type (name)
VALUES ('酒');
INSERT INTO food_type (name)
VALUES ('茶');

--食品
INSERT INTO food (name, price, type_id)
VALUES ('猪肉包子', 2, 1);
INSERT INTO food (name, price, type_id)
VALUES ('鸡肉包子', 2, 1);
INSERT INTO food (name, price, type_id)
VALUES ('白面馒头', 1, 2);
INSERT INTO food (name, price, type_id)
VALUES ('荞麦馒头', 2, 2);
INSERT INTO food (name, price, type_id)
VALUES ('猪肉白菜水饺', 9, 3);
INSERT INTO food (name, price, type_id)
VALUES ('红油抄手', 6, 3);
INSERT INTO food (name, price, type_id)
VALUES ('麻油拌面', 5, 4);
INSERT INTO food (name, price, type_id)
VALUES ('雪菜肉丝面', 8, 4);

