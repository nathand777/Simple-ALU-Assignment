library IEEE;
use IEEE.std_logic_1164.all;  -- call the use of IEEE logic element library packages
use IEEE.numeric_std.all;		-- call the use of IEEE numeric type library packages

entity alu is
port (A,B: in std_logic_vector(15 downto 0);--data in
	opControl: in std_logic_vector(2 downto 0);--control for operation
	displayControl: in std_logic_vector(1 downto 0);--control for display
	display0, display1, display2, display3: out std_logic_vector(3 downto 0)); --outputs for each display
end entity alu;

architecture arch1 of alu is
signal R: std_logic_vector(15 downto 0);
begin
	process (opControl)
	begin
		case opControl is
			--bitwise or
			when o"0" => 
				for i in 15 downto 0 loop
					R(i) <= A(i) or B(i);
				end loop;
				
			--bitwise and
			when o"1" =>
				for i in 15 downto 0 loop
					R(i) <= A(i) and B(i);
				end loop;
				
			--bitwise xor
			when o"2" =>
				for i in 15 downto 0 loop
					R(i) <= A(i) xor B(i);
				end loop;
				
			--addition
			when o"3" =>
				R <= std_logic_vector(unsigned(A) + unsigned(B));
				
			--subtraction
			when o"4" =>
				R <= std_logic_vector(unsigned(A) - unsigned(B)); 
				
			--compliment A
			when o"5" =>
				R <= not A;
				
			--logical shift left
			when o"6" =>
			if B <= x"07" then R <= std_logic_vector(unsigned(A) sll to_integer(unsigned(B)));
			end if;
				
			--logical shift right
			when o"7" =>
			if B <= x"07" then R <= std_logic_vector(unsigned(A) srl to_integer(unsigned(B)));
			end if;
				
			when others => null;
		end case;		
	end process;
	
	process (displayControl)
	begin
		case displayControl is 
			when "00" => 
				display3 <= R(15 downto 12);
				display2 <= R(11 downto 8);
				display1 <= R(7 downto 4);
				display0 <= R(3 downto 0);
			when "01" => 
				display3 <= A(15 downto 12);
				display2 <= A(11 downto 8);
				display1 <= A(7 downto 4);
				display0 <= A(3 downto 0);
			when "10" => 
				display3 <= B(15 downto 12);
				display2 <= B(11 downto 8);
				display1 <= B(7 downto 4);
				display0 <= B(3 downto 0);
			when others => null;
		end case;
	end process;
	
end architecture arch1;