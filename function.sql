-- Повертає середню ціну домів з певним айді продажу
CREATE OR REPLACE FUNCTION vaccines_in_country(smth text) RETURNS int AS
$$
  DECLARE
    avg_sale integer;
  BEGIN
    SELECT AVG(*) INTO avg_sale
    FROM sales
    WHERE sales.sale_id > smth;
    
   RETURN avg_sale;
  END;
$$ LANGUAGE 'plpgsql';
