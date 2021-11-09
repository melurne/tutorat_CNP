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

library work;
use work.constants.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           B : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           Sortie : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           op : in integer; -- (NOP, ADD, SUB, XOR, AND, OR, JMP, *)
           f_zero : out STD_LOGIC;
           f_over : out STD_LOGIC;
           f_neg : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal pre_sortie : std_logic_vector (word_size-1 downto 0);
signal resZ, resNZ : std_logic_vector (word_size-1 downto 0);
begin
with op select 
    pre_sortie <= std_logic_vector(unsigned(A) + unsigned(B)) when constADD,  -- ADD
              std_logic_vector(unsigned(A) - unsigned(B)) when constSUB,  -- SUB
              A xor B when constXOR,                                      -- XOR 
              A and B when constAND,                                      -- AND
              A or B when constOR,                                       -- OR
              B when constJMP,                                            -- JMP
              resZ when constJMPZ,
              resNZ when constJMPNZ,
              B when constLOAD,
              B when constSTORE,
              (pre_sortie'range => '0') when constHALT,
              (pre_sortie'range => '0') when others;
           
           
resZ <= B when (A = (A'range => '0')) else (others => '0');
resNZ <= (others => '0') when (A = (A'range => '0')) else B;

Sortie <= pre_sortie;   

f_zero <= '1' when (pre_sortie = (pre_sortie'range => '0')) else '0';
f_neg <= '1' when (A<B and op = constSUB) else '0';
f_over <= '1' when (unsigned(A) + unsigned(B) > 2**word_size) else '0';

end Behavioral;
