----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:00 01/11/2018 
-- Design Name: 
-- Module Name:    mult_ieee754 - Behavioral 
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

entity mult_ieee754 is
port (
clk : in std_logic;
rst : in std_logic;
-- operandos entrada/salida
op1 : in std_logic_vector(31 downto 0);
op2 : in std_logic_vector(31 downto 0);
res : out std_logic_vector(31 downto 0);
-- control
ini : in std_logic;
fin : out std_logic);
end entity mult_ieee754;

architecture struct of mult_ieee754 is
component cd is
    port (
		clk : in std_logic; -- clock
		rst : in std_logic; -- Async active low reset
		op1 : in std_logic_vector(31 downto 0);
		op2 : in std_logic_vector(31 downto 0);
		res : out std_logic_vector(31 downto 0);
		ctrl : in std_logic_vector (10 downto 0); -- Control
		status : out std_logic_vector (6 downto 0)); -- Status
  end component cd;

component uc is
    port (
		clk : in std_logic; -- clock
		rst : in std_logic; -- Async active low reset
		ini : in std_logic; -- External control signal
		fin : out std_logic; -- External control signal
		ctrl : out std_logic_vector (10 downto 0); -- Control
		status : in std_logic_vector (6 downto 0)); -- Status

  end component uc;
  
  signal ctrl   : std_logic_vector(10 downto 0);  -- Control vector
  signal status : std_logic_vector(6 downto 0);  --Status vector
  
begin

i_cd : cd port map (
    clk    => clk,
    rst  => rst,
	 op1=> op1,
	 op2=> op2,
	 res=> res,
    ctrl   => ctrl,
    status => status);


  i_uc : uc port map (
	 clk    => clk,
    rst  => rst,
    ini    => ini,
    fin    => fin,
    ctrl   => ctrl,
    status => status);
	 
end struct;

