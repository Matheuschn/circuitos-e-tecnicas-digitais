LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY circuito1 IS
	PORT (
		A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		F1, F2, F3, F4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END circuito1;

ARCHITECTURE arch OF circuito1 IS
BEGIN
	F1 <= A + 2; --A + 2
	F2 <= A + 6; --A + 6
	F3 <= A - 5; --A - 5
	F4 <= A - 1; --A - 1
END arch;
