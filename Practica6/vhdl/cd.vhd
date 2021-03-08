----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:31 01/11/2018 
-- Design Name: 
-- Module Name:    cd - Behavioral 
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

entity cd is
    port (
		clk : in std_logic; -- clock
		rst : in std_logic; -- Async active low reset
		op1 : in std_logic_vector(31 downto 0);
		op2 : in std_logic_vector(31 downto 0);
		res : out std_logic_vector(31 downto 0);
		ctrl : in std_logic_vector (10 downto 0); -- Control
		status : out std_logic_vector (6 downto 0)); -- Status

end cd;

architecture Behavioral of cd is
COMPONENT multi_it is
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
END COMPONENT multi_it;

---señales que salen de los resgistros---
signal s1_r:  std_logic;
signal exp1_r: std_logic_vector( 8 downto 0);
signal m1_r:   std_logic_vector( 23 downto 0);
signal s2_r:  std_logic;
signal exp2_r: std_logic_vector( 8 downto 0);
signal m2_r:   std_logic_vector( 23 downto 0);
signal res_reg: 	 std_logic_vector( 31 downto 0);
signal exp_parcial:  std_logic_vector( 8 downto 0);

signal s_res:    std_logic;
signal exp_res:  std_logic_vector( 7 downto 0);
signal m_res:    std_logic_vector( 22 downto 0);
signal op1_adder:  std_logic_vector( 8 downto 0);
signal op2_adder:  std_logic_vector( 8 downto 0);
signal add_result:  std_logic_vector( 8 downto 0);
signal resta_result:  std_logic_vector( 8 downto 0);
signal mux_entrada_exp_parcial: std_logic_vector( 8 downto 0);
signal iteraciones: std_logic_vector( 4 downto 0);
signal m_parcial: std_logic_vector( 47 downto 0);

signal stat_nan,stat_inf,stat_z,stat_it,stat_47,stat_over,stat_under      : std_logic;

signal		load       			: std_logic;
signal		mul_ld   			: std_logic;
signal		mul_it    			: std_logic;
signal		mux_sum    			: std_logic;
signal		exp_ld    			: std_logic;
signal		mux_sig    			: std_logic;
signal		mux_exp_res1    	: std_logic;
signal		mux_exp_res0    	: std_logic;
signal		mux_m_res1    		: std_logic;
signal		mux_m_res0    		: std_logic;
signal		res_ld		    	: std_logic;


begin
	

i_multi_it: multi_it port map (
	 clk    => clk,
    rst  => rst,
	 mant1=> m1_r,
	 mant2=> m2_r,
	 load=> mul_ld,
    iterar   => mul_it,
    it => iteraciones,
	 m_parcial=> m_parcial);
	 
	  (load,       			
	mul_ld,  			
	mul_it,    			
	mux_sum,    			
	exp_ld,    			
	mux_sig,    			
	mux_exp_res1,    	
	mux_exp_res0,    	
	mux_m_res1,    		
	mux_m_res0,    		
	res_ld) <= ctrl;	

		status<=(stat_nan,stat_inf,stat_z,stat_it,stat_47,stat_over,stat_under) ;
-----------------------------------------------------------------------------
----resgistro S1------------------------------------------------------------
------------------------------------------------------------------------------
p_s1_r: process(clk,rst)is 
begin 

	if rst = '1' then 
		s1_r <= '0';
	elsif rising_edge (clk) then 
		if load ='1' then 
		s1_r <= op1(31);	
		end if;
	end if;
end process p_s1_r;

------------------------------------------------------------------------------
----resgistro exp1------------------------------------------------------------
------------------------------------------------------------------------------
p_exp1_r: process(clk,rst)is 
begin 

	if rst = '1' then 
		exp1_r <=(others=> '0');
	elsif rising_edge (clk) then 
		if load ='1' then 
			exp1_r <= "0"& op1(30 downto 23); 
		end if;
	end if;
end process p_exp1_r;
------------------------------------------------------------------------------
----resgistro M1------------------------------------------------------------
------------------------------------------------------------------------------
p_m1_r: process(clk,rst)is 
begin 

	if rst = '1' then 
		m1_r<=(others=> '0');
	elsif rising_edge (clk) then 
		if load ='1' then 
		m1_r <= "1" & op1(22 downto 0);
			
		end if;
	end if;
end process p_m1_r;

------------------------------------------------------------------------------
----resgistro S2------------------------------------------------------------
------------------------------------------------------------------------------
p_s2_r: process(clk,rst)is 
begin 

	if rst = '1' then 
		s2_r <= '0';
	elsif rising_edge (clk) then 
		if load ='1' then 
		s2_r <= op2 (31);
			
		end if;
	end if;
end process p_s2_r;
------------------------------------------------------------------------------
----resgistro exp2------------------------------------------------------------
------------------------------------------------------------------------------
p_exp2_r: process(clk,rst)is 
begin 

	if rst = '1' then 
		exp2_r<=(others=> '0');
	elsif rising_edge (clk) then 
		if load ='1' then 
			exp2_r <= "0"& op2(30 downto 23);
		end if;
	end if;
end process p_exp2_r;
------------------------------------------------------------------------------
----resgistro M2------------------------------------------------------------
------------------------------------------------------------------------------
p_m2_r: process(clk,rst)is 
begin 

	if rst = '1' then 
		m2_r<=(others=> '0');
	elsif rising_edge (clk) then 
		if load ='1' then 
		m2_r <= "1" & op2(22 downto 0);
			
		end if;
	end if;
end process p_m2_r;

---------------------------------------------------------------------------------
-------------------izquierda-----------------------------------------------------
---------------------------------------------------------------------------------
-------------------multiplexor de signo----------------------------------------

p_mux_sig:process (mux_sig,s1_r,s2_r) is 
begin  
	if mux_sig='0' then 
		s_res<= '0';
	else
		s_res<= s1_r or s2_r;
	end if;
	
end process p_mux_sig;

-------------------multiplexor de exp res----------------------------------------

p_mux_exp_res:process (exp_parcial,mux_exp_res1,mux_exp_res0) is 
begin  
	if  mux_exp_res1='0' and mux_exp_res0='0' then 
		exp_res<= (others=>'0'); 
	elsif mux_exp_res1='0' and mux_exp_res0='1' then 
		exp_res<= "11111111";
	else
		exp_res <= exp_parcial(7 downto 0);
	end if;
end process p_mux_exp_res;

-------------------multiplexor de m res----------------------------------------

p_mux_m_res:process (m_parcial,mux_m_res1,mux_m_res0) is 
begin  
	if mux_m_res1='0' and mux_m_res0='0' then 
		m_res<=m_parcial(45 downto 23);
	elsif mux_m_res1='0' and mux_m_res0='1'  then 
		m_res<= m_parcial(46 downto 24);
	elsif mux_m_res1='1' and mux_m_res0='0'then
		m_res<=(others =>'0');
	else
		m_res<=(others =>'1');
	end if;
	
end process p_mux_m_res;



------------------------------------------------------------------------------
----resgistro RES------------------------------------------------------------
------------------------------------------------------------------------------
p_res_r: process(clk,rst)is 
begin 

	if rst = '1' then 
			res_reg<=(others=> '0');
	elsif rising_edge (clk) then 
		if res_ld ='1' then 
			res_reg<= s_res & exp_res & m_res;	
		end if;
	end if;
end process p_res_r;


---------------------------------------------------------------------------------
-------------------derecha-----------------------------------------------------
---------------------------------------------------------------------------------

------------   Excepciones ---------------------------

p_excepciones: process (exp1_r,exp2_r) is  -- Es necesario poner mantisas para números denormalizados.
begin
	if ((exp1_r="011111111" and exp2_r="000000000") or (exp2_r="011111111" and exp1_r="000000000") )then
		stat_nan<='1';
		stat_inf<='0';
		stat_z<='0';
	elsif (exp1_r="011111111" or exp2_r="011111111") then
		stat_nan<='0';
		stat_inf<='1';
		stat_z<='0';
	elsif (exp1_r="000000000" or exp2_r="000000000") then
		stat_nan<='0';
		stat_inf<='0';
		stat_z<='1';
	else
		stat_nan<='0';
		stat_inf<='0';
		stat_z<='0';
	end if;
	
end process p_excepciones;


-------------------multiplexor entrada de exp_parcial---------------------------------------
--------------------------------------------------------------------------------------------
p_mux_entrada_exp_parcial:process (mux_sum, add_result, resta_result) is 
begin  
	if mux_sum='0' then 
		mux_entrada_exp_parcial <= resta_result;
	else
		mux_entrada_exp_parcial <= add_result;
	end if;
end process p_mux_entrada_exp_parcial;

-------------------multiplexor de op1 ALU y exp_parcial----------------------------------------
-----------------------------------------------------------------------------------------

p_mux_op1ALU:process (mux_sum,exp1_r,exp_parcial) is 
begin  
	if mux_sum='0' then 
		op1_adder<= exp1_r;
	else
		op1_adder<= exp_parcial;
	end if;
end process p_mux_op1ALU;

-------------------multiplexor de op2 ALU y exp_parcial----------------------------------------
-----------------------------------------------------------------------------------------

p_mux_op2ALU:process (mux_sum,exp2_r) is 
begin  
	if mux_sum='0' then 
		op2_adder<= exp2_r;
	else
		op2_adder<= "000000001";
	end if;
end process p_mux_op2ALU;

-------------------sumador----------------------------------------
p_adder: process (op1_adder,op2_adder)is 
begin 
	add_result<=std_logic_vector(unsigned(op1_adder ) + unsigned(op2_adder));
end process p_adder;
----------------------------------------------------------------------------
-------------------restador---------------------------------------
p_restador: process (add_result)is 
begin 
	resta_result<=std_logic_vector(unsigned(add_result) + "110000001");
end process p_restador;
------------------------------------------------------------------------------
----resgistro exp_parcial-----------------------------------------------------
------------------------------------------------------------------------------
p_exp_parcial: process(clk,rst)is 
begin 
	if rst = '1' then 
		exp_parcial<=(others=> '0');
	elsif rising_edge (clk) then 
		if exp_ld='1' then 
		exp_parcial<=mux_entrada_exp_parcial;
		end if;
	end if;
end process p_exp_parcial;

----------------------------------------------------------------------------------------------------------
------ Comparador overflow & underflow --------------------------
p_comp_over: process(exp_parcial)is 
begin 
	if exp_parcial(8)='1' and  exp_parcial(7)='1' then 
		stat_under<='1';
		stat_over<='0';
	elsif exp_parcial(8)='1' and  exp_parcial(7)='0' then 
		stat_under<='0';
		stat_over<='1';
	else
		stat_under<='0';
		stat_over<='0';
	end if;
end process p_comp_over;
----------------------------------------------------------------------------------------------------------
------ Comparador iteraciones --------------------------------------
p_comp_iter: process(iteraciones)is 
begin 
	if iteraciones >= "10111" then 
		stat_it<='1';
	else 
		stat_it<='0';
	end if;
end process p_comp_iter;
--------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
------ Comparador m_parcial(47) --------------------------------------
p_comp_47: process(m_parcial)is 
begin 
	if m_parcial(47)='1' then 
		stat_47<='1';
	else 
		stat_47<='0';
	end if;
end process p_comp_47;

res<=res_reg;

end Behavioral;

