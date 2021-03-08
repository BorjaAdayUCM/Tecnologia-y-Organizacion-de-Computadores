--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:00:28 01/13/2018
-- Design Name:   
-- Module Name:   C:/Users/csanchez/Downloads/TOC/mult_ieee754/tb.vhd
-- Project Name:  mult_ieee754
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mult_ieee754
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mult_ieee754
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         res : OUT  std_logic_vector(31 downto 0);
         ini : IN  std_logic;
         fin : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ini : std_logic := '0';

 	--Outputs
   signal res : std_logic_vector(31 downto 0);
   signal fin : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult_ieee754 PORT MAP (
          clk => clk,
          rst => rst,
          op1 => op1,
          op2 => op2,
          res => res,
          ini => ini,
          fin => fin
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

  -- External reset
  p_rst : process
  begin
    rst <= '1';
    wait for 50 ns;
    rst <= '0';
    wait for 30 ns;
	 op1<="11001000101000100101000001101011";
	 op2<="00010001010001001000100011000110";
	 wait for 20 ns;
	 ini<= '1';
	 wait for 10 ns;
	 ini<= '0';
	 wait for 400 ns;
	 op1<="01110000011000000000000000000000";
	 op2<="11010001010000000000000000000000";
	 wait for 20 ns;
	 ini<= '1';
	 wait for 10 ns;
	 ini<= '0';
	 wait for 400 ns;
	 op1<="11001000101000100101000001101011";
	 op2<="00010001010001001000100011000110";
	 wait for 20 ns;
	 ini<= '1';
	 wait for 10 ns;
	 ini<= '0';
	 wait for 400 ns;
	 op1<="00010100011001000000000000000000";
	 op2<="00010001010000000111000000000000";
	 wait for 20 ns;
	 ini<= '1';
	 wait for 10 ns;
	 ini<= '0';
	 wait for 400 ns;
	 op1<="01010100011001000000001000111000";
	 op2<="00011001010000000111000001000100";
	 wait for 20 ns;
	 ini<= '1';
	 wait for 10 ns;
	 ini<= '0';
	 wait for 400 ns;
	 wait;
  end process p_rst;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
