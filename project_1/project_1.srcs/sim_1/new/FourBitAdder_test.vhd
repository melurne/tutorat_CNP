----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.09.2021 16:59:19
-- Design Name: 
-- Module Name: FourBitAdder_test - Behavioral
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

entity FourBitAdder_test is
--  Port ( );
end FourBitAdder_test;

architecture Behavioral of FourBitAdder_test is

signal A, B, Z : std_logic_vector(3 downto 0);
signal C0, C : std_logic;
component FourBitAdder
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C0 : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (3 downto 0);
           C : out STD_LOGIC);
end component;

begin
uut : FourBitAdder port map(
    A => A,
    B => B,
    C0 => C0,
    Z => Z,
    C => C
);

process
    begin
        A <= "0000";
        A(1) <= '0';
        A(2) <= '0';
        A(3) <= '0';
        B <= ('0', '0', '0', '0');
        C0 <= '0';
        wait for 10 ns;
        A <= ('0', '0', '0', '1');
        B <= ('0', '0', '1', '0');
        C0 <= '0';
        wait;
    end process;
end Behavioral;
