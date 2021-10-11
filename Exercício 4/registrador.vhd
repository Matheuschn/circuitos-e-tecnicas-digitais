LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registrador IS
	PORT (
		CLK, RST, EN : IN std_logic;
		D : IN std_logic_vector (3 DOWNTO 0);
		Q : OUT std_logic_vector (3 DOWNTO 0)
	);
END registrador;

ARCHITECTURE arch OF registrador IS
BEGIN
	PROCESS (CLK, D, RST, EN)
	BEGIN
		IF RST = '1' THEN
			Q <= "0011";
		ELSIF (CLK'EVENT AND CLK = '0') THEN
			IF (EN = '1') THEN
				Q <= D;
			END IF;
		END IF; 
	END PROCESS;
END arch;
