LIBRARY IEEE;
USE IEEE.Std_Logic_1164.ALL;

ENTITY usertop IS
	PORT (
		CLK_1Hz : IN std_logic;
		KEY : IN std_logic_vector(1 DOWNTO 0); -- você vai usar apenas KEY(0)
		LEDR : OUT std_logic_vector(3 DOWNTO 0);
		HEX0 : OUT std_logic_vector(6 DOWNTO 0)
	);
END usertop;

ARCHITECTURE arch OF usertop IS
	SIGNAL N : std_logic_vector(3 DOWNTO 0) := "0000";
	SIGNAL S : std_logic_vector(3 DOWNTO 0) := "0000";

	COMPONENT registrador IS
		PORT (
			CLK, RST : IN std_logic;
			D : IN std_logic_vector(3 DOWNTO 0);
			Q : OUT std_logic_vector(3 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT decod7seg IS
		PORT (
			INPUT : IN std_logic_vector(3 DOWNTO 0);
			HEX0 : OUT std_logic_vector(6 DOWNTO 0)
		);
	END COMPONENT;
BEGIN
	reg : registrador PORT MAP(CLK_1Hz, KEY(0), N, S);
	hex : decod7seg PORT MAP(S, HEX0);

	PROCESS (CLK_1Hz)
	BEGIN
		LEDR <= S;
		N(3) <= ((NOT S(3)) AND KEY(0)) OR (S(2) AND (NOT S(1)) AND KEY(0));
		N(2) <= ((NOT S(3)) AND KEY(0)) OR ((NOT S(2)) AND (NOT S(1)) AND KEY(0));
		N(1) <= ((NOT S(3)) AND S(2) AND KEY(0)) OR ((NOT S(2)) AND S(0) AND KEY(0)) OR ((NOT S(1)) AND S(0) AND KEY(0));
		N(0) <= ((NOT S(3)) AND (NOT S(1)) AND KEY(0)) OR ((NOT S(3)) AND S(2) AND KEY(0)) OR ((NOT S(1)) AND S(2) AND KEY(0));
	END PROCESS;
END arch;
