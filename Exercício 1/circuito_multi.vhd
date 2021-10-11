LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY circuito_multi IS
	PORT (
		A : IN std_logic_vector(3 DOWNTO 0);
		F : OUT std_logic_vector(3 DOWNTO 0)
	);
END circuito_multi;

ARCHITECTURE arch OF circuito_multi IS
BEGIN
	-- Conforme enunciado, para a saída F(2), tem-se:

	F(2) <= (NOT A(0));

	-- insira seu codigo VHDL para as saídas F(3), F(1) e F(0) abaixo:

	F(3) <= ((NOT A(3)) AND A(2) AND (NOT A(1)) AND A(0)) OR (A(3) AND A(1) AND (NOT A(0)));
	F(1) <= (NOT A(3)) AND ((NOT A(2)) OR (NOT A(1)));
	F(0) <= A(3) AND (A(2) OR (A(1) AND A(0)));

END arch;