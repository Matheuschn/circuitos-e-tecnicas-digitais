LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY somasub IS
	PORT (
		A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		C : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		overflow : OUT STD_LOGIC
	);
END somasub;

ARCHITECTURE arch OF somasub IS
	SIGNAL R : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL Cout : STD_LOGIC_VECTOR(4 DOWNTO 1);
	COMPONENT fulladder IS
		PORT (
			A : IN STD_LOGIC;
			B : IN STD_LOGIC;
			Cin : IN STD_LOGIC;
			Cout : OUT STD_LOGIC;
			S : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT modb IS
		PORT (
			C1 : IN STD_LOGIC;
			C0 : IN STD_LOGIC;
			B : IN STD_LOGIC;
			R : OUT STD_LOGIC
		);
	END COMPONENT;
BEGIN
	R0 : modb PORT MAP(C(1), C(0), B(0), R(0));
	R1 : modb PORT MAP(C(1), C(0), B(1), R(1));
	R2 : modb PORT MAP(C(1), C(0), B(2), R(2));
	R3 : modb PORT MAP(C(1), C(0), B(3), R(3));
	SUM0 : fulladder PORT MAP(A(0), R(0), C(0), Cout(1), S(0));
	SUM1 : fulladder PORT MAP(A(1), R(1), Cout(1), Cout(2), S(1));
	SUM2 : fulladder PORT MAP(A(2), R(2), Cout(2), Cout(3), S(2));
	SUM3 : fulladder PORT MAP(A(3), R(3), Cout(3), Cout(4), S(3));
	overflow <= C(1) XOR (Cout(4) AND Cout(3));
END arch;

