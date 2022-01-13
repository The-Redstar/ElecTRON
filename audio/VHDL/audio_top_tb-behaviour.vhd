library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of audio_top_tb is
   component audio_top
   	port(	clk				: in  std_logic;
   			reset			: in  std_logic;
   			
   			game_state		: in  std_logic_vector(2 downto 0);
   			
   			beep_clk		: in  std_logic;
   			button			: in  std_logic;
   			
   			player0_dir 	: in  std_logic_vector(1 downto 0);
   			player1_dir 	: in  std_logic_vector(1 downto 0);
   			player0_boost	: in  std_logic;
   			player1_boost	: in  std_logic;
   			
   			wave        	: out std_logic_vector(1 downto 0));
   end component;
   signal clk				: std_logic;
   signal reset			: std_logic;
   signal game_state		: std_logic_vector(2 downto 0);
   signal beep_clk		: std_logic;
   signal button			: std_logic;
   signal player0_dir 	: std_logic_vector(1 downto 0);
   signal player1_dir 	: std_logic_vector(1 downto 0);
   signal player0_boost	: std_logic;
   signal player1_boost	: std_logic;
   signal wave        	: std_logic_vector(1 downto 0);
begin
   test: audio_top port map (clk, reset, game_state, beep_clk, button, player0_dir, player1_dir, player0_boost, player1_boost, wave);
   
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
            
   game_state <=	"000" after 0 ns,
   					"101" after 10 ms,
   					"111" after 20 ms,
   					"001" after 30 ms;
   					
   beep_clk <= 	'0' after 0 ns,
   				'1' after 12 ms,
   				'0' after 19 ms;
   
   button <=	'0' after 0 ns,
   				'1' after 3 ms,
   				'0' after 12 ms;
   				
   player0_dir <= "00" after 0 ns;
   player1_dir <=	"00" after 0 ns,
   					"11" after 25 ms;
   player0_boost <= '0' after 0 ns,
   					'1' after 23 ms,
   					'0' after 30 ms;
   player1_boost <= '0' after 0 ns;
end behaviour;

