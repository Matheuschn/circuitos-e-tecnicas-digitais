LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY decod7seg IS
	PORT (
		INPUT : IN std_logic_vector(3 DOWNTO 0);
		HEX : OUT std_logic_vector(6 DOWNTO 0)
	);
END decod7seg;

ARCHITECTURE arch OF decod7seg IS
BEGIN
	HEX <= "1000000" WHEN INPUT(3 DOWNTO 0) = "0000" ELSE -- 0
	       "1111001" WHEN INPUT(3 DOWNTO 0) = "0001" ELSE -- 1
	       "0100100" WHEN INPUT(3 DOWNTO 0) = "0010" ELSE -- 2
	       "0110000" WHEN INPUT(3 DOWNTO 0) = "0011" ELSE -- 3
	       "0011001" WHEN INPUT(3 DOWNTO 0) = "0100" ELSE -- 4
	       "0010010" WHEN INPUT(3 DOWNTO 0) = "0101" ELSE -- 5
	       "0000010" WHEN INPUT(3 DOWNTO 0) = "0110" ELSE -- 6
	       "1111000" WHEN INPUT(3 DOWNTO 0) = "0111" ELSE -- 7
	       "0000000" WHEN INPUT(3 DOWNTO 0) = "1000" ELSE -- 8
	       "0010000" WHEN INPUT(3 DOWNTO 0) = "1001" ELSE -- 9
	       "0001000" WHEN INPUT(3 DOWNTO 0) = "1010" ELSE -- A
	       "0000011" WHEN INPUT(3 DOWNTO 0) = "1011" ELSE -- b
	       "1000110" WHEN INPUT(3 DOWNTO 0) = "1100" ELSE -- C
	       "0100001" WHEN INPUT(3 DOWNTO 0) = "1101" ELSE -- d
	       "0000110" WHEN INPUT(3 DOWNTO 0) = "1110" ELSE -- E
	       "0001110"; -- F
END arch;