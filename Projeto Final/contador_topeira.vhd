LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY contador_topeira IS
	PORT (
		reset : IN std_logic;
		enable : IN std_logic;
		clock : IN std_logic;
		tc7 : OUT std_logic;
		contagem : OUT std_logic_vector(2 DOWNTO 0)
	);
END contador_topeira;

ARCHITECTURE arch OF contador_topeira IS

	SIGNAL conta : std_logic_vector(2 DOWNTO 0);
	SIGNAL maxcounter : std_logic := '0';
BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '1' THEN
			conta <= "000";
		ELSIF clock'EVENT AND clock = '1' THEN
			IF enable = '1' THEN
				IF conta = "111" THEN
					conta <= "000";
				ELSE
					conta <= conta + 1;
				END IF;
			END IF;
		END IF;
 
		IF conta = "111" THEN
			maxcounter <= '1';
		ELSE maxcounter <= '0';
		END IF;
	END PROCESS;
	contagem <= conta;
	tc7 <= maxcounter;
END arch;
