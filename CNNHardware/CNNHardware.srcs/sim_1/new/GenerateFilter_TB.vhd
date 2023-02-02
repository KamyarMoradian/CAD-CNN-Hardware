LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.CNNPackages.ALL;
USE STD.textio.ALL;
USE ieee.MATH_REAL.uniform;
 
USE ieee.numeric_std.ALL;
 
ENTITY GenerateFilter_TB IS
END GenerateFilter_TB;
 
ARCHITECTURE behavior OF GenerateFilter_TB IS 
    
 	--Outputs
   signal output : filter_array_t(0 to 3);
 
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
        
        generate_random_filter(4, output);
        
        wait for clk_period;
        wait;
        
    end process;

END;
