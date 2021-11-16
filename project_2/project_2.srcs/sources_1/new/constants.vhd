----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2021 14:57:12
-- Design Name: 
-- Module Name: constants - Behavioral
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

package constants is
    constant constHALT: integer := 0;
    constant constADD: integer := 1;
    constant constSUB: integer := 2;
    constant constXOR: integer := 3;
    constant constOR: integer := 4;
    constant constAND: integer := 5;
    constant constJMP: integer := 6;
    constant constJMPZ: integer := 7;
    constant constJMPNZ: integer := 8;
    constant constLOAD: integer := 9;
    constant constSTORE: integer := 10;
    constant constLDI: integer := 11;

    
    constant addr_size: integer := 4;
    constant word_size: integer := 8;
    constant prog_start: std_logic_vector(addr_size-1 downto 0) := "0010";
end constants;
