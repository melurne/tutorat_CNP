----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2021 10:34:50
-- Design Name: 
-- Module Name: ALU - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Sortie : out STD_LOGIC_VECTOR (7 downto 0);
           op : in STD_LOGIC_VECTOR (2 downto 0); -- (NOP, ADD, SUB, XOR, AND, OR, JMP, *)
           f_zero : out STD_LOGIC;
           f_over : out STD_LOGIC;
           f_neg : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal pre_sortie : std_logic_vector (7 downto 0);
begin
with op select 
    pre_sortie <= std_logic_vector(unsigned(A) + unsigned(B)) when "001",  -- ADD
              std_logic_vector(unsigned(A) - unsigned(B)) when "010",  -- SUB
              A xor B when "011",                                      -- XOR 
              A and B when "100",                                      -- AND
              A or B when "101",                                       -- OR
              B when "110",                                            -- JMP
              "00000000" when others;
           
Sortie <= pre_sortie;   
f_zero <= '1' when (pre_sortie="00000000") else '0';
f_neg <= '1' when (A<B and op = "010") else '0';
f_over <= '1' when (unsigned(A) + unsigned(B) > 255) else '0';

end Behavioral;
