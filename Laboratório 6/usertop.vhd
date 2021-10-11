LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY usertop IS
	PORT (
		CLK_1Hz : IN std_logic;
		KEY : IN std_logic_vector(1 DOWNTO 0);
		LEDR : OUT std_logic_vector(3 DOWNTO 0);
		HEX0 : OUT std_logic_vector(6 DOWNTO 0)
	);
END usertop;

ARCHITECTURE arch OF usertop IS

	COMPONENT decod7seg IS
		PORT (
			INPUT : IN std_logic_vector(3 DOWNTO 0);
			HEX0 : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT contador IS
		PORT (
			reset, clock : IN std_logic;
			contagem : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL F : std_logic_vector(3 DOWNTO 0);

BEGIN
	CONT : contador
	PORT MAP(KEY(0), CLK_1Hz, F);
	DECOD : decod7seg
	PORT MAP(F, HEX0);
	LEDR <= F;
END arch;