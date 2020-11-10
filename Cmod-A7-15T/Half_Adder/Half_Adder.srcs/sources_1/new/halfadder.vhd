library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
  Port (
    a: in STD_LOGIC;
    b: in STD_LOGIC;
    sum: out STD_LOGIC;
    carry: out STD_LOGIC);
end halfadder;

architecture Behavioral of halfadder is

begin
    sum <= (a xor b); 
    carry <= (a and b);

end Behavioral;
