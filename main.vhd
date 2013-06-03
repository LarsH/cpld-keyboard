library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( clkIn : in  STD_LOGIC;
			  clkOut : out std_logic; -- connects to clkIn with rc-filter
           keyboardSelect : out  STD_LOGIC_VECTOR (15 downto 0);
           keyboardData : in  STD_LOGIC_VECTOR (7 downto 0);
			  ps2Clk, ps2Data : inout std_logic;
			  speaker : out std_logic);
end main;

architecture Behavioral of main is
-- Components
  component clockGenerator
    Port ( stimuli : in  STD_LOGIC;
           clk : out  STD_LOGIC);
  end component;
  
  component keyboardDriver
    Port ( address : in  STD_LOGIC_VECTOR (6 downto 0);
           keyboardSelect : out  STD_LOGIC_VECTOR (15 downto 0);
           keyboardData : in  STD_LOGIC_VECTOR (7 downto 0);
           isPressed : out  STD_LOGIC;
			  sampleKey : in std_logic);
  end component;
  
  
component converter is
    Port ( code : in  STD_LOGIC_VECTOR (7 downto 0);
           address : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component controller is
    Port ( clk : in  STD_LOGIC;
           code : out  std_logic_vector(7 downto 0);
			  isPressed : in std_logic;
			  wasPressed : in std_logic;
			  ps2send : out STD_LOGIC;
           ps2ready : in  STD_LOGIC;
			  doSampleKey : out std_logic);
end component;

component ps2interface is
    Port ( ps2clk : inout  STD_LOGIC;
           ps2data : inout  STD_LOGIC;
           clk : in  STD_LOGIC;
           code : in  STD_LOGIC_VECTOR (7 downto 0);
           isPressed : in  STD_LOGIC;
           send : in  STD_LOGIC;
           ready : out  STD_LOGIC);
end component;

component memory is
    Port ( code : in  STD_LOGIC_VECTOR (7 downto 0);
           isPressed : in  STD_LOGIC;
           wasPressed : out  STD_LOGIC;
           store : in  STD_LOGIC);
end component;

-- Signals
  signal clk : std_logic;
  signal address : std_logic_vector(6 downto 0);
  signal code : std_logic_vector(7 downto 0);
  signal isPressed : std_logic;
  signal wasPressed : std_logic;
  signal ps2ready, ps2send : std_logic;
  signal sampleKey : std_logic;
  
begin	
	n1 : clockGenerator
	port map(clkIn, clk);
	
	n2 : keyboardDriver
	port map(address, keyboardSelect, keyboardData,isPressed,sampleKey);
	
	n3 : converter
	port map(code, address);
	
	n4 : controller
	port map(clk, code, isPressed,wasPressed,ps2send,ps2ready,sampleKey);
	
	n5 : ps2interface
	port map(ps2clk, ps2data,clk,code,isPressed,ps2send,ps2ready);

	n6 : memory
	port map(code, isPressed, wasPressed, ps2send);

	-- Signal connections
	clkOut <= clk;

	
end Behavioral;

