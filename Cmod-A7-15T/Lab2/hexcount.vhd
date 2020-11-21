-- hexcount.vhd --

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY hexcount IS
	PORT (
		sysclk : IN STD_LOGIC;
		anode : OUT STD_LOGIC_VECTOR (0 TO 3);
		seg : OUT STD_LOGIC_VECTOR (0 TO 6);
		reset : in STD_LOGIC;
		lock_led : out STD_LOGIC
	);
END hexcount;

ARCHITECTURE Behavioral OF hexcount IS
    signal clk_50MHz : STD_LOGIC;
    
    component clk_wiz_0
    port
     (
      clk_50MHz        : out    std_logic;
      reset             : in     std_logic;
      locked            : out    std_logic;
      clk_in1           : in     std_logic
     );
    end component;
    
    ATTRIBUTE SYN_BLACK_BOX : BOOLEAN;
    ATTRIBUTE SYN_BLACK_BOX OF clk_wiz_0 : COMPONENT IS TRUE;
    
    ATTRIBUTE SYN_BLACK_PAD_PIN : STRING;
    ATTRIBUTE SYN_BLACK_PAD_PIN OF clk_wiz_0: COMPONENT IS "clk_in1, clk_100MHz, reset,locked";
  
    
 
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
			data : IN STD_LOGIC_VECTOR (0 TO 3); --DONT change, data is fixed 4 bits in leddec for each displays
			anode : OUT STD_LOGIC_VECTOR (0 TO 3);
			seg : OUT STD_LOGIC_VECTOR (0 TO 6)
		);
	END COMPONENT;

	SIGNAL S : STD_LOGIC_VECTOR (15 DOWNTO 0); -- connect C1 and L1 for values of 4 digits
	SIGNAL md : STD_LOGIC_VECTOR (1 DOWNTO 0); -- mpx selects displays
	SIGNAL display : STD_LOGIC_VECTOR (0 TO 3); -- send digit for only one display to leddec

BEGIN
    
    hexcount_inst : clk_wiz_0
       port map ( 
       clk_50MHz => clk_50MHz,
       reset => reset,
       locked => lock_led,
       clk_in1 => sysclk
     );
 

	C1 : counter
	PORT MAP(clk => clk_50MHz, count => S, mpx => md);
	L1 : leddec
	PORT MAP(dig => md, data => display, anode => anode, seg => seg);

	display <= S(3 DOWNTO 0) WHEN md = "00" ELSE
	           S(7 DOWNTO 4) WHEN md = "01" ELSE
	           S(11 DOWNTO 8) WHEN md = "10" ELSE
	           S(15 DOWNTO 12);

END Behavioral;
