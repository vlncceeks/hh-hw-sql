-- Для третей задачи, где используется GROUP BY по area_id
CREATE INDEX idx_vacancies_area ON vacancies(area_id);


-- Для четвертой задачи, где используется GROUP BY по created_at
CREATE INDEX idx_vacancies_created ON vacancies(created_at);
CREATE INDEX idx_resumes_created ON resumes(created_at);


-- Для пятой задачи
-- в условии WHERE используется responses.created_at и vacancies.created_at (такой индекс уже есть)
CREATE INDEX idx_responses_created ON responses(created_at);
-- в JOIN используется responses.vacancy_id
CREATE INDEX idx_responses_vacancy ON responses(vacancy_id);
-- в SELECT не только id вакансии, но и ее title, поэтому использую составной индекс
CREATE INDEX idx_vacancies_id_created ON vacancies(id, title);
