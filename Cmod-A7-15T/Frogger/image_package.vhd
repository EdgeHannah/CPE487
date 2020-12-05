library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package IMAGE_PACKAGE is
    type DIGIT_TYPE is array(NATURAL range<>, NATURAL range<>) of BOOLEAN;
    type DIGIT_ARRAY_TYPE is array(NATURAL range<>) of DIGIT_TYPE;
   
    constant DIGIT_0 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE )
    );
    
    constant DIGIT_1 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE ),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , TRUE , TRUE , TRUE )
    );
    
    constant DIGIT_2 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE ),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , TRUE , TRUE , TRUE )
    );
    
    constant DIGIT_3 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE )    
    );
    
    constant DIGIT_4 : DIGIT_TYPE :=
    (
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE )
    );

    constant DIGIT_5 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE ),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE )
    );

    constant DIGIT_6 : DIGIT_TYPE :=
    (
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , FALSE, FALSE, FALSE),
    (TRUE , TRUE , TRUE , TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , FALSE, FALSE, TRUE ),
    (TRUE , TRUE , TRUE , TRUE )
    );

    constant DIGIT_7 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE ),
    (FALSE, FALSE, FALSE, TRUE )
    );

    constant DIGIT_8 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE),
    (TRUE , FALSE, FALSE, TRUE),
    (TRUE , FALSE, FALSE, TRUE),
    (TRUE , TRUE , TRUE , TRUE),
    (TRUE , FALSE, FALSE, TRUE),
    (TRUE , FALSE, FALSE, TRUE),
    (TRUE , TRUE , TRUE , TRUE)
    );

    constant DIGIT_9 : DIGIT_TYPE :=
    (
    (TRUE , TRUE , TRUE , TRUE),
    (TRUE , FALSE, FALSE, TRUE),
    (TRUE , FALSE, FALSE, TRUE),
    (TRUE , TRUE , TRUE , TRUE),
    (FALSE, FALSE, FALSE, TRUE),
    (FALSE, FALSE, FALSE, TRUE),
    (FALSE, FALSE, FALSE, TRUE)
    );

    constant DIGIT_ARRAY : DIGIT_ARRAY_TYPE :=
    (DIGIT_0, DIGIT_1, DIGIT_2,
     DIGIT_3, DIGIT_4, DIGIT_5,
     DIGIT_6, DIGIT_7, DIGIT_8, DIGIT_9);
    
    function digit_of_int (number : INTEGER; n : INTEGER) return INTEGER;
end package;

package body IMAGE_PACKAGE is
    function digit_of_int (number : INTEGER; n : INTEGER) return INTEGER is
    
    variable digit : INTEGER := 0;
    variable power10 : INTEGER := 1;    
    begin
    
    for i in 1 to n loop
        power10 := power10 * 10;
    end loop;
    
    digit := number * 10 / power10;
    digit := digit mod 10;
    
    return digit;
    end function;
end package body;
