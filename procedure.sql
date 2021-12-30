-- Процедура, що визначає середню ціну за дім в залежності від року побуудови

CREATE OR REPLACE PROCEDURE avetage_price_by_year(house_year int) 
LANGUAGE 'plpgsql'
AS $$
DECLARE average_price sales.sale_price%TYPE;

BEGIN
	SELECT AVG(sale_price) INTO average_price
	FROM sales
	JOIN houses USING(sale_id)
	WHERE houses.year_built = house_year;
    RAISE INFO 'Year built: %,  Average price: %', house_year, average_price;
END;
$$;
