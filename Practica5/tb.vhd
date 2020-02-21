----------------------------------------------------------------------------------
-- Company:        Universidad Complutense de Madrid
-- Engineer:       TOC&TC
-- 
-- Create Date:    
-- Design Name:    sort
-- Module Name:    tb_sort - beh 
-- Project Name:   Practica 5
-- Target Devices: Spartan-3 
-- Tool versions:  ISE 14.1
-- Description:    Testbech del sistema algoritmico con el algoritmo de
--                 ordenacion de burbuja
-- Dependencies: 
-- Revision: 
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_sort is

end tb_sort;

architecture beh of tb_sort is
  component sort
    port(clk        : in  std_logic;
         rst_n      : in  std_logic;
         ini        : in  std_logic;
         fin        : out std_logic;
         debug_addr : in  std_logic_vector(4 downto 0);
         debug_din : in  std_logic_vector(31 downto 0);
         debug_we   : in  std_logic;
         debug_dout  : out std_logic_vector(31 downto 0));
  end component;

  signal clk, rst_n, ini, fin, debug_we : std_logic;
  signal debug_addr                     : std_logic_vector(4 downto 0);
  signal debug_data, debug_out          : std_logic_vector(31 downto 0);
begin


  -------------------------------------------------------------------------------
  -- Component instantiation
  -------------------------------------------------------------------------------

  i_dut : sort
    port map (
      clk        => clk,
      rst_n      => rst_n,
      ini        => ini,
      debug_addr => debug_addr,
      debug_we   => debug_we,
      debug_din => debug_data,
      debug_dout  => debug_out,
      fin        => fin
      );

  -----------------------------------------------------------------------------
  -- Process declaration
  -----------------------------------------------------------------------------
  -- Input clock
  p_clk : process
  begin
    clk <= '0', '1' after 5 ns;
    wait for 10 ns;
  end process p_clk;

  -- External reset
  p_rst : process
  begin
    rst_n <= '0';
    wait for 250 ns;
    rst_n <= '1';
    wait;
  end process p_rst;

  p_driver : process
    type t_mem is array (0 to 31) of std_logic_vector(31 downto 0);
    variable v_i, v_j : natural := 0;
    variable mem1_red : t_mem := (x"723AF37B",
                                  x"71CB8902",
                                  x"6604D364",
                                  x"655C3976",
                                  x"5930D12F",
                                  x"586ACE26",
                                  x"538F646F",
                                  x"4B769E12",
                                  x"41B492F3",
                                  x"3F730729",
                                  x"36A863D1",
                                  x"2C232D4C",
                                  x"2B70EC74",
                                  x"2A46A4E9",
                                  x"20000002",
                                  x"11111111",
                                  x"0F8B9FE4",
                                  x"90661F5C",
                                  x"923923AF",
                                  x"99999999",
                                  x"9B4D20F7",
                                  x"9BF0A6BA",
                                  x"A07A0C1B",
                                  x"A8968A40",
                                  x"AAFFBBCC",
                                  x"AD2E8083",
                                  x"CAEA0196",
                                  x"D543BE76",
                                  x"D5670931",
                                  x"DDEEFF00",
                                  x"E17A88DD",
                                  x"E638024A"
                                  );
    variable mem2_wri : t_mem := (X"00000000",
                                  x"41B492F3",
                                  x"9BF0A6BA",
                                  x"0F8B9FE4",
                                  x"D543BE76",
                                  x"AD2E8083",
                                  x"2A46A4E9",
                                  x"6604D364",
                                  x"4B769E12",
                                  x"9B4D20F7",
                                  x"36A863D1",
                                  x"A07A0C1B",
                                  x"90661F5C",
                                  x"E17A88DD",
                                  x"71CB8902",
                                  x"A8968A40",
                                  x"E638024A",
                                  x"5930D12F",
                                  x"3F730729",
                                  x"586ACE26",
                                  x"2C232D4C",
                                  x"2B70EC74",
                                  x"D5670931",
                                  x"655C3976",
                                  x"11111111",
                                  x"AAFFBBCC",
                                  x"DDEEFF00",
                                  x"923923AF",
                                  x"20000002",
                                  x"723AF37B",
                                  x"99999999",
                                  x"538F646F"
                                  );
    variable mem2_red : t_mem := (X"723AF37B",
                                  x"71CB8902",
                                  x"6604D364",
                                  x"655C3976",
                                  x"5930D12F",
                                  x"586ACE26",
                                  x"538F646F",
                                  x"4B769E12",
                                  x"41B492F3",
                                  x"3F730729",
                                  x"36A863D1",
                                  x"2C232D4C",
                                  x"2B70EC74",
                                  x"2A46A4E9",
                                  x"20000002",
                                  x"11111111",
                                  x"0F8B9FE4",
                                  x"00000000",
                                  x"90661F5C",
                                  x"923923AF",
                                  x"99999999",
                                  x"9B4D20F7",
                                  x"9BF0A6BA",
                                  x"A07A0C1B",
                                  x"A8968A40",
                                  x"AAFFBBCC",
                                  x"AD2E8083",
                                  x"D543BE76",
                                  x"D5670931",
                                  x"DDEEFF00",
                                  x"E17A88DD",
                                  x"E638024A"
                                  );
  begin
    ini        <= '0';
    debug_we   <= '0';
    debug_addr <= "00000";
    debug_data <= x"00000000";
    wait for 250 ns;
    wait until falling_edge(clk);
    wait until rising_edge(clk);
    ini        <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    ini        <= '0';
    wait until fin = '1';
    wait until rising_edge(clk);
    -- Lectura de los datos cargados inicialmente en la memoria ordenados
    read_mem_loop1 : for v_i in 0 to 31 loop
      debug_addr <= std_logic_vector(to_unsigned(v_i, 5));
      wait until rising_edge(clk);
      wait for 1 ns;
      assert debug_out = mem1_red(v_i) report "Lectura incorrecta" severity warning;
    end loop;

    -- Escritura de datos en memoria
    wait until rising_edge(clk);
    write_mem_loop : for v_i in 0 to 31 loop
      debug_we   <= '1';
      debug_addr <= std_logic_vector(to_unsigned(v_i, 5));
      debug_data <= mem2_wri(v_i);
      wait until rising_edge(clk);
    end loop;
    debug_we <= '0';
    wait until rising_edge(clk);
    ini      <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    ini      <= '0';
    wait until fin = '1';
    wait until rising_edge(clk);
    read_mem_loop2 : for v_i in 0 to 31 loop
      debug_addr <= std_logic_vector(to_unsigned(v_i, 5));
      wait until rising_edge(clk);
      wait for 1 ns;
      assert debug_out = mem2_red(v_i) report "Lectura incorrecta" severity warning;
    end loop;
    wait;
  end process p_driver;

end beh;