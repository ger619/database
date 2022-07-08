/*Queries that provide answers to the questions from all projects.*/

--  ends in "mon
SELECT * FROM animals WHERE name LIKE '%mon';

-- animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

--  animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

-- DOB of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- escape attempts of animals that weigh > 10.5kg
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- all neutered.
SELECT * FROM animals WHERE neutered = true;

-- animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';

-- animals with a weight between 10.4kg and 17.3kg
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals;
ROLLBACK
SELECT * FROM animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT update_weight;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO update_weight;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY (neutered);
SELECT species, MIN(weight_kg), MAX(weight_kg)FROM animals GROUP BY(species);
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY(species);
