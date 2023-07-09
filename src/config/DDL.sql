-- auto-generated definition
CREATE TABLE t_users
(
    user_id     INT AUTO_INCREMENT COMMENT '用户id'
        PRIMARY KEY,
    user_name   VARCHAR(20)                        NOT NULL COMMENT '用户名',
    user_pwd    VARCHAR(100)                       NOT NULL COMMENT '用户密码',
    phone       VARCHAR(11)                        NOT NULL COMMENT '手机号',
    create_date DATETIME DEFAULT CURRENT_TIMESTAMP NULL COMMENT '创建时间'
);

-- auto-generated definition
CREATE TABLE t_batch
(
    batch_id     INT AUTO_INCREMENT COMMENT '批次ID'
        PRIMARY KEY,
    batch_number INT NULL COMMENT '批次编号',
    batch_status INT NOT NULL COMMENT '批次状态',
    CONSTRAINT batch_number
        UNIQUE (batch_number)
);

-- auto-generated definition
CREATE TABLE t_buy
(
    buy_id         INT AUTO_INCREMENT COMMENT '唯一id'
        PRIMARY KEY,
    buy_date       DATE           NOT NULL COMMENT '购买日期',
    buy_quantity   INT            NOT NULL COMMENT '购买数量',
    buy_variety    VARCHAR(20)    NOT NULL COMMENT '购买品种',
    buy_price      DOUBLE         NOT NULL COMMENT '购买价格',
    buy_address    VARCHAR(100)   NULL COMMENT '购买地址',
    average_weight DECIMAL(10, 2) NOT NULL COMMENT '平均重量',
    beyond_price   DOUBLE         NULL COMMENT '超出标准重量价格',
    total_money    DECIMAL(10, 2) NOT NULL COMMENT '购买总金额',
    batch_number   INT            NOT NULL COMMENT '批次号',
    CONSTRAINT t_buy_ibfk_1
        FOREIGN KEY (batch_number) REFERENCES t_batch (batch_number)
);

CREATE INDEX batch_number
    ON t_buy (batch_number);

-- auto-generated definition
CREATE TABLE t_feed
(
    feed_id       INT AUTO_INCREMENT COMMENT '饲料唯一ID'
        PRIMARY KEY,
    send_date     DATE        NOT NULL COMMENT '配送日期',
    feed_quantity INT         NOT NULL COMMENT '配送数量',
    feed_price    DOUBLE      NOT NULL COMMENT '单价',
    feed_paystate VARCHAR(20) NOT NULL COMMENT '支付状态',
    feed_total    DOUBLE      NOT NULL COMMENT '金额总数',
    batch_number  INT         NOT NULL COMMENT '批次号',
    CONSTRAINT t_feed_ibfk_1
        FOREIGN KEY (batch_number) REFERENCES t_batch (batch_number)
);

CREATE INDEX batch_number
    ON t_feed (batch_number);

-- auto-generated definition
CREATE TABLE t_other
(
    record_id      INT AUTO_INCREMENT
        PRIMARY KEY,
    record_date    DATE           NULL COMMENT '记录日期',
    record_details VARCHAR(10000) NULL COMMENT '记录详情，可以为空',
    record_money   DECIMAL(10, 2) NULL COMMENT '开销总数',
    batch_number   INT            NOT NULL COMMENT '批次号',
    CONSTRAINT t_other_ibfk_1
        FOREIGN KEY (batch_number) REFERENCES t_batch (batch_number)
);

CREATE INDEX batch_number
    ON t_other (batch_number);

-- auto-generated definition
CREATE TABLE t_sale
(
    sale_id        INT AUTO_INCREMENT COMMENT '唯一id'
        PRIMARY KEY,
    sale_date      DATE           NOT NULL COMMENT '销售日期',
    sale_price     DECIMAL(10, 1) NOT NULL COMMENT '售价',
    sale_quantity  INT            NOT NULL COMMENT '销售数量',
    sale_variety   VARCHAR(20)    NOT NULL COMMENT '销售品种',
    total_weight   DECIMAL(10, 2) NOT NULL COMMENT '总重量',
    average_weight DECIMAL(10, 2) NOT NULL COMMENT '平均重量',
    average_money  DECIMAL(10, 2) NOT NULL COMMENT '平均每头金额',
    sale_amount    DECIMAL(10, 2) NOT NULL COMMENT '销售总金额',
    batch_number   INT            NOT NULL COMMENT '批次号',
    CONSTRAINT t_sale_ibfk_1
        FOREIGN KEY (batch_number) REFERENCES t_batch (batch_number)
);

CREATE INDEX batch_number
    ON t_sale (batch_number);

-- auto-generated definition
CREATE TABLE t_vaccine
(
    vaccine_id       INT AUTO_INCREMENT COMMENT '唯一id'
        PRIMARY KEY,
    vaccine_name     VARCHAR(30)    NOT NULL COMMENT '疫苗种类名称',
    vaccine_date     DATE           NOT NULL COMMENT '接种日期',
    vaccine_quantity INT            NOT NULL COMMENT '接种头数',
    vaccine_money    DECIMAL(10, 2) NOT NULL COMMENT '疫苗开销花费',
    batch_number     INT            NOT NULL COMMENT '批次号',
    CONSTRAINT t_vaccine_ibfk_1
        FOREIGN KEY (batch_number) REFERENCES t_batch (batch_number)
);

CREATE INDEX batch_number
    ON t_vaccine (batch_number);

