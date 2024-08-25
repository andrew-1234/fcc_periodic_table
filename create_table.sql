-- create types table with type_id integer primary key
-- a type column (varchar, not null)
CREATE TABLE types (
    type_id SERIAL PRIMARY KEY,
    type VARCHAR(255) NOT NULL
);
-- add the three types: nonmetal, metal, metalloid
INSERT INTO types (type) VALUES ('nonmetal');
INSERT INTO types (type) VALUES ('metal');
INSERT INTO types (type) VALUES ('metalloid');

insert into elements (atomic_number, symbol, name) values (9, 'F', 'Fluorine');
insert into properties (atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) values (9, 'nonmetal', 18.998, -220, -188.1, 1);
insert into elements (atomic_number, symbol, name) values (10, 'Ne', 'Neon');
insert into properties (atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) values (10, 'nonmetal', 20.18, -248.6, -246.1, 1);
