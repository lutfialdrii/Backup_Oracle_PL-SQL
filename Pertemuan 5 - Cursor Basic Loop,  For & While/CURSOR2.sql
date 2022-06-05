DECLARE
    CURSOR cur_department IS SELECT e.employee_id, e.department_id,department_name, first_name, salary
    FROM employees e, departments d
    WHERE e.department_id = d.department_id
    AND e.department_id=20
    AND salary >=4000;
    v_empid employees.employee_id%TYPE;
    v_depid departments.department_id%TYPE;
    v_depname departments.department_name%TYPE;
    v_fname employees.first_name%TYPE;
    v_sal employees.salary%TYPE;
BEGIN
    OPEN cur_department;
    LOOP
        FETCH cur_department INTO v_empid, v_depid,v_depname, v_fname, v_sal;
        EXIT WHEN cur_department%NOTFOUND;
        dbms_output.put_line ('ID Pegawai '||v_empid||' dengan ID Department'||v_depid||' dengan nama department '||v_depname||', Nama panggilannya '||v_fname||' dengan gaji '||v_sal);
    END LOOP;
    CLOSE cur_department;
END;
/
