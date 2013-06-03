library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory is
    Port ( code : in  STD_LOGIC_VECTOR (7 downto 0);
           isPressed : in  STD_LOGIC;
           wasPressed : out  STD_LOGIC;
           store : in  STD_LOGIC);
end memory;

architecture Behavioral of memory is
signal myCode : std_logic_vector  (7 downto 0);
signal oldValue : std_logic;
begin

	process(store)
	begin
		if store'event and store = '1' then
			oldValue <= isPressed;
			myCode <= code;
		end if;
	end process;
	
	wasPressed <= '1' when (myCode = code) and oldValue = '1' else '0';
	
end Behavioral;

