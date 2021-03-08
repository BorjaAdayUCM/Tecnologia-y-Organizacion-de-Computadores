----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:55:00 11/13/2017 
-- Design Name: 
-- Module Name:    iterative_1d - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.definitions.all;

entity iterative_1d is
	generic (g_width_data : natural := 32;
				g_width_count : natural := 5);
	port ( din : in std_logic_vector(g_width_data -1 downto 0);
			num_patterns : out std_logic_vector(g_width_count -1 downto 0));
end iterative_1d;

use work.definitions.all;

architecture Behavioral of iterative_1d is

	type t_pattern_vector is array (g_width_data downto 0) of t_pattern;
	type t_count_vector is array (g_width_data downto 0) of signed(g_width_count -1 downto 0);
	
	signal count : t_count_vector;
	signal pattern : t_pattern_vector;
		
	component cell is
	generic ( g_width : natural := 5);
	port (d			: in std_logic;
			pattern_in	: in t_pattern;
			count_in		: in signed(g_width-1 downto 0);
			pattern_out	: out t_pattern;
			count_out	: out signed(g_width-1 downto 0));
	end component;
	
begin

	pattern(0) <= no_pattern;
	count(0) <= (others => '0');
	
	cell_generation : for idx in 0 to g_width_data -1 generate
		i_cell : cell 
		generic map ( g_width => g_width_count)
		port map (  d => din(idx),
						pattern_in => pattern(idx),
						count_in => count(idx),
						pattern_out => pattern(idx+1),
						count_out => count(idx+1));
	end generate cell_generation;
	num_patterns <= std_logic_vector(count(g_width_data));
	
end Behavioral;

