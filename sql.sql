CREATE DATABASE myblog;
USE myblog;


CREATE TABLE tb_user(
	id INT(4) AUTO_INCREMENT,
	username VARCHAR(64) NOT NULL , 
	PASSWORD VARCHAR(64) NOT NULL ,
	role VARCHAR(8) NOT NULL,
	PRIMARY KEY(id)
)ENGINE=INNODB CHARSET=utf8;

CREATE TABLE tb_category(
	id INT(10) AUTO_INCREMENT,
	NAME VARCHAR(128) NOT NULL,
	PRIMARY KEY(id)
)ENGINE=INNODB CHARSET=utf8;

CREATE TABLE tb_article(
	id INT(124) AUTO_INCREMENT,
	title VARCHAR(128) NOT NULL ,
	content LONGTEXT ,
	description VARCHAR(512),
	first_picture VARCHAR(256),
	published INT(2) NOT NULL DEFAULT 0 ,
	COMMENT INT(2) NOT NULL DEFAULT 0 ,
	views INT(10) NOT NULL DEFAULT 0,
	category_id INT(10) NOT NULL,
	create_time DATETIME NOT NULL ,
	update_time DATETIME NOT NULL ,
	PRIMARY KEY(id),
	INDEX(category_id),
	FOREIGN KEY(category_id) REFERENCES tb_category(id) ON DELETE CASCADE 
)ENGINE=INNODB CHARSET=utf8;


CREATE TABLE tb_comment(
	id INT(10) AUTO_INCREMENT,
	article_id INT(10) NOT NULL ,
	parent_id INT(10) ,
	nickname VARCHAR(64) NOT NULL ,
	email VARCHAR(128) NOT NULL ,
	direct VARCHAR(64) ,
	content VARCHAR(256) NOT NULL,
	create_time DATETIME NOT NULL ,
	PRIMARY KEY(id),
	INDEX (article_id),
	INDEX (parent_id) ,
	FOREIGN KEY(article_id) REFERENCES tb_article(id) ON DELETE CASCADE,
	FOREIGN KEY(parent_id) REFERENCES tb_comment(id) ON DELETE CASCADE
)ENGINE=INNODB CHARSET=utf8;

CREATE TABLE tb_tag(
	id INT AUTO_INCREMENT,
	NAME VARCHAR(10) binary,
	PRIMARY KEY(id)
)ENGINE=INNODB CHARSET=utf8;

CREATE TABLE tb_tag_article(
	id INT AUTO_INCREMENT,
	tag_id INT NOT NULL ,
	article_id INT NOT NULL ,
	PRIMARY KEY(id),
	FOREIGN KEY(tag_id) REFERENCES tb_tag(id) ON DELETE CASCADE ,
	FOREIGN KEY(article_id) REFERENCES tb_article(id) ON DELETE CASCADE
)ENGINE=INNODB CHARSET=utf8;


INSERT INTO tb_user(username,password,role)
VALUES ("admin","$2a$10$zu8erEqhQg9d/OTRWxcBce6A0IhNQtmhgHhZzc9hcwMI9vYOhkpMK","admin");
-- admin $2a$10$zu8erEqhQg9d/OTRWxcBce6A0IhNQtmhgHhZzc9hcwMI9vYOhkpMK admin