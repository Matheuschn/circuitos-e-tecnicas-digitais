LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY FSM_clock IS
	PORT (
		clk_500Hz : IN std_logic;
		reset : IN std_logic;
		CLK_0_25Hz, CLK_0_5Hz, CLK_0_75Hz, CLK_1Hz, CLK_1_25Hz, CLK_1_5Hz, CLK_2Hz : OUT std_logic
	);
END ENTITY;

ARCHITECTURE arch OF FSM_clock IS
	SIGNAL contador : INTEGER RANGE 0 TO 1999; -- período (2 Hz) = 0,5 s -- 0,5 s * 500 = 250
	SIGNAL ctr_0_75 : INTEGER RANGE 0 TO 666; -- período (0,75 Hz) = 1,33 s -- 1,33s * 500 = 666
	SIGNAL ctr_1_25 : INTEGER RANGE 0 TO 399; -- período (1,25 Hz) = 0,8 s -- 0,8 s * 500 = 400
BEGIN
	P1 : PROCESS (clk_500Hz, reset)

	BEGIN
		IF reset = '1' THEN
			contador <= 0;
			ctr_0_75 <= 0;
			ctr_1_25 <= 0;

		ELSIF clk_500Hz'EVENT AND clk_500Hz = '1' THEN
			IF (contador < 1999) THEN
				contador <= contador + 1;
			ELSE
				contador <= 0;
			END IF;

			IF (ctr_0_75 < 666) THEN
				ctr_0_75 <= ctr_0_75 + 1;
			ELSE
				ctr_0_75 <= 0;
			END IF;

			IF (ctr_1_25 < 399) THEN
				ctr_1_25 <= ctr_1_25 + 1;
			ELSE ctr_1_25 <= 0;
			END IF;
		END IF;
	END PROCESS;

	P2 : PROCESS (contador)
	BEGIN
		CASE contador IS
			WHEN 0 TO 124 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '0';
				CLK_2Hz <= '0';
			WHEN 125 TO 249 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '0';
				CLK_2Hz <= '1';
			WHEN 250 TO 374 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '1';
				CLK_2Hz <= '0';
			WHEN 375 TO 499 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '1';
				CLK_2Hz <= '1';

			WHEN 500 TO 624 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '0';
				CLK_2Hz <= '0';

			WHEN 625 TO 749 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '0';
				CLK_2Hz <= '1';
			WHEN 750 TO 874 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '1';
				CLK_2Hz <= '0';
			WHEN 875 TO 999 => 
				CLK_0_25Hz <= '0';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '1';
				CLK_2Hz <= '1';
			WHEN 1000 TO 1124 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '0';
				CLK_2Hz <= '0';
			WHEN 1125 TO 1249 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '0';
				CLK_2Hz <= '1';
			WHEN 1250 TO 1374 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '1';
				CLK_2Hz <= '0';
			WHEN 1375 TO 1499 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '0';
				CLK_1Hz <= '1';
				CLK_2Hz <= '1';
			WHEN 1500 TO 1624 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '0';
				CLK_2Hz <= '0';
			WHEN 1625 TO 1749 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '0';
				CLK_2Hz <= '1';
			WHEN 1750 TO 1874 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '1';
				CLK_2Hz <= '0';
			WHEN 1875 TO 1999 => 
				CLK_0_25Hz <= '1';
				CLK_0_5Hz <= '1';
				CLK_1Hz <= '1';
				CLK_2Hz <= '1';
		END CASE;
	END PROCESS;

	P3 : PROCESS (ctr_0_75)
	BEGIN
		CASE ctr_0_75 IS
			WHEN 0 TO 166 => 
				CLK_0_75Hz <= '0';
				CLK_1_5Hz <= '0';
			WHEN 167 TO 333 => 
				CLK_0_75Hz <= '0';
				CLK_1_5Hz <= '1';
			WHEN 334 TO 500 => 
				CLK_0_75Hz <= '1';
				CLK_1_5Hz <= '0';
			WHEN 501 TO 666 => 
				CLK_0_75Hz <= '1';
				CLK_1_5Hz <= '1';
		END CASE;
	END PROCESS;

	P4 : PROCESS (ctr_1_25)
	BEGIN
		CASE ctr_1_25 IS
			WHEN 0 TO 199 => 
				CLK_1_25Hz <= '0';
			WHEN 200 TO 399 => 
				CLK_1_25Hz <= '1';
		END CASE;
	END PROCESS;
END arch;
