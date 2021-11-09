----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 16:45:03
-- Design Name: 
-- Module Name: FourBitAdder - Behavioral
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

entity FourBitAdder is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C0 : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC);
end FourBitAdder;

architecture Behavioral of FourBitAdder is
signal Connect : std_logic_vector(2 downto 0);
component fullAdder
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           Cin : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end component;

begin
add1 : fullAdder port map (
    a_in => A(0),
    b_in => B(0),
    Cin => C0,
    C_out => Connect(0),
    S_out => Z(0) 
);

add2 : fullAdder port map (
    a_in => A(1),
    b_in => B(1),
    Cin => Connect(0),
    C_out => Connect(1),
    S_out => Z(1) 
);

add3 : fullAdder port map (
    a_in => A(2),
    b_in => B(2),
    Cin => Connect(1),
    C_out => Connect(2),
    S_out => Z(2) 
);

add4 : fullAdder port map (
    a_in => A(3),
    b_in => B(3),
    Cin => Connect(2),
    C_out => C,
    S_out => Z(3) 
);

end Behavioral;
