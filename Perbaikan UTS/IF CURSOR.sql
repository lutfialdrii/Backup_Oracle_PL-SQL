DECLARE
    CURSOR cur_karyawan IS
        SELECT employee_id, first_name, last_name,city
        FROM employees e, departments d, locations l
        WHERE e.department_id = d.department_id AND
        d.location_id = l.location_id;
        v_record cur_karyawan%rowtype;
        v_boolean VARCHAR2(10);
BEGIN
 OPEN cur_karyawan;
 LOOP
  FETCH cur_karyawan INTO v_record;
  IF (v_record.employee_id mod 2 = 1) THEN 
    v_boolean := 'Ganjil';
  ELSE v_boolean := 'Genap';
  END IF;
  EXIT WHEN cur_karyawan%NOTFOUND OR cur_karyawan%ROWCOUNT > 10;
  DBMS_OUTPUT.PUT_LINE(v_record.employee_id || ' ' || v_record.first_name ||' '|| v_record.last_name ||' '|| v_boolean||' '|| v_record.city);
 END LOOP;
 CLOSE cur_karyawan;
END;
/
