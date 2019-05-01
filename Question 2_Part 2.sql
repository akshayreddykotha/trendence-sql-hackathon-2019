SELECT sum(num_act.num_activities)
FROM (SELECT v.activity_type at, count(*) num_activities
	FROM studentVle sv
    JOIN vle v
    ON v.id_site = sv.id_site
    WHERE sv.course_code = 'AAA' AND sv.batch_code = '2013J'
    GROUP BY v.activity_type) num_act
GROUP BY num_act.at;

SELECT activity_type, cast(cast(count(*)*100 AS decimal(10,2))/
						   cast((SELECT count(*)
                                 from vle
                                 WHERE course_code = 'AAA' AND batch_code = '2013J') 
								 AS numeric(10,2)) 
							AS numeric(10,2)) perc_activity 
from vle 
WHERE course_code = 'AAA' AND batch_code = '2013J'
GROUP BY activity_type

SELECT	count(*)
from vle
WHERE course_code = 'AAA' AND batch_code = '2013J'

SELECT	activity_type, count(id_site)
from vle
WHERE course_code = 'AAA' AND batch_code = '2013J'
GROUP BY activity_type