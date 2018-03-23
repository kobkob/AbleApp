
--
-- TABLE: Requirement
-- 
--  

CREATE TABLE Requirement (
  id_plan long int NOT NULL ,
  id long int NOT NULL 
);
CREATE SEQUENCE Requirement_id_seq START 1 INCREMENT 1 ;
ALTER TABLE Requirement ALTER COLUMN id SET NOT 0;
ALTER TABLE Requirement ALTER COLUMN id SET DEFAULT nextval('Requirement_id_seq');

-- 
ALTER TABLE Requirement ADD CONSTRAINT idpk PRIMARY KEY (id);

-- 
ALTER TABLE Requirement ADD CONSTRAINT plan FOREIGN KEY (id_plan) REFERENCES Plan(id) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE INDEX Requirement_id_plan_index  ON Requirement(id_plan);

CREATE INDEX Requirement_id_index  ON Requirement(id);
