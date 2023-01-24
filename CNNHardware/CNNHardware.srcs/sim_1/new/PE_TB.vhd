LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.CNNPackages.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY PE_TB IS
END PE_TB;
 
ARCHITECTURE behavior OF PE_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component PE is
        Port (  input_filter : in filter_t;
                input_window : in win_t;
                output : out pixle);
    end component;

   --Inputs
   signal input_filter : filter_t;
   signal input_window : win_t;

 	--Outputs
   signal output : pixle;
 
   constant clk_period : time := 100 ns;
   SIGNAL clk : STD_LOGIC;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: PE Port MAP 
                (input_filter => input_filter,
                input_window => input_window,
                output => output);

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
		input_filter <= (0 => (0.1, 0.1, 0.5), 
		                 1 => (0.2, 0.4, 0.1), 
		                 2 => (0.3, 0.1, 0.6));
        input_window <= (0 => (1, 2, 5), 
		                 1 => (1, 10, 51), 
		                 2 => (5, 128, 61));
	  -- Output shold be 63
      wait for clk_period;	
		input_filter <= (0 => (0.1, 0.1, 0.5), 
		                 1 => (0.2, 0.4, 0.1), 
		                 2 => (0.3, 0.1, 0.6));
        input_window <= (0 => (17, 24, 5), 
		                 1 => (1, 121, 241), 
		                 2 => (14, 10, 61));
	  -- Output should be 121		
      wait;
   end process;

END;
