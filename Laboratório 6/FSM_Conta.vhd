LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY FSM_Conta IS
	PORT (
		reset, clock : IN std_logic;
		contagem : OUT std_logic_vector(3 DOWNTO 0)
	);
END FSM_Conta;

ARCHITECTURE arch OF FSM_Conta IS

	TYPE STATES IS (E0, E1, E2, E3, E4);
	SIGNAL EA, PE : STATES;

BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '1' THEN
			EA <= E0;
		ELSIF clock'EVENT AND clock = '0' THEN
			EA <= PE;
		END IF;
	END PROCESS;
 
	P2 : PROCESS (EA)
	BEGIN
		CASE EA IS
			WHEN E0 => 
				contagem <= "1001";
				PE <= E1;
			WHEN E1 => 
				contagem <= "1010";
				PE <= E2;
			WHEN E2 => 
				contagem <= "1011";
				PE <= E3;
			WHEN E3 => 
				contagem <= "1100";
				PE <= E4;
			WHEN E4 => 
				contagem <= "1101";
				PE <= E0;
		END CASE;
	END PROCESS;
END arch;