SELECT area_id,
       AVG(compensation_from) as comp_from,
       AVG(compensation_to) as comp_to
FROM vacancies v
GROUP BY area_id
ORDER BY area_id;