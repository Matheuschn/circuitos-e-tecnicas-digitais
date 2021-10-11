LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY usertop IS
	PORT (
		CLK_1Hz : IN std_logic;
		KEY : IN std_logic_vector(2 DOWNTO 0);
		SW : IN std_logic_vector(5 DOWNTO 0);
		LEDR : OUT std_logic_vector(3 DOWNTO 0)
	);
END usertop;

ARCHITECTURE arch OF usertop IS
	SIGNAL SEL : std_logic_vector(1 DOWNTO 0);
	SIGNAL RST : std_logic;

	COMPONENT controle IS
		PORT (
			clock, reset : IN std_logic;
			RSET : OUT std_logic;
			S : OUT std_logic_vector(1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT datapath IS
		PORT (
			CLK_1Hz : IN std_logic;
			ENABLE : IN std_logic; -- enable
			RESET : IN std_logic;
			SW : IN std_logic_vector(3 DOWNTO 0);
			S : IN std_logic_vector(1 DOWNTO 0);
			Q : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;
BEGIN
	CTL : controle PORT MAP(CLK_1Hz, KEY(0), RST, SEL);
	DATA : datapath PORT MAP(CLK_1HZ, SW(5), RST, SW(3 DOWNTO 0), SEL, LEDR);
END arch;
