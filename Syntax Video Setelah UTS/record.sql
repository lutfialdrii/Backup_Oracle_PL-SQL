DECLARE
    v_employees_record employees%ROWTYPE;
BEGIN
    SELECT * INTO v_employees_record
    FROM employees
    WHERE employee_id = 110;
    DBMS_OUTPUT.PUT_LINE(v_employees_record.employee_id ||' '||v_employees_record.first_name||' '||v_employees_record.last_name||' '||v_employees_record.salary||' '||v_employees_record.department_id);
END;
/