-- Table: public.animals

-- DROP TABLE IF EXISTS public.animals;

CREATE TABLE IF NOT EXISTS public.animals
(
    id bigint,
    name "char",
    date_of_birth date,
    escape_attempts bigint,
    neutered boolean,
    weight_kg double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

ALTER TABLE animals ADD COLUMN species TEXT;


-- Create a table named owners with id, full_name, age.
CREATE TABLE IF NOT EXISTS public.owners
(
 id bigint GENERATED ALWAYS AS IDENTITY,
 full_name "char",
 age INT,
 PRIMARY KEY(id)
);

-- Create a table named species with id, name
CREATE TABLE species(
 id bigint GENERATED ALWAYS AS IDENTITY,
 name "char",
 PRIMARY KEY(id)
);


ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id bigint
 REFERENCES species(id)
 ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id bigint
 REFERENCES owners(id)
 ON DELETE CASCADE;

