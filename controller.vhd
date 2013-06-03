----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:47:28 06/03/2013 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    Port ( clk : in  STD_LOGIC;
           code : out  std_logic_vector(7 downto 0);
			  isPressed : in std_logic;
			  wasPressed : in std_logic;
			  ps2send : out STD_LOGIC; -- used by both ps2- and memory module.
           ps2ready : in  STD_LOGIC;
			  doSampleKey : out std_logic);
end controller;

architecture Behavioral of controller is
TYPE ps2state_TYPE IS (s_start, s_check, s_startSending, s_waitSending, s_continue);
SIGNAL state   : ps2state_TYPE;
signal currentCode : unsigned (7 downto 0);
begin

	process(clk)
	begin
		if clk'event and clk = '1' then
			case state is
				-- The start state is the only state where the
				-- doSampleKey signal is low, the key is sampled
				-- on the transition to the s_check state
				when s_start =>
					state <= s_check;

            -- Check the sampled value, and send data if
				-- a key is held down or released
				when s_check =>
					if isPressed = '1' or wasPressed = '1' then
						-- TODO: some kind of timeout for held
						-- keys? We only need to send every 100ms
						
						-- TODO: some kind of timeout for ps2-block?
						-- Start sending if not blocked
						if ps2ready = '1' then
							state <= s_startSending;
						end if;
					else
						-- Nothing to report. Move on to next key.
						state <= s_continue;
					end if;

				-- Hold the send signal high until the ps2-module
				-- has began sending
				when s_startSending =>
					if ps2ready = '0' then
						state <= s_waitSending;
					end if;
					
				-- Wait until sending finished.
				when s_waitSending =>
					if ps2ready = '1' then
						state <= s_continue;
					end if;
				
				-- Move on to next key
				when s_continue =>
					currentCode <= currentCode + 1;
					state <= s_start;
			end case;
		end if;
	end process;

	code <= STD_LOGIC_VECTOR(currentCode);
	
	doSampleKey <= '0' when state = s_start else '1';
	
	-- ps2send is also used as a store signal to memory
	ps2send <= '1' when state = s_startSending else '0';
	
end Behavioral;

