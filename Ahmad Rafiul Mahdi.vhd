library IEEE;
use IEEE.std_logic_1164.all;

entity gabungan is

port (
 a, b, c, d : in std_logic_vector(3 downto 0);
 sel :in std_logic_vector(3 downto 0);
 O : out std_logic_vector(3 downto 0);
 bcd : in std_logic_vector (3 downto 0);
 sevenseg : out std_logic_vector (6 downto 0));
end gabungan;


architecture mux4 of gabungan is

begin
 O <= a when (sel = "0011") else
  b when (sel = "0010") else
  c when (sel = "0001") else
  d when (sel = "0000") else "0000";
  
end mux4;


architecture bcdsevenseg of gabungan is
begin

process(bcd)
begin


 case bcd is

 when "0000" => sevenseg <= "0000001"; 
 when "0001" => sevenseg <= "1001111"; 
 when "0010" => sevenseg <= "0010010";
 when "0011" => sevenseg <= "0000110";
 when others => sevenseg <= "1111111"; 
 end case;
 
 
end process;
end bcdsevenseg;
