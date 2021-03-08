----------------------------------------------------------------------------------
-- Company:        Universidad Complutense de Madrid
-- Engineer:       TOC&TC
-- 
-- Create Date:    
-- Design Name:    Divisor secuencial
-- Module Name:    camino de datos - rtl
-- Project Name:   Practica 5
-- Target Devices: Spartan-3 
-- Tool versions:  ISE 14.1
-- Description:    Camino de datos del divisor secuencial de 8 bits con restauracion
-- Dependencies: 
-- Revision: 
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity cd is
  port (
    clk			: in	std_logic;                      -- clock
    rst_n		: in	std_logic;                      -- reset
	 debug_addr : in	std_logic_vector(4 downto 0);	  --Input address for debugging
	 debug_we	: in	std_logic;	  -- Input write enable for degugging
	 debug_din	: in	std_logic_vector(31 downto 0);  --Input data for debugging
	 debug_dout : out std_logic_vector(31 downto 0);  --Debug ouutput
    ctrl			: in	std_logic_vector(6 downto 0);   -- Control
    status		: out std_logic_vector(2 downto 0));  -- Status
end entity cd;

architecture rtl of cd is
--Componente memoria

component bj_mem IS --memoria
 PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
end component;

  signal cntri_r, cntrj_r           : unsigned(4 downto 0); 
  signal add              : std_logic_vector(4 downto 0);
  signal mux_output       : std_logic_vector(4 downto 0); 
  signal mux_output_1     : std_logic_vector(31 downto 0); 
  signal mux_output_2     : std_logic; 
  signal mux_output_3     : std_logic_vector(31 downto 0);
  signal douta_out		  : std_logic_vector(31 downto 0);
  signal doutb_out		  : std_logic_vector(31 downto 0);
  --signal


  -- Control signals
  signal cntri_ld			: std_logic;
  signal cntri_cu			: std_logic;
  signal cntrj_ld			: std_logic;
  signal cntrj_cu			: std_logic;
  signal wea				: std_logic;
  signal web				: std_logic;
  signal debug_mode		: std_logic;
 


  -- Status signals
  signal cmp_mem			: std_logic;
  signal cmp_j				: std_logic;
  signal cmp_i				: std_logic;
  
begin

  i_bj_mem: bj_mem PORT MAP(clka => clk,
						          wea(0) => mux_output_2,
							       addra => mux_output,
								    dina => mux_output_1,
							       douta => douta_out,
		                      clkb => clk,
                            web(0) => web,
                            addrb => add,
                            dinb => douta_out,
                            doutb => doutb_out);
	
	(debug_mode,
   web,
   wea,
   cntrj_cu,
   cntrj_ld,
   cntri_cu,
	cntri_ld) <= ctrl;

  status <= (cmp_i &
             cmp_j &
				 cmp_mem);


  -----------------------------------------------------------------------------
  -- Contadores con carga paralela
  -----------------------------------------------------------------------------
  p_cntr_r : process (clk, rst_n) is
  begin
    if rst_n = '0' then
      cntri_r <= (others => '0');
		cntrj_r <= (others => '0');
    elsif rising_edge(clk) then
      if cntri_ld = '1' then
        cntri_r <= (others => '0');
		elsif cntri_cu= '1' then
			cntri_r <= cntri_r + 1;
      end if;
		if cntrj_ld = '1' then
			cntrj_r <= (others => '0');
		elsif cntrj_cu = '1' then
			cntrj_r <= cntrj_r + 1;
		end if;
    end if;
  end process p_cntr_r;


  -----------------------------------------------------------------------------
  -- Sumador
  -----------------------------------------------------------------------------
  p_add : process (cntrj_r) is
  begin  -- process p_add
	add <= std_logic_vector(cntrj_r + 1);
  end process p_add;

  -----------------------------------------------------------------------------
  -- Multiplexor
  -----------------------------------------------------------------------------
  p_mux : process (debug_mode, cntrj_r,debug_addr,debug_din,debug_we, wea, douta_out, doutb_out) is--faltan las señale s de lso puertos
	begin  -- process p_mux
    if debug_mode = '0' then
      mux_output <= std_logic_vector(cntrj_r);
		mux_output_1 <= doutb_out;
		mux_output_2 <= wea;
		mux_output_3 <= (others =>'0');
    elsif debug_mode = '1' then
      mux_output <= debug_addr;
		mux_output_1 <= debug_din;
		mux_output_2 <= debug_we;
		mux_output_3 <= douta_out;
    end if;
  end process p_mux;
  
-----------------------------------------------------------------------
-- COMPARADORES i,j
-----------------------------------------------------------------------
 p_cmp_i: process (cntri_r, cntrj_r) is
	begin
	 if cntri_r < "11111" then
		 cmp_i <= '1';
	 else 
		 cmp_i <= '0';
	 end if;
	 if cntrj_r <= "11110" then
		 cmp_j <= '1';
	 else 
		 cmp_j <= '0';
	 end if;
 end process p_cmp_i;

-----------------------------------------------------------------------
-- COMPARADOR mem
-----------------------------------------------------------------------
p_cmp_mem: process (doutb_out, douta_out) is
	begin
	 if doutb_out(31) = '1' and douta_out(31) = '0' then
		 cmp_mem <= '0';
	 elsif doutb_out(31)= '0' and douta_out(31) = '1' then 
		 cmp_mem <= '1';
	 else
	    if(douta_out(30 downto 0) > doutb_out(30 downto 0)) then
			cmp_mem <= '0';
		 else 
			cmp_mem <= '1';
		 end if;
	 end if;
 end process p_cmp_mem;

 debug_dout <= mux_output_3;
 
end architecture rtl;