----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:44:30 01/18/2019 
-- Design Name: 
-- Module Name:    ACReg - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ACReg is
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           dout : out  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
           load : in  STD_LOGIC;
           nRST : in  STD_LOGIC;
           cmpl : in STD_LOGIC;
           INC : in  STD_LOGIC);
end ACReg;

architecture Behavioral of ACReg is
    signal douttemp : STD_LOGIC_VECTOR(15 downto 0);
begin
    process(CLK, nRST)
    begin
        if nRST = '0' then
            douttemp <= "0000000000000000";
        elsif rising_edge(CLK) then
            if INC = '1' then
                douttemp <= douttemp + '1';
            end if;

            if cmpl = '1' then
                douttemp <= not din;
            end if;

            if load = '1' then
                douttemp <= din;
            end if;
        end if;

    end process;
    dout <= douttemp;

end Behavioral;

