----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 17:46:42
-- Design Name: 
-- Module Name: Exercice6 - Behavioral
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

entity Exercice6 is
    Port ( r : in STD_LOGIC;
           s : in STD_LOGIC;
           q : out STD_LOGIC);
end Exercice6;

architecture Behavioral of Exercice6 is
signal ck : std_logic;
begin
process (r, s)
begin
    if (r='1' and s ='0') then
        q <= '0';
    elsif (r='0' and s ='1') then
        q <= '1';
    elsif (r='1' and s='1') then
        q <= '0';
    end if;

end process;

end Behavioral;
