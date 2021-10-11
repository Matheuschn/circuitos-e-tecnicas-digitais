LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY datapath IS
	PORT (
		m : IN std_logic_vector(6 DOWNTO 0);
		r : OUT std_logic_vector(6 DOWNTO 0);
		clock, Tw, Tc : IN std_logic;
		Tm : OUT std_logic
	);
END datapath;

ARCHITECTURE arch OF datapath IS
	SIGNAL tot : std_logic_vector(6 DOWNTO 0);

BEGIN
	-- Registrador e Somador:
	PROCESS (clock, Tc, Tw)
	BEGIN
		IF (Tc = '1') THEN
			tot <= "0000000";
		ELSIF (clock'EVENT AND clock = '1') THEN
			IF (Tw = '1') THEN
				tot <= tot + 1;
			END IF;
		END IF;
	END PROCESS;

	r <= tot;
	-- Comparador:
	Tm <= '1' WHEN (tot < m) ELSE
	      '0';

END arch;