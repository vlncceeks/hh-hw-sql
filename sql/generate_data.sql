INSERT INTO specializations (name)
VALUES ('Python разработчик'),
        ('Java разработчик'),
        ('Frontend разработчик'),
        ('Менеджер по продажам'),
        ('Маркетолог'),
        ('HR менеджер'),
        ('Бухгалтер'),
        ('Водитель'),
        ('Врач'),
        ('Системный администратор');

INSERT INTO vacancies (title, specialization_id, compensation_from, compensation_to, area_id, created_at, is_active)
SELECT
    (SELECT name FROM specializations s WHERE s.specialization_id = spec_id) as title,
    spec_id,
    compensation_from,
    compensation_from + compensation_delta,
    area_id,
    created_at,
    is_active
FROM (
    SELECT
        floor(random() * (SELECT count(*) FROM specializations) + 1)::int as spec_id,

        -- от 30к до 180к
        (random() * 150000 + 30000)::int as compensation_from,

        -- разница между compensation_to и compensation_from от 0 до 50к
        (random() * 50000)::int as compensation_delta,

        -- от 1 до 100
        (random() * 100 + 1)::int as area_id,

        -- created_at за последние 2 года
        current_date - (random() * 730)::int as created_at,

        -- 90% активных
        random() > 0.1 as is_active

    FROM generate_series(1, 10000)
) as alias;

INSERT INTO resumes (desired_position, specialization_id, compensation_from, compensation_to, area_id, created_at, is_active)
SELECT
    (SELECT name FROM specializations s WHERE s.specialization_id = spec_id) as desired_position,
    spec_id,
    compensation_from,
    compensation_from + compensation_delta,
    area_id,
    created_at,
    is_active
FROM (
    SELECT
        floor(random() * (SELECT count(*) FROM specializations) + 1)::int as spec_id,

        -- от 30к до 180к
        (random() * 150000 + 30000)::int as compensation_from,

        -- разница между compensation_to и compensation_from от 0 до 30к
        (random() * 30000)::int as compensation_delta,

        -- от 1 до 100
        (random() * 100 + 1)::int as area_id,

        -- created_at за последние 2 года
        current_date - (random() * 730)::int as created_at,

        -- 95% активных
        random() > 0.05 as is_active

    FROM generate_series(1, 100000)
) as alias;

INSERT INTO responses (vacancy_id, resume_id, created_at)
SELECT
    v.id,
    r.id,
    GREATEST(v.created_at, r.created_at) +
        (random() * (current_date - GREATEST(v.created_at, r.created_at)))
FROM vacancies v
INNER JOIN resumes r
ON r.specialization_id = v.specialization_id
WHERE v.is_active = true AND r.is_active = true AND r.area_id = v.area_id
  AND v.compensation_to > r.compensation_from AND random() < 0.6;
