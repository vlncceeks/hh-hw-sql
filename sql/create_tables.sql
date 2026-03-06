CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    compensation_from INTEGER,
    compensation_to INTEGER,
    area_id INTEGER,
    created_at DATE,
    is_active BOOLEAN
);

CREATE TABLE resumes (
    id SERIAL PRIMARY KEY,
    desired_position VARCHAR(255) NOT NULL,
    compensation_from INTEGER,
    compensation_to INTEGER,
    area_id INTEGER,
    created_at DATE,
    is_active BOOLEAN
);

CREATE TABLE responses (
    id SERIAL PRIMARY KEY,
    vacancy_id INTEGER REFERENCES vacancies(id),
    resume_id INTEGER REFERENCES resumes(id),
    created_at DATE
);

CREATE TABLE specializations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
