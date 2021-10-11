LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY contador IS
	PORT (
		enable : IN std_logic;
		clock : IN std_logic;
		contagem : OUT std_logic_vector(1 DOWNTO 0)
	);
END contador;

ARCHITECTURE arch OF contador IS

	SIGNAL conta : std_logic_vector(1 DOWNTO 0) := "00";
BEGIN
	P1 : PROCESS (clock)
	BEGIN
		IF clock'EVENT AND clock = '1' THEN
			IF enable = '1' THEN
				IF conta = "11" THEN
					conta <= "00";
				ELSE
					conta <= conta + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	contagem <= conta;
END arch;
