LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY comparator IS
	PORT (
		A, B : IN std_logic_vector(0 TO 7);
		output : OUT std_logic
	);
END comparator;

ARCHITECTURE arch OF comparator IS
BEGIN
	PROCESS (A, B)
	BEGIN
		IF A = B THEN
			output <= '1';
		ELSE
			output <= '0';
		END IF;
	END PROCESS;
END arch;