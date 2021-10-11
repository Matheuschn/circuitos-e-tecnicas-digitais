LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY contador_trial IS
	PORT (
		reset : IN std_logic;
		enable : IN std_logic;
		clock : IN std_logic;
		tcn3 : OUT std_logic;
		contagem : OUT std_logic_vector(1 DOWNTO 0)
	);
END contador_trial;

ARCHITECTURE arch OF contador_trial IS

	SIGNAL conta : std_logic_vector(1 DOWNTO 0);
	SIGNAL notmax : std_logic := '1';
BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '1' THEN
			conta <= "00";
		ELSIF clock'EVENT AND clock = '1' THEN
			IF enable = '1' THEN
				IF conta = "11" THEN
					conta <= "00";
				ELSE
					conta <= conta + 1;
				END IF;
			END IF;
		END IF;
 
		IF conta = "11" THEN
			notmax <= '0';
		ELSE notmax <= '1';
		END IF;
	END PROCESS;
	contagem <= conta;
	tcn3 <= notmax;
END arch;
