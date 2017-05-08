library IEEE;
use IEEE.std_logic_1164.all;  -- call the use of IEEE logic element library packages
use IEEE.numeric_std.all;		-- call the use of IEEE numeric type library packages

entity dataRegister is
port (D: in std_logic_vector(15 downto 0);
	clk, en: in std_logic;
	Q: out std_logic_vector(15 downto 0));
end entity dataRegister;

architecture arch1 of dataRegister is
begin
	process(clk, en)
	begin 
		if clk'event and clk = '1' and en = '0' then
			Q <= D;
		end if;
	end process;
end architecture arch1;