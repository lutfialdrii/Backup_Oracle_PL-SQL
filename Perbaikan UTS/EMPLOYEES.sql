DECLARE
    CURSOR cur_karyawan IS
        SELECT e.employee_id, e.first_name, e.last_name, e.department_id, e.job_id, e.salary, e.commission_pct
        FROM employees e, departments d, jobs j
        WHERE e.department_id = d.department_id AND
        e.job_id = j.job_id AND
        e.job_id LIKE '%REP%' AND
        e.department_id IN (80,85);
        v_employee_id employees.employee_id%TYPE;
        v_first_name employees.first_name%TYPE;
        v_last_name employees.last_name%TYPE;
        v_department_id employees.department_id%TYPE;
        v_job_id employees.job_id%TYPE;
        v_salary employees.salary%TYPE;
        v_commission_pct employees.commission_pct%TYPE;
        v_totalgaji employees.salary%TYPE;
BEGIN
 OPEN cur_karyawan;
 LOOP
  FETCH cur_karyawan INTO v_employee_id, v_first_name, v_last_name, v_department_id, v_job_id, v_salary, v_commission_pct;
  v_totalgaji := v_salary+(v_salary * v_commission_pct);
  EXIT WHEN cur_karyawan%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE('ID : '|| v_employee_id || ' ' || v_first_name ||' '|| v_last_name || ', DEPT : ' || v_department_id || ', JOB ID : ' || v_job_id || ', Gaji Pokok : ' || v_salary || ', TOTAL GAJI : ' || v_totalgaji);
  END LOOP;
  CLOSE cur_karyawan;
END;
/
