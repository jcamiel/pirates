UNIT outils;

INTERFACE

USES
  Crt;

  PROCEDURE efface;
  PROCEDURE v_e(x,y :Integer; texte : String);
  PROCEDURE v_e_al(x,y: Integer; texte : String);
  PROCEDURE v_e_c(x,y: Integer; couleur: Byte; texte: String);
  PROCEDURE v_e_c2(x,y: Integer; couleur: Byte; nombre: integer);
  PROCEDURE v_e_c_f(x,y : INTEGER ; coul_text, coul_fond : BYTE ; texte : STRING);
  PROCEDURE marseillaise;
  PROCEDURE compagnie;

IMPLEMENTATION

  PROCEDURE compagnie;
    begin
      clrscr;
      textbackground(red);
      v_e_c(25,12,green+blink,'TU N'' AS PAS ASSEZ D'' ARGENT !!!');
      readln;
    end;


  PROCEDURE efface;
    VAR
     i: INTEGER;
    BEGIN
      Textbackground(cyan);
      textcolor(white);
      For i:=4 to 20 do
        BEGIN
          Gotoxy(58,i);
          Writeln('                 ³    ');
        END;
     END;

  PROCEDURE v_e(x,y: Integer; texte: String);
    begin
     gotoxy(x,y);
     write (texte);
    end;

  PROCEDURE v_e_al(x,y: Integer; texte: String);
    VAR couleur : byte;
    begin
     gotoxy(x,y);
     couleur := RANDOM(7) +8;
     textcolor(couleur);
     write(texte);
    end;

  PROCEDURE v_e_c(x,y :Integer; couleur: Byte; texte: String);

    begin
     Gotoxy(x,y);
     textcolor(couleur);
     write(texte);
   end;

  PROCEDURE v_e_c2(x,y :Integer; couleur: Byte; nombre : integer);

    begin
     Gotoxy(x,y);
     textcolor(couleur);
     write(nombre);
   end;

PROCEDURE v_e_c_f(x,y : INTEGER ; coul_text, coul_fond : BYTE ; texte : STRING);
    BEGIN
      Gotoxy(x,y);
      Textbackground(coul_fond);
      Textcolor(coul_text);
      Write(texte);
    END;

  PROCEDURE marseillaise;
    BEGIN
      sound(196);delay(800);nosound;
      delay(100);
      sound(196);delay(800);nosound;
      delay(500);
      sound(196);delay(800);nosound;
      delay(200);
      sound(262);delay(1000);nosound;
      delay(600);
      sound(262);delay(1000);nosound;
      delay(600);
      sound(294);delay(1000);nosound;
      delay(600);
      sound(294);delay(1000);nosound;
      delay(600);
      sound(392);delay(2000);nosound;
      delay(100);
      sound(330);delay(800);nosound;
      delay(100);
      sound(262);delay(1000);nosound;
      delay(500);
      sound(262);delay(800);nosound;
      delay(250);
      sound(330);delay(800);nosound;
      delay(500);
      sound(262);delay(800);nosound;
      delay(250);
      sound(220);delay(800);nosound;
      delay(300);
      sound(350);delay(1500);nosound;
      delay(200);
      sound(294);delay(800);nosound;
      delay(300);
      sound(247);delay(800);nosound;
      delay(100);
      sound(262);delay(2000);nosound;
    END;

 END.