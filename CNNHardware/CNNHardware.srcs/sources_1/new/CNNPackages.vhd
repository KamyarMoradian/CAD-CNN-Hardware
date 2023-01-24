----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2023 11:47:07 AM
-- Design Name: 
-- Module Name: CNNPackages - Behavioral
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


package CNNPackages is
    subtype pixle is integer range 0 to 255; 
    type win_t is array (0 to 2, 0 to 2) of pixle;
    type filter_t is array (0 to 2, 0 to 2) of real;
	type win_array_t is array (0 to 125, 0 to 125) of win_t; -- windows taken from input pic
	type win_buffer_t is array (0 to 15875) of win_t; -- windows in the each buffer 
	type win_array_buffer_t is array (integer range <>) of win_buffer_t; -- all the buffers of windows
	type filter_array_t is array(integer range <>) of filter_t;
	type pic_t is array (0 to 127, 0 to 127) of pixle;
	function get_buffer_windows (n, buffer_index : integer) return win_buffer_t ;
	function generate_random_filter return filter_t;
	function get_all_windows_from_file return win_array_t;
end package;

-- TODO: Write function bodies
