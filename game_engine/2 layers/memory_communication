library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity memory_communication is
   port(clk                : in  std_logic;
	address		   : in std_logic_vector(7 downto 0);
        reset              : in  std_logic;
	read_data_in	   : in std_logic_vector(7 downto 0);
        input              : in  std_logic_vector(3 downto 0);
        write_data         : in  std_logic;
	write_enable       : in  std_logic;
	clear		   : in  std_logic;
        read_enable        : in  std_logic;
        memory_ready       : out  std_logic;
	read_data_out	   : out std_logic_vector(7 downto 0));
end memory_communication; 