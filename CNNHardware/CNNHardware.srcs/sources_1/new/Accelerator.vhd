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
           out_pixle_array : out pixle_array(0 to N - 1, 0 to N - 1); --debug
           index_out : out integer; --debug
           out_pic_buffer: out pic_buffer_out_t (0 to N - 1));
end Accelerator;

architecture Behavioral of Accelerator is

-- components:
component PE is
    Port (  input_filter : in filter_t;
            input_window : in win_t;
            output : out pixle);
end component;

-- signals:
signal buffer_index : integer := 0;
signal out_temp : pixle_array(0 to N - 1, 0 to N - 1);

begin
    
    PIC_RES_ROW_GEN:                
    for i in 0 to N - 1 generate
    begin
        PIC_RES_COL_GEN:
        for j in 0 to N - 1 generate
        begin
            uut_pe: PE Port Map (
            input_filter => filter_buffer(i),
            input_window => in_window_buffer(j)(buffer_index),
            output => out_temp(i, j));
        end generate;
    end generate;
    
    counter_increamenter: process(clk) is
        variable index : integer;
    begin
        if (rising_edge(clk)) then
            for i in 0 to n-1 loop
                for j in 0 to n-1 loop
                    index := buffer_index * n + j;
                    out_pic_buffer(i)(index/126, index mod 126) <= integer(real(out_temp(i, j)) / 1112.0 * 256);
                end loop;
            end loop;
            if (buffer_index < 126*126/n - 1) then
                buffer_index <= buffer_index + 1;
            end if;
        end if;
    end process;
    
    index_out <= buffer_index;
    out_pixle_array <= out_temp;

end Behavioral;
