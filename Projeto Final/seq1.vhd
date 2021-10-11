LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY seq1 IS
	PORT (
		address : IN std_logic_vector(4 DOWNTO 0);
		data : OUT std_logic_vector(7 DOWNTO 0) 
	);
END ENTITY;

ARCHITECTURE arch OF seq1 IS
	TYPE memory IS ARRAY (00 TO 31) OF std_logic_vector(7 DOWNTO 0);
	CONSTANT my_Rom : memory := (
		00 => "00100000", 
		01 => "10000000", 
		02 => "00100000", 
		03 => "01000000", 
		04 => "00000001", 
		05 => "10000000", 
		06 => "00000100", 
		07 => "00010000", 
		08 => "00100000", 
		09 => "10000000", 
		10 => "00100000", 
		11 => "01000000", 
		12 => "00000001", 
		13 => "10000000", 
		14 => "00000100", 
		15 => "00010000", 
		16 => "00100000", 
		17 => "10000000", 
		18 => "00100000", 
		19 => "01000000", 
		20 => "00000001", 
		21 => "10000000", 
		22 => "00000100", 
		23 => "00010000", 
		24 => "00100000", 
		25 => "10000000", 
		26 => "00100000", 
		27 => "01000000", 
		28 => "00000001", 
		29 => "10000000", 
		30 => "00000100", 
		31 => "00010000"
	);
 
BEGIN
	PROCESS (address)
	BEGIN
		CASE address IS
			WHEN "00000" => data <= my_rom(00);
			WHEN "00001" => data <= my_rom(01);
			WHEN "00010" => data <= my_rom(02);
			WHEN "00011" => data <= my_rom(03);
			WHEN "00100" => data <= my_rom(04);
			WHEN "00101" => data <= my_rom(05);
			WHEN "00110" => data <= my_rom(06);
			WHEN "00111" => data <= my_rom(07);
			WHEN "01000" => data <= my_rom(08);
			WHEN "01001" => data <= my_rom(09);
			WHEN "01010" => data <= my_rom(10);
			WHEN "01011" => data <= my_rom(11);
			WHEN "01100" => data <= my_rom(12);
			WHEN "01101" => data <= my_rom(13);
			WHEN "01110" => data <= my_rom(14);
			WHEN "01111" => data <= my_rom(15);
			WHEN "10000" => data <= my_rom(16);
			WHEN "10001" => data <= my_rom(17);
			WHEN "10010" => data <= my_rom(18);
			WHEN "10011" => data <= my_rom(19);
			WHEN "10100" => data <= my_rom(20);
			WHEN "10101" => data <= my_rom(21);
			WHEN "10110" => data <= my_rom(22);
			WHEN "10111" => data <= my_rom(23);
			WHEN "11000" => data <= my_rom(24);
			WHEN "11001" => data <= my_rom(25);
			WHEN "11010" => data <= my_rom(26);
			WHEN "11011" => data <= my_rom(27);
			WHEN "11100" => data <= my_rom(28);
			WHEN "11101" => data <= my_rom(29);
			WHEN "11110" => data <= my_rom(30);
			WHEN OTHERS => data <= my_rom(31);
 
		END CASE;
	END PROCESS;
END arch;
