declare
	cursor v_departement is select first_name, employee_id, department_id, job_id, salary, commission_pct
	from employees
	where department_id IN (80,85)
	and job_id LIKE '%REP';
	v_firstName employees.first_name%TYPE;
	v_empid employees.employee_id%TYPE;
	v_dep employees.department_id%TYPE;
	v_job employees.job_id%TYPE;
	v_sal employees.salary%TYPE;
	v_com employees.commission_pct%TYPE;
begin
	Open v_departement;
	LOOP
		fetch v_departement into v_firstName, v_empid, v_dep, v_job, v_sal, v_com;
		exit when v_departement%NOTFOUND;
		dbms_output.put_line('ID : '|| v_empid || ',NAMA : ' || v_firstName || ',DEPT : ' || v_dep || ',JOB : '|| v_job || ',GAJI POKOK : '|| v_sal || ',TOTAL GAJI :' || (v_sal * v_com));
	end loop;
	close v_departement;
end;
/