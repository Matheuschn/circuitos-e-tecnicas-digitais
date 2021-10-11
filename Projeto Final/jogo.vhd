LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY jogo IS
	PORT (
		CLK_500Hz : IN std_logic;
		KEY : IN std_logic_vector(3 DOWNTO 0);
		SW : IN std_logic_vector(7 DOWNTO 0);
		LEDR : OUT std_logic_vector(7 DOWNTO 0);
		HEX0, HEX1, HEX2 : OUT std_logic_vector(6 DOWNTO 0)
	);
END jogo;

ARCHITECTURE arch OF jogo IS
	SIGNAL BTN : std_logic_vector(3 DOWNTO 0);
	SIGNAL END_GAME, END_ROUND, R1 : std_logic;
	SIGNAL STATE : std_logic_vector(1 DOWNTO 0);

	COMPONENT ButtonSync IS
		PORT (
			KEY0, KEY1, KEY2, KEY3, CLK : IN std_logic;
			BTN0, BTN1, BTN2, BTN3 : OUT std_logic
		);
	END COMPONENT;

	COMPONENT controle IS
		PORT (
			clock, reset, enter : IN std_logic;
			end_game, end_round : IN std_logic;
			R1 : OUT std_logic;
			state : OUT std_logic_vector(1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT datapath IS
		PORT (
			btn3, btn2, btn1, CLK_500Hz, r1 : IN std_logic;
			state : IN std_logic_vector(1 DOWNTO 0);
			sw_entra : IN std_logic_vector(7 DOWNTO 0);
			h0, h1, h2 : OUT std_logic_vector(6 DOWNTO 0);
			led_out : OUT std_logic_vector (7 DOWNTO 0);
			end_game, end_round : OUT std_logic
		);
	END COMPONENT;
BEGIN
	BTNSYNC : ButtonSync PORT MAP(KEY(0), KEY(1), KEY(2), KEY(3), CLK_500Hz, BTN(0), BTN(1), BTN(2), BTN(3));
	CTL : controle PORT MAP(CLK_500Hz, BTN(0), BTN(3), END_GAME, END_ROUND, R1, STATE);
	DATA : datapath PORT MAP(BTN(3), BTN(2), BTN(1), CLK_500Hz, R1, STATE, SW, HEX0, HEX1, HEX2, LEDR, END_GAME, END_ROUND);
END arch;
