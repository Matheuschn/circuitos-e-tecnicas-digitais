LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY logica_trial IS
	PORT (
		N, T : IN std_logic_vector(1 DOWNTO 0);
		clk_sel : OUT std_logic_vector(2 DOWNTO 0)
	);
END logica_trial;

ARCHITECTURE arch OF logica_trial IS
	SIGNAL A, B, C, D, E, F, G, H, I : std_logic;
BEGIN
	A <= N(1) AND T(1);
	B <= N(0) AND T(1) AND T(0);
	C <= N(1) AND N(0) AND T(0);
	D <= N(1) AND NOT(T(1)) AND NOT(T(0));
	E <= N(1) AND NOT(N(0)) AND NOT(T(1));
	F <= NOT(N(1)) AND NOT(N(0)) AND T(1);
	G <= NOT(N(1)) AND T(1) AND NOT(T(0));
	H <= NOT(N(1)) AND N(0) AND NOT(T(1)) AND T(0);
	I <= N(1) AND N(0) AND T(1) AND T(0);

	clk_sel(0) <= N(0) XOR T(0);
	clk_sel(1) <= D OR E OR F OR G OR H OR I;
	clk_sel(2) <= A OR B OR C;
END arch;