LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY usertop IS
	PORT (
		A : IN std_logic_vector(3 DOWNTO 0);
		C : IN std_logic_vector(1 DOWNTO 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT std_logic_vector(6 DOWNTO 0)
	);
END usertop;

ARCHITECTURE arch OF usertop IS
	SIGNAL F, F1, F2, F3, F4 : std_logic_vector(3 DOWNTO 0);

	COMPONENT circuito1 IS
		PORT (
			A : IN std_logic_vector(3 DOWNTO 0);
			F1, F2, F3, F4 : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux4_1 IS
		PORT (
			F1, F2, F3, F4 : IN std_logic_vector(3 DOWNTO 0);
			sel : IN std_logic_vector(1 DOWNTO 0);
			F : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT mux2_1 IS
		PORT (
			F1 : IN std_logic_vector(6 DOWNTO 0);
			F2 : IN std_logic_vector(6 DOWNTO 0);
			sel : IN std_logic;
			F : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decod_C2 IS
		PORT (
			G : IN std_logic_vector(3 DOWNTO 0);
			F : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decod IS
		PORT (
			G : IN std_logic_vector(1 DOWNTO 0);
			F : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;
	SIGNAL off : std_logic_vector(6 DOWNTO 0) := "1111111";
	SIGNAL minus : std_logic_vector(6 DOWNTO 0) := "0111111";
	SIGNAL equal : std_logic_vector(6 DOWNTO 0) := "0110111";
	SIGNAL plus : std_logic_vector(6 DOWNTO 0) := "0001111";
BEGIN
	C1 : circuito1 PORT MAP(A, F1, F2, F3, F4);
	CMUX : mux4_1 PORT MAP(F1, F2, F3, F4, C, F);
	CHEX0 : decod_C2 PORT MAP(F, HEX0);
	CHEX1 : mux2_1 PORT MAP(off, minus, F(3), HEX1);
	HEX2 <= equal;
	CHEX3 : decod PORT MAP(C, HEX3);
	CHEX4 : mux2_1 PORT MAP(plus, minus, C(1), HEX4);
	CHEX5 : decod_C2 PORT MAP(A, HEX5);
	CHEX6 : mux2_1 PORT MAP(off, minus, A(3), HEX6);
 
END arch;
