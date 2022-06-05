create or replace procedure edit_gaji (bonus number) as
	cursor cur_emp is select * from copy_employees;
	v_cur_emp_rec cur_emp%rowtype;
begin
	for v_cur_emp in cur_emp LOOP
		update copy_employees set salary = salary + (salary * bonus/100) where employee_id = v_cur_emp.employee_id;
	exit when cur_emp%notfound;
	end loop;
end;
/