library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity vedic_2 is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end vedic_2;

architecture Behavioral of vedic_2 is

begin

q(0)<=a(0) and b(0);
q(1)<=(a(1) and b(0)) xor (a(0) and b(1));
q(2)<=((a(1) and b(0)) and (a(0) and b(1))) xor (a(1) and b(1));
q(3)<=(a(1) and b(0)) and (a(0) and b(1)) and (a(1) and b(1));
end Behavioral;