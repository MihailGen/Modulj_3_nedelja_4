-- Запрос 1: Вывести идентификаторы курсов (предметов)
select courseid 
from course

-- Запрос 2: Вывести всю информацию о курсах (предметах)
select * 
from course

-- Запрос 3: Вывести идентификатор курса с названием "Machine Learning"
select courseid 
from course 
where coursetitle = 'Machine Learning'

-- Запрос 4: Вывести название курса с идентификатором 5
select coursetitle 
from course where courseid = 5 

-- Запрос 5: Вывести список мобильных телефонов (PhoneType = 'cell') из таблицы "PHONE_LIST"
select phone 
from phone_list  
where phonetype = 'cell' 

-- Запрос 6: Вывести количество отметок, которое получил студент с идентификатором (номером зачетки) 345576
select count(grade) 
from exam_result 
where studentid = 345576 

-- Запрос 7: Вывести номера зачеток (идентификаторы студентов) и средние баллы, которые получили студенты за все экзамены
select studentid, AVG(grade) 
from exam_result 
group by studentid 
order by studentid 

-- Запрос 8: Вывести минимальный и максимальный баллы, полученные студентами на экзаменах
select Min(grade), MAX(grade)
from exam_result 

-- минимальный и максимальный баллы поименно (это в задании не требовалось)
select studentname, Min(exam_result.grade), MAX(exam_result.grade) 
from exam_result INNER join students 
on exam_result.studentid = students.studentid 
group by students.studentid 

-- Запрос 9: Найти пересечение идентификаторов студентов, получавших и 2, и 5. Каждый идентификатор из пересечения должен встречаться не более одного раза
select studentid from exam_result where grade = 2 
INTERSECT 
select studentid from exam_result where grade = 5 
group by studentid
order by studentid

-- Запрос 10: Найти объединение идентификаторов студентов, у которых есть хоть одна 2 и/или хоть одна 5. 
-- Каждый идентификатор из пересечения должен встречаться не более одного раза
SELECT studentid from exam_result where grade = 2 
union 
SELECT studentid from exam_result where grade = 5
group by studentid 
order by studentid
group by studentid order by studentid
