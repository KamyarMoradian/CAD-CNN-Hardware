----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2023 12:50:54 PM
-- Design Name: 
-- Module Name: PE - Behavioral
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
use WORK.CNNPackages.ALL;

entity PE is
    Port (
        input_filter : in filter_t;
        input_window : in win_t;
        output : out real);
end PE;

architecture Behavioral of PE is

    -- components:
    component BinaryAdder is
        Port ( input : in real_vector(0 to 8);
               output : out real);
    end component; 
    
    component MultiplierOfReal is
        Port ( int_input : in integer;
               real_input : in real;
               output : out real);
    end component;
    
    -- signals:
    signal mul_result : real_vector(0 to 8);
    
begin

    GEN_MUL_RES:
    for row in 0 to 2 generate
    begin
        GEN_MUL_RES0:
        for col in 0 to 2 generate
        begin
            uut_multiplier: MultiplierOfReal 
            Port Map (input_window(row, col), input_filter(row, col), mul_result(row * 3 + col));
        end generate;
    end generate;
    
    uut_adder: BinaryAdder Port Map (mul_result, output);

end Behavioral;
