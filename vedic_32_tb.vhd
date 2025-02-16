library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vedic_32_tb is
end vedic_32_tb;

architecture Behavioral of vedic_32_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component vedic_32
        Port (
            a : in  STD_LOGIC_VECTOR (31 downto 0);
            b : in  STD_LOGIC_VECTOR (31 downto 0);
            y : out STD_LOGIC_VECTOR (63 downto 0)
        );
    end component;

    -- Inputs
    signal a : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal b : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

    -- Outputs
    signal y : STD_LOGIC_VECTOR(63 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: vedic_32
        Port Map (
            a => a,
            b => b,
            y => y
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1
        a <= x"00000001"; -- 1
        b <= x"00000001"; -- 1
        wait for 10 ns;
        -- Expected output: y = 0000000000000000000000000000000000000000000000000000000000000001 (1)

        -- Test case 2
        a <= x"00000002"; -- 2
        b <= x"00000002"; -- 2
        wait for 10 ns;
        -- Expected output: y = 0000000000000000000000000000000000000000000000000000000000000100 (4)

        -- Test case 3
        a <= x"0000FFFF"; -- 65535
        b <= x"0000FFFF"; -- 65535
        wait for 10 ns;
        -- Expected output: y = 000000000000000011111111111111100000000000000001 (4294836225)

        -- Test case 4
        a <= x"FFFFFFFF"; -- 4294967295
        b <= x"FFFFFFFF"; -- 4294967295
        wait for 10 ns;
        -- Expected output: y = FFFFFFFE00000001 (18446744065119617025)

        -- Test case 5
        a <= x"12345678"; -- 305419896
        b <= x"87654321"; -- 2271560481
        wait for 10 ns;
        -- Expected output: y = 09A0CD05F1E0C078 (694740048947827832)

        -- End of test
        wait;
    end process;
end Behavioral;