LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registrador IS
	PORT (
		CLK, RST : IN std_logic;
		D : IN std_logic_vector (3 DOWNTO 0);
		Q : OUT std_logic_vector (3 DOWNTO 0)
	);
END registrador;

ARCHITECTURE arch OF registrador IS
BEGIN
	PROCESS (CLK, D, RST)
	BEGIN
		IF RST = '0' THEN
			Q <= "0000";
		ELSIF (CLK'EVENT AND CLK = '1') THEN 
			Q <= D;
		END IF; 
	END PROCESS;
END arch;
