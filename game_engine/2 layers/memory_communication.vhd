library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity memory_communication is
   port(clk                : in  std_logic;
        reset              : in  std_logic;
		
		--from the fsm
		address_fsm	   	   : in  std_logic_vector(7 downto 0);
		write_enable_fsm   : in  std_logic;
        read_enable_fsm    : in  std_logic;
		clear_fsm          : in  std_logic;
        write_data_fsm     : in  std_logic;
		
		--from the memory
		memory_ready	   : in  std_logic;
		read_data_mem	   : in  std_logic_vector(7 downto 0);
		
		--to the fsm
        memory_com_ready   : out std_logic;
		read_data_fsm	   : out std_logic_vector(7 downto 0);
		
		--to the memory	
		go_to	           : out std_logic;
		clear_mem	       : out std_logic;
        write_enable_mem   : out std_logic;
        write_data_mem     : out std_logic_vector(7 downto 0);
        address_mem        : out std_logic_vector(9 downto 0));
end memory_communication; 