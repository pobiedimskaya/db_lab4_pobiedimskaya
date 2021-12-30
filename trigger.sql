-- TRIGGER

CREATE OR REPLACE FUNCTION new_neighborhood() RETURNS trigger AS
$$
  DECLARE
  
  BEGIN
  	RAISE NOTICE 'NEW:%',NEW;
	NEW.neighborhood_name := 'New ->' || NEW.neighborhood_name;
	return NEW;
	
  END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER neighborhood_updater
 BEFORE INSERT ON neighborhoods
 FOR EACH ROW EXECUTE FUNCTION new_neighborhood();
