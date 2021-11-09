----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.10.2021 10:37:54
-- Design Name: 
-- Module Name: Exercice9 - Behavioral
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

entity Exercice9 is
    Port ( input : in STD_LOGIC;
           clk : in STD_LOGIC;
           tick : out STD_LOGIC);
end Exercice9;

architecture Behavioral of Exercice9 is
type state is (zero, edge, one);
signal state_reg : state;
begin
process (clk)
begin
    if clk = '1' and clk'event then
        case state_reg is 
            when zero =>
                tick <= '0';
                if input = '1' then
                    state_reg <= edge;
                end if;
            when edge =>
                tick <= '1';
                if input = '0' then
                    state_reg <= zero;
                else 
                    state_reg <= one;
                end if;
            when one => 
                tick <= '1';
                if input = '0' then
                    state_reg <= zero;
                end if;
        end case;
    end if;
end process;


end Behavioral;
