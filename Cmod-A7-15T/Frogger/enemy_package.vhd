library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package ENEMY_PACKAGE is
    type ENEMY_TYPE is (CAR, LOG); -- Types of enemies
    
    type ENEMY_COOR is record -- Coordinate attribute
        x : INTEGER range 0 to (640 - 1);
        y : INTEGER range 0 to (480 - 1);
    end record;

    --type ENEMY_COL is record -- Coordinate attribute
    --   r : INTEGER range 0 to (640 - 1);
    --    g : INTEGER range 0 to (480 - 1);
    --    b : 
    --end record;

    type ENEMY_VEL is record -- Coordinate attribute
        delx : INTEGER range 0 to 10;
    end record;
    
    type ENEMY_DEF is record
        enemy : ENEMY_TYPE;
        coords : ENEMY_COOR;
        s : INTEGER;
        speed : ENEMY_VEL;
        direc : BOOLEAN; --True is right
    end record;
    
    constant CARS : ENEMY_DEF :=
    (
       enemy => CAR,
       coords => (x => 0, y => 0),
       s => 16,
       speed => (delx => 1),
       direc => FALSE
    );
    constant LOGS : ENEMY_DEF :=
    (
       enemy => LOG,
       coords => (x => 0, y => 0),
       s => 12,
       speed => (delx => 1),
       direc => FALSE
    );
    function speedup_enemy (enem : ENEMY_DEF) return ENEMY_DEF;
end package;
package body ENEMY_PACKAGE is
    function speedup_enemy (enem : ENEMY_DEF) return ENEMY_DEF is
        variable faster_enemy : ENEMY_DEF;
        variable deltaX : INTEGER := 1;
        
        begin
            faster_enemy.speed := (delx => deltaX);
            return faster_enemy;   
    end function;  
end package body;
