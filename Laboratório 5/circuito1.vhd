LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY circuito1 IS
	PORT (
		A, B : IN std_logic_vector(2 DOWNTO 0);
		F1, F2, F3, F4 : OUT std_logic_vector(3 DOWNTO 0)
	);
END circuito1;

ARCHITECTURE arch OF circuito1 IS
BEGIN
	F1 <= '0' & A; --A
	F2 <= A & '0'; --2A
	F3 <= '0' & B; --B
	F4 <= B & '0'; --2B
END arch;