DECLARE
    v_salary jobs.min_salary%TYPE;
    v_job_title jobs.job_title%TYPE;
BEGIN
    SELECT min_salary,job_title INTO v_salary,v_job_title
    FROM jobs
    WHERE job_title = 'Programmer';
	IF v_salary >= 4000 THEN
		DBMS_OUTPUT.PUT_LINE ('Pekerjaan '||v_job_title||' memiliki gaji '||v_salary||' sehingga lebih besar dari UMR');
	ELSE
		DBMS_OUTPUT.PUT_LINE ('Pekerjaan '||v_job_title||' memiliki gaji '||v_salary||' sehingga setara dengan UMR');
	END IF;
END;
/