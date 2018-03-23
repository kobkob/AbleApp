
--
-- TABLE: BussinessUnit
-- 
--  

CREATE TABLE BussinessUnit (
  id long int NOT NULL ,
  name string NOT NULL 
);
CREATE SEQUENCE BussinessUnit_id_seq START 1 INCREMENT 1 ;
ALTER TABLE BussinessUnit ALTER COLUMN id SET NOT 0;
ALTER TABLE BussinessUnit ALTER COLUMN id SET DEFAULT nextval('BussinessUnit_id_seq');

-- 
ALTER TABLE BussinessUnit ADD CONSTRAINT idpkctr PRIMARY KEY (id);

CREATE INDEX BussinessUnit_id_index  ON BussinessUnit(id);
