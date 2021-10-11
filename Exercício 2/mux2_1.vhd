-- OBS: Basta criar o componente uma vez e usa-lo mais de uma vez no usertop com diferentes entradas
LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY mux2_1 IS

	PORT (
		F1, F2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		sel : IN STD_LOGIC;
		F : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);

END mux2_1;

ARCHITECTURE arch OF mux2_1 IS
BEGIN
	F <= F1 WHEN sel = '0' ELSE
	     F2;
END arch;
