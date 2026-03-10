WITH month_per_year_v as
    (
        SELECT DISTINCT ON (data.year) data.month, data.year, data.cnt
        FROM (SELECT EXTRACT(YEAR FROM v.created_at) as year,
            EXTRACT(MONTH FROM v.created_at) as month,
            count(v) as cnt
                FROM vacancies v
                GROUP BY EXTRACT(YEAR FROM v.created_at), EXTRACT(MONTH FROM v.created_at)
                ) as data
        ORDER BY data.year, data.cnt DESC
    ),
    month_per_year_r as
    (
        SELECT DISTINCT ON (data.year) data.month, data.year, data.cnt
        FROM (SELECT EXTRACT(YEAR FROM r.created_at) as year,
            EXTRACT(MONTH FROM r.created_at) as month,
            count(r) as cnt
                FROM resumes r
                GROUP BY EXTRACT(YEAR FROM r.created_at), EXTRACT(MONTH FROM r.created_at)

                ) as data
        ORDER BY data.year, data.cnt DESC
    )
SELECT v.year as year,
        (ARRAY['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
              'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'])[v.month] as month_vanacy,
        (ARRAY['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
              'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'])[r.month] as month_resume,
        v.cnt as vacancies,
        r.cnt as resumes
FROM month_per_year_v v
JOIN month_per_year_r r
ON v.year = r.year;
