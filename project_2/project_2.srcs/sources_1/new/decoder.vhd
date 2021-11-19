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

entity decoder is
    Port ( 
            clk : in std_logic;
            Instruction : in std_logic_vector(21 downto 0);
            f_halt : out std_logic;
            WE_reg : out std_logic;
            addr_reg_A : out std_logic_vector(addr_size-1 downto 0);
            addr_reg_B : out std_logic_vector(addr_size-1 downto 0);
            addr_reg_IN : out std_logic_vector(addr_size-1 downto 0);
            addr_ram : out std_logic_vector(addr_size-1 downto 0);
            WE_ram : out std_logic;
            RE_ram : out std_logic;
            op_out : out integer;
            imediate_val : out std_logic_vector(word_size-1 downto 0);
            f_imediate : out std_logic
           );
end decoder;

architecture Behavioral of decoder is
signal dest, src1 : std_logic_vector(addr_size-1 downto 0);
signal src2 : std_logic_vector(word_size-1 downto 0);
signal f_imediate_intern : std_logic;
signal op_raw : std_logic_vector(4 downto 0);
signal op : integer;

signal addr_src2 : std_logic_vector(addr_size-1 downto 0);


begin

src2 <= Instruction(21 downto 14);
f_imediate_intern <= Instruction(13);
src1 <= Instruction(12 downto 9);
dest <= Instruction(8 downto 5);
op_raw <= Instruction(4 downto 0);
addr_src2 <= src2(addr_size-1 downto 0);

op <= to_integer(unsigned(op_raw));
op_out <= op;

imediate_val <= src2;
f_imediate <= f_imediate_intern;

addr_reg_A <= src1;
addr_reg_B <= addr_src2;
addr_reg_IN <= dest;

with op select f_halt <=
    '1' when constHALT,
    '0' when constADD,
    '0' when constSUB,
    '0' when constXOR,
    '0' when constAND,
    '0' when constOR,
    '0' when constJMP,
    '0' when constJMPZ,
    '0' when constJMPNZ,
    '0' when constLOAD,
    '0' when constSTORE,
    '0' when constLDI,
    '1' when others;
    
with op select WE_reg <=
    '0' when constHALT,
    '1' when constADD,
    '1' when constSUB,
    '1' when constXOR,
    '1' when constAND,
    '1' when constOR,
    '0' when constJMP,
    '0' when constJMPZ,
    '0' when constJMPNZ,
    '0' when constLOAD,
    '0' when constSTORE,
    '1' when constLDI,
    '0' when others;
    
with op select WE_ram <=
    '0' when constHALT,
    '0' when constADD,
    '0' when constSUB,
    '0' when constXOR,
    '0' when constAND,
    '0' when constOR,
    '0' when constJMP,
    '0' when constJMPZ,
    '0' when constJMPNZ,
    '0' when constLOAD,
    '1' when constSTORE,
    '0' when constLDI,
    '0' when others;
    
with op select RE_ram <=
    '0' when constHALT,
    '0' when constADD,
    '0' when constSUB,
    '0' when constXOR,
    '0' when constAND,
    '0' when constOR,
    '0' when constJMP,
    '0' when constJMPZ,
    '0' when constJMPNZ,
    '1' when constLOAD,
    '0' when constSTORE,
    '0' when constLDI,
    '0' when others;
 
with op select addr_ram <=
    addr_src2 when constLOAD,
    dest when constSTORE,
    dest when others;

end Behavioral;
