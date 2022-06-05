DECLARE
    v_salary jobs.min_salary%TYPE;
    v_job_title jobs.job_title%TYPE;
BEGIN
    SELECT min_salary,job_title INTO v_salary,v_job_title
    FROM jobs
    WHERE job_title = 'Programmer';
	CASE
    WHEN v_salary >= 12000 THEN
		DBMS_OUTPUT.PUT_LINE ('Pekerjaan '||v_job_title||' memiliki gaji '||v_salary||' merupakan pekerjaan tingkat tinggi');
	WHEN v_salary >= 6000 THEN
		DBMS_OUTPUT.PUT_LINE ('Pekerjaan '||v_job_title||' memiliki gaji '||v_salary||' merupakan pekerjaan tingkat menengah');
	ELSE
        DBMS_OUTPUT.PUT_LINE ('Pekerjaan '||v_job_title||' memiliki gaji '||v_salary||' merupakan pekerjaan tingkat rendah');
    END CASE;
END;
/