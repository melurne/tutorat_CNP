----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2021 11:11:06
-- Design Name: 
-- Module Name: Exercice7 - Behavioral
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

entity Exercice7 is
    Port ( CLK : in STD_LOGIC;
           reset : in STD_LOGIC;
           mode : in STD_LOGIC; -- 1 <=> +, 0 <=> -
           data_out : out STD_LOGIC_VECTOR (8 downto 0);
           data_in : in STD_LOGIC_VECTOR (8 downto 0)
           );
end Exercice7;

architecture Behavioral of Exercice7 is
use ieee.numeric_std.all;

signal tmp : unsigned(8 downto 0);
begin
process(CLK, reset)
begin
    if reset='1' then
        data_out <= "000000000";
    elsif CLK='1' and CLK'event then
        if mode='1' then
            if tmp = 511 then
                tmp <= unsigned(data_in);
            else
                tmp <= tmp+1;
            end if;
        elsif mode='0' then
            if tmp = 0 then
                tmp <= unsigned(data_in);
            else
                tmp <= tmp-1;
            end if;
        end if;
    end if;
end process;

data_out <= std_logic_vector(tmp);

end Behavioral;
