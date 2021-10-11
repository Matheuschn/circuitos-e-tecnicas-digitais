LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY contador IS
	PORT (
		reset, clock : IN std_logic;
		contagem : OUT std_logic_vector(3 DOWNTO 0)
	);
END contador;

ARCHITECTURE arch OF contador IS

	SIGNAL conta : std_logic_vector(3 DOWNTO 0);
BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '0' THEN
			conta <= "1001";
		ELSIF clock'EVENT AND clock = '0' THEN
			IF conta = "1101" THEN
				conta <= "1001";
			ELSE
				conta <= conta + 1;
			END IF;
		END IF;
	END PROCESS;
	contagem <= conta;
END arch;