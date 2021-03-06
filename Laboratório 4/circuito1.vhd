LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY circuito1 IS
	PORT (
		A : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		F1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		F2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		F3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		F4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END circuito1;

ARCHITECTURE arch OF circuito1 IS
BEGIN
	F1 <= '0' & A; --A
	F2 <= A & '0'; --2A
	F3 <= '0' & B; --B
	F4 <= B & '0'; --2B
END arch;

