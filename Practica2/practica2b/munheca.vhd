----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:15 10/20/2017 
-- Design Name: 
-- Module Name:    munheca - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity munheca is
	port (clk : in std_logic;
			rst : in std_logic;
			r	 : in std_logic;
			c   : in std_logic;
			g   : out std_logic;
			l   : out std_logic);
end munheca;

architecture Behavioral of munheca is

	type t_state is (tranquila_st, asustada_st, dormida_st, habla_st);
	signal current_state, next_state : t_state;
	signal clk_int : std_logic;

----------------------------------
-- Descomentar para implementación
----------------------------------
	component divisor is
		port(rst        : in std_logic;
			  clk : in std_logic;
			  clk_1hz    : out std_logic);
	end component;
	
begin

---------------------------------
-- Descomentar cuando se vaya a realizar la implementación en la FPGA
---------------------------------
	i_clk_int : divisor port map(
	rst     => rst,
	clk     => clk,
	clk_1hz => clk_int);
---------------------------------
-- Comentar cuando se vaya a realizar la implementación en la FPGA
---------------------------------
--	clk_int <= clk;
	
	p_next_state : process(current_state, r, c)
		begin
		case current_state is
			when tranquila_st =>
				if c = '0' and r = '1' then
					next_state <= habla_st;
				elsif c = '1' and r = '0' then
					next_state <= dormida_st;
				else 
					next_state <= current_state;
				end if;
			when asustada_st =>
				if c = '0' and r = '0' then
					next_state <= tranquila_st;
				elsif c = '1' and r = '0' then
					next_state <= dormida_st;
				else 							
					next_state <= current_state;
				end if;
			when dormida_st =>
				if r = '1' then
					next_state <= asustada_st;
				else
					next_state <= current_state;
				end if;
			when habla_st =>
				if c = '1' then
					next_state <= dormida_st;
				else
					next_state <= current_state;
				end if;
			when others =>
		end case;
	end process p_next_state;
				
	p_outputs : process(current_state)
		begin
		case current_state is
			when tranquila_st =>
				g <= '0';
				l <= '-';
			when asustada_st =>
				g <= '1';
				l <= '1';
			when dormida_st =>
				g <= '0';
				l <= '-';
			when habla_st =>
				g <= '1';
				l <= '0';
			when others =>
		end case;
	end process p_outputs;
	
	p_reg : process(clk_int, rst)
		begin
		if rst = '0' then
			current_state <= tranquila_st;
		elsif rising_edge(clk_int) then
			current_state <= next_state;
		end if;
	end process p_reg;

end Behavioral;

