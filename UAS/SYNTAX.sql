-- soal 2
CREATE TABLE C_ULUTFI AS SELECT e.employee_id id, e.first_name nama, e.department_id id_dep, d.department_name namadep, e.salary gaji, nvl (e.COMMISSION_PCT, 0.1) komisi
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- soal 3
CREATE OR REPLACE PROCEDURE PROC_LUTFI(P_KOMISI NUMBER, P_DEP_ID NUMBER) AS
    CURSOR cur_data IS
    SELECT * FROM C_ULUTFI
    WHERE komisi = P_KOMISI
    AND id_dep = P_DEP_ID;
    rec_data cur_data%ROWTYPE;
BEGIN
    OPEN cur_data;
    LOOP
        FETCH cur_data INTO rec_data;
        EXIT WHEN cur_data%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID KARYAWAN ' ||' '|| rec_data.id ||' Nama : '|| rec_data.nama ||' ID_DEPARTMENT :' || rec_data.id_dep||' GAJI :' ||rec_data.gaji);
    END LOOP;
    CLOSE cur_data;
END;

-- soal 4
CREATE OR REPLACE FUNCTION pajak_lutfi (p_id NUMBER)
RETURN NUMBER IS
    v_komisi C_ULUTFI.komisi%TYPE;
    v_gaji C_ULUTFI.gaji%TYPE;
    v_pajak NUMBER;
BEGIN
    SELECT gaji, komisi INTO v_gaji, v_komisi FROM C_ULUTFI WHERE ID = p_id;
    IF v_komisi > 0.1 THEN
    v_pajak := v_gaji * 0.1;
    RETURN v_pajak;
    ELSE
    v_pajak := v_gaji * 0.5;
    RETURN v_pajak;
    END IF;
END;
/

-- soal 5
CREATE TABLE LOG_LUTFI (waktu TIMESTAMP, ID VARCHAR2(20),keterangan VARCHAR2(50), PRIMARY KEY (waktu));

CREATE OR REPLACE TRIGGER TRIG_LUTFI AFTER INSERT ON regions
BEGIN
    INSERT INTO LOG_LUTFI (waktu,id,keterangan) VALUES (sysdate,user,'Insert Data di Region');
END;
/

CREATE OR REPLACE TRIGGER TRIG_LUTFI2 AFTER update ON regions
BEGIN
    INSERT INTO LOG_LUTFI (waktu,id,keterangan) VALUES (sysdate,user,'Update Data di Region');
END;
/
insert into regions values (190,' lutfi');
update regions set region_name = 'lutfialdi' where region_id = 190;


-- COBA COBA dan error
CREATE OR REPLACE TRIGGER TRIG_LUTFI3
IF AFTER update ON regions THEN
BEGIN
    INSERT INTO LOG_LUTFI (waktu,id,keterangan) VALUES (sysdate,user,'Update Data di Region');
END;
ELSIF AFTER INSERT ON region THEN
BEGIN
    INSERT INTO LOG_LUTFI (waktu,id,keterangan) VALUES (sysdate,user,'insert Data di Region');
END;
END IF;
END;
/