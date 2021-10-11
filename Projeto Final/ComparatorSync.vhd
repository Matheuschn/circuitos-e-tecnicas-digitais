LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ComparatorSync IS
	PORT (
		entrada, CLK : IN std_logic;
		saida : OUT std_logic
	);
END ComparatorSync;
ARCHITECTURE circuito OF ComparatorSync IS
	TYPE STATES IS (EsperaAtivar, SaidaAtiva, EsperaDesativar);
	SIGNAL saidaState : STATES := EsperaAtivar;
	SIGNAL saidaNext : STATES := EsperaAtivar;

BEGIN
	P1 : PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN -- Resposta na transicao positiva do clock
			saidaState <= saidaNext;
		END IF;
	END PROCESS;
 
	P2 : PROCESS (entrada, saidaState)
	BEGIN
		CASE saidaState IS
			WHEN EsperaAtivar => 
				IF entrada = '1' THEN
					saidaNext <= SaidaAtiva;
				ELSE
					saidaNext <= EsperaAtivar;
				END IF;
				saida <= '0';
			WHEN SaidaAtiva => 
				IF entrada = '1' THEN
					saidaNext <= EsperaDesativar;
				ELSE saidaNext <= EsperaAtivar;
				END IF; 
				saida <= '1';
			WHEN EsperaDesativar => 
				IF entrada = '1' THEN
					saidaNext <= EsperaDesativar;
				ELSE saidaNext <= EsperaAtivar;
				END IF; 
				saida <= '0';
		END CASE; 
	END PROCESS;
END circuito;
