-- Multiplexador 2x1 de 8 bit.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2_1x8 IS
	PORT (
		sel : IN std_logic;
		ent0, ent1 : IN std_logic_vector(7 DOWNTO 0);
		saida : OUT std_logic_vector(7 DOWNTO 0)
	);
END mux2_1x8;

ARCHITECTURE arch OF mux2_1x8 IS
BEGIN
	saida <= ent0 WHEN sel = '0' ELSE
	         ent1;
END arch;
