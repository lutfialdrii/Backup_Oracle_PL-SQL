create or replace procedure edit_gaji (bonus number) as
	cursor cur_emp is select * from copy_employees;
	v_cur_emp_rec cur_emp%rowtype;
begin
	open cur_emp;
	LOOP
		fetch cur_emp into v_cur_emp_rec;
		update copy_employees set salary = salary + (salary * bonus/100) where employee_id = v_cur_emp_rec.employee_id;
	exit when cur_emp%notfound;
	end loop;
	close cur_emp;
end;
/