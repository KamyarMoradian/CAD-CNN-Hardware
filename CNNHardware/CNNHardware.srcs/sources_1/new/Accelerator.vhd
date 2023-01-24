----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2023 02:08:43 PM
-- Design Name: 
-- Module Name: Accelerator - Behavioral
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


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use WORK.CNNPackages.ALL;

--entity Accelerator is
--    Generic (N : positive);
--    Port (
--        clk: in std_logic;
--        filter_buffer: in filter_array_t;
--        in_window_buffer: in win_buffer_t;
--        out_window_buffer: out win_buffer_t
--    );
--end Accelerator;

--architecture Behavioral of Accelerator is

---- components:
--    component PE is
--    Port (  input_filter : in filter_t;
--            input_window : in win_t;
--            output : out real);
--    end component;
    
---- signals:
--signal out_index : integer := 0;
--signal in_index : integer := 0;

--begin

--    MUL_RES_ROW_GEN:
--    for index in 0 to N - 1 generate
--    begin
--        uut_multiplier: PE Port Map (filter_buffer(index), in_window_buffer(row, col), mul_result(row * 3 + col));
--    end generate;
    
--    counter_increamenter: process(clk) is
--    begin
--        out_index <= out_index + 1;
--        in_index <= in_index + 1;
--    end process;

--end Behavioral;
