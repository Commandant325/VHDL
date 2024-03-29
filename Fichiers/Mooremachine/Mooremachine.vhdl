library ieee;
use ieee.std_logic_1164.all;

entity Mooremachine is

	port (

		clk : in std_logic;
		clr : in std_logic;
		a : in std_logic;
		b : in std_logic;

		y1 : out std_logic;
		y2 : out std_logic

	);

end Mooremachine;

architecture Behavioral of Mooremachine is

	type state_type is (s1, s2, s3, s4);

	signal current_s, next_s : state_type;

begin

	process (clk)
	begin

		if (clr = '1') then

			current_s <= s1;

		elsif (rising_edge(clk)) then

			current_s <= next_s;

		end if;

	end process;

	process (current_s, a, b)
	begin

		case current_s is

			when s1 =>

				y1 <= '0';
				y2 <= '0';

				if a = '0' and b = '0' then

				next_s <= s1;

				elsif a = '0' and b = '1' then

				next_s <= s4;

				elsif a = '1' and b = '1' then

				next_s <= s4;

				elsif a = '1' and b = '0' then

				next_s <= s2;

				end if;

			when s2 =>

				y1 <= '0';
				y2 <= '0';

				if a = '1' and b = '0' then

					next_s <= s2;

				elsif a = '0' and b = '1' then

					next_s <= s4;

				elsif a = '0' and b = '0' then

					next_s <= s4;

				elsif a = '1' and b = '1' then

					next_s <= s3;

				end if;

			when s3 =>

				y1 <= '1';
				y2 <= '0';

				if a = '0' and b = '0' then

					next_s <= s3;

				elsif a = '0' and b = '1' then

					next_s <= s3;

				elsif a = '1' and b = '1' then

					next_s <= s3;

				elsif a = '1' and b = '0' then

					next_s <= s3;

				end if;

			when s4 =>

				y1 <= '0';
				y2 <= '1';

				if a = '0' and b = '0' then

					next_s <= s4;

				elsif a = '0' and b = '1' then

					next_s <= s4;

				elsif a = '1' and b = '1' then

					next_s <= s4;

				elsif a = '1' and b = '0' then

					next_s <= s4;

				end if;

		end case;

	end process;

end Behavioral;
