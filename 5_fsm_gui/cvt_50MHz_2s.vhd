library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY cvt_50MHz_2s IS
	PORT (
		CLK : in  STD_LOGIC;
		RST : in  STD_LOGIC;
		O   : out STD_LOGIC
	);
END cvt_50MHz_2s;

ARCHITECTURE Behavioral OF cvt_50MHz_2s IS
	CONSTANT MAX_VAL : INTEGER := 099999999;	-- output clock is 5s when input clock is 50 MHz
	SIGNAL   COUNTER : INTEGER RANGE 0 TO MAX_VAL;
BEGIN

	PROCESS(RST, CLK)
	BEGIN
		IF RST = '1' THEN
			O       <= '0';
			COUNTER <= 0;
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF COUNTER = MAX_VAL THEN
				COUNTER <=  0;
				O       <= '1';
			ELSE
				COUNTER <= COUNTER + 1;
				O       <= '0';
			END IF;
		END IF;
	END PROCESS;

END Behavioral;