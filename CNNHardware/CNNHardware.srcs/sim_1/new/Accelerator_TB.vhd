LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE WORK.CNNPackages.ALL;
LIBRARY std;
USE std.textio.all;
 
USE ieee.numeric_std.ALL;
 
ENTITY Accelerator_TB IS
END Accelerator_TB;
 
ARCHITECTURE behavior OF Accelerator_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component Accelerator is
        Generic (N : positive);
        Port ( clk: in std_logic;
           filter_buffer: in filter_array_t (0 to N - 1);
           in_window_buffer: in win_array_buffer_t (0 to N - 1);
           out_pixle_array : out pixle_array(0 to N - 1, 0 to N - 1);
           index_out : out integer;
           out_pic_buffer: out pic_buffer_out_t (0 to N - 1));
    end component;

   -- generic values:
    constant n : positive := 4;
   
   --Inputs
    signal filter_buffer : filter_array_t (0 to n - 1);
    signal in_window_buffer : win_array_buffer_t (0 to n - 1);

 	--Outputs
    signal out_pixle_array : pixle_array(0 to n-1, 0 to n-1);
    signal out_pic_buffer : pic_buffer_out_t (0 to n - 1);
    signal index_out : integer;

    constant clk_period : time := 8 ns;
    SIGNAL clk : STD_LOGIC;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: Accelerator
         Generic Map
         (N => n)
         Port MAP 
         (clk => clk,
         filter_buffer => filter_buffer,
         in_window_buffer => in_window_buffer,
         out_pixle_array => out_pixle_array,
         index_out => index_out,
         out_pic_buffer => out_pic_buffer);

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
    
        generate_random_filter(n, filter_buffer);
        get_buffer_windows(n, in_window_buffer);
        wait for 500ns;
        for i in 0 to 126 * 126 / n loop
            wait for clk_period;		
        end loop;
    
    wait;
   end process;

END;
