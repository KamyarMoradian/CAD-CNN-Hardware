LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.CNNPackages.ALL;
USE STD.textio.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY GenerateAllWin_TB IS
END GenerateAllWin_TB;
 
ARCHITECTURE behavior OF GenerateAllWin_TB IS 

 	--Outputs
   signal output : win_array_t;
 
   constant clk_period : time := 100 ns;
   SIGNAL clk : STD_LOGIC;
   
begin

   -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
	
    stim_proc2: process	
    begin	
        wait for clk_period;
        
        output <= get_all_windows_from_file;
        
        wait for clk_period;
        wait;
    end process;

END;
