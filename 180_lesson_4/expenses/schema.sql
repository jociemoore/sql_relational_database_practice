CREATE TABLE expenses (
id SERIAL PRIMARY KEY,
amount NUMERIC(6,2) NOT NULL CHECK (amount > 0.00),
memo TEXT NOT NULL ,
created_on DATE NOT NULL 
)