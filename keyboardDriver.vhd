library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keyboardDriver is
    Port ( address : in  STD_LOGIC_VECTOR (6 downto 0);
           keyboardSelect : out  STD_LOGIC_VECTOR (15 downto 0);
           keyboardData : in  STD_LOGIC_VECTOR (7 downto 0);
           isPressed : out  STD_LOGIC;
			  sampleKey : in std_logic);
end keyboardDriver;

architecture Behavioral of keyboardDriver is
	signal outState : unsigned (3 downto 0);
	signal inState : unsigned (2 downto 0);
	--is to_integer(to_unsigned(address (6 downto 3)));
	--alias inState is address(2 downto 0);
	signal keySample : std_logic;
begin
	outState <= unsigned(address(6 downto 3));
	inState <= unsigned(address(2 downto 0));
	
	keyboardSelect(0) <= '1' when outState = 0 else '0';
	keyboardSelect(1) <= '1' when outState = 1 else '0';
	keyboardSelect(2) <= '1' when outState = 2 else '0';
	keyboardSelect(3) <= '1' when outState = 3 else '0';
	keyboardSelect(4) <= '1' when outState = 4 else '0';
	keyboardSelect(5) <= '1' when outState = 5 else '0';
	keyboardSelect(6) <= '1' when outState = 6 else '0';
	keyboardSelect(7) <= '1' when outState = 7 else '0';
	keyboardSelect(8) <= '1' when outState = 8 else '0';
	keyboardSelect(9) <= '1' when outState = 9 else '0';
	keyboardSelect(10) <= '1' when outState = 10 else '0';
	keyboardSelect(11) <= '1' when outState = 11 else '0';
	keyboardSelect(12) <= '1' when outState = 12 else '0';
	keyboardSelect(13) <= '1' when outState = 13 else '0';
	keyboardSelect(14) <= '1' when outState = 14 else '0';
	keyboardSelect(15) <= '1' when outState = 15 else '0';

	-- To make logic more consistent, sample the key to
	-- so that the value does not change during the processing
	-- of a keypress
	process(sampleKey)
	begin
		if sampleKey'event and sampleKey = '1' then
			keySample <= keyboardData(to_integer(inState));
		end if;
	end process;

	isPressed <= keySample when sampleKey = '1' else '0';

end Behavioral;
