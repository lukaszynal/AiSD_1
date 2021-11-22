{Program:  AiSD_4 v.01, 01.06.2021
Autor: Szynal Lukasz, 150063, 2020/2021, Informatyka, D2, I semestr}

unit AiSD_cwiczenie5_unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm_Listy }

  TForm_Listy = class(TForm)
    Button_Info: TButton;
    Button_Koniec: TButton;
    Button_Sortuj: TButton;
    Button_Losuj: TButton;
    Label_ListaNieposortowana: TLabel;
    Label_ListaPosortowana: TLabel;
    ListBox_ListaNieposortowana: TListBox;
    ListBox_ListaPosortowana: TListBox;

    procedure Button_LosujClick(Sender: TObject);
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);
    procedure Button_SortujClick(Sender: TObject);

  private
    const cRozmiarListy = 20;           // rozmiar listy
    type
        tWezel = ^tLista;               // typ wskaznikowy

        tLista = record                 // typ rekordowy
          Liczba : Integer;
          Nastepny : tWezel
        end;
    var
      Lista : tWezel;                   // zmienna globalna listy

  public
    procedure pLosuj;
    procedure pDodajWezel(var Wezel_Pierwszy : tWezel; liczba : integer);
    procedure pWyswietlNieposortowane(Wezel : tWezel);
    procedure pSortuj;
    function fSzukajWiekszy(Wezel_Pierwszy : tWezel; liczba_kontrolna : integer) : tWezel;
    procedure pDodajWezelWiekszy(var Wezel_Pierwszy : tWezel; Wezel_Wiekszy : tWezel);
    procedure pUsunWezel(var Wezel_Pierwszy : tWezel; Wezel_Wybrany : tWezel);
    procedure pUsunWezelKontrolny(var Wezel_Pierwszy : tWezel);
    procedure pWyswietlPosortowane(Wezel : tWezel);
    procedure pInfo;
  end;

var
  Form_Listy: TForm_Listy;

implementation

{$R *.lfm}

{ TForm_Listy }

procedure TForm_Listy.Button_InfoClick(Sender: TObject);
begin
  pInfo;
end;

procedure TForm_Listy.Button_LosujClick(Sender: TObject);
begin
  pLosuj;
end;

procedure TForm_Listy.Button_KoniecClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Listy.Button_SortujClick(Sender: TObject);
begin
  pSortuj;
end;

{Tworzenie listy skladajacej sie z 20 elementow i przypisanie im losowej liczby
z przedzialu <0,1000), a nastepnie wyswietlenie jej w ListBox}
procedure TForm_Listy.pLosuj;
var i, liczba : integer;
begin
  Randomize;
  Lista := nil;                    // Deklaracja pustej listy
  for i:=1 to cRozmiarListy do
    begin
      liczba:=Random(1000);
      pDodajWezel(Lista, liczba);  // Dodawanie kolejnych wezlow
    end;
  pWyswietlNieposortowane(Lista);
end;

{Dodanie kolejnego wezla na koniec listy}
procedure TForm_Listy.pDodajWezel (var Wezel_Pierwszy : tWezel; liczba : integer);
var
  Wezel_Nowy, Wezel : tWezel;
begin
  New (Wezel_Nowy);                         // Tworzymy nowy wezel
  Wezel_Nowy^.Nastepny := nil;
  Wezel_Nowy^.Liczba := liczba;
  Wezel := Wezel_Pierwszy;
  if Wezel = nil then Wezel_Pierwszy := Wezel_Nowy // Sprawdzamy czy lista nie jest pusta
  else
    begin
      while Wezel^.Nastepny <> nil do Wezel := Wezel^.Nastepny; //Przepisujemy wskazania nastepnego wezla
      Wezel^.Nastepny := Wezel_Nowy;
    end;
end;

{Wyswietlanie listy nieposortowanej poprzez trawersowanie}
procedure TForm_Listy.pWyswietlNieposortowane(Wezel : tWezel);
var i : integer;
begin
  i:=1;
  ListBox_ListaNieposortowana.Clear;
  while Wezel <> nil do
    begin
      ListBox_ListaNieposortowana.Items.Add(IntToStr(i)+': '+IntToStr(Wezel^.Liczba));
      i:=i+1;
      Wezel := Wezel^.Nastepny;
    end;
end;

{Sortowanie listy poprzez wstawienie na koncu listy wezla kontrolnego zawierajacego
liczbe spoza przedzialu. Nastepnie wyszukiwanie wezlow o najmniejszej wartosci liczbowej
w porzadku rosnacym, a nastepnie przenoszenie ich na koniec listy i usuniecie ze srodka.
Przeszukiwanie listy trwa do momentu odnalezienia wezla kontrolnego za ktorym sa juz elementy uporzadkowane.
Ostatnim elementem algorytmu jest usuniecie pierwszego elementu czyli wezla kontrolnego
oraz wyswietlenie listy w ListBox.}
procedure TForm_Listy.pSortuj;
var
  Wezel, Wezel_Wiekszy : tWezel;
  i, liczba_kontrolna : integer;
begin
  Wezel := Lista;
  liczba_kontrolna := (-1);
  pDodajWezel(Wezel, liczba_kontrolna);
  for i:=1 to cRozmiarListy do
    begin
      Wezel_Wiekszy := fSzukajWiekszy(Wezel, liczba_kontrolna);
      pDodajWezelWiekszy(Wezel, Wezel_Wiekszy);
      pUsunWezel(Wezel, Wezel_Wiekszy);
    end;
  pUsunWezelKontrolny(Wezel);
  pWyswietlPosortowane(Wezel);
  Lista := Wezel;
end;

{Wyszukiwanie wezla o wiekszej wartosci liczbowej}
function TForm_Listy.fSzukajWiekszy(Wezel_Pierwszy : tWezel; liczba_kontrolna : integer) : tWezel;
var
  Wezel, Wezel_Wiekszy : tWezel;
begin
  Wezel_Wiekszy := Wezel_Pierwszy;
  if Wezel_Pierwszy <> nil then
    begin
      Wezel := Wezel_Pierwszy^.Nastepny;
      while Wezel^.Liczba <> liczba_kontrolna do
        begin
          if Wezel^.Liczba < Wezel_Wiekszy^.Liczba then Wezel_Wiekszy := Wezel;
          Wezel := Wezel^.Nastepny;
        end;
    end;
  fSzukajWiekszy := Wezel_Wiekszy;
end;

{Dodanie kolejnego wiekszego wezla na koniec listy}
procedure TForm_Listy.pDodajWezelWiekszy(var Wezel_Pierwszy : tWezel; Wezel_Wiekszy : tWezel);
var
  Wezel_Nowy, Wezel : tWezel;
begin
  New (Wezel_Nowy);                         // Tworzymy nowy wezel
  Wezel_Nowy^.Nastepny := nil;
  Wezel_Nowy^.Liczba := Wezel_Wiekszy^.Liczba;
  Wezel := Wezel_Pierwszy;
  if Wezel = nil then Wezel_Pierwszy := Wezel_Nowy
  else
    begin
      while Wezel^.Nastepny <> nil do Wezel := Wezel^.Nastepny; //Przepisujemy wskazania nastepnego wezla
      Wezel^.Nastepny := Wezel_Nowy;
    end;
end;

procedure TForm_Listy.pUsunWezelKontrolny(var Wezel_Pierwszy : tWezel);
var
  Wezel : tWezel;
begin
  Wezel := Wezel_Pierwszy;             // zapamiętujemy początek
  if Wezel <> nil then
  begin
    Wezel_Pierwszy := Wezel^.Nastepny; // nowy początek
    dispose (Wezel);                   // usuń element z pamięci
  end;
end;

{Wyswietlanie listy posortowanej poprzez trawersowanie}
procedure TForm_Listy.pWyswietlPosortowane(Wezel : tWezel);
var
  i : integer;
begin
  i:=1;
  ListBox_ListaPosortowana.Clear;
  while Wezel <> nil do
    begin
      ListBox_ListaPosortowana.Items.Add( IntToStr(i)+': '+IntToStr(Wezel^.Liczba));
      i:=i+1;
      Wezel := Wezel^.Nastepny;
    end;
end;

{Usuwanie wybranego wezla}
procedure TForm_Listy.pUsunWezel(var Wezel_Pierwszy : tWezel; Wezel_Wybrany : tWezel);
var
  Wezel : tWezel;
begin
  if Wezel_Pierwszy = Wezel_Wybrany then
    begin
      Wezel := Wezel_Pierwszy;
      if Wezel <> nil then
        begin
          Wezel_Pierwszy := Wezel^.Nastepny;
          dispose (Wezel);
        end;
    end
  else
    begin
      Wezel := Wezel_Pierwszy;
      while Wezel^.Nastepny <> Wezel_Wybrany do Wezel := Wezel^.Nastepny;
      Wezel^.Nastepny := Wezel_Wybrany^.Nastepny;
      dispose (Wezel_Wybrany);
    end;
end;

{Wyswietlanie informacji o programie}
procedure TForm_Listy.pInfo;
var
  komunikat : string;
begin
  Komunikat:=' AiSD2_5, Autor: Szynal Łukasz, 150063' +#13+
             '2020/2021, Informatyka, D2, Semestr I';
  Application.MessageBox(PChar(komunikat),'Informacja o programie',MB_OK);
end;
end.
