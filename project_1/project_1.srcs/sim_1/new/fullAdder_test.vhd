----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2021 11:59:13
-- Design Name: 
-- Module Name: fullAdder_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder_test is
--  Port ( );
end fullAdder_test;

architecture Behavioral of fullAdder_test is
signal a_in_t, b_in_t, c_in_t, c_out_t, s_out_t : std_logic;

component fullAdder
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           Cin : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end component;
begin
uut : fullAdder port map (
    a_in => a_in_t,
    b_in => b_in_t,
    Cin => c_in_t,
    C_out => c_out_t,
    S_out => s_out_t
);
stim_proc : process
    begin
        a_in_t <= '0';
        b_in_t <= '0';
        c_in_t <= '0';
        wait for 10 ns;
        a_in_t <= '1';
        wait for 10 ns;
        b_in_t <= '1';
        wait for 10 ns;
        c_in_t <= '1';
        wait;    
    end process;

end Behavioral;
