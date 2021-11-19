----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2021 14:43:49
-- Design Name: 
-- Module Name: CPU - Behavioral
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
use IEEE.numeric_std.all;

library work;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
    Port ( 
        CLK100MHZ: in std_logic;
        reset : in std_logic;
        f_zero : out STD_LOGIC;
        f_neg : out STD_LOGIC;
        f_over : out STD_LOGIC;
        pc_mes : out std_logic_vector(addr_size-1 downto 0);
        clk_mes : out std_logic;
        ALU_mes : out std_logic_vector(word_size-1 downto 0);
        WE_reg_mes : out std_logic
    );
end CPU;

architecture Behavioral of CPU is

component ALU is
    Port ( A : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           B : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           Sortie : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           op : in integer;
           f_zero : out STD_LOGIC;
           f_over : out STD_LOGIC;
           f_neg : out STD_LOGIC;
           f_jmp : out STD_LOGIC);
end component;

component decoder is
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
end component;

component RAM is
    Port ( data_out : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           data_in : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           addr : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           --addr_write : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           write_enable : in STD_LOGIC;
           read_enable : in STD_LOGIC;
           clk : in STD_LOGIC);
end component;

component ROM is
    Port ( data_out : out STD_LOGIC_VECTOR (21 downto 0);
           addr_read : in STD_LOGIC_VECTOR (addr_size-1 downto 0));
end component;

component REG is
    Port ( out_A : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           out_B : out STD_LOGIC_VECTOR (word_size-1 downto 0);
           data_in : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           addr_A : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           addr_B : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           addr_write : in STD_LOGIC_VECTOR (addr_size-1 downto 0);
           write_enable : in STD_LOGIC;
           clk : in STD_LOGIC);
end component;

component PC is
    Port ( RAM_ALU_out : in STD_LOGIC_VECTOR (word_size-1 downto 0);
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           halt : in STD_LOGIC;
           f_jmp : in std_logic;
           sortie : out STD_LOGIC_VECTOR (addr_size-1 downto 0));
end component;

signal f_halt, f_jmp, WE_reg, WE_ram, RE_ram, f_imediate : std_logic;
signal RAM_ALU_out, ALU_A, ALU_B, REG_B, imediate, ALU_out, RAM_out : std_logic_vector(word_size-1 downto 0);
signal op : integer := 0;
signal cpt: integer := 0;
signal instruction : std_logic_vector(21 downto 0);
signal PC_out, addr_reg_A, addr_reg_B, addr_reg_IN, addr_ram : std_logic_vector(addr_size-1 downto 0);
signal clk: std_logic;

begin
PROG_ROM : ROM port map (
    addr_read => PC_out,
    data_out => instruction
);

decoder_comp : decoder port map (
    clk => clk,
    Instruction => instruction,
    f_halt => f_halt,
    WE_reg => WE_reg,
    WE_ram => WE_ram,
    RE_ram => RE_ram,
    addr_reg_A => addr_reg_A,
    addr_reg_B => addr_reg_B,
    addr_reg_IN => addr_reg_IN,
    addr_ram => addr_ram,
    op_out => op,
    imediate_val => imediate,
    f_imediate => f_imediate
);

reg_comp : REG port map (
    out_A => ALU_A,
    out_B => REG_B,
    data_IN => RAM_ALU_out,
    addr_A => addr_reg_A,
    addr_B => addr_reg_B,
    addr_write => addr_reg_IN,
    write_enable => WE_reg,
    clk => clk
);

pc_comp : PC port map (
    RAM_ALU_out => RAM_ALU_out,
    reset => reset,
    clk => clk,
    halt => f_halt,
    f_jmp => f_jmp,
    sortie => PC_out
);

ram_comp : RAM port map (
    data_out => RAM_out,
    data_in => RAM_ALU_out,
    addr => addr_ram,
    write_enable => WE_ram,
    read_enable => RE_ram,
    clk => clk
);

alu_comp : ALU port map (
    A => ALU_A,
    B => ALU_B,
    sortie => ALU_out,
    f_jmp => f_jmp,
    f_zero => f_zero,
    f_neg => f_neg,
    f_over => f_over,
    op => op
);

ALU_B <= REG_B when f_imediate = '0' else imediate;
RAM_ALU_out <= RAM_out when RE_ram = '1' else ALU_out;

pc_mes <= PC_out;
clk_mes <= clk;
ALU_mes <= ALU_A;
WE_reg_mes <= WE_reg;

clkDivider : process(CLK100MHZ)
begin
    if CLK100MHZ='1' and CLK100MHZ'event then
        if cpt >= 50000000 then
            clk <= not clk;
            cpt <= 0;
        else 
            cpt <= cpt+1;
        end if ;
    end if;
end process;

end Behavioral;
