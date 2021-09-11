
-- Add a column to the animals table called “location”. 
-- It should have a VARCHAR data type.
ALTER TABLE animals 
ADD Location VARCHAR(30);
-- Insert 3 new animals into the table – make sure none of their fields are null.
INSERT INTO animals ( name, type, age, location ) 
VALUES ('Lionel', 'lion', 15, 'Africa'), ('Royal', 'Tiger', 13, 'Asia'), ('Kobra', 'Snake', 14, 'Africa');        

-- Change the “type” column’s name to be “species”.
ALTER TABLE animals
RENAME COLUMN type TO species;
-- Change the “species” column data type to be VARCHAR.
ALTER TABLE animals
ALTER COLUMN species type VARCHAR(300);