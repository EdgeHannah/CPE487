LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.IMAGE_PACKAGE.ALL;

ENTITY frog IS
	PORT (
		v_sync    : IN STD_LOGIC;
		pixel_row : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		pixel_col : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		red       : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		green     : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
		blue      : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
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
	SIGNAL frog_hop : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000001000";
	SIGNAL direction  : INTEGER := 8;
	
	constant SCORE_X : INTEGER := 10;
    constant SCORE_Y : INTEGER := 10;
BEGIN
	-- process to draw frog current pixel address is covered by frog position
	draw : PROCESS (frog_x, frog_y, pixel_row, pixel_col) IS
	variable score : INTEGER := 1;
	BEGIN
		IF (pixel_col >= frog_x - size) AND
		   (pixel_col <= frog_x + size) AND
		   (pixel_row >= frog_y - size) AND
	  	   (pixel_row <= frog_y + size) THEN
	  	    red <= "000"; green <= "011"; blue <= "00";
		ELSE
			red <= "000"; green <= "000"; blue <= "00";
		END IF;
		
        if DIGIT_ARRAY(digit_of_int(score, 1))(SCORE_Y,
        SCORE_X) then
            red <= "1111"; green <= "1111"; blue <= "1111";
        end if;
		
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
