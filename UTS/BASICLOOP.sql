DECLARE
	v_counter number(2) := 1;
	v_language_id languages.language_id%TYPE;
BEGIN
	SELECT MIN(language_id)
	INTO v_language_id
	FROM languages;
	LOOP
		INSERT INTO languages(language_id,language_name)
		VALUES ((v_language_id+v_counter),('Belum Terdaftar'));
		v_counter := v_counter+1;
	EXIT WHEN v_counter > 5;
	END LOOP;
END;
/