CREATE TABLE IF NOT EXISTS t_om_system
(
    id varchar(32) not null unique primary key,
    name varchar(128) not null,
    is_global varchar(128) not null,
    is_show varchar(128) not null
)ENGINE = INNODB CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS t_om_system_info
(
    id varchar(32) not null unique primary key,
    system_id varchar(32) not null,
    url varchar(2000) not null,
    region varchar(255),
    create_time datetime not null,
    modify_time datetime not null,
    UNIQUE KEY (system_id, region)
)ENGINE = INNODB CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS t_operation
(
    id varchar(32) not null unique primary key,
    system_id varchar(32) not null,
    name varchar(128) not null,
    description varchar(256),
    type varchar(32) not null,
    is_global boolean not null,
    create_time datetime not null,
    modify_time datetime not null
)ENGINE = INNODB CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS t_operation_info
(
    id varchar(32) not null unique primary key,
    operation_id varchar(32) not null,
    region varchar(255),
    url varchar(1000) not null,
    create_time datetime not null,
    modify_time datetime not null,
    UNIQUE KEY (operation_id, region)
)ENGINE = INNODB CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS t_operation_type
(
    id varchar(32) not null unique primary key,
    name varchar(128) not null,
    create_time datetime not null,
    modify_time datetime not null
)ENGINE = INNODB CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS t_operation_sense
(
    id varchar(32) not null unique primary key,
    name varchar(128) not null,
    description varchar(256),
    operation_order VARCHAR(1000),
    is_show boolean not null,
    icon text,
    create_time datetime not null,
    modify_time datetime not null
)ENGINE = INNODB CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS t_operation_map_type
(
    id varchar(32) not null unique primary key,
    name varchar(128) not null,
    level tinyint(1) not null,
    parent varchar(32),
    status tinyint(1) not null,
    icon text,
    create_time datetime not null,
    modify_time datetime not null
)ENGINE = INNODB CHARACTER SET utf8;

-- CREATE TABLE IF NOT EXISTS t_operation_map_info
-- (
--     id varchar(32) not null unique primary key,
--     name varchar(128) not null,
--     url varchar(1000) not null,
--     type varchar(32) not null,
--     status tinyint(1) not null,
--     create_time datetime not null,
--     modify_time datetime not null
-- )ENGINE = INNODB CHARACTER SET utf8;

-- CREATE TABLE IF NOT EXISTS `t_visit_history` (
--   `id` bigint(20) NOT NULL AUTO_INCREMENT,
--   `type` tinyint(1) NOT NULL,
--   `type_id` varchar(32)  NOT NULL,
--   `operation_id` varchar(32),
--   `user_name` varchar(32) NOT NULL,
--   `visit_time` datetime NOT NULL,
--   `leave_time` datetime,
--   PRIMARY KEY (`id`),
--   KEY `type` (`type`) USING BTREE,
--   KEY `type_id` (`type_id`) USING BTREE
-- )ENGINE=InnoDB CHARACTER SET utf8;