SELECT count(*), a.assessment_type, a.id_assessment
FROM studentAssessment sa
JOIN assessments a
ON sa.id_assessment = a.id_assessment
GROUP BY a.assessment_type, a.id_assessment