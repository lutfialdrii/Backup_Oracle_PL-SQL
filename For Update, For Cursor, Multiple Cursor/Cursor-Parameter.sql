DECLARE
    CURSOR cur_languages(p_language_id NUMBER) IS
        SELECT language_id, language_name
        FROM languages
        WHERE language_id <= p_language_id;
BEGIN
    FOR i IN cur_languages(105)
    LOOP
        DBMS_OUTPUT.PUT_LINE(i.language_id || ' ' || i.language_name);
    END LOOP;
END;
/
