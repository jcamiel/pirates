PROGRAM save;

uses
  crt;

type
  sauvegarde = record
    s_nom : string[12];
    s_prenom : string[12];
    s_argent : longint;
  end;
  fichier = file of sauvegarde;

var
  nom,prenom,nom2,prenom2 : string;
  argent,argent2 : longint;
  sauve : fichier;
  article : sauvegarde;

begin
  clrscr;
  randomize;
  writeln ('entrez votre nom:');
  readln(nom);
  writeln ('entrez votre prenom');
  readln(prenom);
  argent := random(10000);
  writeln(argent);
  readln;
  assign (sauve,'savegame.dat');
  rewrite(sauve);
  with article do
    begin
      s_nom := nom;
      s_prenom := prenom;
      s_argent := argent;
      write(sauve,article);
    end;
  close(sauve);
  reset(sauve);
  with article do
    begin
      while not eof(sauve) do
        begin
          read(sauve,article);
          nom2 := s_nom;
          prenom2 := s_prenom;
          argent2 := s_argent;
        end;
     end;
   close(sauve);
   writeln(nom2);
   writeln(prenom2);
   writeln(argent2);
   readln;
end.