-- 1 Creacion database universe
create database universe;

-- 2️ Conectarse a la base de datos
\c universe;

-- 3️ Crear tabla GALAXY
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  has_life BOOLEAN NOT NULL DEFAULT false,
  is_spherical BOOLEAN NOT NULL DEFAULT true,
  age_in_millions_of_years NUMERIC,
  distance_from_earth INT
);

-- 4️ Crear tabla STAR
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  mass NUMERIC,
  temperature INT,
  is_active BOOLEAN NOT NULL DEFAULT true
);

-- 5️ Crear tabla PLANET
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  has_life BOOLEAN NOT NULL DEFAULT false,
  is_spherical BOOLEAN NOT NULL DEFAULT true,
  planet_type TEXT,
  diameter INT
);

-- 6️ Crear tabla MOON
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  is_spherical BOOLEAN NOT NULL DEFAULT true,
  radius INT,
  has_life BOOLEAN NOT NULL DEFAULT false
);

-- 7️ Crear una quinta tabla (por ejemplo, “planet_type”)
CREATE TABLE planet_type (
  planet_type_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT,
  average_temperature INT,
  is_gaseous BOOLEAN NOT NULL DEFAULT false
);

-- 8️ Insertar algunos datos de ejemplo

-- Galaxies
INSERT INTO galaxy (name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_earth)
VALUES
  ('Argentina', 'Our home galaxy', true, true, 13600, 0),
  ('Colombia', 'Nearest spiral galaxy', false, true, 10000, 2537000),
  ('Ecuador', 'Edge-on spiral galaxy', false, true, 11000, 29000000),
  ('Uruguay', 'Spiral galaxy with companion', false, true, 9000, 23000000),
  ('Paraguay', 'Supergiant elliptical galaxy', false, true, 13000, 53000000),
  ('Brasil', 'Satellite galaxy of Argentina', false, true, 10000, 163000);

-- Stars
INSERT INTO star (name, galaxy_id, mass, temperature, is_active)
VALUES
  ('Sol', 1, 1.0, 5778, true),
  ('Maria', 1, 0.12, 3042, true),
  ('Jose', 1, 2.06, 9940, true),
  ('Pedro', 1, 20.0, 3500, false),
  ('Juan', 2, 1.5, 6000, true),
  ('Simon', 4, 3.0, 7500, true);

-- Planet Types
INSERT INTO planet_type (name, description, average_temperature, is_gaseous)
VALUES
  ('Terrestres', 'Rocky planets similar to Earth', 288, false),
  ('Gas enorme', 'Large gaseous planet like Jupiter', 120, true),
  ('Hielo grande', 'Planets with icy compositions', 60, true),
  ('Canica', 'Small planet-like object', 180, false),
  ('Atlantico', 'Covered in liquid water', 300, false);

-- Planets
INSERT INTO planet (name, star_id, has_life, is_spherical, planet_type, diameter)
VALUES
  ('River Plate', 1, true, true, 'Terrestres', 12742),
  ('Barcelona', 1, false, true, 'Terrestres', 6779),
  ('Real Madrid', 1, false, true, 'Gas Enorme', 139820),
  ('Chelsea', 1, false, true, 'Hielo Grande' , 49244),
  ('Liverpool', 2, false, true, 'Terrestres', 12000),
  ('Fluminense', 3, false, true, 'Canica', 8000),
  ('Inter', 4, false, true, 'Gas Enorme', 150000),
  ('Roma', 5, false, true, 'Terrestres', 13000),
  ('Milan', 5, false, true, 'Gas Enorme', 110000),
  ('Malaga', 6, false, true, 'Terrestres', 9000),
  ('Independiente', 6, false, true, 'Canica', 50000),
  ('Estudiantes', 6, false, true, 'Atlantico', 130000);

-- Moons
INSERT INTO moon (name, planet_id, is_spherical, radius, has_life)
VALUES
  ('Gallardo', 1, true, 1737, false),
  ('Messi', 2, true, 11, false),
  ('Benzema', 2, true, 6, false),
  ('Drogba', 3, true, 1821, false),
  ('Gerrard', 3, true, 1560, false),
  ('Cano', 3, true, 2634, false),
  ('Icardi', 3, true, 2410, false),
  ('Totti', 4, true, 1353, false),
  ('Demichelis', 5, true, 400, false),
  ('Bochini', 8, true, 800, false),
  ('Veron', 8, true, 600, false),
  ('Ortega', 10, true, 300, false),
  ('Iniesta', 10, true, 250, false),
  ('Casillas', 11, true, 500, false),
  ('Lampard', 11, true, 400, false),
  ('Salah', 12, true, 1000, false),
  ('Ganso', 12, true, 800, false),
  ('Lukaku', 12, true, 700, false),
  ('Lamela', 12, true, 600, false),
  ('Bounannotte', 12, true, 500, false);