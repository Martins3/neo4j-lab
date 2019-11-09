create database Student_Status;
use Student_Status;
CREATE TABLE `department` (
`department_number` int NOT NULL,
`department_name` varchar(255) NULL,
PRIMARY KEY (`department_number`)
);
CREATE TABLE `student` (
`student_number` int NOT NULL,
`student_sex` varchar(255) NULL,
`student_brithday` varchar(255) NULL,
`student_name` varchar(255) NULL,
`department_number` int NULL,
PRIMARY KEY (`student_number`)
);
CREATE TABLE `teacher` (
`teacher_number` int NOT NULL,
`teacher_name` varchar(255) NULL,
`level` varchar(255) NULL,
`department_number` int NULL,
PRIMARY KEY (`teacher_number`)
);
CREATE TABLE `course` (
`course_number` int NOT NULL,
`course_name` varchar(255) NULL,
`course_type` varchar(255) NULL,
`credit_number` int NULL,
PRIMARY KEY (`course_number`)
);
CREATE TABLE `selection` (
`student_number` int NOT NULL,
`course_number` int NOT NULL,
`score_number` int NULL,
PRIMARY KEY (`student_number`, `course_number`)
);
CREATE TABLE `teach` (
`teacher_number` int NOT NULL,
`course_number` int NOT NULL,
PRIMARY KEY (`teacher_number`, `course_number`)
);

ALTER TABLE `student` ADD CONSTRAINT `fk_student_student_1` FOREIGN KEY (`department_number`) REFERENCES `department` (`department_number`);
ALTER TABLE `teacher` ADD CONSTRAINT `fk_teacher_teacher_1` FOREIGN KEY (`department_number`) REFERENCES `department` (`department_number`);
ALTER TABLE `selection` ADD CONSTRAINT `fk_selection_selection_1` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`);
ALTER TABLE `selection` ADD CONSTRAINT `fk_selection_selection_2` FOREIGN KEY (`course_number`) REFERENCES `course` (`course_number`);
ALTER TABLE `teach` ADD CONSTRAINT `fk_teach_teach_1` FOREIGN KEY (`teacher_number`) REFERENCES `teacher` (`teacher_number`);
ALTER TABLE `teach` ADD CONSTRAINT `fk_teach_teach_2` FOREIGN KEY (`course_number`) REFERENCES `course` (`course_number`);

INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(0, '模式识别', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(1, 'C++编程', 2, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(2, '计算机视觉', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(3, '密码学', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(4, '数理分析', 2, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(5, '英语', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(6, '声乐', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(7, '控制理论', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(8, '信号处理', 2, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(9, '物理学', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(10, '化学分析', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(11, '遗传学', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(12, '数据结构', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(13, '通信工程', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(14, '随机数学', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(15, '日语', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(16, '美术', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(17, '解剖学', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(18, '有机化学', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(19, '材料学', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(20, '流体力学', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(21, '复变函数', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(22, '市场营销', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(23, '人力资源管理', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(24, '组织理论与设计', 2, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(25, '证券投资学', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(26, '宏观经济学', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(27, '微观经济学', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(28, '管理学', 2, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(29, '公司战略', 1, '讨论');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(30, '德语', 3, '讲授');
INSERT INTO `course` (`course_number`, `course_name`, `credit_number`, `course_type`) VALUES(31, '西班牙语', 2, '讲授');

INSERT INTO `department` (`department_number`, `department_name`) VALUES (0, '计算机系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (1, '自动化系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (2, '艺术系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (3, '通信系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (4, '外语系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (5, '物理系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (6, '化学系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (7, '数学系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (8, '生物系');
INSERT INTO `department` (`department_number`, `department_name`) VALUES (9, '管理系');

INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(0, '牛根生', '教授', 0);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(1, '王石', '教授', 1);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(2, '马化腾', '副教授', 2);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(3, '周鸿祎', '副教授', 3);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(4, '马云', '教授', 4);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(5, '柳传志', '教授', 5);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(6, '史玉柱', '副教授', 6);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(7, '王建宙', '教授', 7);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(8, '李彦宏', '副教授', 8);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(9, '周小川', '教授', 9);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(10, '王健林', '教授', 0);
INSERT INTO `teacher` (`teacher_number`, `teacher_name`, `level`, `department_number`) VALUES(11, '李开复', '教授', 1);




INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(0, 0 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(1, 1 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(2, 2 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(3, 3 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(4, 4 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(5, 5 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(6, 6 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(7, 7 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(8, 8 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(9, 9 );
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(0, 10);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(1, 11);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(2, 12);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(3, 13);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(4, 14);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(5, 15);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(6, 16);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(7, 17);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(8, 18);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(9, 19);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(0, 20);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(1, 21);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(2, 22);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(3, 23);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(4, 24);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(5, 25);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(6, 26);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(7, 27);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(8, 28);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(9, 29);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(0, 30);
INSERT INTO `teach` (`teacher_number`, `course_number`) VALUES(1, 31);

INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(0, '张三', '男', 19870610, 0);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(1, '李四', '男', 19870610, 1);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(2, '王五', '女', 19870610, 2);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(3, '赵六', '男', 19870610, 3);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(4, '李德', '男', 19870610, 4);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(5, '王和', '男', 19870610, 5);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(6, '田亮', '男', 19870610, 6);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(7, '周润发', '男', 19870610, 7);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(8, '刘德华', '男', 19870610, 8);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(9, '谢霆锋', '男', 19870610, 9);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(10, '邓超', '男', 19870610, 0);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(11, '刘翔', '男', 19860214, 1);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(12, '姚明', '男', 19860214, 2);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(13, '高峰', '男', 19860214, 3);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(14, '史冬鹏', '男', 19860214, 4);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(15, '郭晶晶', '女', 19860214, 5);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(16, '汤唯', '女', 19860214, 6);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(17, '范冰冰', '女', 19860214, 7);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(18, '李冰冰', '女', 19860214, 8);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(19, '赵本山', '男', 19860214, 9);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(20, '郭德纲', '男', 19860214, 0);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(21, '于谦', '男', 19860214, 1);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(22, '岳云鹏', '男', 19870814, 2);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(23, '姜昆', '男', 19870905, 3);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(24, '李金斗', '男', 19870905, 4);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(25, '刘青云', '男', 19870905, 5);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(26, '张靓颖', '女', 19870905, 6);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(27, '韩寒', '男', 19870905, 7);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(28, '李宇春', '女', 19870905, 8);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(29, '张静初', '女', 19870905, 9);
INSERT INTO `student` (`student_number`, `student_name`, `student_sex`, `student_brithday`, `department_number`) VALUES(30, '莫文蔚', '女', 19870905, 9);


INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  0	  ,0 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  1	  ,0 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  2	  ,1 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  3	  ,1 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  4	  ,2 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  5	  ,2 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  6	  ,3 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  7	  ,3 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  8	  ,4 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  9	  ,4 ,     99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  10	,5 , 	  99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  11	,5 , 	  99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  12	,6 , 	  99);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  13	,6 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  14	,7 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  15	,7 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  16	,8 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  17	,8 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  18	,9 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  19	,9 , 	  88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  20	,10,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  21	,10,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  22	,11,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  23	,11,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  24	,12,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  25	,12,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  26	,13,		88);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  27	,13,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  28	,14,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  29	,14,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  30	,15,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  31	,15,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  0	  ,16,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  1	  ,16,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  2	  ,17,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  3	  ,17,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  4	  ,18,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  5	  ,18,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  6	  ,19,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  7	  ,19,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  8	  ,20,		77);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  9	  ,20,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  10	,21,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  11	,21,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  12	,22,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  13	,22,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  14	,23,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  15	,23,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  16	,24,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  17	,24,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  18	,25,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  19	,25,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  20	,26,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  21	,26,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  22	,27,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  23	,28,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  24	,28,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  25	,29,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  26	,29,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  27	,30,		66);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  28	,30,		55);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  29	,27,		55);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  30	,26,		55);
INSERT INTO `selection` (`course_number`, `student_number`, `score_number`) VALUES(  31	,30,		55);
