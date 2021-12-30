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
