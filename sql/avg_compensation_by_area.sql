SELECT area_id,
       AVG(compensation_from) as avg_from,
       AVG(compensation_to) as avg_to,
       (AVG(compensation_from) + AVG(compensation_to)) / 2 as avg_from_to
FROM vacancies v
GROUP BY area_id
ORDER BY area_id;