LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY mux IS
	PORT (
		W, X, Y, Z : IN std_logic_vector(3 DOWNTO 0);
		SEL : IN std_logic_vector(1 DOWNTO 0);
		F : OUT std_logic_vector(3 DOWNTO 0)
	);
END mux;

ARCHITECTURE arch OF mux IS
BEGIN
	F <= W WHEN SEL(1 DOWNTO 0) = "00" ELSE
	     X WHEN SEL(1 DOWNTO 0) = "01" ELSE
	     Y WHEN SEL(1 DOWNTO 0) = "10" ELSE
	     Z;
END arch;