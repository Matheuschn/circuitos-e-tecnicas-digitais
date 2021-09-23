LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY fulladder IS
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		Cin : IN STD_LOGIC;
		Cout : OUT STD_LOGIC;
		S : OUT STD_LOGIC
	);
END fulladder;

ARCHITECTURE arch OF fulladder IS
BEGIN
	S <= (A XOR B) XOR Cin;
	Cout <= ((A XOR B) AND Cin) OR (A AND B);
END arch;

