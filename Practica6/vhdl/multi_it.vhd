----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:18 01/11/2018 
-- Design Name: 
-- Module Name:    multi_it - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multi_it is
  PORT (
    clk : in std_logic;
	 rst : in std_logic; -- Async active low reset
	 mant1: in std_logic_vector (23 downto 0);
	 mant2: in std_logic_vector (23 downto 0);
	 load: in std_logic;
	 iterar: in std_logic;
	 it: out std_logic_vector (4 downto 0);
	 m_parcial: out std_logic_vector (47 downto 0)
  );
end multi_it;

architecture Behavioral of multi_it is
  type t_st is (s0, s1, s2,s3);
  signal current_state, next_state : t_st;
  signal stat_ld,stat_it    				: std_logic;
  signal multiplicando : std_logic_vector (47 downto 0);
  signal multiplicador : std_logic_vector (23 downto 0);
  signal iteraciones : std_logic_vector (4 downto 0);
  signal resultado: std_logic_vector (47 downto 0);
  signal cambio_st: std_logic;
  
begin

	stat_ld <= load;
	stat_it <= iterar;
	
	next_state <= s0 when (current_state=s0 and stat_ld='0' and stat_it='0') else
					  s0 when (current_state=s2 and stat_it='0') else
					  s0 when (current_state=s3 and stat_it='0') else
					  s1 when (current_state=s0 and stat_ld='1') else
					  s2 when (current_state=s0 and stat_ld='0' and stat_it='1') else
					  s2 when (current_state=s1) else
					  s2 when (current_state=s3 and stat_it='1') else
					  s3 when (current_state=s2 and stat_it='1');

p_suma: process (current_state) is
begin
	case current_state is
	when s0 =>
	when s1 =>
		multiplicando <= "000000000000000000000000" & mant1;
		multiplicador <= mant2;
		iteraciones <= (others=>'0');
		resultado <= (others=>'0');
	when s2 =>
			if multiplicador(0) = '1' then
				resultado <= std_logic_vector(unsigned(multiplicando) + unsigned(resultado));
			else
				resultado <= resultado;
			end if;
			multiplicando<= multiplicando(46 downto 0) & "0";
			multiplicador<= "0" & multiplicador(23 downto 1) ;
			iteraciones <= std_logic_vector(unsigned(iteraciones) + 1);
	when s3 =>
			if multiplicador(0)='1' then
				resultado<=std_logic_vector(unsigned(multiplicando) + unsigned(resultado));
			else
				resultado <= resultado;
			end if;
			multiplicando<= multiplicando(46 downto 0) & "0";
			multiplicador<= "0" & multiplicador(23 downto 1) ;
			iteraciones <= std_logic_vector(unsigned(iteraciones) + 1);
	end case;
	
end process p_suma;
	
p_sincrono : process (clk, rst) is
  begin
    if rst = '1' then
      current_state <= s0;
    elsif rising_edge(clk) then
      current_state <= next_state;
    end if;
 end process p_sincrono;

	m_parcial<=resultado;
	it<=iteraciones;

end Behavioral;

