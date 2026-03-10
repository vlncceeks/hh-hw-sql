-- Индекс для area_id не нужен, потому что их количество 100


-- Для четвертой задачи, где используется GROUP BY по created_at
CREATE INDEX idx_vacancies_created ON vacancies(created_at);
CREATE INDEX idx_resumes_created ON resumes(created_at);


-- Для пятой задачи
-- Сделала только составной индекс, потому что в запросе в join и where эти поля используются одновременно
CREATE INDEX idx_responses_vacancyid_created ON responses(vacancy_id, created_at);

