----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2023 12:38:57 PM
-- Design Name: 
-- Module Name: BinaryAdder - Behavioral
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

entity BinaryAdder is
    Port ( input : in real_vector(0 to 8);
           output : out real);
end BinaryAdder;

architecture Behavioral of BinaryAdder is

    -- components: 
    component AdderOfReal is
        Port ( input1 : in real;
               input2 : in real;
               output : out real);
    end component;
    
    -- signals:
    signal level1_sig1, level1_sig2, level1_sig3, level1_sig4 : real;
    signal level2_sig1, level2_sig2 : real;
    signal level3_sig1 : real;
    
begin

    uut1: AdderOfReal Port Map (input(0), input(1), level1_sig1);    
    uut2: AdderOfReal Port Map (input(2), input(3), level1_sig2);    
    uut3: AdderOfReal Port Map (input(4), input(5), level1_sig3);    
    uut4: AdderOfReal Port Map (input(6), input(7), level1_sig4);    
    uut5: AdderOfReal Port Map (level1_sig1, level1_sig2, level2_sig1);    
    uut6: AdderOfReal Port Map (level1_sig3, level1_sig4, level2_sig2);    
    uut7: AdderOfReal Port Map (level2_sig1, level2_sig2, level3_sig1);    
    uut8: AdderOfReal Port Map (level3_sig1, input(8), output);    

end Behavioral;
