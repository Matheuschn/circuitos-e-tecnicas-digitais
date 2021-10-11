LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controle IS
	PORT (
		clock, reset, enter : IN std_logic;
		end_game, end_round : IN std_logic;
		R1 : OUT std_logic;
		state : OUT std_logic_vector(1 DOWNTO 0)
	);
END controle;

ARCHITECTURE arch OF controle IS
	TYPE STATES IS (S_START, S_SETUP, S_PLAY, S_NEXT_ROUND, S_END_GAME);
	SIGNAL EA, PE : STATES;
BEGIN
	P1 : PROCESS (clock, reset)
	BEGIN
		IF reset = '1' THEN
			EA <= S_START;
		ELSIF clock'EVENT AND clock = '1' THEN
			EA <= PE;
		END IF;
	END PROCESS;
 
	P2 : PROCESS (EA, enter, end_game, end_round)
	BEGIN
		CASE EA IS
			WHEN S_START => 
				R1 <= '1';
				PE <= S_SETUP;
			WHEN S_SETUP => 
				R1 <= '0';
				state <= "00";
				IF enter = '1' THEN
					PE <= S_PLAY;
				END IF;
			WHEN S_PLAY => 
				R1 <= '0';
				state <= "01";
				IF end_round = '1' THEN
					EA <= S_NEXT_ROUND;
				ELSIF end_game = '1' THEN
					EA <= S_END_GAME;
				END IF;
			WHEN S_NEXT_ROUND => 
				R1 <= '0';
				state <= "10";
				IF enter = '1' THEN
					PE <= S_PLAY;
				END IF;
			WHEN S_END_GAME => 
				R1 <= '0';
				state <= "11";
		END CASE;
	END PROCESS;
END arch;
