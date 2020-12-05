LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.IMAGE_PACKAGE.ALL;

ENTITY image_source IS
	PORT (
	   score : in INTEGER range 0 to 999999;
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
END image_source;

ARCHITECTURE Behavioral OF image_source IS
    constant SCORE_X : INTEGER := 10;
    constant SCORE_Y : INTEGER := 10;

BEGIN
	
	END PROCESS;
END Behavioral;
