-- COPY TABLE EMPLOYEES
CREATE TABLE my_emp AS SELECT employee_id, first_name, salary FROM employees;

-- Table digunakan untuk Tracking data
CREATE TABLE log_salary (user_id VARCHAR2(10), waktu TIMESTAMP,
PRIMARY KEY (waktu));

-- buat TRIGGER bertujuan untuk melihat perubahan jika update, lalu data waktu diinptkan pada tabel log_salary
CREATE OR REPLACE TRIGGER log_sal_tr AFTER UPDATE OF SALARY on my_emp
BEGIN
    INSERT INTO log_salary (waktu,user_id) VALUES (sysdate,user);
END;
/

-- melakukan update
UPDATE my_emp SET salary = 5000 WHERE employee_id=232;
UPDATE my_emp SET first_name = 'aji' WHERE employee_id=232;


-- Tabel untuk mentracking
CREATE TABLE login_tabel (waktu TIMESTAMP, username VARCHAR2(20), PRIMARY KEY (waktu));


CREATE OR REPLACE TRIGGER login_trigger AFTER LOGON ON DATABASE
BEGIN
    INSERT INTO login_tabel (waktu,username) VALUES (sysdate,user);
END;
/

-- copy TABLE employees
CREATE TABLE pegawai AS SELECT employee_id, first_name, commission_pct, bonus FROM employees;

-- Tabel log
CREATE TABLE data_track (waktu TIMESTAMP, username VARCHAR2(20), keterangan VARCHAR2(20), PRIMARY KEY(waktu));

-- TRIGGER data bila update
CREATE OR REPLACE TRIGGER update_tabel AFTER UPDATE OF bonus ON pegawai
BEGIN
    INSERT INTO data_track (waktu,username,keterangan) VALUES (sysdate,user,'Update');
END;
/

-- TRIGGER DATA bila delete row
CREATE OR REPLACE TRIGGER delete_tabel AFTER DELETE ON pegawai
BEGIN
    INSERT INTO data_track (waktu,username,keterangan) VALUES (sysdate,user,'Delete');
END;
/