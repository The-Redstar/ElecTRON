library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memory_communication_tb is
   component memory_communication
      port(clk                : in  std_logic;
           reset              : in  std_logic;
   		
   		address_fsm	   	   : in  std_logic_vector(9 downto 0);
   		write_enable_fsm   : in  std_logic;
           read_enable_fsm    : in  std_logic;
   		clear_fsm          : in  std_logic;
           write_data_fsm     : in  std_logic_vector(7 downto 0);
   		
   		memory_ready	   : in  std_logic;
   		read_data_mem	   : in  std_logic_vector(7 downto 0);
   		
           mem_com_ready      : out std_logic;
   		read_data_fsm	   : out std_logic_vector(7 downto 0);
   		
   		go_to	           : out std_logic;
   		clear_mem	       : out std_logic;
           write_enable_mem   : out std_logic;
           write_data_mem     : out std_logic_vector(7 downto 0);
           address_mem        : out std_logic_vector(9 downto 0));
   end component;
   signal clk                : std_logic;
   signal reset              : std_logic;
   signal address_fsm	   	   : std_logic_vector(9 downto 0);
   signal write_enable_fsm   : std_logic;
   signal read_enable_fsm    : std_logic;
   signal clear_fsm          : std_logic;
   signal write_data_fsm     : std_logic_vector(7 downto 0);
   signal memory_ready	   : std_logic;
   signal read_data_mem	   : std_logic_vector(7 downto 0);
   signal mem_com_ready      : std_logic;
   signal read_data_fsm	   : std_logic_vector(7 downto 0);
   signal go_to	           : std_logic;
   signal clear_mem	       : std_logic;
   signal write_enable_mem   : std_logic;
   signal write_data_mem     : std_logic_vector(7 downto 0);
   signal address_mem        : std_logic_vector(9 downto 0);
begin
   test: memory_communication port map (clk, reset, address_fsm, write_enable_fsm, read_enable_fsm, clear_fsm, write_data_fsm, memory_ready, read_data_mem, mem_com_ready, read_data_fsm, go_to, clear_mem, write_enable_mem, write_data_mem, address_mem);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   address_fsm(0) <= '1' after 0 ns;
   address_fsm(1) <= '0' after 0 ns;
   address_fsm(2) <= '0' after 0 ns;
   address_fsm(3) <= '0' after 0 ns;
   address_fsm(4) <= '0' after 0 ns;
   address_fsm(5) <= '0' after 0 ns;
   address_fsm(6) <= '0' after 0 ns;
   address_fsm(7) <= '0' after 0 ns;
   address_fsm(8) <= '0' after 0 ns;
   address_fsm(9) <= '0' after 0 ns;
   write_enable_fsm <= '1' after 0 ns, '0' after 310 ns;
   read_enable_fsm <= '0' after 0 ns, '1' after 350 ns, '0' after 700 ns;
   clear_fsm <= '0' after 0 ns, '1' after 800 ns, '0' after 1000 ns;
   write_data_fsm(0) <= '1' after 0 ns;
   write_data_fsm(1) <= '0' after 0 ns;
   write_data_fsm(2) <= '0' after 0 ns;
   write_data_fsm(3) <= '0' after 0 ns;
   write_data_fsm(4) <= '0' after 0 ns;
   write_data_fsm(5) <= '0' after 0 ns;
   write_data_fsm(6) <= '0' after 0 ns;
   write_data_fsm(7) <= '0' after 0 ns;
   memory_ready <= '1' after 0 ns, '0' after 20 ns, '1' after 250 ns, '0' after 430 ns, '1' after 650 ns, '0' after 820 ns, '1' after 950 ns; 
   read_data_mem(0) <= '1' after 0 ns;
   read_data_mem(1) <= '0' after 0 ns;
   read_data_mem(2) <= '0' after 0 ns;
   read_data_mem(3) <= '0' after 0 ns;
   read_data_mem(4) <= '0' after 0 ns;
   read_data_mem(5) <= '0' after 0 ns;
   read_data_mem(6) <= '0' after 0 ns;
   read_data_mem(7) <= '0' after 0 ns;
end behaviour;

