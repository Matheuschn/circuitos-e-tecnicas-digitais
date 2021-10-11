LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controle IS
	PORT (
		clock, reset : IN std_logic;
		RSET : OUT std_logic;
		S : OUT std_logic_vector(1 DOWNTO 0)
	);
END controle;

ARCHITECTURE arch OF controle IS
	TYPE STATES IS (E0, E1, E2, E3, E4, E5);
	SIGNAL EA, PE : STATES;
BEGIN
	-- OBS: especificar o valor de saída do sinal de comando RESET (RSET) em todos os estados!!!!!
	-- inserir seu código abaixo
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '0' THEN
			EA <= E0;
		ELSIF clock'EVENT AND clock = '1' THEN
			EA <= PE;
		END IF;
	END PROCESS;
 
	P2 : PROCESS (EA)
	BEGIN
		CASE EA IS
			WHEN E0 => 
				RSET <= '1';
				S <= "00";
				PE <= E1;
			WHEN E1 => 
				RSET <= '0';
				S <= "11";
				PE <= E2;
			WHEN E2 => 
				RSET <= '0';
				S <= "01";
				PE <= E3;
			WHEN E3 => 
				RSET <= '0';
				S <= "10";
				PE <= E4;
			WHEN E4 => 
				RSET <= '0';
				S <= "10";
				PE <= E5;
			WHEN E5 => 
				RSET <= '0';
				S <= "11";
				PE <= E0;
		END CASE;
	END PROCESS;
END arch;
