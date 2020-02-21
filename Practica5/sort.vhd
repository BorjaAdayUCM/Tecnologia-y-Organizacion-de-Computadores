----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:26 12/18/2017 
-- Design Name: 
-- Module Name:    short - Behavioral 
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

entity sort is
port ( clk : in std_logic;
		 rst_n : in std_logic;
		 ini : in std_logic;
		 fin : out std_logic;
		 debug_addr : in std_logic_vector(4 downto 0);
		 debug_din : in std_logic_vector(31 downto 0);
		 debug_we : in std_logic;
		 debug_dout : out std_logic_vector (31 downto 0)
	   );
end entity sort;

architecture Behavioral of sort is

component cd is 
port( clk			: in	std_logic;                      
      rst_n		: in	std_logic;                      
	   debug_addr : in	std_logic_vector(4 downto 0);	  
	   debug_we	: in	std_logic;							  
	   debug_din	: in	std_logic_vector(31 downto 0);  
	   debug_dout : out std_logic_vector(31 downto 0);  
      ctrl			: in	std_logic_vector(6 downto 0);   
      status		: out std_logic_vector(2 downto 0)
	  );
end component;

component uc is 
port( clk    : in  std_logic;                      
      rst_n  : in  std_logic;                      
      ini    : in  std_logic;                      
      fin    : out std_logic;                      
      ctrl   : out std_logic_vector(6 downto 0);   
      status : in  std_logic_vector(2 downto 0)
	 );
end component;

signal ctrl   : std_logic_vector(6 downto 0);  -- Control vector
signal status : std_logic_vector(2 downto 0);  --Status vector
 
begin

i_cd : cd port map( clk => clk,
						  rst_n => rst_n,
						  debug_addr => debug_addr,
						  debug_we => debug_we,
						  debug_din => debug_din,
						  debug_dout => debug_dout,
						  ctrl => ctrl,
						  status => status
						 );

i_uc : uc port map( clk => clk,
						  rst_n => rst_n,
						  ini => ini,
						  fin => fin,
						  ctrl => ctrl,
						  status => status
						 );

end Behavioral;

