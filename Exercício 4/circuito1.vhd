LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY circuito1 IS
	PORT (
		I, Q : IN std_logic_vector(3 DOWNTO 0);
		S0, S1, S2, S3 : OUT std_logic_vector(3 DOWNTO 0)
	);
END circuito1;

ARCHITECTURE arch OF circuito1 IS
BEGIN
	S0 <= I;
	S1 <= I + Q;
	S2 <= '0' & Q(3 DOWNTO 1);
	S3 <= Q(2 DOWNTO 0) & '0';

END arch;
