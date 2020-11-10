-- hexcount.vhd --

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY hexcount IS
	PORT (
		sysclk : IN STD_LOGIC;
		anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		seg : OUT STD_LOGIC_VECTOR (0 TO 6)
	);
END hexcount;

ARCHITECTURE Behavioral OF hexcount IS

	COMPONENT counter IS
		PORT (
			clk : IN STD_LOGIC;
			count : OUT STD_LOGIC_VECTOR (15 DOWNTO 0); --NEED CHANGE! counter now output 16 bits for all 4 displays
			mpx : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT leddec IS
		PORT (
			dig : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			data : IN STD_LOGIC_VECTOR (3 DOWNTO 0); --DONT change, data is fixed 4 bits in leddec for each displays
			anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			seg : OUT STD_LOGIC_VECTOR (0 TO 6)
		);
	END COMPONENT;

	SIGNAL S : STD_LOGIC_VECTOR (15 DOWNTO 0); -- connect C1 and L1 for values of 4 digits
	SIGNAL md : STD_LOGIC_VECTOR (1 DOWNTO 0); -- mpx selects displays
	SIGNAL display : STD_LOGIC_VECTOR (3 DOWNTO 0); -- send digit for only one display to leddec

BEGIN
	C1 : counter
	PORT MAP(clk => sysclk, count => S, mpx => md);
	L1 : leddec
	PORT MAP(dig => md, data => display, anode => anode, seg => seg);

	display <= S(3 DOWNTO 0) WHEN md = "00" ELSE
	           S(7 DOWNTO 4) WHEN md = "01" ELSE
	           S(11 DOWNTO 8) WHEN md = "10" ELSE
	           S(15 DOWNTO 12);

END Behavioral;
