----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2023 12:33:29 PM
-- Design Name: 
-- Module Name: MultiplierOfReal - Behavioral
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

entity MultiplierOfReal is
    Port ( int_input : in integer;
           real_input : in real;
           output : out real);
end MultiplierOfReal;

architecture Behavioral of MultiplierOfReal is

begin
    
    output <= real(int_input) * real_input;
    
end Behavioral;
