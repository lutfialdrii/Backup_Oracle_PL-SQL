CREATE PROCEDURE VOLUMEKERUCUT IS
    v_phi FLOAT(5) :=3.14;
    v_jari NUMBER(2) :=17;
    v_tinggi NUMBER(2) :=30;
    v_volume FLOAT;
BEGIN
    v_volume :=v_phi*v_jari*v_jari*v_tinggi/3;
    DBMS_OUTPUT.PUT_LINE('JARI-JARI ALAS KERUCUT ADALAH='||' '||v_jari||' '||'CM');
    DBMS_OUTPUT.PUT_LINE('TINGGI KERUCUT ADALAH='||' '||v_tinggi||' '||'CM');
    DBMS_OUTPUT.PUT_LINE('VOLUME KERUCUT ADALAH='||' '||v_volume||' '||'CM3');
END;
/
