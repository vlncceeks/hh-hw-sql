SELECT v.id, v.title
FROM responses r
JOIN vacancies v
ON r.vacancy_id = v.id
WHERE r.created_at BETWEEN v.created_at AND v.created_at + 7
GROUP BY v.id
HAVING count(*) > 5;
