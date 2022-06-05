DECLARE 
    TYPE t_emp_rec IS TABLE OF employees%ROWTYPE
    INDEX BY BINARY_INTEGER;
    v_emp_rec_tab t_emp_rec;
BEGIN
    FOR emp_rec IN (SELECT * FROM employees) LOOP
        v_emp_rec_tab(emp_rec.employee_id) := emp_rec;
        DBMS_OUTPUT.PUT_LINE(v_emp_rec_tab(emp_rec.employee_id).salary);
    END LOOP;
END;
/