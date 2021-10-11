LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tflipflop IS
	PORT (
		T : IN std_logic;
		enable : IN std_logic;
		clock : IN std_logic;
		Q : OUT std_logic
	);
END tflipflop;

ARCHITECTURE arch OF tflipflop IS 
	SIGNAL op : std_logic := '0'; 
BEGIN
	PROCESS (clock) IS
	BEGIN
		IF (enable = '0') THEN
			op <= op;
		ELSIF (clock'EVENT AND clock = '1' AND enable = '1') THEN
			IF (T = '1') THEN
				op <= NOT op;
			ELSE
				op <= op;
			END IF;
		END IF;
	END PROCESS;
	Q <= op; 
END arch;
