LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY leddec IS
	PORT (
		dig : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		data : IN STD_LOGIC_VECTOR (0 TO 3);
		anode : OUT STD_LOGIC_VECTOR (0 TO 3);
		seg : OUT STD_LOGIC_VECTOR (0 TO 6)
	);
END leddec;

ARCHITECTURE Behavioral OF leddec IS
BEGIN
	-- Turn on segments corresponding to 4-bit data word
	seg <= "1111110" WHEN data = "0000" ELSE --0
	       "0110000" WHEN data = "0001" ELSE --1
	       "1101101" WHEN data = "0010" ELSE --2
	       "1111001" WHEN data = "0011" ELSE --3
	       "0110011" WHEN data = "0100" ELSE --4
	       "1011011" WHEN data = "0101" ELSE --5
	       "1011111" WHEN data = "0110" ELSE --6
	       "1110000" WHEN data = "0111" ELSE --7
	       "1111111" WHEN data = "1000" ELSE --8
	       "1111011" WHEN data = "1001" ELSE --9
	       "1110111" WHEN data = "1010" ELSE --A
	       "0011111" WHEN data = "1011" ELSE --B
	       "1001110" WHEN data = "1100" ELSE --C
	       "0111101" WHEN data = "1101" ELSE --D
	       "1001111" WHEN data = "1110" ELSE --E
	       "1000111" WHEN data = "1111" ELSE --F
	       "0000000";

	-- Turn on anode of 7-segment display addressed by 2-bit digit selector dig
	anode <= "1110" WHEN dig = "00" ELSE --0
	         "1101" WHEN dig = "01" ELSE --1
	         "1011" WHEN dig = "10" ELSE --2
	         "0111" WHEN dig = "11" ELSE --3
	         "1111";
END Behavioral;
