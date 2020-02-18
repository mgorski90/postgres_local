CREATE SEQUENCE public.person_extension_id_seq;

CREATE TABLE public.person_extension (
                id BIGINT NOT NULL DEFAULT nextval('public.person_extension_id_seq'),
                details VARCHAR(250) NOT NULL,
                CONSTRAINT id PRIMARY KEY (id)
);

ALTER SEQUENCE public.person_extension_id_seq OWNED BY public.person_extension.id;

CREATE TABLE public.person (
                id BIGINT NOT NULL,
                name VARCHAR(50) NOT NULL,
                surname VARCHAR(50) NOT NULL,
                CONSTRAINT id_person PRIMARY KEY (id)
);

ALTER TABLE public.person ADD CONSTRAINT person_extension_person_fk
FOREIGN KEY (id)
REFERENCES public.person_extension (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
