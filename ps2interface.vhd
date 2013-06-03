library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ps2interface is
    Port ( ps2clk : inout  STD_LOGIC;
           ps2data : inout  STD_LOGIC;
           clk : in  STD_LOGIC;
           code : in  STD_LOGIC_VECTOR (7 downto 0);
           isPressed : in  STD_LOGIC;
           send : in  STD_LOGIC;
           ready : out  STD_LOGIC);
end ps2interface;

architecture Behavioral of ps2interface is
   -- TYPE ps2state_TYPE IS (s_idle, s_recv, s_respond, s_send);
   -- SIGNAL state   : ps2state_TYPE;
	-- signal counter : integer;
begin
	ps2clk <= clk;
	ps2data <= clk;
	ready <= send xor isPressed xor ps2data;
end Behavioral;

