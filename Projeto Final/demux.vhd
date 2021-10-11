LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY demux IS
	PORT (
		ent, sel : IN std_logic;
		out0, out1 : OUT std_logic
	);
END demux;

ARCHITECTURE arch OF demux IS
BEGIN
	out0 <= (ent AND NOT sel);
	out1 <= (ent AND sel);

END arch;
