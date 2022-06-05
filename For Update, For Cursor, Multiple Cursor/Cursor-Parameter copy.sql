DECLARE
    CURSOR cur_classes(p_class_id NUMBER, p_frequency VARCHAR2) IS
        SELECT class_id, period, frequency, instr_id, course_id
        FROM classes
        WHERE class_id < p_class_id AND frequency = p_frequency;
BEGIN
    FOR i IN cur_classes(3, 'Daily')
    LOOP
        DBMS_OUTPUT.PUT_LINE(i.class_id || ' ' ||i.period|| ' ' || i.frequency|| ' ' || i.instr_id|| ' ' || i.course_id);
    END LOOP;
END;
/
