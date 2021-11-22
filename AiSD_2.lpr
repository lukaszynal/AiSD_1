{Program: AiSD_2 v.01, 15.04.2021
Autor: Szynal Lukasz, 150063, 2020/2021, Informatyka, D2, I semestr}

program Program_prosty;
uses CRT, math, sysUtils;

{Funkcje oraz procedury do obliczania silni dwiema metodami}

function Czytaj_Liczbe : int64;
var liczba : int64;
begin
readln(liczba);
     if (liczba<0) or (liczba>20) then
        begin
            repeat
            write('Podaj liczbe z zakresu: <0, 20>: '); readln(liczba); //zadanie podania liczby z podanego zakresu
            until (liczba>=0) and (liczba<=20);
        end;
Czytaj_Liczbe := liczba;
end;

function Czytaj_Powtorzenia : integer;
var powtorzenia : integer;
begin
readln(powtorzenia);
Czytaj_Powtorzenia := powtorzenia;
end;

function Silnia_Rekurencyjnie(liczba : int64) : int64; //funkcja liczaca silnie w sposob rekurencyjny
begin
     if (liczba > 1) then
        begin
        Silnia_Rekurencyjnie := (liczba * Silnia_Rekurencyjnie(liczba - 1));
        end
     else Silnia_Rekurencyjnie := 1;
end;

function Silnia_Rekurencyjnie_Petla(liczba : int64; powtorzenia : int64; var zegar : real) : int64; //funkcja liczaca silnie w sposob rekurencyjny w petli
var wynik : int64;
    i : integer;
    zegar_start, zegar_stop : real;
begin
zegar_start := (Time*24*60*60);
     for i :=1 to powtorzenia do
     begin
          wynik := Silnia_Rekurencyjnie(liczba);
     end;
zegar_stop := (Time*24*60*60);
zegar := zegar_stop - zegar_start;
Silnia_Rekurencyjnie_Petla := wynik;
end;

function Silnia_Iteracyjnie(liczba : int64) : int64; //funkcja liczaca silnie w sposob iteracyjny
var wynik : int64;
    i : integer;
begin
wynik :=1;
     if (liczba > 1) then
        for i := 1 to liczba do
        begin
          wynik := wynik * liczba;
          liczba := liczba - 1;
        end;
Silnia_Iteracyjnie := wynik;
end;

function Silnia_Iteracyjnie_Petla(liczba : int64; powtorzenia : integer; var zegar : real) : int64; //funkcja liczaca silnie w sposob iteracyjny w petli
var wynik : int64;
    i : integer;
    zegar_start, zegar_stop : real;
begin
zegar_start := (Time*24*60*60);
        for i := 1 to powtorzenia do wynik := Silnia_Iteracyjnie(liczba);
zegar_stop := (Time*24*60*60);
zegar := zegar_stop - zegar_start;
Silnia_Iteracyjnie_Petla := wynik;
end;

procedure Silnia;
var liczba : int64;
    powtorzenia : integer;
    zegar : real;
begin
zegar := 0.0;
writeln('Obliczanie silni:');
write( 'Podaj liczbe dla ktorej bedzie obliczana funkcja silnia: ' );
liczba := Czytaj_Liczbe;
write( 'Podaj liczbe powtorzen obliczania funkcji silnia: ' );
powtorzenia := Czytaj_Powtorzenia;
writeln('Silnia dla argumentu ', liczba, ' sposobem rekurencyjnym wynosi: ', Silnia_Rekurencyjnie_Petla(liczba, powtorzenia, zegar), ' (czas obliczen: ', zegar:0:3, 's / ', powtorzenia, ' powtorzen)');
writeln('Silnia dla argumentu ', liczba, ' sposobem iteracyjnym wynosi:   ', Silnia_Iteracyjnie_Petla(liczba, powtorzenia, zegar), ' (czas obliczen: ', zegar:0:3, 's / ', powtorzenia, ' powtorzen)');
end;

{Funkcje oraz procedury do wyznaczania sumy cyfr liczby calkowitej}

function Podaj_Liczbe : integer;
var liczba : integer;
begin
readln(liczba);
Podaj_Liczbe := liczba;
end;

function Sumowanie_Cyfr_Iteracyjnie(liczba : integer) : integer; //funkcja liczaca sume cyfr liczby metoda iteracyjna
var suma : integer;
begin
     suma := 0;
     while liczba <> 0 do
     begin
     suma := suma + (liczba mod 10);
     liczba := liczba div 10;
     end;
     Sumowanie_Cyfr_Iteracyjnie := suma;
end;

function Sumowanie_Cyfr_Rekurencyjnie(liczba : integer) : integer; //funkcja liczaca sume cyfr liczby metoda rekurencyjna
begin
     if liczba <> 0 then
     begin
     Sumowanie_Cyfr_Rekurencyjnie := (liczba mod 10) + Sumowanie_Cyfr_Rekurencyjnie(liczba div 10);
     end;
end;

procedure Suma_Cyfr;
var liczba : integer;
begin
writeln('Obliczanie sumy cyfr liczby calkowitej:');
write( 'Podaj dowolna liczbe calkowita: ' );
liczba := (Podaj_Liczbe);
writeln('Suma cyfr metoda iteracyjna dla liczby ', liczba, ' wynosi:   ', Sumowanie_Cyfr_Iteracyjnie(liczba));
writeln('Suma cyfr metoda rekurencyjna dla liczby ', liczba, ' wynosi: ', Sumowanie_Cyfr_Rekurencyjnie(liczba));
end;

{Blok glowny programu}

begin
  writeln('Program: Silnia, rekurencja i iteracje');
  writeln('Autor: Lukasz Szynal, 150063, 2020/2021, Informatyka, D2, I semestr');
  writeln('====================================================================');
  Silnia;
  writeln;
  Suma_Cyfr;
  readln
end.
