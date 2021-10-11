-- Multiplexador 4x1 de 4 bit.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4_1x4 IS
	PORT (
		sel : IN std_logic_vector(1 DOWNTO 0);
		ent0, ent1, ent2, ent3 : IN std_logic_vector(3 DOWNTO 0);
		ss : OUT std_logic_vector(3 DOWNTO 0)
	);
END mux4_1x4;

ARCHITECTURE arch OF mux4_1x4 IS
BEGIN
	ss <= ent0 WHEN sel = "00" ELSE
	      ent1 WHEN sel = "01" ELSE
	      ent2 WHEN sel = "10" ELSE
	      ent3;
END arch;
