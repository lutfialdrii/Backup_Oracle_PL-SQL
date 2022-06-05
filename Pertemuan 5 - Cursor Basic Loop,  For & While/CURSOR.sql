DECLARE
    CURSOR cur_lokasi IS SELECT location_id, city, country_id FROM locations;
    v_counter number:=1;
    v_city locations.city%TYPE;
    v_country locations.country_id%TYPE;
    v_loc_id locations.location_id%TYPE;
BEGIN
    OPEN cur_lokasi;
    LOOP
        FETCH cur_lokasi INTO v_loc_id, v_city, v_country;
        EXIT WHEN cur_lokasi%NOTFOUND;
        dbms_output.put_line ('locations id adalah ' || v_loc_id || ' kota adalah ' || v_city || ' negaranya adalah ' || v_country);
    END LOOP;
    CLOSE cur_lokasi;
END;
/
