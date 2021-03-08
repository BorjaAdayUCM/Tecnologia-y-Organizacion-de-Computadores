----------------------------------------------------------------------------------
-- Company:        UCM
-- Engineer:       Oscar Garnica
-- 
-- Create Date:    11:07:57 10/22/2012 
-- Design Name:    counter
-- Module Name:    rtl 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity contador is
	generic (k : integer := 4;            -- Module value
            n : integer := 2);           -- Counter width
-- k < 2**n
	port (rst  : in  std_logic;           -- Asynch reset
         clk  : in  std_logic;           -- Input clock
		   CU   : in  std_logic;           -- Capacitación de cuenta
         cntr : out std_logic_vector(n-1 downto 0));
	end contador;

	architecture rtl of contador is

	signal cntr_reg : unsigned(n-1 downto 0);
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

	cntr <= std_logic_vector(cntr_reg);

	p_cntr_reg : process(clk_int, rst)
		begin
		if rising_edge(clk_int) then
			if rst = '1' then
				cntr_reg <= (others => '0');
			else
				if CU = '1' then
					if cntr_reg < (k-1) then
						cntr_reg <= cntr_reg+1;
					else
						cntr_reg <= (others => '0');
					end if;
				else
					cntr_reg <= cntr_reg;
				end if;
			end if;
		end if;
	end process p_cntr_reg;

end rtl;