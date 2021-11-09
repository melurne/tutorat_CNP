----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.09.2021 10:50:33
-- Design Name: 
-- Module Name: Exercice2b - Behavioral
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

entity Exercice2b is
    Port ( a0 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           b0 : in STD_LOGIC;
           b1 : in STD_LOGIC;
           z : out STD_LOGIC);
end Exercice2b;

architecture Behavioral of Exercice2b is
signal comp1 : std_logic;
signal comp2 : std_logic;

component comparator
    port(
        a, b : in std_logic;
        z : out std_logic
    );
end component;

begin
part1 : comparator port map (
    a => a0,
    b => b0,
    z => comp1
);
part2 : comparator port map (
    a => a1,
    b => b1,
    z => comp2
);

z <= comp1 and comp2;

end Behavioral;
