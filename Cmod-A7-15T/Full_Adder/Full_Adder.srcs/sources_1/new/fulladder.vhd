library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
  Port ( 
  a: in STD_LOGIC;
  b: in STD_LOGIC;
  ci: in STD_LOGIC;
  sum: out STD_LOGIC;
  carry: out STD_LOGIC
  );
end fulladder;

architecture Behavioral of fulladder is
begin
    sum <= a xor b xor ci;
    carry <= (a and b) or (a and ci) or (b and ci);
end Behavioral;
