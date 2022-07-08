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


