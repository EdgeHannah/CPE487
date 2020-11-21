LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY leddec16 IS
	PORT (
	   dig : IN STD_LOGIC_VECTOR (1 DOWNTO 0); -- which digit to currently display
	   data : IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- 16-bit (4-digit) data
	   anode : OUT STD_LOGIC_VECTOR (0 TO 3); -- which anode to turn on
	   seg : OUT STD_LOGIC_VECTOR (0 TO 6)); -- segment code for current digit
END leddec16;

ARCHITECTURE Behavioral OF leddec16 IS
	SIGNAL data4 : STD_LOGIC_VECTOR (3 DOWNTO 0); -- binary value of current digit
BEGIN
	-- Select digit data to be displayed in this mpx period
	data4 <= data(3 DOWNTO 0) WHEN dig = "00" ELSE --digit 0
	         data(7 DOWNTO 4) WHEN dig = "01" ELSE --digit 1
	         data(11 DOWNTO 8) WHEN dig = "10" ELSE --digit 2
	         data(15 DOWNTO 12); --digit 3
	-- Turn on segments corresponding to 4-bit data word
	seg <= "1111110" WHEN data4 = "0000" ELSE --0
	       "0110000" WHEN data4 = "0001" ELSE --1
	       "1101101" WHEN data4 = "0010" ELSE --2
	       "1111001" WHEN data4 = "0011" ELSE --3
	       "0110011" WHEN data4 = "0100" ELSE --4
	       "1011011" WHEN data4 = "0101" ELSE --5
	       "1011111" WHEN data4 = "0110" ELSE --6
	       "1110000" WHEN data4 = "0111" ELSE --7
	       "1111111" WHEN data4 = "1000" ELSE --8
	       "1111011" WHEN data4 = "1001" ELSE --9
	       "1110111" WHEN data4 = "1010" ELSE --A
	       "0011111" WHEN data4 = "1011" ELSE --B
	       "1001110" WHEN data4 = "1100" ELSE --C
	       "0111101" WHEN data4 = "1101" ELSE --D
	       "1001111" WHEN data4 = "1110" ELSE --E
	       "1000111" WHEN data4 = "1111" ELSE --F
	       "0000000";
	-- Turn on anode of 7-segment display addressed by 2-bit digit selector dig
	anode <= "0001" WHEN dig = "00" ELSE -- digit 0
	         "0010" WHEN dig = "01" ELSE -- digit 1
	         "0100" WHEN dig = "10" ELSE -- digit 2
	         "1000" WHEN dig = "11" ELSE -- digit 3
	         "0000";
END Behavioral;
