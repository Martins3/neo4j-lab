# 完成在表上的操作 (用SQL的SELECT语句)：
# 1.给出学生名，查询学生所选的所有课程名、成绩，累计学分。


(select student.student_name,  course_name, score_number  from student, selection, course
where student.student_number = selection.student_number and course.course_number = selection.course_number
  and student_name ='张三');
  (select student_name,  sum(credit_number) as sum_credit from student, selection, course
where student.student_number = selection.student_number and course.course_number = selection.course_number
  and student_name ='张三');


# 2.给出课程名，查询学生的平均成绩
select course_name,  avg(selection.score_number) from course , selection where selection.course_number = course.course_number
and course_name = '模式识别';

# 3. 各门课按平均成绩排序
select course_name , avg(selection.score_number) from course , selection where selection.course_number = course.course_number
group by selection.course_number;

# 4.显示所有的课程名和讲课教师名
select course.course_name from course;
select teacher.teacher_name from teacher;
