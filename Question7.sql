WITH wtdscore AS (
select id_student, sum(a.weight*sa.score/100) wtd_prod, sum(a.weight/100) sumofweights, 
				   (sum(a.weight*sa.score/100)/sum(a.weight/100)) wtd_score
from studentAssessment sa
join assessments a
ON a.id_assessment = sa.id_assessment
WHERE sa.score is not NULL 
GROUP BY sa.id_student
HAVING sum(a.weight) != 0)

select sa.id_student, count(*) tot_num_assess
from studentAssessment sa
join wtdscore ws
on ws.id_student = sa.id_student
where score = 100
group by sa.id_student, ws.wtd_score
having count(*) > 1
order by tot_num_assess desc, ws.wtd_score desc

select id_student, count(*) tot_num_assess
from studentAssessment
where score = 100
group by id_student
having count(*) > 1
order by tot_num_assess desc

select sa.id_student, a.course_code, a.batch_code, a.id_assessment, a.weight, sa.score
from studentAssessment sa
join assessments a
ON a.id_assessment = sa.id_assessment
WHERE sa.id_student = 508924
group by sa.id_student, a.course_code, a.batch_code, a.id_assessment, a.weight, sa.score




select *
FROM assessments a
WHERE a.weight is NULL

select *
FROM studentAssessment sa
WHERE sa.score is NULL


select *
from assessments
where course_code = 'AAA' AND batch_code = '2013J'

select sa.*, a.weight
from studentAssessment sa
join assessments a
on sa.id_assessment = a.id_assessment
where sa.id_student IN (631473, 624060, 630905)
order by sa.id_student

