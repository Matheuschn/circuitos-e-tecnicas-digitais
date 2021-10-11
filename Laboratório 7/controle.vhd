LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controle IS
	PORT (
		c, Tm, clock, reset : IN std_logic;
		Tc, Tw : OUT std_logic
	);
END controle;

ARCHITECTURE arch OF controle IS
	TYPE STATES IS (INIT, ESPERA, COUNT);
	SIGNAL EA, PE : STATES;

BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '0' THEN
			EA <= INIT;
		ELSIF clock'EVENT AND clock = '0' THEN
			EA <= PE;
		END IF;
	END PROCESS;

	P2 : PROCESS (EA)
	BEGIN
		CASE EA IS
			WHEN INIT => 
				Tc <= '1';
				Tw <= '0';
				PE <= ESPERA;
			WHEN ESPERA => 
				Tc <= '0';
				Tw <= '0';
				IF (NOT Tm) = '1' THEN
					PE <= INIT;
				ELSIF (c AND Tm) = '1' THEN
					PE <= COUNT;
				ELSIF ((NOT c) AND Tm) = '1' THEN
					PE <= ESPERA;
				END IF;
			WHEN COUNT => 
				Tc <= '0';
				Tw <= '1';
				PE <= ESPERA;
		END CASE;
	END IF;
	END PROCESS;
END arch;