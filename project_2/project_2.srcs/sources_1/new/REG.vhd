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

entity REG is
    Port ( out_A : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           out_B : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           data_in : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           addr_A : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           addr_B : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           addr_write : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           write_enable : in STD_LOGIC;
           clk : in STD_LOGIC);
end REG;

architecture Behavioral of REG is
type regs is array (0 to 2**addr_size - 1) of std_logic_vector(word_size-1 downto 0);
signal regs_bank : regs;
begin

process(clk)
begin
if clk='1' and clk'event then
    if write_enable = '1' then
        regs_bank(to_integer(unsigned(addr_write))) <= data_in;
    else
        out_A <= regs_bank(to_integer(unsigned(addr_A)));
        out_B <= regs_bank(to_integer(unsigned(addr_B)));
    end if;
end if;
end process;



end Behavioral;
