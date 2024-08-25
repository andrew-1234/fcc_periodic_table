-- delete the non existent element, whose atomic_number is 1000, from the two
-- tables element and properties
DELETE FROM elements WHERE atomic_number = 1000;
DELETE FROM properties WHERE atomic_number = 1000;

-- remove type column from properties
ALTER TABLE properties DROP COLUMN type;