library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity multifuncion is
generic (g_width : natural := 32);
port ( op1 : in signed(g_width -1 downto 0);
       op2 : in signed(g_width -1 downto 0);
       sel : in std_logic_vector(2 downto 0);
       res : out signed(g_width -1 downto 0));
end multifuncion;


architecture Behavioral of multifuncion is

constant c_add : std_logic_vector(2 downto 0) := "000";
constant c_sub : std_logic_vector(2 downto 0) := "001";
constant c_min : std_logic_vector(2 downto 0) := "100";
constant c_max : std_logic_vector(2 downto 0) := "101";
constant c_abs : std_logic_vector(2 downto 0) := "110";

begin

p_fu : process (sel, op1, op2) is
begin
	case sel is
		when c_add =>
			res <= op1 + op2;
		when c_sub =>
			res <= op1 - op2;
		when c_min =>
			if op1 < op2 then
				res <= op1;
			else
				res <= op2;
			end if;
		when c_max =>
			if op2 > op1 then
				res <= op2;
			else
				res <= op1;
			end if;
		when c_abs =>
			if op1 < 0 then
				res <= 0 - op1;
			else
				res <= op1;
			end if;
		when others =>
			res <= op1 + op2;
	end case;
end process;
end Behavioral;


