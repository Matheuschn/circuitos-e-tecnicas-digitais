LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY usertop IS
	PORT (

		CLK_500Hz : IN std_logic;
		CLK_1Hz : IN std_logic;
		KEY : IN std_logic_vector(3 DOWNTO 0);
		SW : IN std_logic_vector(6 DOWNTO 0);
		LEDR : OUT std_logic_vector(6 DOWNTO 0)

	);
END usertop;

ARCHITECTURE arch OF usertop IS
	-- Incluir signals se necessário

	SIGNAL m, r : std_logic_vector(6 DOWNTO 0); --m = valor máximo da contagem --r = saída da contagem
	SIGNAL c, reset : std_logic;
	SIGNAL Tw, Tc, Tm : std_logic;

	-- Declarar componentes
	COMPONENT datapath IS
		PORT (
			m : IN std_logic_vector(6 DOWNTO 0);
			r : OUT std_logic_vector(6 DOWNTO 0);
			clock, Tw, Tc : IN std_logic;
			Tm : OUT std_logic
		);
	END COMPONENT;

	COMPONENT controle IS
		PORT (
			c, Tm, clock, reset : IN std_logic;
			Tc, Tw : OUT std_logic
		);
	END COMPONENT;
BEGIN
	m <= SW(6 DOWNTO 0);
	c <= KEY(1);
	reset <= KEY(0);
	LEDR(6 DOWNTO 0) <= r;
	-- Incluir instancias de Datapath e Controle e conectá-las...
	DTP : datapath
	PORT MAP(m, r, CLK_1HZ, Tw, Tc, Tm);
	CTL : controle
	PORT MAP(c, Tm, CLK_500HZ, reset, Tc, Tw);

END arch;