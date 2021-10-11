LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY datapath IS
	PORT (
		CLK_1Hz : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;
		SW : IN std_logic_vector(3 DOWNTO 0);
		S : IN std_logic_vector(1 DOWNTO 0);
		Q : OUT std_logic_vector(3 DOWNTO 0)
	);
END datapath;

ARCHITECTURE arch OF datapath IS
	SIGNAL S0, S1, S2, S3, F, SAIDA : std_logic_vector(3 DOWNTO 0);

	COMPONENT circuito1 IS
		PORT (
			I, Q : IN std_logic_vector(3 DOWNTO 0);
			S0, S1, S2, S3 : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux4_1 IS
		PORT (
			F1, F2, F3, F4 : IN std_logic_vector(3 DOWNTO 0);
			sel : IN std_logic_vector(1 DOWNTO 0);
			F : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT registrador IS
		PORT (
			CLK, RST, EN : IN std_logic;
			D : IN std_logic_vector(3 DOWNTO 0);
			Q : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;
BEGIN
	CCT1 : circuito1 PORT MAP(SW, SAIDA, S0, S1, S2, S3);
	MUX : mux4_1 PORT MAP(S0, S1, S2, S3, S, F);
	REG : registrador PORT MAP(CLK_1Hz, RESET, ENABLE, F, SAIDA);

	Q <= SAIDA;
END arch;
