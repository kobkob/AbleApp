
--
-- TABLE: Domain
-- 
--  

CREATE TABLE Domain (
  id long int NOT NULL ,
  name string NOT NULL ,
  id_bus long int NOT NULL 
);
CREATE SEQUENCE Domain_id_seq START 1 INCREMENT 1 ;
ALTER TABLE Domain ALTER COLUMN id SET NOT 0;
ALTER TABLE Domain ALTER COLUMN id SET DEFAULT nextval('Domain_id_seq');

-- 
ALTER TABLE Domain ADD CONSTRAINT idpk PRIMARY KEY (id);

-- 
ALTER TABLE Domain ADD CONSTRAINT bus FOREIGN KEY (id_bus) REFERENCES BussinessUnit(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE INDEX Domain_id_index  ON Domain(id);
ALTER TABLE Domain ADD CONSTRAINT  FOREIGN KEY () REFERENCES BussinessUnit ();
