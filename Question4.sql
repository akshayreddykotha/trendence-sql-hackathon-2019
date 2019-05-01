select course_code,batch_code, date, sum(sum_click) total_clicks
from studentVle
group by course_code, batch_code, date

select course_code,
	    batch_code, 
		MAX(sum_click) OVER(PARTITION BY course_code, batch_code ORDER BY sum_click desc),
		date, 
		sum_click
from studentVle

WITH max_activity AS (
select course_code,
	    batch_code, 
		RANK() OVER(PARTITION BY course_code, batch_code ORDER BY sum_click desc) rank,
		date, 
		sum_click
from studentVle)

select *
from max_activity
where rank = 1;

select course_code,
	    batch_code, 
		date
from studentVle

WHERE sum_click = MAX(sum_click)
GROUP BY course_code, batch_code