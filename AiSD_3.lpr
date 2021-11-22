{Program: AiSD_3 v.01, 03.05.2021
Autor: Szynal Lukasz, 150063, 2020/2021, Informatyka, D2, I semestr}

program AiSD_cwiczenie3;
uses CRT, math, sysUtils;

procedure poczatek;
begin
  writeln('Program: Obliczenia na liczbach rzeczywistych,');
  writeln('         algorytm polowienia przedzialu, tablice i rekordy');
  writeln('Autor: Lukasz Szynal, 150063, 2020/2021, Informatyka, D2, I semestr');
  writeln('====================================================================');
  writeln;
end;

{Funkcje oraz procedury do sumowania liczb rzeczywistych}

// Sumowanie liczb typu single
function sumowanieLiczb(n :integer; s :single) :single;                         //funkcja obliczajaca sume liczb rzeczywistych typu single
var suma :single;
    i :integer;
begin
suma:=0.0;
for i:=1 to n do suma:=suma+s;
sumowanieLiczb:=suma;
end;

function sumowanieParami(n :integer; s :single) :single;                        //funkcja obliczajaca sume liczb rzeczywistych parami typu single
var suma, suma1, suma2 :single;
    i :integer;
begin
suma:=0.0; suma1:=0.0; suma2:=0.0;
for i:=1 to n do
    begin
         if (i mod 2) = 0 then suma1:=suma1+s
         else suma2:=suma2+s;
    end;
suma:=suma1+suma2;
sumowanieParami:=suma;
end;

function sumowaniePoprawka(n :integer; s :single) :single;                      //funkcja obliczajaca sume liczb rzeczywistych z poprawka typu single
var suma, sumai, poprawka :single;
    i :integer;
begin
suma:=0.0; poprawka:=0.0;
for i:=1 to n do
begin
     sumai:=suma+s;
     poprawka:=suma-sumai+s+poprawka;
     suma:=sumai
end;
sumowaniePoprawka:=suma+poprawka;
end;

function iloczynLiczb(n :single; s :single) :single;                            //funkcja obliczajaca iloczyn liczb rzeczywistych typu single
var iloczyn :single;
begin
iloczyn:=s*n;
iloczynLiczb:=iloczyn;
end;

procedure dodawanieLiczbSingle;
const n = 1000000;                                                              // liczba sumowan
      s = 0.314159265;                                                          // liczba sumowana
var suma :single;
    sumaPar :single;
    sumaPoprawka :single;
    iloczyn :single;
begin
suma:=sumowanieLiczb(n,s);
sumaPar:=sumowanieParami(n,s);
sumaPoprawka:=sumowaniePoprawka(n,s);
iloczyn:=iloczynLiczb(n,s);
writeln('ZMIENNA TYPU SINGLE');
write('Sumowanie liczb rzeczywistych:'); writeln(suma:23:10);
write('Iloczyn liczb rzeczywistych:'); writeln(iloczyn:25:10);
write('Roznica iloczynu i sumy:'); writeln((iloczyn-suma):29:10);
writeln;
write('Sumowanie parami:'); writeln(sumaPar:36:10);
write('Iloczyn liczb rzeczywistych:'); writeln(iloczyn:25:10);
write('Roznica iloczynu i sumy parami:'); writeln((iloczyn-sumaPar):22:10);
writeln;
write('Sumowanie z poprawka:'); writeln(sumaPoprawka:32:10);
write('Iloczyn liczb rzeczywistych:'); writeln(iloczyn:25:10);
write('Roznica iloczynu i sumy z poprawka:'); writeln((iloczyn-sumaPoprawka):18:10);
readln;
end;

// Sumowanie liczb typu real
function sumowanieLiczb2(n :integer; s :real) :real;                            //funkcja obliczajaca sume liczb rzeczywistych typu real
var suma :real;
    i :integer;
begin
suma:=0.0;
for i:=1 to n do suma:=suma+s;
sumowanieLiczb2:=suma;
end;

function sumowanieParami2(n :integer; s :real) :real;                           //funkcja obliczajaca sume liczb rzeczywistych parami typu real
var suma, suma1, suma2 :real;
    i :integer;
begin
suma:=0.0; suma1:=0.0; suma2:=0.0;
for i:=1 to n do
    begin
         if (i mod 2) = 0 then suma1:=suma1+s
         else suma2:=suma2+s;
    end;
suma:=suma1+suma2;
sumowanieParami2:=suma;
end;

function sumowaniePoprawka2(n :integer; s :real) :real;                         //funkcja obliczajaca sume liczb rzeczywistych z poprawka typu real
var suma, sumai, poprawka : real;
    i :integer;
begin
suma:=0.0; poprawka:=0.0;
for i:=1 to n do
    begin
         sumai:=suma+s;
         poprawka:=suma-sumai+s+poprawka;
         suma:=sumai
    end;
sumowaniePoprawka2:=suma+poprawka;
end;

function iloczynLiczb2(n :real; s :real) :real;                                 //funkcja obliczajaca iloczyn liczb rzeczywistych typu real
var iloczyn :real;
begin
iloczyn:=s*n;
iloczynLiczb2:=iloczyn;
end;

procedure dodawanieLiczbReal;
const n = 1000000;                                                              // liczba sumowan
      s = 0.314159265;                                                          // liczba sumowana
var suma :real;
    sumaPar :real;
    sumaPoprawka :real;
    iloczyn :real;
begin
suma:=sumowanieLiczb2(n,s);
sumaPar:=sumowanieParami2(n,s);
sumaPoprawka:=sumowaniePoprawka2(n,s);
iloczyn:=iloczynLiczb2(n,s);
writeln('ZMIENNA TYPU REAL');
write('Sumowanie liczb rzeczywistych:'); writeln(suma:23:10);
write('Iloczyn liczb rzeczywistych:'); writeln(iloczyn:25:10);
write('Roznica iloczynu i sumy:'); writeln((iloczyn-suma):29:10);
writeln;
write('Sumowanie parami:'); writeln(sumaPar:36:10);
write('Iloczyn liczb rzeczywistych:'); writeln(iloczyn:25:10);
write('Roznica iloczynu i sumy parami:'); writeln((iloczyn-sumaPar):22:10);
writeln;
write('Sumowanie z poprawka:'); writeln(sumaPoprawka:32:10);
write('Iloczyn liczb rzeczywistych:'); writeln(iloczyn:25:10);
write('Roznica iloczynu i sumy z poprawka:'); writeln((iloczyn-sumaPoprawka):18:10);
readln;
end;

procedure dodawanieLiczb;
begin
writeln('|| DODAWANIE LICZB RZECZYWISTYCH ||');
dodawanieLiczbSingle;
dodawanieLiczbReal;
writeln('Dlugosc zmiennej single: ', SizeOf(single), ' bajty');
writeln('Dlugosc zmiennej real: ', SizeOf(real), ' bajow');
readln;
end;

{Funkcje oraz procedury do obliczania miejsca zerowego funkcji metoda polowienia przedzialu}

function funkcja(x : double) : double;                                          //wzor funkcji
begin
  funkcja :=(x*x*x)-(x*x)-x+2;
end;

procedure czytajDane(var a, b, d :double);
begin
write('Podaj poczatek odcinka: '); readln(a);
write('Podaj koniec odcinka: '); readln(b);
while ((funkcja(a)<0) and (funkcja(b)<0)) or ((funkcja(a)>0) and (funkcja(b)>0)) do  // warunek wartosci krancowych
   begin
        writeln('Ta funkcja nie ma miejsca zerowego. Podaj inne dane!');
        write('Podaj poczatek odcinka: '); readln(a);
        write('Podaj koniec odcinka: '); readln(b);
   end;
write('Podaj dokladnosc wyniku: '); readln(d);
end;

function miejsceZerowe(a,b,d :double; var i :integer) :double;                  //funkcja liczaca miejsce zerowe
var x :double;
begin
x:=(a+b)/2;
while abs(funkcja(x))>=d do
      begin
        if funkcja(a)*funkcja(x)<0 then b:=x
        else a:=x;
      x:=(a+b)/2;
      i:=i+1;
      end;
miejsceZerowe:=x;
end;

function cyfryPoPrzecinku (liczba :double):integer;                             // funkcja liczaca ilosc cyfr po przecinku
var licznik :integer;                                                           // ma wady ale pomaga w formatowaniu liczby oznaczajacej dokladnosc
begin
licznik :=0;
If liczba<1 then
   repeat
   liczba := liczba*10;
   licznik :=licznik +1;
   until liczba>=1
else cyfryPoPrzecinku:=0;
cyfryPoPrzecinku:=licznik;
end;

procedure polowienie;
var a, b, d, wynik :double;
    i, dec :integer;
begin
a:=0; b:=0; d:=0; i:=0;
writeln('|| MIEJSCE ZEROWE FUNKCJI METODA POLOWIENIA PRZEDZIALU ||');
writeln;
czytajDane(a,b,d);
wynik:=miejsceZerowe(a,b,d,i);
dec :=cyfryPoPrzecinku(d);
writeln('Miejsce zerowe wynosi: ',Format('%g',[wynik]),' z dokladnoscia ',d:0:dec);
writeln('Liczba iteracji: ', i);
readln;
end;

{Typy, zmienne, funkcje oraz procedury do obliczen statystycznych}
// zmienne globalne
type tPlec = (Kobiety, Mezczyzni);
     TCovid = record
            zakazeniaKobiety :integer;
            zgonyKobiety :integer;
            zakazeniaMezczyzni :integer;
            zgonyMezczyzni :integer;
     end;
     tDaneCovid = array[1..31,tPlec] of TCovid;
     tSumaZgonow = array[1..31] of integer;

procedure wypelnianieTablicy(var tablica :tDaneCovid);                          // wypelnianie tablicy liczbami losowymi
var
    i :integer;
begin
Randomize;                                                                      // zwolnienie blokady maszyny losujacej :)
for i:=1 to 31 do
    begin
        tablica[i,Kobiety].zakazeniaKobiety:=1000+Random(9001);                 // przedzial <1000,10000>
        tablica[i,Kobiety].zgonyKobiety:=20+Random(181);                        // przedzial <20,200>
        tablica[i,Mezczyzni].zakazeniaMezczyzni:=1000+Random(9001);
        tablica[i,Mezczyzni].zgonyMezczyzni:=20+Random(181);
    end;
end;

procedure wyswietalnieTablicy(tablica :tDaneCovid);
var
    i :integer;
begin
for i:=1 to 31 do
    begin
    writeln(i:4,tablica[i,Kobiety].zakazeniaKobiety:11,tablica[i,Mezczyzni].zakazeniaMezczyzni:14,tablica[i,Kobiety].zgonyKobiety:11,tablica[i,Mezczyzni].zgonyMezczyzni:8);
    if (i mod 10)= 0 then readln;                                               // listowanie danych co 10 dni
    end;
end;

procedure sumaZachorowan(var tablica :tDaneCovid; var sumaKobiety :integer; var sumaMezczyzni :integer; var sumaOgolem :integer); // suma zachorowan kobiet i mezczyzn
var i :integer;
begin
for i:=1 to 31 do
    begin
    sumaKobiety:=sumaKobiety+tablica[i,Kobiety].zakazeniaKobiety;
    sumaMezczyzni:=sumaMezczyzni+tablica[i,Mezczyzni].zakazeniaMezczyzni;
    end;
sumaOgolem:=sumaKobiety+sumaMezczyzni;
end;

function sredniaZachorowan(sumaOgolem :integer) :single;
begin
sredniaZachorowan:=sumaOgolem/31;
end;

procedure sumaZgonow(tablica :tDaneCovid; var zgony :tSumaZgonow);              // suma zgonow zapisywana do tablicy tSumaZgonow
var i :integer;
begin
for i:=1 to 31 do
    begin
    zgony[i]:=tablica[i,Kobiety].zgonyKobiety + tablica[i,Mezczyzni].zgonyMezczyzni;
    end;
end;

function maxDzienZgonow(zgony :tSumaZgonow) :integer;                           // szukanie dnia z najwieksza iloscia zgonow i zwrocenie jej jako wartosc funkcji
var i, dzien, maxZ :integer;
begin
maxZ:=zgony[1]; dzien:=1;
for i:=1 to 31 do
    begin
    if zgony[i] > maxZ then
       begin
       dzien:=i;
       maxZ:=zgony[i];
       end;
    end;
maxDzienZgonow:=dzien;
end;

procedure maxZgonow(tablica :tDaneCovid; var zgony :tSumaZgonow; var dzien :integer); // procedura wyznaczajaca dzien z najwieksza iloscia zgonow
begin
sumaZgonow(tablica,zgony);
dzien:=maxDzienZgonow(zgony);
end;

procedure statystyka;
var sumaKobiety, sumaMezczyzni, sumaOgolem :integer;
    dzien :integer;
    tablica :tDaneCovid;
    zgony :tSumaZgonow;
begin
sumaKobiety:=0; sumaMezczyzni:=0; sumaOgolem:=0;
dzien:=1;
writeln('|| OBLICZENIA STATYSTYCZNE ||');
writeln;
wypelnianieTablicy(tablica);                                                    // uzupelnianie tablicy liczbami losowymi
writeln('Dzien  Zachorowania  Zachorowania  Zgony   Zgony');
writeln('       Kobiet        Mezczyzn      Kobiet  Mezczyzn');
wyswietalnieTablicy(tablica);                                                   // wyswietlanie tablicy
sumaZachorowan(tablica, sumaKobiety, sumaMezczyzni, sumaOgolem);                // obliczanie wartosci sumy zachorowan
writeln;
writeln('Suma zachorowan: Kobiety: ',sumaKobiety,', Mezczyzni: ',sumaMezczyzni,', Ogolem: ', sumaOgolem);
writeln('Srednia liczba zachorowan dziennie: ', sredniaZachorowan(sumaOgolem):0:2);
maxZgonow(tablica, zgony, dzien);                                               // znajdowanie dnia z najwieksza iloscia zgonow
writeln('Dzien najwiekszej liczby zgonow: ', dzien,' wynosi: ',zgony[dzien]);
end;

{Blok glowny programu}

begin
  poczatek;
  dodawanieLiczb;
  polowienie;
  statystyka;
  readln;
end.
