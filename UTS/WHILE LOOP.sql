DECLARE
	v_counter number(2) := 1;
	v_language_id languages.language_id%TYPE;
BEGIN
    v_language_id := 1;
	WHILE v_counter <=5 LOOP
        UPDATE languages SET language_name = 'Bahasa Daerah di Indonesia' WHERE language_id = v_counter;
	    v_counter := v_counter+1;
    END LOOP;
END;
/