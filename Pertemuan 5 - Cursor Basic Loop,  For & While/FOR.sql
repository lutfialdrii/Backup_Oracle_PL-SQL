DECLARE
    v_loc_id locations.location_id%TYPE;
BEGIN
    SELECT (location_id) INTO v_loc_id FROM locations WHERE city = 'Toronto';
    FOR i IN 1..3 LOOP
    INSERT INTO locations (location_id, city, country_id)
    VALUES ((v_loc_id-i),'Pekanbaru',2);
    END LOOP;
END;
/