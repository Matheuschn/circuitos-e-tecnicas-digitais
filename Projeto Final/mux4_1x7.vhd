-- Multiplexador 4x1 de 7 bit.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4_1x7 IS
	PORT (
		sel : IN std_logic_vector(1 DOWNTO 0);
		ent0, ent1, ent2, ent3 : IN std_logic_vector(6 DOWNTO 0);
		ss : OUT std_logic_vector(6 DOWNTO 0)
	);
END mux4_1x7;

ARCHITECTURE arch OF mux4_1x7 IS
BEGIN
	ss <= ent0 WHEN sel = "00" ELSE
	      ent1 WHEN sel = "01" ELSE
	      ent2 WHEN sel = "10" ELSE
	      ent3;
END arch;
