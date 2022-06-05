DECLARE
    v_counter number:=1;
    v_turun number:=10;
BEGIN
    WHILE v_counter <=10 LOOP
    DBMS_OUTPUT.PUT_LINE ('anak ayam turun'||' '||v_turun||'mati'||' '||v_counter||' '||'tinggal'||' '||(v_turun-v_counter));
    v_counter:=v_counter+1;
    END LOOP;
END;
/
