----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:12:34 01/18/2019 
-- Design Name: 
-- Module Name:    Mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mem is
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           dout : out  STD_LOGIC_VECTOR (15 downto 0);
           addr : in  STD_LOGIC_VECTOR (11 downto 0);
           WR : in  STD_LOGIC;
           RE : in  STD_LOGIC;
           CLK : in STD_LOGIC);
end Mem;

architecture Behavioral of Mem is

    type memtype is array (0 to 4095) of STD_LOGIC_VECTOR(15 downto 0);
    signal memory : memtype := (    
                                    0 => "0000100000000000",
                                    --1
                                    1 => "0011100000000000",--LDA 2048
                                    2 => "1000010000000000",--SHR
                                    3 => "0100100000000000",--STA 2048
                                    4 => "0011100000000010",--LDA 2050
                                    5 => "1010110000000000",--SZE
                                    6 => "0000100000000001",--ADD 2049
                                    7 => "0100100000000010",--STA 2050
                                    8 => "0011100000000001",--LDA 2049
                                    9 => "1000100000000000",--SHL
                                    10 => "0100100000000001",--STA 2049
                                    --2
                                    11 => "0011100000000000",--LDA 2048
                                    12 => "1000010000000000",--SHR
                                    13 => "0100100000000000",--STA 2048
                                    14 => "0011100000000010",--LDA 2050
                                    15 => "1010110000000000",--SZE
                                    16 => "0000100000000001",--ADD 2049
                                    17 => "0100100000000010",--STA 2050
                                    18 => "0011100000000001",--LDA 2049
                                    19 => "1000100000000000",--SHL
                                    20 => "0100100000000001",--STA 2049
                                    --3
                                    21 => "0011100000000000",--LDA 2048
                                    22 => "1000010000000000",--SHR
                                    23 => "0100100000000000",--STA 2048
                                    24 => "0011100000000010",--LDA 2050
                                    25 => "1010110000000000",--SZE
                                    26 => "0000100000000001",--ADD 2049
                                    27 => "0100100000000010",--STA 2050
                                    28 => "0011100000000001",--LDA 2049
                                    29 => "1000100000000000",--SHL
                                    30 => "0100100000000001",--STA 2049
                                    --4
                                    31 => "0011100000000000",--LDA 2048
                                    32 => "1000010000000000",--SHR
                                    33 => "0100100000000000",--STA 2048
                                    34 => "0011100000000010",--LDA 2050
                                    35 => "1010110000000000",--SZE
                                    36 => "0000100000000001",--ADD 2049
                                    37 => "0100100000000010",--STA 2050
                                    38 => "0011100000000001",--LDA 2049
                                    39 => "1000100000000000",--SHL
                                    40 => "0100100000000001",--STA 2049
                                    --5
                                    41 => "0011100000000000",--LDA 2048
                                    42 => "1000010000000000",--SHR
                                    43 => "0100100000000000",--STA 2048
                                    44 => "0011100000000010",--LDA 2050
                                    45 => "1010110000000000",--SZE
                                    46 => "0000100000000001",--ADD 2049
                                    47 => "0100100000000010",--STA 2050
                                    48 => "0011100000000001",--LDA 2049
                                    49 => "1000100000000000",--SHL
                                    50 => "0100100000000001",--STA 2049
                                    --6
                                    51 => "0011100000000000",--LDA 2048
                                    52 => "1000010000000000",--SHR
                                    53 => "0100100000000000",--STA 2048
                                    54 => "0011100000000010",--LDA 2050
                                    55 => "1010110000000000",--SZE
                                    56 => "0000100000000001",--ADD 2049
                                    57 => "0100100000000010",--STA 2050
                                    58 => "0011100000000001",--LDA 2049
                                    59 => "1000100000000000",--SHL
                                    60 => "0100100000000001",--STA 2049
                                    --7
                                    61 => "0011100000000000",--LDA 2048
                                    62 => "1000010000000000",--SHR
                                    63 => "0100100000000000",--STA 2048
                                    64 => "0011100000000010",--LDA 2050
                                    65 => "1010110000000000",--SZE
                                    66 => "0000100000000001",--ADD 2049
                                    67 => "0100100000000010",--STA 2050
                                    68 => "0011100000000001",--LDA 2049
                                    69 => "1000100000000000",--SHL
                                    70 => "0100100000000001",--STA 2049
                                    --8
                                    71 => "0011100000000000",--LDA 2048
                                    72 => "1000010000000000",--SHR
                                    73 => "0100100000000000",--STA 2048
                                    74 => "0011100000000010",--LDA 2050
                                    75 => "1010110000000000",--SZE
                                    76 => "0000100000000001",--ADD 2049
                                    77 => "0100100000000010",--STA 2050
                                    78 => "0011100000000001",--LDA 2049
                                    79 => "1000100000000000",--SHL
                                    80 => "0100100000000001",--STA 2049

                                    2048 => "0000000000000101",
                                    2049 => "0000000000000110",
                                    2050 => "0000000000000000",
                                    others => (others => '0')
                                );

begin
    process(CLK, addr) is
        begin
            if rising_edge(CLK) then
                if (WR = '1') and (RE = '1') then
                    memory(to_integer(unsigned(addr))) <= din;
                elsif (WR = '1') then
                    memory(to_integer(unsigned(addr))) <= din;
                end if;
            end if;
            dout <= memory(to_integer(unsigned(addr)));
    end process;

end Behavioral;
