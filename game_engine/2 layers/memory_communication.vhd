library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity memory_communication is
   port(clk                : in  std_logic;
        reset              : in  std_logic;
		
		--from the FSM
		address		   	   : in  std_logic_vector(7 downto 0);
		write_enable       : in  std_logic;
        read_enable        : in  std_logic;
		clear		       : in  std_logic;
        write_data         : in  std_logic;
		
		--from the memory
		memory_ready	   : in  std_logic;
		read_data_in	   : in  std_logic_vector(7 downto 0);
		
		--to the FSM
        memory_com_ready   : out std_logic;
		read_data_out	   : out std_logic_vector(7 downto 0);
		
		--to the memory	
		go_to	           : out std_logic;
		clear_memory       : out std_logic;
        write_enable       : out std_logic;
        write_memory       : out std_logic_vector(7 downto 0);
        address            : out std_logic_vector(9 downto 0));
end memory_communication; 