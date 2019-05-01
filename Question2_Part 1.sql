WITH reg AS 
(SELECT course_code, batch_code, COUNT(id_student) num_reg
FROM studentRegistration
WHERE date_unregistration IS NULL
GROUP BY course_code, batch_code),

pass AS 
(SELECT course_code, batch_code, COUNT(final_result) num_pass
FROM studentInfo
WHERE final_result IN ('Distinction', 'Pass')
GROUP BY course_code, batch_code)


SELECT reg.course_code, 
	   reg.batch_code, 
	   reg.num_reg, 
	   pass.num_pass, 
	   (pass.num_pass*100/reg.num_reg) pass_rate
FROM reg
JOIN pass
ON reg.course_code = pass.course_code
AND reg.batch_code = pass.batch_code
GROUP BY reg.course_code, reg.batch_code, reg.num_reg, pass.num_pass
oRDER BY 5 DESC



SELECT final_result, count(*)
FROM studentInfo
GROUP BY final_result