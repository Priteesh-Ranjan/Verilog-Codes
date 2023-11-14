----------------------------------------------------------------------------------
-- Institute: NIT Rourkela 
-- Create Date: 18.01.2023 19:34:48
-- Design Name: Priteesh Ranjan
-- Module Name: Mux
-- Project Name: 4x1 Mux 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity not_gate is
--  Port ( );
PORT(  
      A : IN std_logic;  
      Y : OUT std_logic  
     ); 
end not_gate;

architecture Behavioral of not_gate is
begin
Y <= not(A);
end Behavioral;
