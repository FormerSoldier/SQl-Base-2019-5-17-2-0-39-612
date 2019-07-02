-- 创建考生系统的数据库
CREATE DATABASE IF NOT EXISTS student_examination_sys;
USE student_examination_sys;

-- 创建学生表
CREATE TABLE IF NOT EXISTS student(
	id 			INT PRIMARY KEY,
	name		VARCHAR(32),
	age			INT(3),
	sex			char(2)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 创建考试科目表
CREATE TABLE IF NOT EXISTS subject(
	id			INT PRIMARY KEY,
	subject	VARCHAR(32),
	teacher		VARCHAR(32),
	description	VARCHAR(400)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 创建成绩表
CREATE TABLE IF NOT EXISTS score(
	id			INT PRIMARY KEY,
	student_id	INT NOT NULL,
	subject_id	INT,
	score		DECIMAL(3,1),
	CONSTRAINT fk_student_id FOREIGN KEY(student_id) REFERENCES student(id),
	CONSTRAINT fk_subject_id FOREIGN KEY(subject_id) REFERENCES subject(id)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8;

-- 向student表插入两条数据
INSERT INTO student VALUES(001,'张三',18,'男');
INSERT INTO student VALUES(002,'李四',20,'女');

-- 向考试科目表插入两条数据
INSERT INTO subject VALUES(1001,'语文','王老师','本次考试比较简单');
INSERT INTO subject VALUES(1002,'数学','刘老师','本次考试比较难');

-- 向成绩表中插入4条数据
INSERT INTO score VALUES(1,001,1001,80);
INSERT INTO score VALUES(2,002,1002,60);
INSERT INTO score VALUES(3,001,1001,70);
INSERT INTO score VALUES(4,002,1002,60.5);

SELECT * FROM student;
SELECT * FROM subject;
SELECT * FROM score;