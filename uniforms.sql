-- Create the employees table to store basic employee information
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    size_number INTEGER,
    size_letter TEXT
);

-- Create the uniform_items table to store different types of uniforms/clothing
CREATE TABLE uniform_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    renewal_period_months INTEGER
);

-- Create the uniform_assignments table to store issue and return dates
CREATE TABLE uniform_assignments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    employee_id INTEGER,
    item_id INTEGER,
    issue_date DATE,
    next_renewal_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (item_id) REFERENCES uniform_items(id)
);

-- Insert uniform items with their renewal periods
INSERT INTO uniform_items (name, renewal_period_months) VALUES
    ('spodnie robocze', 18),
    ('polar roboczy', 18),
    ('obuwie bezpieczne', 12),
    ('koszula dl rekaw 2 szt', 12),
    ('koszula kr rekaw 2 szt', 12),
    ('kurtka caloroczna', 48),
    ('spodnie ocieplane', 48),
    ('czapka zimowa', 36),
    ('shorty', 48),
    ('czapka/kaszkiet', 48);

-- Insert employees with corrected names
INSERT INTO employees (name, size_number, size_letter) VALUES
    ('Adam Nowak', 54, 'M'),
    ('Jan Kowalski', 54, 'M'),
    ('Tomasz Wisniewski', 52, 'M'),
    ('Lukasz Zieslinski', 52, 'M'),
    ('Krzysztof Lewandowski', 41, 'M'),
    ('Marek Kwiatkowski', 45, 'M'),
    ('Anna Wojcik', 40, NULL),
    ('Pawel Jankowski', 52, 'L'),
    ('Katarzyna Kaminska', 41, 'XL'),
    ('Ewa Szymanska', 39, 'M');

-- Insert complete uniform assignments with corrected dates (DD.MM.YYYY format)
INSERT INTO uniform_assignments (employee_id, item_id, issue_date, next_renewal_date) VALUES
    -- Pawel Kuczak
    (1, 1, '2023-08-07', '2025-02-02'),  -- spodnie robocze
    (1, 2, '2023-02-08', '2025-02-02'),  -- polar roboczy
    (1, 3, '2023-05-17', '2024-05-17'),  -- obuwie bezpieczne
    (1, 4, '2023-05-07', '2024-07-05'),  -- koszula dl rekaw
    (1, 5, '2023-08-20', '2024-08-20'),  -- koszula kr rekaw
    (1, 6, '2023-10-20', '2027-10-20'),  -- kurtka caloroczna
    (1, 7, '2023-05-20', '2027-05-20'),  -- spodnie ocieplane
    (1, 8, '2023-10-20', '2026-10-20'),  -- czapka zimowa
    (1, 9, '2023-05-20', '2027-06-20'),  -- shorty
    (1, 10, '2023-05-16', '2027-05-16'), -- czapka/kaszkiet

    -- Piotr Kuczak
    (2, 1, '2023-08-19', '2025-02-02'),
    (2, 2, '2023-02-10', '2025-02-02'),
    (2, 3, '2023-03-05', '2024-05-03'),
    (2, 4, '2023-05-07', '2024-07-05'),
    (2, 5, '2023-05-07', '2024-07-05'),
    (2, 6, '2023-09-20', '2027-09-20'),
    (2, 7, '2023-10-20', '2027-10-20'),
    (2, 8, '2023-10-20', '2026-10-20'),
    (2, 9, '2023-10-20', '2027-10-20'),
    (2, 10, '2023-10-20', '2027-10-20'),

    -- Michal Burda
    (3, 1, '2023-09-24', '2025-03-20'),
    (3, 2, '2023-08-05', '2025-05-08'),
    (3, 3, '2023-05-17', '2024-05-17'),
    (3, 4, '2023-05-07', '2024-07-05'),
    (3, 5, '2023-08-28', '2024-08-28'),
    (3, 6, '2023-11-22', '2027-11-22'),
    (3, 7, '2023-10-20', '2027-10-20'),
    (3, 8, '2023-10-20', '2026-10-20'),
    (3, 9, '2023-05-20', '2027-05-20'),
    (3, 10, '2023-09-20', '2027-09-20'),

    -- Rafal Danowski
    (4, 1, '2023-09-20', '2025-02-02'),
    (4, 2, '2023-02-09', '2025-02-02'),
    (4, 3, '2023-02-05', '2024-05-02'),
    (4, 4, '2023-05-07', '2024-07-05'),
    (4, 5, '2023-05-07', '2024-07-05'),
    (4, 6, '2023-10-20', '2027-10-20'),
    (4, 7, '2023-10-20', '2027-10-20'),
    (4, 8, '2023-10-20', '2026-10-20'),
    (4, 9, '2023-05-20', '2027-05-20'),
    (4, 10, '2023-10-20', '2027-10-20'),

    -- Michal Szostek
    (5, 1, '2023-09-09', '2025-03-20'),
    (5, 2, '2023-02-09', '2025-09-02'),
    (5, 3, '2023-05-17', '2024-05-17'),
    (5, 4, '2023-05-07', '2024-07-05'),
    (5, 5, '2023-05-07', '2024-07-05'),
    (5, 6, '2023-11-21', '2027-11-21'),
    (5, 7, '2023-10-20', '2027-10-20'),
    (5, 8, '2023-10-20', '2026-10-20'),
    (5, 9, '2023-05-20', '2027-05-20'),
    (5, 10, '2023-10-20', '2027-10-20'),

    -- Karol Batko
    (6, 1, '2023-04-24', '2025-04-24'),
    (6, 2, '2023-03-21', '2025-03-21'),
    (6, 3, '2023-05-17', '2024-05-17'),
    (6, 4, '2023-05-07', '2024-07-05'),
    (6, 5, '2023-03-08', '2024-08-03'),
    (6, 6, '2023-09-20', '2027-09-20'),
    (6, 7, '2023-09-20', '2027-09-20'),
    (6, 8, '2023-10-20', '2026-10-20'),
    (6, 9, '2023-05-20', '2027-05-20'),
    (6, 10, '2023-10-20', '2027-10-20'),

    -- Elzbieta Poltorak
    (7, 2, '2023-09-20', '2025-09-20'),
    (7, 3, '2023-09-20', '2024-09-20'),
    (7, 4, '2023-05-07', '2024-07-05'),
    (7, 5, '2023-05-07', '2024-07-05'),
    (7, 6, '2023-10-20', '2027-10-20'),
    (7, 7, '2023-10-20', '2027-10-20'),
    (7, 8, '2023-10-20', '2026-10-20'),

    -- Konrad Tomasiewicz
    (8, 1, '2023-09-09', '2025-09-09'),
    (8, 2, '2023-09-09', '2025-09-09'),
    (8, 3, '2023-08-12', '2024-12-08'),
    (8, 4, '2023-08-09', '2024-09-08'),
    (8, 5, '2023-09-21', '2024-09-21'),
    (8, 6, '2023-09-28', '2027-09-28'),
    (8, 7, '2023-10-20', '2027-10-20'),
    (8, 8, '2023-10-20', '2026-10-20'),
    (8, 9, '2023-09-20', '2027-09-20'),
    (8, 10, '2023-01-20', '2027-01-20'),

    -- Monika Kotula
    (9, 1, '2023-03-24', '2025-03-24'),
    (9, 2, '2023-12-07', '2025-07-12'),
    (9, 3, '2023-05-17', '2024-05-17'),
    (9, 4, '2023-05-07', '2024-07-05'),
    (9, 5, '2023-05-07', '2024-07-05'),
    (9, 6, '2023-09-21', '2027-09-21'),
    (9, 7, '2023-10-20', '2027-10-20'),
    (9, 8, '2023-10-20', '2026-10-20'),
    (9, 9, '2023-03-20', '2027-03-20'),
    (9, 10, '2023-11-20', '2027-11-20'),

    -- Sabina Rzeszutko
    (10, 1, '2023-10-17', '2025-10-17'),
    (10, 2, '2023-05-05', '2025-05-05'),
    (10, 3, '2023-05-05', '2024-05-05'),
    (10, 4, '2023-05-10', '2024-05-10'),
    (10, 5, '2023-05-10', '2024-05-10'),
    (10, 6, '2023-10-17', '2027-10-17'),
    (10, 7, '2023-10-20', '2027-10-20'),
    (10, 8, '2023-10-20', '2026-10-20'),
    (10, 9, '2023-05-20', '2027-05-20'),
    (10, 10, '2023-05-20', '2027-05-20');
