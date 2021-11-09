----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 11:28:15
-- Design Name: 
-- Module Name: NbitAdder - Behavioral
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

entity NbitAdder is
    generic (
        n : natural := 6
    );
    Port ( a_in : in STD_LOGIC_VECTOR (n-1 downto 0);
           b_in : in STD_LOGIC_VECTOR (n-1 downto 0);
           c_in : in STD_LOGIC;
           s_out : out STD_LOGIC_VECTOR (n-1 downto 0);
           c_out : out STD_LOGIC);
end NbitAdder;

architecture Behavioral of NbitAdder is
signal carry_inter : std_logic_vector(n downto 0);
component fullAdder
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           Cin : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S_out : out STD_LOGIC);
end component;

begin
ADDERS : for i in 0 to n-1 generate
    FAi : fullAdder port map (
        a_in => a_in(i),
        b_in => b_in(i),
        Cin => carry_inter(i),
        C_out => carry_inter(i+1),
        S_out => s_out(i) 
    );
end generate;

carry_inter(0) <= c_in;
c_out <= carry_inter(n);


end Behavioral;
