select v.activity_type, sum(sv.sum_click) num_clicks
FROM studentInfo si
JOIN studentVle sv
ON si.id_student = sv.id_student
JOIN vle v
ON v.id_site = sv.id_site
WHERE si.final_result = 'Distinction'
GROUP BY v.activity_type
ORDER BY 2 desc;
 
select v.activity_type, sum(sv.sum_click) num_clicks
FROM studentInfo si
JOIN studentVle sv
ON si.course_code = sv.course_code
AND si.batch_code = sv.batch_code
AND si.id_student = sv.id_student
JOIN vle v
ON v.id_site = sv.id_site
WHERE si.final_result = 'Distinction'
GROUP BY v.activity_type
ORDER BY 2 desc
 


select *
from studentVle

select *
from studentInfo

select sv.course_code, sv.batch_code, sv.id_student, sv.id_site, v.activity_type
from studentVle sv
JOIN Vle v
ON sv.id_site = v.id_site

select *
from vle

/*each id_site is for a single course,batch combination*/
select id_site,  count(distinct course_code), count(distinct batch_code)
from studentVle
where id_site = 877078
group by id_site

select id_student, course_code, batch_code
FROM studentInfo
where id_student = 8462
group by id_student, course_code, batch_code