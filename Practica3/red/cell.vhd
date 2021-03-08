----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:08:03 11/13/2017 
-- Design Name: 
-- Module Name:    cell - Behavioral 
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

use work.definitions.all;

entity cell is
	generic ( g_width : natural := 5);
	port (d			: in std_logic;
			pattern_in	: in t_pattern;
			count_in		: in signed(g_width-1 downto 0);
			pattern_out	: out t_pattern;
			count_out	: out signed(g_width-1 downto 0));
end cell;

use work.definitions.all;

architecture Behavioral of cell is

signal pattern : t_pattern;

begin

	p_pattern : process (pattern_in, d) is
		begin
			case pattern_in is
			when no_pattern =>
				if d = '0' then
					pattern <= no_pattern;
				elsif d = '1' then
					pattern <= first_one;
				else
					pattern <= no_pattern;
				end if;
			when first_one =>
				if d = '0' then
					pattern <= second_zero;
				elsif d = '1' then
					pattern <= second_one;
				else
					pattern <= first_one;
				end if;
			when second_zero =>
				if d = '0' then
					pattern <= no_pattern;
				elsif d = '1' then
					pattern <= pattern_rec;
				else
					pattern <= second_zero;
				end if;
			when second_one =>
				if d = '0' then
					pattern <= second_zero;
				elsif d = '1' then
					pattern <= pattern_rec;
				else
					pattern <= second_one;
				end if;
			when pattern_rec =>
				if d = '0' then
					pattern <= no_pattern;
				elsif d = '1' then
					pattern <= first_one;
				else
					pattern <= pattern_rec;
				end if;
			when others =>
				pattern <= no_pattern;
			end case;
		end process p_pattern;
		
	p_count: process (count_in, pattern) is
		begin
		if pattern = pattern_rec then
			count_out <= count_in + 1;
		else
			count_out <= count_in;
		end if;
		end process p_count;
		
	pattern_out <= pattern;

end Behavioral;

