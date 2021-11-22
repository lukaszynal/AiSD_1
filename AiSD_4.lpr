{Program:  AiSD_4 v.01, 13.05.2021
Autor: Szynal Lukasz, 150063, 2020/2021, Informatyka, D2, I semestr}

unit aisd_cwiczenie4_unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm_Sort }

  TForm_Sort = class(TForm)
    Button_Losuj: TButton;
    Button_Koniec: TButton;
    Button_Kopiuj: TButton;
    Button_Kopiuj_Odwrotnie: TButton;
    Button_Sort_Babelkowe: TButton;
    Button_SortProste: TButton;
    Button_Straznik: TButton;
    Button_ProsteWybieranie: TButton;
    Button_Szybkie: TButton;
    Button_Info: TButton;
    Edit_LiczbaZamian: TEdit;
    Edit_LiczbaPorownan: TEdit;
    Label_LiczbaPorownan: TLabel;
    Label_LiczbaZamian: TLabel;
    Label_DanePosortowane: TLabel;
    Label_DaneZrodlowe: TLabel;
    ListBox_DaneZrodlowe: TListBox;
    ListBox_DanePosortowane: TListBox;
    procedure Button_SzybkieClick(Sender: TObject);
    procedure Button_LosujClick(Sender: TObject);
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);
    procedure Button_KopiujClick(Sender: TObject);
    procedure Button_Kopiuj_OdwrotnieClick(Sender: TObject);
    procedure Button_ProsteWybieranieClick(Sender: TObject);
    procedure Button_SortProsteClick(Sender: TObject);
    procedure Button_Sort_BabelkoweClick(Sender: TObject);
    procedure Button_StraznikClick(Sender: TObject);

    procedure Wyswietl_Zrodlo;
    procedure Wyswietl_Posortowane;
    procedure Wyswietl_LiczbaZamian;
    procedure Wyswietl_LiczbaPorownan;
    procedure Losuj;
    procedure KopiujDoSort;
    procedure Kopiuj;
    procedure KopiujOdwrotnie;
    procedure Sortuj_Babelkowo;
    procedure Zamien(var Liczba1, Liczba2 : integer);
    procedure Sortuj_ProsteWstawianie;
    procedure Sortuj_Straznik;
    procedure Sortuj_ProsteWybieranie;
    procedure Quicksort(lewy, prawy : integer);
    procedure Sortuj_Szybkie;

  private

  const cRozmiarTablicy = 20;
  var   TabSort : array [0..cRozmiarTablicy] of integer;
        TabLiczb : array [0..cRozmiarTablicy] of integer;
        Zamiana :integer;
        Porownania :integer;

  public

  end;

var
  Form_Sort: TForm_Sort;

implementation

{$R *.lfm}

{ TForm_Sort }

procedure TForm_Sort.Button_KoniecClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm_Sort.Button_KopiujClick(Sender: TObject);
begin
  Kopiuj;
end;

procedure TForm_Sort.Button_Kopiuj_OdwrotnieClick(Sender: TObject);
begin
  KopiujOdwrotnie;
end;

procedure TForm_Sort.Button_ProsteWybieranieClick(Sender: TObject);
begin
  Sortuj_ProsteWybieranie;
end;

procedure TForm_Sort.Button_SortProsteClick(Sender: TObject);
begin
  Sortuj_ProsteWstawianie;
end;

procedure TForm_Sort.Button_Sort_BabelkoweClick(Sender: TObject);
begin
  Sortuj_Babelkowo;
end;

procedure TForm_Sort.Button_StraznikClick(Sender: TObject);
begin
  Sortuj_Straznik;
end;

procedure TForm_Sort.Button_InfoClick(Sender: TObject);
var komunikat : string;
begin
Komunikat:=' AiSD2_4, Autor: Szynal Łukasz, 150063' +#13+
           '2020/2021, Informatyka, D2, Semestr I';
Application.MessageBox(PChar(komunikat),'Informacja o programie',MB_OK);

end;

procedure TForm_Sort.Button_LosujClick(Sender: TObject);
begin
  Losuj;
end;

procedure TForm_Sort.Button_SzybkieClick(Sender: TObject);
begin
  Sortuj_Szybkie;
end;

procedure TForm_Sort.Wyswietl_Zrodlo; // Wyswietlanie wartosci tablicy w polu na dane zrodlowe
var i : integer;
begin
ListBox_DaneZrodlowe.Clear;
for i:=1 to cRozmiarTablicy do
 ListBox_DaneZrodlowe.Items.Add( IntToStr(i)+': '+IntToStr(TabLiczb[i]));
end;

procedure TForm_Sort.Wyswietl_Posortowane; // Wyswietlanie posortowanych wartosci tablicy w polu na dane posortowane
var i : integer;
begin
ListBox_DanePosortowane.Clear;
for i:=1 to cRozmiarTablicy do
 ListBox_DanePosortowane.Items.Add( IntToStr(i)+': '+IntToStr(TabSort[i]));
end;

procedure TForm_Sort.Wyswietl_LiczbaZamian; // Wyswietlanie liczby zamian
begin
Edit_LiczbaZamian.Clear;
Edit_LiczbaZamian.Text:=(IntToStr(Zamiana));
end;

procedure TForm_Sort.Wyswietl_LiczbaPorownan; // Wyswietlanie liczby zamian
begin
Edit_LiczbaPorownan.Clear;
Edit_LiczbaPorownan.Text:=(IntToStr(Porownania));
end;

procedure TForm_Sort.Losuj; // Losowanie i wyswietlanie liczb z przedzialu <0,1000)
var i : integer;
begin
for i:=1 to cRozmiarTablicy do TabLiczb[i]:=Random(1000);
Wyswietl_Zrodlo;
end;

procedure TForm_Sort.KopiujDoSort; // Kopiowanie wartosci z pola danych zrodlowych do danych posortowanych
var i :integer;
begin
for i:=1 to cRozmiarTablicy do TabSort[i]:=TabLiczb[i];
end;

procedure TForm_Sort.Kopiuj; // Kopiowanie wartosci z pola danych posortowanych do danych zrodlowych
var i :integer;
begin
for i:=1 to cRozmiarTablicy do TabLiczb[i]:=TabSort[i];
Wyswietl_Zrodlo;
end;

procedure TForm_Sort.KopiujOdwrotnie; // Kopiowanie wartosci z pola danych posortowanych do danych zrodlowych w odwrotnej kolejnosci
var i, l :integer;
begin
l:=cRozmiarTablicy;
for i:=1 to cRozmiarTablicy do
 begin
    TabLiczb[i]:=TabSort[l];
    l:=l-1
 end;
Wyswietl_Zrodlo;
end;

procedure TForm_Sort.Sortuj_Babelkowo; // Sortowanie babelkowe
var i,j : integer;
begin
Zamiana :=0;
Porownania :=0;
KopiujDoSort;
for i:=1 to cRozmiarTablicy-1 do
 begin
 for j:=cRozmiarTablicy downto i+1 do
   begin
     Porownania:=Porownania+1;
     if TabSort[j-1]>TabSort[j] then
       begin
         Zamien( TabSort[j-1],TabSort[j] );
         Zamiana := Zamiana+1;
       end;
    end;
 end;
Wyswietl_Posortowane;
Wyswietl_LiczbaZamian;
Wyswietl_LiczbaPorownan;
end;

procedure TForm_Sort.Sortuj_ProsteWstawianie; // Sortowanie przez proste wstawianie
var i,j : integer;
 CzyKoniec : boolean;
begin
Zamiana :=0;
Porownania :=0;
KopiujDoSort;
for i:=1 to cRozmiarTablicy-1 do
 begin
 CzyKoniec:=FALSE;
 j:=i+1;
 repeat
 Porownania:=Porownania+1;
 if TabSort[j]<TabSort[j-1] then
 begin
 Zamien( TabSort[j],TabSort[j-1] );
 Zamiana := Zamiana+1;
 j:=j-1
 end
 else CzyKoniec:=True;
 until ( j=1 ) or CzyKoniec;
 end;
Wyswietl_Posortowane;
Wyswietl_LiczbaZamian;
Wyswietl_LiczbaPorownan;
end;

procedure TForm_Sort.Zamien( var Liczba1, Liczba2 : integer ); // Procedura zamieniajaca wartosci miejscami
var Pom : integer;
begin
Pom:=Liczba1;
Liczba1:=Liczba2;
Liczba2:=Pom
end;

procedure TForm_Sort.Sortuj_Straznik; // Sortowanie przez proste wstawianie ze straznikiem
var i,j,Nowy : integer;
begin
Zamiana :=0;
Porownania :=0;
KopiujDoSort;
for i:=2 to cRozmiarTablicy do
 begin
 Nowy:=TabSort[i];
 TabSort[0]:=Nowy;
 j:=i-1;
 while Nowy<TabSort[j] do
 begin
 TabSort[j+1]:=TabSort[j];
 Porownania:=Porownania+1;
 Zamiana := Zamiana+1;
 j:=j-1
 end;
 TabSort[j+1]:=Nowy;
 end;
Wyswietl_Posortowane;
Wyswietl_LiczbaZamian;
Wyswietl_LiczbaPorownan;
end;

procedure TForm_Sort.Sortuj_ProsteWybieranie; // Sortowanie przez proste wybieranie
var i,j,Imin : integer;
begin
Zamiana :=0;
Porownania :=0;
KopiujDoSort;
for i:=1 to cRozmiarTablicy-1 do
 begin
 Imin:=i;
 for j:=i to cRozmiarTablicy do
  begin
  Porownania:=Porownania+1;
  if TabSort[Imin]>TabSort[j] then Imin:=j;
  end;
 Zamien( TabSort[i],TabSort[Imin] );
 Zamiana := Zamiana+1;
 end;
Wyswietl_Posortowane;
Wyswietl_LiczbaZamian;
Wyswietl_LiczbaPorownan;
end;

procedure TForm_Sort.Quicksort(lewy, prawy  : integer); // Algorytm szybkiego sortowania
var
  i,j,os,x : integer;
begin
  i := (lewy + prawy) div 2;
  os := TabSort[i]; TabSort[i] := TabSort[prawy];
  j := lewy;
  for i := lewy to (prawy-1) do
   begin
    Porownania:=Porownania+1;
    if TabSort[i] < os then
       begin
       Porownania:=Porownania+1;
         Zamiana := Zamiana+1;
         x := TabSort[i]; TabSort[i] := TabSort[j]; TabSort[j] := x;
         j:=j+1;
       end;
   end;
 TabSort[prawy] := TabSort[j]; TabSort[j] := os;
  if lewy < (j-1)  then Quicksort(lewy, j - 1);
  if (j+1) < prawy then Quicksort(j + 1, prawy);
  Wyswietl_Posortowane;
end;

procedure TForm_Sort.Sortuj_Szybkie; // Sortowanie szybkie
var
  lewy, prawy : integer;
begin
Zamiana :=0;
Porownania :=0;
KopiujDoSort;
lewy := 1;
prawy := cRozmiarTablicy;
Quicksort(lewy, prawy);
Wyswietl_Posortowane;
Wyswietl_LiczbaZamian;
Wyswietl_LiczbaPorownan;
end;
end.
