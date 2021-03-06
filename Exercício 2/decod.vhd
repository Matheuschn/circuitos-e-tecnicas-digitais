LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY decod IS
	PORT (
		G : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		F : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END decod;

ARCHITECTURE arch OF decod IS
BEGIN
	F <= "0100100" WHEN G = "00" ELSE -- 2
	     "0000010" WHEN G = "01" ELSE -- 6
	     "0010010" WHEN G = "10" ELSE -- 5
	     "1111001"; -- 1
END arch;
