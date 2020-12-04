LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.ENEMY_PACKAGE.ALL;

ENTITY enemy_data IS
	PORT (
	    clock : in STD_LOGIC;
        clear : in STD_LOGIC
	);
END enemy_data;

ARCHITECTURE Behavioral OF enemy_data IS
	CONSTANT size  : INTEGER := 8;
	SIGNAL frog_on : STD_LOGIC; -- indicates whether frog is over current pixel position
	-- current frog position - intitialized to center of screen
	SIGNAL frog_x  : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(320, 11);
	SIGNAL frog_y  : STD_LOGIC_VECTOR(10 DOWNTO 0) := CONV_STD_LOGIC_VECTOR(240, 11);
	-- current frog motion - initialized to +4 pixels/frame
	SIGNAL frog_hop : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000001000";
	SIGNAL direction  : INTEGER := 8;
BEGIN
	--red <= NOT frog_on;
	--green <= '1';
	--blue  <= NOT frog_on;

	-- process to draw frog current pixel address is covered by frog position
	bdraw : PROCESS (frog_x, frog_y, pixel_row, pixel_col) IS
	BEGIN
		IF (pixel_col >= frog_x - size) AND
		   (pixel_col <= frog_x + size) AND
		   (pixel_row >= frog_y - size) AND
	  	   (pixel_row <= frog_y + size) THEN
	  	    red <= '0'; green <= '1'; blue <= '0';
		ELSE
			red <= '0'; green <= '0'; blue <= '0';
		END IF;
		END PROCESS;
	-- process to move frog once every frame (i.e. once every vsync pulse)
	mfrog : PROCESS
	BEGIN
	   WAIT UNTIL rising_edge(v_sync);
	   IF up = '1' THEN
	       direction <= 1;
	   ELSIF down = '1' THEN
	       direction <= 2;
	   ELSIF left = '1' THEN
	       direction <= 3;
	   ELSIF right = '1' THEN
	       direction <= 4;
	   ELSE
	       direction <= 0;
	   END IF;
	   
	   IF direction = 1 AND frog_y > size THEN 
	       frog_y <= frog_y - frog_hop;
	   ELSIF direction = 2 AND frog_y + size < 480 THEN
	       frog_y <= frog_y + frog_hop;
	   ELSIF direction = 3 AND frog_x > size THEN  
	       frog_x <= frog_x - frog_hop;
	   ELSIF direction = 4 AND frog_x + size < 640 THEN 
	       frog_x <= frog_x + frog_hop; 
	   END IF;  
	END PROCESS;
END Behavioral;
