/* HACK 3 */
CREATE TABLE priorities(
  id_priority SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL
);

CREATE TABLE countries(
  id_country SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE contact_request(
  id_email SERIAL PRIMARY KEY,
  id_country INTEGER,
  id_priority INTEGER,
  name VARCHAR(50) NOT NULL,
  detail VARCHAR(100) NOT NULL,
  physical_address VARCHAR(100) NOT NULL
);


/* HACK 4 */
CREATE TABLE priorities(
  id_priority SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL
);

CREATE TABLE countries(
  id_country SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE contact_request(
  id_email SERIAL PRIMARY KEY,
  id_country INTEGER,
  id_priority INTEGER,
  name VARCHAR(50) NOT NULL,
  detail VARCHAR(100) NOT NULL,
  physical_address VARCHAR(100) NOT NULL
);

/* INSERT */
/* insert 5 record in countries */
INSERT INTO countries(name) 
VALUES 
('venezuela'),
('argentina'),
('italia'),
('alemania'),
('EEUU');
SELECT * FROM countries;

/* insert 3 record in priorities */
INSERT INTO priorities(type_name) 
VALUES 
('Alta'),
('Media'),
('Baja');
SELECT * FROM priorities;

/* insert 3 record in contact_request */
INSERT INTO contact_request(id_country, id_priority, name, detail, physical_address)
VALUES
(4, 1, 'Jonas Kahnwald', 'Necesito encontrar el camino al pasado', 'Winden, avenida 20, calle 19'),
(5, 2, 'Jane Hopper', 'Ubicacion del Mind Flayer', 'Hawkins, Indiana, Estados Unidos'),
(2, 2, 'Julio Cortazar', 'Consulta sobre servicio de internet', 'Buenos Aires, avenida rayuela');
select * FROM contact_request;

/* delete last user: */
DELETE FROM contact_request where id_email = 3;
SELECT * FROM contact_request;

/* update first user: */

UPDATE contact_request set name = 'Marta Nielsen', detail = 'Cuando estamos' WHERE id_email = 1;
SELECT * FROM contact_request;