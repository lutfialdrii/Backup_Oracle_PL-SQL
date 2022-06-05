DECLARE
    v_turun number:=10;
BEGIN
    FOR v_counter IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE ('anak ayam turun'||' '||v_turun||' mati'||' '||v_counter||' '||'tinggal'||' '||(v_turun-v_counter));
    END LOOP;
END;
/
