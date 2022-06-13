CREATE OR REPLACE FUNCTION luas_lingkaran(p_jari_jari NUMBER)
RETURN FLOAT IS
v_phi NUMBER := 3.14;
v_luas NUMBER := v_phi * p_jari_jari * p_jari_jari;
BEGIN
RETURN v_luas;
END;

-- memanggil function menggunakan BLOCK
BEGIN
    DBMS_OUTPUT.PUT_LINE('Luas Lingkaran = ' || luas_lingkaran(7));
END;

-- MEMANGGIL DENGAN SELECT
-- Table Dual adalah tabel DUMMY
SELECT LUAS_LINGKARAN(7) FROM DUAL;