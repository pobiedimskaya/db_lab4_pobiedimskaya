-- function
-- Повертає середню ціну домів з певним айді продажу
CREATE OR REPLACE FUNCTION average_sale_price(smth int) RETURNS int AS
$$
  DECLARE
    avg_sale integer;
  BEGIN
    SELECT AVG(sale_price) INTO avg_sale
    FROM sales
    WHERE sales.sale_id > smth;
    
   RETURN avg_sale;
  END;
$$ LANGUAGE 'plpgsql';

select * from sales
select average_sale_price(10)

-- procedure
-- Процедура, що визначає середню ціну за дім в залежності від року побуудови

CREATE OR REPLACE PROCEDURE avetage_price_by_year(house_year int) 
LANGUAGE 'plpgsql'
AS $$
DECLARE average_price sales.sale_price%TYPE;

BEGIN
	SELECT AVG(sale_price) INTO average_price
	FROM sales
	JOIN houses USING(house_id)
	WHERE houses.year_built = house_year;
    RAISE INFO 'Year built: %,  Average price: %', house_year, average_price;
END;
$$;

CALL average_price_by_year(2011);

-- trigger

CREATE OR REPLACE FUNCTION new_neighborhood() RETURNS trigger AS
$$
  DECLARE
  
  BEGIN
  	RAISE NOTICE 'NEW:%',NEW;
	NEW.neighborhood_name := 'Neighborhood is ' || NEW.neighborhood_name;
	return NEW;
	
  END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER neighborhood_updater
 BEFORE INSERT ON neighborhoods
 FOR EACH ROW EXECUTE FUNCTION new_neighborhood();

select * from neighborhoods
INSERT INTO neighborhoods(neighborhood_id, neighborhood_name)
VALUES(330, 'tRoEsChInA');
select * from neighborhoods
