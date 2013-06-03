library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clockGenerator is
    Port ( stimuli : in  STD_LOGIC;
           clk : out  STD_LOGIC);
end clockGenerator;

architecture Behavioral of clockGenerator is
	signal dummy : std_logic;
begin
	clk <= dummy;
	dummy <= not stimuli;
end Behavioral;
