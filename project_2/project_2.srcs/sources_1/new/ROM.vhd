----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2021 16:35:16
-- Design Name: 
-- Module Name: REG - Behavioral
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
use ieee.numeric_std.all;

library work;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( data_out : out STD_LOGIC_VECTOR (21 downto 0);
           addr_read : in STD_LOGIC_VECTOR (addr_size-1 downto 0));

end ROM;

architecture Behavioral of ROM is
type regs is array (0 to 2**addr_size - 1) of std_logic_vector(21 downto 0);
signal ram_bank : regs;
begin

data_out <= ram_bank(to_integer(unsigned(addr_read)));

end Behavioral;
