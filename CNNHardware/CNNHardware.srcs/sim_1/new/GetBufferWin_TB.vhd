LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.CNNPackages.ALL;
USE STD.textio.ALL;
USE ieee.MATH_REAL.uniform;
 
USE ieee.numeric_std.ALL;
 
ENTITY GetBufferWin_TB IS
END GetBufferWin_TB;
 
ARCHITECTURE behavior OF GetBufferWin_TB IS 
    
 	--Outputs
   signal output : win_array_buffer_t(0 to 3);
 
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
        
        get_buffer_windows(4, output);
        
        wait for clk_period;
        wait;
        
    end process;

END;
