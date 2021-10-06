LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY aritmetico_reg IS
	PORT (
		A : IN std_logic_vector(2 DOWNTO 0);
		B : IN std_logic_vector(2 DOWNTO 0);
		SEL : IN std_logic_vector(1 DOWNTO 0);
		CLK, RST, ENTER : IN std_logic;
		OUTHEX : OUT std_logic_vector(6 DOWNTO 0);
		OUTBIN : OUT std_logic_vector(3 DOWNTO 0)
	);
END aritmetico_reg;

ARCHITECTURE arch OF aritmetico_reg IS
	SIGNAL F1, F2, F3, F4 : std_logic_vector(3 DOWNTO 0);
	SIGNAL FMUX : std_logic_vector(3 DOWNTO 0);
	SIGNAL G, H : std_logic_vector(3 DOWNTO 0);
	COMPONENT somador IS
		PORT (
			A, B : IN std_logic_vector(3 DOWNTO 0);
			F : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux IS
		PORT (
			W, X, Y, Z : IN std_logic_vector(3 DOWNTO 0);
			SEL : IN std_logic_vector(1 DOWNTO 0);
			F : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decod7seg IS
		PORT (
			INPUT : IN std_logic_vector(3 DOWNTO 0);
			HEX0 : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT circuito1 IS
		PORT (
			A, B : IN std_logic_vector(2 DOWNTO 0);
			F1, F2, F3, F4 : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT registrador IS
		PORT (
			CLK, RST, ENTER : IN std_logic;
			D : IN std_logic_vector (3 DOWNTO 0);
			Q : OUT std_logic_vector (3 DOWNTO 0)
		);
	END COMPONENT;

BEGIN
	C1 : circuito1
	PORT MAP(A, B, F1, F2, F3, F4);
	CMUX : mux
	PORT MAP(F1, F2, F3, F4, SEL, FMUX);
	CSUM : somador
	PORT MAP(F1, FMUX, G);
CREG : registrador
PORT MAP(CLK, RST, ENTER, G, H);
CHEX : decod7seg
PORT MAP(H, OUTHEX);
OUTBIN <= H;
END arch;