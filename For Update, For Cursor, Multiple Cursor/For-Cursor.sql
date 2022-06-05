DECLARE
    CURSOR cur_languages IS
        SELECT language_id, language_name
        FROM languages;
BEGIN
    FOR i IN cur_languages
    LOOP
        DBMS_OUTPUT.PUT_LINE(i.language_id || ' ' || i.language_name);
    END LOOP;
END;
/
