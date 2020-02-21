----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:25 01/11/2018 
-- Design Name: 
-- Module Name:    uc - Behavioral 
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

entity uc is
    port (
		clk : in std_logic; -- clock
		rst : in std_logic; -- Async active low reset
		ini : in std_logic; -- External control signal
		fin : out std_logic; -- External control signal
		ctrl : out std_logic_vector (10 downto 0); -- Control
		status : in std_logic_vector (6 downto 0)); -- Status
		
end uc;

architecture Behavioral of uc is
  type t_st is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11);
  signal current_state, next_state : t_st;
  signal stat_nan,stat_inf,stat_z,stat_it,stat_47,stat_over,stat_under      : std_logic;
  signal cambio_st : std_logic;

begin

p_status_signals : (stat_nan,stat_inf,stat_z,stat_it,stat_47,stat_over,stat_under) <= status;

				next_state <=  s0 when (current_state = s0 and ini = '0') else
									s0 when (current_state = s7) else
									s0 when (current_state = s8) else
									s0 when (current_state = s9) else
									s0 when (current_state = s10) else
									s0 when (current_state = s11) else
									s1 when (current_state = s0 and ini = '1') else
									s2 when (current_state = s1) else
									s3 when (current_state = s2 and stat_nan = '0' and stat_inf = '0' and stat_z = '0') else
									s3 when (current_state = s3 and stat_it = '0') else
									s4 when (current_state = s3 and stat_it = '1') else
									s5 when (current_state = s4 and stat_47 = '1') else
									s6 when (current_state = s4 and stat_47 = '0') else
									s6 when (current_state = s5) else
									s7 when (current_state = s6 and stat_over = '0' and stat_under = '0' and stat_47 = '1') else
									s8 when (current_state = s6 and stat_over = '0' and stat_under = '0' and stat_47 = '0') else
									s9 when (current_state = s2 and stat_nan = '1') else
									s10 when (current_state = s2 and stat_nan = '0' and stat_inf = '1') else
									s10 when (current_state = s6 and stat_under = '0' and stat_over = '1') else
									s11 when (current_state = s2 and stat_nan = '0' and stat_inf = '0' and stat_z = '1') else
									s11 when (current_state = s6 and stat_under = '1') else
									s0;
				
 p_outputs : process (current_state)
    ---------------------------------------------------------------------------
    -- Definición de cada uno de las senales de control
    
    constant load       			: std_logic_vector(10 downto 0) := "10000000000";
    constant mul_ld   				: std_logic_vector(10 downto 0) := "01000000000";
    constant mul_it    				: std_logic_vector(10 downto 0) := "00100000000";
    constant mux_sum    			: std_logic_vector(10 downto 0) := "00010000000";
    constant exp_ld    				: std_logic_vector(10 downto 0) := "00001000000";
    constant mux_sig    			: std_logic_vector(10 downto 0) := "00000100000";
    constant mux_exp_res1    		: std_logic_vector(10 downto 0) := "00000010000";
	 constant mux_exp_res0    		: std_logic_vector(10 downto 0) := "00000001000";
	 constant mux_m_res1    		: std_logic_vector(10 downto 0) := "00000000100";
	 constant mux_m_res0    		: std_logic_vector(10 downto 0) := "00000000010";
	 constant res_ld		    		: std_logic_vector(10 downto 0) := "00000000001";


  begin
	ctrl <= (others => '0');
	 case current_state is
      when s0 =>
        ctrl <= (others => '0');
        fin  <= '1'; 
      when s1 =>
        ctrl <= load or res_ld or mux_m_res1;
        fin <= '0';
      when s2 => 
			ctrl <= mul_ld;
			fin <= '0';
      when s3 =>
			ctrl <= mul_it;
		   fin <= '0';
      when s4 =>
			ctrl <= exp_ld;
			fin <= '0';
      when s5 =>
			ctrl <= mux_sum or exp_ld;
			fin <= '0';
      when s6 =>
			ctrl <= (others => '0');
			fin <= '0';
		when s7 =>
			ctrl <= mux_sig or mux_exp_res1 or mux_m_res0 or res_ld;
			fin <= '0';
		when s8 =>
			ctrl <= mux_sig or mux_exp_res1 or res_ld;
			fin <= '0';
		when s9 =>
			ctrl <= mux_exp_res0 or mux_m_res1 or mux_m_res0 or res_ld;
			fin <= '0';
		when s10 =>
			ctrl <= mux_exp_res0 or mux_m_res1 or mux_sig or res_ld;
			fin <= '0';	
		when s11 =>
			ctrl <= mux_m_res1 or res_ld;
			fin <= '0';					
      when others => 
			fin <= '0';
    end case;


  end process p_outputs;

p_sincrono : process (clk, rst) is
  begin
    if rst = '1' then
      current_state <= s0;
    elsif rising_edge(clk) then
      current_state <= next_state;
		if cambio_st = '0' then
			cambio_st <= '1';
		else
			cambio_st <= '0';
		end if;
    end if;
  end process p_sincrono;

end Behavioral;

