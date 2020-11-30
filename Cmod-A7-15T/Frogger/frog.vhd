LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY frog IS
	PORT (
		v_sync    : IN STD_LOGIC;
		pixel_row : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		pixel_col : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		red       : OUT STD_LOGIC;
		green     : OUT STD_LOGIC;
		blue      : OUT STD_LOGIC;
	    up        : IN STD_LOGIC;
	    down      : IN STD_LOGIC;
	    left      : IN STD_LOGIC;
	    right     : IN STD_LOGIC		
	);
END frog;

ARCHITECTURE Behavioral OF frog IS
	CONSTANT size  : INTEGER := 8;
	SIGNAL frog_on : STD_LOGIC; -- indicates whether ball is over current pixel position
	-- current ball position - intitialized to center of screen
	SIGNAL frog_x  : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(400, 11);
	SIGNAL frog_y  : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(300, 11);
	-- current ball motion - initialized to +4 pixels/frame
	SIGNAL frog_y_motion : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000000100";
	SIGNAL frog_x_motion : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000000100";
BEGIN
	red <= NOT frog_on; -- color setup for red ball on white background
	green <= '1';
	blue  <= NOT frog_on;
	-- process to draw ball current pixel address is covered by ball position
	bdraw : PROCESS (frog_x, frog_y, pixel_row, pixel_col) IS
	BEGIN
		IF (pixel_col >= frog_x - size) AND
		 (pixel_col <= frog_x + size) AND
			 (pixel_row >= frog_y - size) AND
			 (pixel_row <= frog_y + size) THEN
				frog_on <= '1';
		ELSE
			frog_on <= '0';
		END IF;
		END PROCESS;
		-- process to move frog once every frame (i.e. once every vsync pulse)
		mball : PROCESS
		BEGIN
			WAIT UNTIL rising_edge(v_sync);
			-- allow for bounce off top or bottom of screen
			IF frog_y + size >= 600 THEN
				frog_y_motion <= "11111111100"; -- -4 pixels
			ELSIF frog_y <= size THEN
				frog_y_motion <= "00000000100"; -- +4 pixels
			END IF;
			frog_y <= frog_y + frog_y_motion; -- compute next frog position
		END PROCESS;
END Behavioral;
