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
	SIGNAL frog_on : STD_LOGIC; -- indicates whether frog is over current pixel position
	-- current frog position - intitialized to center of screen
	SIGNAL frog_x  : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(320, 11);
	SIGNAL frog_y  : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(240, 11);
	-- current frog motion - initialized to +4 pixels/frame
	SIGNAL frog_y_motion : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000001000";
	SIGNAL frog_x_motion : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000001000";
BEGIN
	red <= NOT frog_on;
	green <= '1';
	blue  <= NOT frog_on;

	-- process to draw frog current pixel address is covered by frog position
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
	mfrog : PROCESS (up, down, left, right) IS
	BEGIN
		IF up == '1' THEN
			IF frog_y + size <= 600 THEN
				frog_y_motion <= "00000001000";
			ELSE
				frog_y_motion <= "00000000000";
			END IF;
			frog_y <= frog_y + frog_y_motion;
		END IF;
	END PROCESS;
END Behavioral;
