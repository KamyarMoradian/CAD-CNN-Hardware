------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
 
---- Create Date: 01/24/2023 02:08:43 PM
---- Design Name: 
---- Module Name: Accelerator - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
 
---- Dependencies: 
 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
 
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.CNNPackages.ALL;

entity Accelerator is
    Generic (N : positive := 4);
    Port ( clk: in std_logic;
           filter_buffer: in filter_array_t (0 to N - 1);
           in_window_buffer: in win_array_buffer_t (0 to N - 1);
           out_pic_buffer: out pic_buffer_out_t (0 to N - 1));
end Accelerator;

architecture Behavioral of Accelerator is

-- components:
    component PE is
    Port (
        input_filter : in filter_t;
        input_window : in win_t;
        output : out pixle);
    end component;
    
-- signals:
signal buffer_index : integer := 0;

begin

    MUL_RES_ROW_GEN:
    for index in 0 to N - 1 generate
    begin
        uut_multiplier: PE Port Map (
         input_filter => filter_buffer(index), 
         input_window => in_window_buffer(index)(buffer_index),
         output => out_pic_buffer(index)(buffer_index / N, buffer_index mod N));
    end generate;
    
    counter_increamenter: process(clk) is
    begin
        if (buffer_index >= 126 * 126 / N) then
            buffer_index <= buffer_index + 1;
        end if;
    end process;

end Behavioral;
