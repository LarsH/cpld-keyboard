----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:27:35 06/03/2013 
-- Design Name: 
-- Module Name:    converter - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity converter is
    Port ( code : in  STD_LOGIC_VECTOR (7 downto 0);
           address : out  STD_LOGIC_VECTOR (6 downto 0));
end converter;

architecture Behavioral of converter is
constant addr_0 : std_logic_vector := "0000";
constant addr_1 : std_logic_vector := "0001";
constant addr_2 : std_logic_vector := "0010";
constant addr_3 : std_logic_vector := "0011";
constant addr_4 : std_logic_vector := "0100";
constant addr_5 : std_logic_vector := "0101";
constant addr_6 : std_logic_vector := "0110";
constant addr_7 : std_logic_vector := "0111";
constant addr_8 : std_logic_vector := "1000";
constant addr_9 : std_logic_vector := "1001";
constant addr_a : std_logic_vector := "1010";
constant addr_b : std_logic_vector := "1011";
constant addr_c : std_logic_vector := "1100";
constant addr_d : std_logic_vector := "1101";
constant addr_e : std_logic_vector := "1110";
constant addr_f : std_logic_vector := "1111";

constant addr_s : std_logic_vector := "000";
constant addr_t : std_logic_vector := "001";
constant addr_u : std_logic_vector := "010";
constant addr_v : std_logic_vector := "011";
constant addr_w : std_logic_vector := "100";
constant addr_x : std_logic_vector := "101";
constant addr_y : std_logic_vector := "110";
constant addr_z : std_logic_vector := "111";

-- The invalid position
constant addr_i : std_logic_vector := "1111";
constant addr_j : std_logic_vector := "111";
begin
-- http://www.computer-engineering.org/ps2keyboard/scancodes2.html
	with code select 
	address <=
    addr_t & addr_2 when x"01", -- F9
    addr_x & addr_1 when x"03", -- F5
    addr_v & addr_1 when x"04", -- F3
    addr_u & addr_1 when x"05", -- F1
    addr_u & addr_2 when x"06", -- F2
    -- addr_ & addr_ when x"07", -- F12
    addr_s & addr_1 when x"09", -- F10
    addr_t & addr_2 when x"0A", -- F8
    addr_x & addr_2 when x"0B", -- F6
    addr_w & addr_1 when x"0C", -- F4
    addr_w & addr_2 when x"0D", -- TAB
    addr_z & addr_4 when x"0E", -- `
    addr_s & addr_0 when x"11", -- L ALT
    addr_z & addr_3 when x"12", -- L SHFT
    addr_z & addr_0 when x"14", -- L CTRL
    addr_w & addr_4 when x"15", -- Q
    addr_v & addr_4 when x"16", -- 1
    addr_y & addr_4 when x"1A", -- Z
    addr_t & addr_5 when x"1B", -- S
    addr_t & addr_4 when x"1C", -- A
    addr_w & addr_5 when x"1D", -- W
    addr_v & addr_5 when x"1E", -- 2
    addr_y & addr_6 when x"21", -- C
    addr_y & addr_5 when x"22", -- X
    addr_t & addr_6 when x"23", -- D
    addr_w & addr_6 when x"24", -- E
    addr_v & addr_7 when x"25", -- 4
    addr_v & addr_6 when x"26", -- 3
    addr_z & addr_1 when x"29", -- SPACE
    addr_y & addr_7 when x"2A", -- V
    addr_t & addr_7 when x"2B", -- F
    addr_x & addr_7 when x"2C", -- T
    addr_w & addr_7 when x"2D", -- R
    addr_u & addr_7 when x"2E", -- 5
    addr_z & addr_8 when x"31", -- N
    addr_z & addr_7 when x"32", -- B
    addr_s & addr_8 when x"33", -- H
    addr_s & addr_7 when x"34", -- G
    addr_x & addr_8 when x"35", -- Y
    addr_u & addr_8 when x"36", -- 6
    addr_y & addr_8 when x"3A", -- M
    addr_t & addr_8 when x"3B", -- J
    addr_w & addr_8 when x"3C", -- U
    addr_v & addr_8 when x"3D", --    7
    addr_v & addr_9 when x"3E", --    8
    addr_y & addr_9 when x"41", -- ,
    addr_t & addr_9 when x"42", -- K
    addr_w & addr_9 when x"43", -- I
    addr_w & addr_a when x"44", -- O
    addr_v & addr_b when x"45", -- 0
    addr_v & addr_a when x"46", -- 9
    addr_y & addr_a when x"49", --    .
    addr_y & addr_b when x"4A", --    /
    addr_t & addr_a when x"4B", -- L
    addr_t & addr_b when x"4C", -- ;
    addr_w & addr_b when x"4D", -- P
    addr_u & addr_b when x"4E", -- -
    addr_s & addr_b when x"52", -- '
    addr_x & addr_b when x"54", -- [
    addr_u & addr_9 when x"55", -- =
    addr_y & addr_2 when x"58", -- CAPS
    addr_y & addr_3 when x"59", -- R SHFT
    addr_y & addr_c when x"5A", -- ENTER
    addr_x & addr_9 when x"5B", -- ]
    addr_y & addr_b when x"5D", -- \
    addr_u & addr_c when x"66", -- BKSP
--    addr_ & addr_ when x"69", -- KP 1
--    addr_ & addr_ when x"6B", -- KP 4
--    addr_ & addr_ when x"6C", -- KP 7
--    addr_ & addr_ when x"70", -- KP 0
--    addr_ & addr_ when x"71", -- KP .
--    addr_ & addr_ when x"72", -- KP 2
--    addr_ & addr_ when x"73", -- KP 5
--    addr_ & addr_ when x"74", -- KP 6
--    addr_ & addr_ when x"75", -- KP 8
    addr_u & addr_4 when x"76", -- ESC
--    addr_ & addr_ when x"77", -- NUM
--    addr_ & addr_ when x"78", -- F11
--    addr_ & addr_ when x"79", -- KP +
--    addr_ & addr_ when x"7A", -- KP 3
--    addr_ & addr_ when x"7B", -- KP -
--    addr_ & addr_ when x"7C", -- KP *
--    addr_ & addr_ when x"7D", -- KP 9
--    addr_ & addr_ when x"7E", --    SCROLL
--    addr_t & addr_1 when x"83", -- F7 (problem, har bit 7)
	 addr_i & addr_j when others;

end Behavioral;

