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
			count : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT leddec IS
		PORT (
			data : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			anode : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			seg : OUT STD_LOGIC_VECTOR (0 to 6)
		);
	END COMPONENT;
	SIGNAL S : STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN
	C1 : counter
	PORT MAP(clk => sysclk, count => S);
	L1 : leddec
	PORT MAP(data => S, anode => anode, seg => seg);
END Behavioral;