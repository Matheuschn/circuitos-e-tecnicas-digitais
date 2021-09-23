LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY majority IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		C : IN STD_LOGIC;
		Y : OUT STD_LOGIC
	);
END majority;

ARCHITECTURE arch OF majority IS
	SIGNAL D, E, F : STD_LOGIC;
BEGIN
	D <= A AND B;
	E <= A AND C;
	F <= B AND C;
	Y <= D OR E OR F;
END arch;

