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
	type vector_real is array (0 to 8) of real;
	type win_t is array (0 to 2, 0 to 2) of pixle;
	type filter_t is array (0 to 2, 0 to 2) of real;
	type win_array_t is array (0 to 125, 0 to 125) of win_t; -- windows taken from input pic
	type win_buffer_t is array (0 to 15875) of win_t; -- windows in the each buffer 
	type win_array_buffer_t is array (integer range <>) of win_buffer_t; -- all the buffers of windows
	type filter_array_t is array(integer range <>) of filter_t;
	type pic_in_t is array (0 to 127, 0 to 127) of pixle;
	type pic_out_t is array(0 to 125, 0 to 125) of pixle;
	type pic_buffer_out_t is array(integer range <>) of pic_out_t;
	function get_buffer_windows (n : integer) return win_array_buffer_t ;
	function generate_random_filter (n : integer) return filter_array_t;
	function get_all_windows_from_file return win_array_t;
end package;

-- TODO: Write function bodies

package body My_Package is
    function get_buffer_windows (n: integer) return win_array_buffer_t is 
	variable win_out_buffers : win_array_buffer_t(0 to n-1);
	variable tmp_win_buffer_t : win_buffer_t;
	variable j : integer := 0;			   
	    begin	       
		 for i in 0 to n-1 loop
			for x in 0 to 125 loop
				for y in 0 to 125 loop
				       if ((x+y) mod n = i) then
		        		    tmp_win_buffer_t(j) := func3(x,y);
				       end if;
				       j := j + 1;
				end loop
			end loop;
			win_out_buffers(i) := tmp_win_buffer_t;
		 end loop;
	     return win_out_buffers;
	end function ;
				       
    function generate_random_filter (n : integer) return filter_array_t;
	variable tmp_real : real;
        variable tmp_win : win_t ;
        variable intx : integer ;
        variable filter_array_out : array_of_filters(0 to n-1);
	begin
	     for i in 0 to n-1 loop
		  for x in 0 to 2 loop
			for y in 0 to 2 loop
				uniform(0 , 1, r);
				intx := integer(floor(r* real(2**3)));
				tmp_win(x,y) := intx;
			end loop;
		  end loop ;
		 filter_array_out(i) := tmp_win;
		end loop;
        return filter_array_out;
    end function;
				       
    function get_all_windows_from_file return win_array_t is 
	variable win_out_array : win_array_t;
        variable tmp_win : win_t ;	 
	begin	       
		for i in 0 to 125 loop
			for j in 0 to 125 loop
				for x in 0 to 2 loop
					for y in 0 to 2 loop
				       		--read file -> array (128*128) of 
						tmp_win(x,y) := read_file(i+x)(j+y);
					end loop;
				end loop;
				win_out_array(i,j) := tmp_win;
			end loop;
		end loop;
	return win_array_t;
    end function ;	
				       
 end package body;			   
