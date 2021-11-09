----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.10.2021 10:36:33
-- Design Name: 
-- Module Name: exercice6b - Behavioral
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

entity exercice6b is
    Port ( CLK : in STD_LOGIC;
           set : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC;
           data_out : out STD_LOGIC;
           enable : in STD_LOGIC);
end exercice6b;

architecture Behavioral of exercice6b is

begin
latch : process(CLK, set , reset)
   begin
   if set='1' and reset='0' then
        data_out <= '1';
   elsif set='0' and reset='1' then
        data_out <= '0';
   elsif CLK='1' and CLK'event and enable='1' then
    data_out <= data_in;
   end if;

end process;

end Behavioral;
