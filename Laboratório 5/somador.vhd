LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY somador IS
	PORT (
		A, B : IN std_logic_vector(3 DOWNTO 0);
		F : OUT std_logic_vector(3 DOWNTO 0)
	);
END somador;

ARCHITECTURE arch OF somador IS
BEGIN
	F <= A + B;
END circuito;