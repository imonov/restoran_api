-- Category Table
CREATE TABLE
    category (id SERIAL PRIMARY KEY, name VARCHAR(50) NOT NULL);

-- meals table
CREATE TABLE
    meals (
        id SERIAL PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        description VARCHAR(120) NOT NULL,
        category_id INT REFERENCES category (id)
    ) NOT NULL;

-- kategoriya ma'lumot qo'shish
INSERT INTO
    category (name)
VALUES
    ('Milliy Taomlar'),
    ('Yevropa Taomlari'),
    ('Turk Taomlari'),
    ('Yaponiya Taomlari'),
    ('Fastfood');

-- ovqatlarga ma'lumot qo'shish
INSERT INTO
    meals (name, description, category_id)
VALUES
    ('Osh', 'Guruch, GO''sht, Piyoz, Suv', 1),
    ('Mastava', 'Guruch, Piyoz, Sabzi, Suv', 1),
    ('Pizza', 'Hamir, pishloq, sous', 2),
    (
        'Bruscetta',
        'Baget, chery pomidor, zaytun yog''i',
        2
    ),
    ('Merjimek', 'Yasmiq, suv, ziravorlar', 3),
    (
        'Menemen',
        'Pamidor, bulg''ori, qalampir, sarimsoq, pishloq, tuxum',
        3
    ),
    ('Sushi', 'Guruch, soya, baliq', 4),
    ('Tonkatsu', 'Go''sht (mol, tovuq), yog''', 4),
    (
        'Lavash',
        'Hamir, doner go''sht, sous, pishloq',
        5
    ),
    (
        'Burger',
        'Bulochka, kotlet, sous, salat bargi, pomidor, sho''r bodring, pishloq',
        5
    );

-- meals table'ni category bilan join qilish 
SELECT
    m.id,
    m.name AS name,
    m.description,
    c.name AS c_name
FROM
    meals AS m
    JOIN category AS c ON c.id = m.category_id;