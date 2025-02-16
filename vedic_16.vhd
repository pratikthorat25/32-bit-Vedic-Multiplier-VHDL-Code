library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vedic_16 is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (31 downto 0));
end vedic_16;

architecture Behavioral of vedic_16 is
component vedic_8 is
Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component cla_16 is
port(
         x_in      :  IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
         y_in      :  IN   STD_LOGIC_VECTOR(15 DOWNTO 0);
         carry_in  :  IN   STD_LOGIC;
         sum       :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
         carry_out :  OUT  STD_LOGIC
        );
end component;

signal ca1, ca2, ca3: std_logic;
signal s0,s1,s2,s3,s4,s5,s6,s7: std_logic_vector(15 downto 0);
signal x0,x1,x2,x3,x4,x5,x6,x7:std_logic_vector(15 downto 0);
signal cc0,cc1,cc2,cc3,cc4,cc5,cc6:std_logic_vector(15 downto 0);
begin
	
u1: vedic_8 port map(a(7 downto 0),b(7 downto 0),s0);
cc0<="00000000" & s0(15 downto 8);

u2: vedic_8 port map(a(15 downto 8),b(7 downto 0),s1);
u3: vedic_8 port map(a(7 downto 0),b(15 downto 8),s2);

v0: cla_16 port map(s1,s2,'0',x0,ca1);

v1: cla_16 port map(x0,cc0,'0',x1,ca2);
cc1<="0000000" & (ca1 or ca2) & x1(15 downto 8);

u4: vedic_8 port map(a(15 downto 8),b(15 downto 8),s3);


v2: cla_16 port map(s3,cc1,'0',x2,ca3);


y<=x2 & x1(7 downto 0) & s0(7 downto 0);

end Behavioral;