BEGIN
    FOR i IN 1..5 LOOP
    DELETE FROM coba1.languages WHERE language_id = i;
    END LOOP;
END;
/