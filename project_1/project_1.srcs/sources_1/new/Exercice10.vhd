----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.10.2021 11:49:00
-- Design Name: 
-- Module Name: Exercice10 - Behavioral
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

entity Exercice10 is
    Port ( x : in STD_LOGIC;
           clk : in STD_LOGIC;
           res_out : out STD_LOGIC);
end Exercice10;

architecture Behavioral of Exercice10 is
type state is (S0, S1, S2, S3, S4, S5, S6);
signal state_reg : state;
begin

process (clk)
begin
if clk = '1' and clk'event then
    case state_reg is 
        when S0 =>
            res_out <= '0';
            if x = '0' then
                state_reg <= S1;
            end if;
        when S1 =>
            res_out <= '0';
            if x = '0' then
                state_reg <= S2;
            else
                state_reg <= S0;
            end if;
        when S2 =>
            res_out <= '0';
            if x = '0' then
                state_reg <= S3;
            else
                state_reg <= S4;
            end if;
        when S3 =>
            res_out <= '0';
            if x = '1' then
                state_reg <= S5;
            end if;
        when S4 =>
            res_out <= '0';
            if x = '0' then
                state_reg <= S6;
            else
                state_reg <= S0;
            end if;
        when S5 =>
            res_out <= '1';
            if x = '0' then
                state_reg <= S6;
            else
                state_reg <= S0;
            end if;
        when S6 =>
            res_out <= '1';
            if x = '0' then
                state_reg <= S2;
            else
                state_reg <= S0;
            end if;
    end case;
end if;
end process;



end Behavioral;
