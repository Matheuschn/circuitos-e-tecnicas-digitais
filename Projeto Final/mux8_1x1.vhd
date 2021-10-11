-- Multiplexador 8x1 de 8 bit.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux8_1x1 IS
	PORT (
		sel : IN std_logic_vector(2 DOWNTO 0);
		ent0, ent1, ent2, ent3, ent4, ent5, ent6, ent7 : IN std_logic;
		saida : OUT std_logic
	);
END mux8_1x1;

ARCHITECTURE arch OF mux8_1x1 IS
BEGIN
	saida <= ent0 WHEN sel = "000" ELSE
	         ent1 WHEN sel = "001" ELSE
	         ent2 WHEN sel = "010" ELSE
	         ent3 WHEN sel = "011" ELSE
	         ent4 WHEN sel = "100" ELSE
	         ent5 WHEN sel = "101" ELSE
	         ent6 WHEN sel = "110" ELSE
	         ent7;
END arch;
