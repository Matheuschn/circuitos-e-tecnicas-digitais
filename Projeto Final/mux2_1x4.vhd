-- Multiplexador 2x1 de 4 bit.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2_1x4 IS
	PORT (
		sel : IN std_logic;
		ent0, ent1 : IN std_logic_vector(3 DOWNTO 0);
		saida : OUT std_logic_vector(3 DOWNTO 0)
	);
END mux2_1x4;

ARCHITECTURE arch OF mux2_1x4 IS
BEGIN
	saida <= ent0 WHEN sel = '0' ELSE
	         ent1;
END arch;
