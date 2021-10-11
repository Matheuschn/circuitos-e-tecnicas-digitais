LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY contador_score IS
	PORT (
		data : IN std_logic_vector(1 DOWNTO 0);
		reset : IN std_logic;
		enable : IN std_logic;
		clock : IN std_logic;
		contagem : OUT std_logic_vector(7 DOWNTO 0)
	);
END contador_score;

ARCHITECTURE arch OF contador_score IS

	SIGNAL conta : std_logic_vector(7 DOWNTO 0);
BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '1' THEN
			conta <= "00000000";
		ELSIF clock'EVENT AND clock = '1' AND enable = '1' THEN
			IF conta = "11111111" THEN
				conta <= "00000000";
			ELSE
				conta <= conta + data + 1;
			END IF;
		END IF;
	END PROCESS;
	contagem <= conta;
END arch;
