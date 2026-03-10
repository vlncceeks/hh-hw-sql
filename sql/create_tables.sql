DROP TABLE IF EXISTS responses;
DROP TABLE IF EXISTS vacancies;
DROP TABLE IF EXISTS resumes;
DROP TABLE IF EXISTS specializations;

CREATE TABLE specializations (
    specialization_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    specialization_id INT NOT NULL,
    compensation_from INTEGER,
    compensation_to INTEGER,
    area_id INTEGER,
    created_at TIMESTAMP,
    is_active BOOLEAN,
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id)
);

CREATE TABLE resumes (
    id SERIAL PRIMARY KEY,
    desired_position VARCHAR(255) NOT NULL,
    specialization_id INT NOT NULL,
    compensation_from INTEGER,
    compensation_to INTEGER,
    area_id INTEGER,
    created_at TIMESTAMP,
    is_active BOOLEAN,
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id)
);

CREATE TABLE responses (
    id SERIAL PRIMARY KEY,
    vacancy_id INTEGER REFERENCES vacancies(id),
    resume_id INTEGER REFERENCES resumes(id),
    created_at TIMESTAMP
);
