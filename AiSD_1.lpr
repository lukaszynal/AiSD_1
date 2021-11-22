{Program: AiSD_1 v.01, 30.03.2021
Autor: Szynal Lukasz, 150063, 2020/2021, Informatyka, D2, I semestr}

program Program_prosty;
uses CRT, math, sysUtils;
var rok, liczba : integer;
    calka : double;

{Funkcje oraz procedury do wyznaczania roku przestepnego}

function Czytaj_Rok : integer;
begin
write( 'Podaj rok: ' );
readln(rok);
Czytaj_Rok := rok;
end;

function Tak_Czy_Nie(warunek : integer) : boolean; // funkcja liczaca czy rok jest przestepny
begin
if ((warunek mod 400) = 0) or ((warunek mod 100) <> 0) and ((warunek mod 4) = 0)
          then
          Tak_Czy_Nie := True
else Tak_Czy_Nie := False
end;

procedure Wynik_Rok_Przestepny(r : integer; w : boolean); // procedura wyswietlajaca czy rok jest przestepny
begin
     if w = True
        then
        writeln('Rok ', r,' jest przestepny!')
        else
        writeln('Rok ', r,' nie jest przestepny!')
end;

procedure Rok_Przestepny;
var zapis : boolean;
begin
writeln('Wyznaczanie roku przestepnego:');
zapis := (Tak_Czy_Nie(Czytaj_Rok));
Wynik_Rok_Przestepny(rok, zapis);
end;

{Funkcje oraz procedury do wyznaczania sumy cyfr liczby calkowitej}

function Czytaj_Liczbe : integer;
begin
write( 'Podaj dowolna liczbe calkowita: ' );
readln(liczba);
Czytaj_Liczbe := liczba;
end;

function Sumowanie_Cyfr(liczba_calkowita : integer) : integer; //funkcja liczaca sume cyfr liczby
var suma : integer;
begin
     suma := 0;
     while liczba_calkowita <> 0 do
     begin
     suma := suma + (liczba_calkowita mod 10);
     liczba_calkowita := liczba_calkowita div 10;
     end;
     Sumowanie_Cyfr := suma;
end;

procedure Wynik_Sumowanie_Cyfr(liczba_1 : integer; suma_1 : integer); //procedura wyswietlajaca sume cyfr liczby
begin
     writeln('Suma liczby ',liczba_1,' wynosi: ',suma_1);
end;

procedure Suma_Cyfr;
var zapis : integer;
begin
writeln('Obliczanie sumy cyfr liczby calkowitej:');
zapis := (Sumowanie_Cyfr(Czytaj_Liczbe));
Wynik_Sumowanie_Cyfr(liczba, zapis);
end;

{Funkcje oraz procedury do obliczenia calki oznaczonej metoda trapezow dla funkcji sinus}

procedure Czytaj_Dane (var a, b : double; var n : integer);
begin
write( 'Podaj liczbe podzialow n: ' ); readln(n);
write( 'Podaj poczatek odcinka: ' ); readln(a);
if (a<0) or (a>Pi) then
   begin
       repeat
       write('Podaj poczatek odcinka w zakresie (0, ',Pi:0:5,'): '); readln(a); //zadanie podania poczatku z podanego zakresu
       until (a>0) and (a<Pi);
   end;
write( 'Podaj koniec odcinka: ' ); read(b);
if (b<=a) or (b>Pi) then
   begin
       repeat
       write('Podaj koniec odcinka w zakresie (',(a+0.00001):0:5,', ',Pi:0:5,'): '); readln(b); //zadanie podania konca z podanego zakresu
       until (b>=a) and (b<Pi);
   end;
end;

function Funkcja(x : double) : double; //funkcja sinus
begin
  Funkcja := sin(x);
end;

function Wynik_Calka(var a, b : double; var n : integer) : double; //funkcja liczaca wartosci calki
var dx : double;
    i : integer;
begin
dx := (b - a) / n;
calka := 0;
for i := 1 to n - 1 do calka := calka + Funkcja(a + i * dx);
calka := (calka + (Funkcja(a) + Funkcja(b)) / 2)* dx;
Wynik_Calka := calka;
end;

procedure Calka_Oznaczona;
var a, b : double;
    n : integer;
begin
a := 0;
b := 0;
n := 0;
writeln('Obliczenie calki oznaczonej metoda trapezow:');
Czytaj_Dane(a,b,n);
Wynik_Calka(a,b,n);
writeln;
writeln('Obliczenie calki oznaczonej funkcji sinus:');
writeln('Liczba podzialow n:        ',n);
writeln('Przedzial <a,b>:           ',a:0:2,', ',b:0:2);
writeln('Przyblizona wartosc calki: ',calka:0:5);
readln
end;

{Blok glowny programu}

begin
  writeln('Program na wyznaczanie roku przestepnego,');
  writeln('obliczanie sumy cyfr i calki oznaczonej metoda trapezow');
  writeln('Autor: Lukasz Szynal, 150063, 2020/2021, Informatyka, D2, I semestr');
  writeln('====================================================================');
  Rok_Przestepny;
  writeln;
  Suma_Cyfr;
  writeln;
  Calka_Oznaczona;
  readln
end.
