SELECT count(*)
FROM studentInfo si
JOIN studentAssessment sa
ON si.id_student = sa.id_assessment
JOIN assessments a
ON  a.id_assessment = sa.id_assessment
WHERE a.assessment_type = 'Exam'
/*
a.assessment_type, si.region,
GROUP BY a.assessment_type, si.region
*/