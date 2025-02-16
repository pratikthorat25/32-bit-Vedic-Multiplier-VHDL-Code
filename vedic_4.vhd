library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vedic_4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0));
end vedic_4;

architecture Behavioral of vedic_4 is
component vedic_2 is
Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component cla_adder is
port( A: in std_logic_vector(3 downto 0);
      B: in std_logic_vector(3 downto 0);
        cin : in std_logic;
        S : out std_logic_vector(3 downto 0);
        cout : out std_logic);
end component;

signal ca1, ca2, ca3: std_logic;
signal s0,s1,s2,s3,s4,s5,s6,s7: std_logic_vector(3 downto 0);
signal x1,x2:std_logic_vector(3 downto 0);
begin
u1: vedic_2 port map(a(1 downto 0),b(1 downto 0),s0);

u2: vedic_2 port map(a(1 downto 0),b(3 downto 2),s1);

u3: vedic_2 port map(a(3 downto 2),b(1 downto 0),s2);

v1: cla_adder port map(s1,s2,'0',s4,ca1);
x1<="00" & s0(3 downto 2);

v2: cla_adder port map(x1,s4,'0',s5,ca2);

u4: vedic_2 port map(a(3 downto 2),b(3 downto 2),s3);
x2<='0' & (ca1 or ca2) & s5(3 downto 2);
v3: cla_adder port map(s3,x2,'0',s6,ca3);

y<=s6 & s5(1 downto 0) & s0(1 downto 0);

end Behavioral;