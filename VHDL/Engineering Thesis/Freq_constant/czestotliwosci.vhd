library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;

package freqlib is
--cdefgahc

subtype TuneQuant is std_logic_vector(31 downto 0);

--obliczenia
-- kwant generowanej czestotliwosci wynosi 22 mHz.
-- wyrazenie okreslonej czestotliwosci f: tune= f[Hz]/22 mHz, wynik podany w wersji binarnej.
-- przyklad: dzwiek A=440 Hz
-- 440 Hz/22 mHz=20000
--20000[dec]=100111000100000[bin]
--wobec tego 32-bitowa stala tune_A1 ma nastepujaca postac:
--contatna Tune_A1: TuneQuant:="00000000000000000100111000100000";
--inne stale sa, rzecz jasna, obliczone analogicznie.
--tak samo robimy dowolna inna czestotliwosc :) 

--100 Hz
constant Tune_C1: TuneQuant:="00000000001111111001000111000001";--"00000000000000000001000111000001";
--300 Hz
constant Tune_D1: TuneQuant:="00000000000000000011001011110011";
--500 Hz
constant Tune_E1: TuneQuant:="00000000000000000101100011000111";
--700 Hz
constant Tune_F1: TuneQuant:="00000000000000000111011011100010";
--G razkreœlne: f=392 Hz
constant Tune_G1: TuneQuant:="00000000000000000100010110011010";
--A razkreœlne: f=440 Hz
constant Tune_A1: TuneQuant:="00000000000000000100111000100000";
--H razkreœlne: f=493,9 Hz
constant Tune_H1: TuneQuant:="00000000000000000101011110110010";
--C dwukreœlne: f=523,3 Hz
constant Tune_C2: TuneQuant:="00000000000000000101110011101010";


end freqlib;

