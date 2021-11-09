----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2021 11:31:46
-- Design Name: 
-- Module Name: fullAdder - Behavioral
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

entity fullAdder is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           Cin : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is
signal C1, C2, S1 : std_logic;

component HalfAdder
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           c : out STD_LOGIC);
end component;
begin
HA1 : HalfAdder port map (
    a => a_in,
    b => b_in,
    s => S1,
    c => C1
);
HA2 : HalfAdder port map (
    a => S1,
    b => Cin,
    s => S_out,
    c => C2
);

C_out <= C1 or C2;

end Behavioral;
