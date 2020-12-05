LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY vga_top IS
    PORT (
        sysclk    : IN STD_LOGIC;
        vga_red   : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        vga_green : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        vga_blue  : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
        vga_hsync : OUT STD_LOGIC;
        vga_vsync : OUT STD_LOGIC;
        reset     : IN STD_LOGIC;
        lock_led  : OUT STD_LOGIC;
        frog_up   : IN STD_LOGIC;
        frog_down : IN STD_LOGIC;
        frog_left : IN STD_LOGIC;
        frog_right: IN STD_LOGIC
    );
END vga_top;

ARCHITECTURE Behavioral OF vga_top IS
    SIGNAL pxl_clk : STD_LOGIC;
    -- internal signals to connect modules
    SIGNAL S_vsync : STD_LOGIC;
    SIGNAL S_pixel_row, S_pixel_col : STD_LOGIC_VECTOR (10 DOWNTO 0);
    COMPONENT frog IS
        PORT (
            v_sync : IN STD_LOGIC;
            pixel_row : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            pixel_col : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
            red : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            green : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            blue : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
            up : IN STD_LOGIC;
            down : IN STD_LOGIC;
            left : IN STD_LOGIC;
            right : IN STD_LOGIC
        );
    END COMPONENT;
    COMPONENT vga_sync IS
        PORT (
            pixel_clk : IN STD_LOGIC;
            hsync     : OUT STD_LOGIC;
            vsync     : OUT STD_LOGIC;
            pixel_row : OUT STD_LOGIC_VECTOR (10 DOWNTO 0);
            pixel_col : OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
        );
    END COMPONENT;
    
    component clk_wiz_0 is
    port (
      clk_in1  : in std_logic;
      reset    : in std_logic;
      clk_out1 : out std_logic;
      locked   : out std_logic
    );
    end component;
    
    
BEGIN
    add_frog : frog
    PORT MAP(
        --instantiate frog component
        v_sync    => S_vsync, 
        pixel_row => S_pixel_row, 
        pixel_col => S_pixel_col, 
        red       => vga_red, 
        green     => vga_green, 
        blue      => vga_blue,
        up        => frog_up,
		down      => frog_down,
	    left      => frog_left,
	    right     => frog_right
    );

    vga_driver : vga_sync
    PORT MAP(
        --instantiate vga_sync component
        pixel_clk => pxl_clk, 
        pixel_row => S_pixel_row, 
        pixel_col => S_pixel_col, 
        hsync     => vga_hsync, 
        vsync     => S_vsync
    );
    vga_vsync <= S_vsync; --connect output vsync
        
    clk_wiz_0_inst : clk_wiz_0
    port map (
      clk_in1 => sysclk,
      clk_out1 => pxl_clk,
      reset => reset,
      locked => lock_led
    );
    
END Behavioral;
