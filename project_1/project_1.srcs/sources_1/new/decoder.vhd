----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2021 11:01:42
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port ( clk : in STD_LOGIC;
           op : in STD_LOGIC_VECTOR (2 downto 0);
           --dest : in STD_LOGIC_VECTOR (15 downto 0);
           --source : in STD_LOGIC_VECTOR (15 downto 0);
           --val : in STD_LOGIC_VECTOR (7 downto 0);
           alu_op : out STD_LOGIC_VECTOR (3 downto 0);
           addr_out : out STD_LOGIC_VECTOR (15 downto 0)
           --addr_a : out STD_LOGIC_VECTOR (15 downto 0);
           --addr_b : out STD_LOGIC_VECTOR (15 downto 0)
           );
end decoder;

architecture Behavioral of decoder is

begin

process (clk)
begin
    if clk = '1' and clk'event then
        if op = "110" then
            
        end if;
    end if;
end process;


end Behavioral;
