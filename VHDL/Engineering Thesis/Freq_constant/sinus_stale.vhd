library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

package sinelib is

--stale do wyliczania argumentu sinusa/stanu maszyny. Dokladnosc: od 2^2(=4), 11 bitow.
-- TODO: zwieksz dokladnosc wszystkich do (10 downto 0)!!!
constant half_pi: std_logic_vector (31 downto 0):="00110010010001110111111111111111";--pi/2
constant pi: std_logic_vector (31 downto 0):="01100100100011101111111111111110";-- bylo tyle i sie pojawialy bledy: "01100100100001101111111111111110";--3,1416
constant two_pi : std_logic_vector(31 downto 0) := "11001001000111011111111111111111";--pi*2

constant third_two_pi:std_logic_vector (8 downto 0):= pi(8 downto 0) + half_pi(8 downto 0); --zapis 3+6

--stale do obliczen wartosci sinusa
constant one_sixth: std_logic_vector (6 downto 0):= "0010110"; --=2^-3 + 2^-5 + 2^-6
constant one_120th: std_logic_vector (6 downto 0):= "0000001";-- = 2^-7, okolo
--normalizacja: pierwsze miejsce =0.5=2^-1



end sinelib;

