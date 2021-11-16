----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2021 11:36:30
-- Design Name: 
-- Module Name: PC - Behavioral
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
use IEEE.numeric_std.all;

library work;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( RAM_ALU_out : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           halt : in STD_LOGIC;
           f_jmp : in std_logic;
           sortie : out STD_LOGIC_VECTOR (addr_size-1 downto 0));
end PC;

architecture Behavioral of PC is
signal pc : std_logic_vector (addr_size-1 downto 0);
signal selector : std_logic_vector(1 downto 0);
begin

process (clk, reset)
begin
    if reset = '1' then
        sortie <= prog_start; -- addresse de debut du programme
    end if;
    if clk = '1' and clk'event then 
        case selector is
            when "10" =>
                pc <= RAM_ALU_out(addr_size-1 downto 0);
            when "00" =>
                pc <= std_logic_vector(unsigned(pc) + 1);
            when "01" =>
            when others =>
        end case;
    end if;
end process;

selector <= f_jmp & halt;

sortie <= pc;

end Behavioral;
