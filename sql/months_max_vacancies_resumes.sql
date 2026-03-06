WITH month_v as
    (
        SELECT EXTRACT(MONTH FROM v.created_at) as month
        FROM vacancies v
        GROUP BY EXTRACT(MONTH FROM v.created_at)
        ORDER BY count(v) DESC
        LIMIT 1
    ),
    month_r as
    (
        SELECT EXTRACT(MONTH FROM r.created_at) as month
        FROM resumes r
        GROUP BY EXTRACT(MONTH FROM r.created_at)
        ORDER BY count(r) DESC
        LIMIT 1
    )
SELECT (ARRAY['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
              'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'])[month_v.month],
    (ARRAY['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
              'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'])[month_r.month]
FROM month_v
CROSS JOIN month_r;
