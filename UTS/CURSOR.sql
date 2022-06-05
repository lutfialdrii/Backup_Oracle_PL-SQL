DECLARE
    CURSOR cur_languages IS
        SELECT language_id, language_name
        FROM languages;
        v_language_id languages.language_id%TYPE;
        v_language_name languages.language_name%TYPE;
BEGIN
 OPEN cur_languages;
 LOOP
  FETCH cur_languages INTO v_language_id, v_language_name;
  EXIT WHEN cur_languages%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE(v_language_id || ' ' || v_language_name);
  END LOOP;
  CLOSE cur_languages;
END;
/
