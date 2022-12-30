UNIT combat;

INTERFACE

USES
  crt, outils;

PROCEDURE longuevue;
PROCEDURE tempete;
PROCEDURE commerce;
PROCEDURE decors;
PROCEDURE pirate;
PROCEDURE ecrancombat;
PROCEDURE mcombat(nom, arial :string; canon, homme, soutemax,numebat : integer);
PROCEDURE bateau(xbateau1 :integer);
PROCEDURE bateau2(xbateau2 :integer);
PROCEDURE choix2;

IMPLEMENTATION

PROCEDURE choix2;

   
  var
    article : char;
     reponse : file of char;
  begin
    assign(reponse,'trans.dat');
    rewrite(reponse);
    v_e_c(1,22,4, '╔═════════════════════════╦═════════════════════════╦══════════════════════════╗');
    v_e_c(1,23,4, '║          TTAQUER        ║         A ORDER         ║            UIRE          ║');
    v_e_c(1,24,4, '╚═════════════════════════╩═════════════════════════╩══════════════════════════╝');
    textbackground(red);
    v_e_c(11,23,black,'A');
    v_e_c(38,23,black,'B');
    v_e_c(65,23,black,'F');
    textbackground(black);
    article := readkey;
    write(reponse,article);
    close(reponse);
  end;
PROCEDURE ecrancombat;
 var
   i :integer;

 begin
   clrscr;
   textbackground(cyan);
   clrscr;
   FOR i := 1 to 80 do
     begin
       v_e_c(i,21,blue,'█');
     end;
   v_e_c(1,22,15, '╔══════════════════════════════════════════════════════════════════════════════╗');
   v_e_c(1,23,15, '║                                                                              ║');
   v_e_c(1,24,15, '╚══════════════════════════════════════════════════════════════════════════════╝');
   FOR i := 2 to 36 do
     begin
       v_e_c(i, 1,white,'═');
       v_e_c(i, 5,white,'═');
       v_e_c(i+43, 1,white,'═');
       v_e_c(i+43, 5,white,'═');
     end;
   FOR i:= 2 to 4 do
     begin
       v_e_c( 1, i,white,'║');
       v_e_c(37, i,white,'║');
       v_e_c(44, i,white,'║');
       v_e_c(80, i,white,'║');
     end;
  v_e_c(1, 1,white,'╔');
  v_e_c(1, 5,white,'╚');
  v_e_c(44, 5,white,'╚');
  v_e_c(44, 1,white,'╔');
  v_e_c(37, 1,white,'╗');
  v_e_c(37, 5,white,'╝');
  v_e_c(80, 1,white,'╗');
  v_e_c(80, 5,white,'╝');
  v_e_c(37, 1,white,'╗');
  v_e_c(37, 5,white,'╝');
 end;

PROCEDURE mcombat(nom,arial : string;canon, homme, soutemax, numebat : integer);
  CONST
    domagenemi : ARRAY[1..5, 1..4] OF INTEGER = (

{  BATEAU     }
{Caravelle}(30,75,15,5),
{Flute    }(10,40,20,10),
{Caravelle}(70,120,25,10),
{Galion   }(140,200,65,35),
{Galion   }(150,300,100,60));

  var
    enemidomage, courrier, chairenemi, i, boulet, dommage, chair,chair2, dommage2: integer;
    xboulet, xboulet2, yboulet2, xbateau1,xbateau2,angle,force, vent, ventaffich, direcvent : integer;
    fleche : string;
    xa, xb, ya, yb, xc, yc, a, b, c : REAL;
    yboulet : REAL;

  begin
    boulet:= 20;
    FOR i:=0 to 1 do
      begin
        v_e_c( 7+43*i, 2,black,'DOMMAGE :');
        v_e_c( 7+43*i, 3,black,'HOMMES :');
        v_e_c( 8+43*i, 4,black,'BOULET');
      end;
      v_e_c2( 3, 2,black,soutemax);
      v_e_c2( 3, 3,black,homme);
      v_e_c2( 3, 4,black,boulet);
      dommage := soutemax div 12;
      chair := homme div 5;
      FOR i:= 1 to dommage do
        begin
          v_e_c(15+i, 2,red,'█');
        end;
      FOR i:= 1 to chair do
        begin
          v_e_c(15+i, 3,lightblue,'█');
        end;
      enemidomage := random(domagenemi[numebat,2]-domagenemi[numebat,1])+domagenemi[numebat,1];
      chairenemi := random(domagenemi[numebat,3]-domagenemi[numebat,4])+domagenemi[numebat,4];
      v_e_c2( 45, 2,black,enemidomage);
      v_e_c2( 45, 3,black,chairenemi);
      dommage2 := enemidomage div 12;
      chair2 := chairenemi div 5;
      FOR i:=1 to dommage2 do

        begin
          v_e_c(58+i, 2,red,'█');
        end;
      FOR i:= 1 to chair2 do
        begin
          v_e_c(58+i, 3,lightblue,'█');
        end;
{*******************************************TIR*****************************}
    xbateau1 := random(10)+5;
    xbateau2 := random(15)+60;
    bateau(xbateau1);
    bateau2(xbateau2);
    direcvent := random(3)-1;
    if direcvent <> 0
      then
        begin
          vent := random(13);
        end
      else
        begin
          vent := 0;
        end;
    ventaffich := vent*17;
    CASE direcvent OF
      -1 : fleche := '<-';
       0 : fleche := 'NUL';
       1 : fleche := '->';
    end;
    v_e_c2(39, 3,black,ventaffich);
    v_e_c(39, 4,black,fleche);
    courrier := 0;
  REPEAT
    REPEAT
      v_e_c( 3,23,black,'ANGLE ?: ');
      readln(angle);
    UNTIL (angle>9) and (angle<80);
    v_e_c(3,23,black,'FORCE ?:     ');
    gotoxy(11,23);
    readln(force);
    xa := xbateau1;
    ya := -19;
    xb := xbateau1 + 2.5*vent*direcvent + force;
    yb := -20 + angle;
    xc := xbateau1 + 2.5*vent*direcvent + 2*force;
    yc := -20;
    If xb<=xa then
      BEGIN
       xb := xa+1;
      END;


    b := ((yb-ya) * (SQR(xc)-SQR(xa)) - (yc-ya) * (SQR(xb)-SQR(xa)))/((xb-xa) * (SQR(xc)-SQR(xa))-(xc-xa)*(SQR(xb)-SQR(xa)));
    a := ((yb - ya) - b * (xb - xa)) / (SQR(xb) - SQR(xa));
    c := ya - (a * SQR(xa)) - (b * xa);

    xboulet := xbateau1;
    TEXtbackground (cyan);
    REPEAT
      BEGIN
        yboulet := a * SQR(xboulet) + b * xboulet + c;
        yboulet2 := trunc(yboulet);
        If (yboulet<-6) and (xboulet<80)
          Then
            BEGIN

              v_e_c(xboulet, -yboulet2, black,'ø');
              Textcolor(CYAN);
              Delay (100);
              v_e_c(xboulet, -yboulet2, cyan,' ');
          END;
        If ((yboulet<-15) and (xboulet<xbateau1+8)) THEN bateau(xbateau1);
        inc(xboulet);
      end;
    UNTIL (yboulet < -20) or (xboulet>80);

       If ((xboulet>= xbateau2) and (xboulet<=xbateau2 +3))  then  chairenemi := chairenemi-5;
    If ((xboulet>= xbateau2-2) and (xboulet<=xbateau2 +6))  then  enemidomage := enemidomage-2*canon;
    If arial = 'pirate' then
      BEGIN
        xbateau1 := xbateau1+4;
        xbateau2:= xbateau2-4;
      END;
    ecrancombat;
    FOR i:=0 to 1 do
      begin
        v_e_c( 7+43*i, 2,black,'DOMMAGE :');
        v_e_c( 7+43*i, 3,black,'HOMMES :');
        v_e_c( 8+43*i, 4,black,'BOULET');
      end;
      v_e_c2( 3, 2,black,soutemax);
      v_e_c2( 3, 3,black,homme);
      v_e_c2( 3, 4,black,boulet);
      dommage := soutemax div 12;
      chair := homme div 5;
      FOR i:= 1 to dommage do
        begin
          v_e_c(15+i, 2,red,'█');
        end;
      FOR i:= 1 to chair do
        begin
          v_e_c(15+i, 3,lightblue,'█');
        end;
      v_e_c2( 45, 2,black,enemidomage);
      v_e_c2( 45, 3,black,chairenemi);
      dommage2 := enemidomage div 12;
      chair2 := chairenemi div 5;
      FOR i:=1 to dommage2 do

        begin
          v_e_c(58+i, 2,red,'█');
        end;
      FOR i:= 1 to chair2 do
        begin
          v_e_c(58+i, 3,lightblue,'█');
        end;
     bateau(xbateau1);
     bateau2(xbateau2);
     v_e_c2(39, 3,black,ventaffich);
     v_e_c(39, 4,black,fleche);
     readln;

     If arial = 'commerce' then
       BEGIN
         force := random(50)+10;
         angle := random(30)+10;
         xa := xbateau2;
         ya := -19;
         xb := xbateau2 - 2.5*vent*direcvent - force;
         yb := -20 + angle;
         xc := xbateau2 - 2.5*vent*direcvent - 2*force;
         yc := -20;
    If xb<=xa then
      BEGIN
       xb := xa-1;
      END;


    b := ((yb-ya) * (SQR(xc)-SQR(xa)) - (yc-ya) * (SQR(xb)-SQR(xa)))/((xb-xa) * (SQR(xc)-SQR(xa))-(xc-xa)*(SQR(xb)-SQR(xa)));
    a := ((yb - ya) - b * (xb - xa)) / (SQR(xb) - SQR(xa));
    c := ya - (a * SQR(xa)) - (b * xa);

    xboulet := xbateau2;
    TEXtbackground (cyan);
    REPEAT
      BEGIN
        yboulet := a * SQR(xboulet) + b * xboulet + c;
        yboulet2 := trunc(yboulet);
        If (yboulet<-6) and (xboulet<80)
          Then
            BEGIN

              v_e_c(xboulet, -yboulet2, black,'ø');
              Textcolor(CYAN);
              Delay (100);
              v_e_c(xboulet, -yboulet2, cyan,' ');
          END;
        If ((yboulet<-15) and (xboulet<xbateau2-8)) THEN bateau2(xbateau2);
        xboulet:=xboulet-1;
      end;
    UNTIL (yboulet < -20) or (xboulet<1);

       If ((xboulet>= xbateau1) and (xboulet<=xbateau1+3))  then  homme := homme-5;
       If ((xboulet>= xbateau1-2) and (xboulet<=xbateau1 +6))  then  soutemax := soutemax-10;
        xbateau1 := xbateau1+4;
        xbateau2:= xbateau2-4;
    ecrancombat;
    FOR i:=0 to 1 do
      begin
        v_e_c( 7+43*i, 2,black,'DOMMAGE :');
        v_e_c( 7+43*i, 3,black,'HOMMES :');
        v_e_c( 8+43*i, 4,black,'BOULET');
      end;
      v_e_c2( 3, 2,black,soutemax);
      v_e_c2( 3, 3,black,homme);
      v_e_c2( 3, 4,black,boulet);
      dommage := soutemax div 12;
      chair := homme div 5;
      FOR i:= 1 to dommage do
        begin
          v_e_c(15+i, 2,red,'█');
        end;
      FOR i:= 1 to chair do
        begin
          v_e_c(15+i, 3,lightblue,'█');
        end;
      v_e_c2( 45, 2,black,enemidomage);
      v_e_c2( 45, 3,black,chairenemi);
      dommage2 := enemidomage div 12;
      chair2 := chairenemi div 5;
      FOR i:=1 to dommage2 do

        begin
          v_e_c(58+i, 2,red,'█');
        end;
      FOR i:= 1 to chair2 do
        begin
          v_e_c(58+i, 3,lightblue,'█');
        end;
     bateau(xbateau1);
     bateau2(xbateau2);
     v_e_c2(39, 3,black,ventaffich);
     v_e_c(39, 4,black,fleche);
     readln;
     end;







     courrier := courrier+1;
     UNTIL ((courrier = 6) or (enemidomage<=0) or (chairenemi <=0));

end;

PROCEDURE bateau2(xbateau2 : integer);
  begin
    textbackground(cyan);
     v_e_c(xbateau2,16,white,        '▄▌ ▄▌');
     v_e_c(xbateau2-1,17,white,     '▐█▌▐█▌');
     v_e_c(xbateau2,18,white,        '█▌ █▌');
     v_e_c(xbateau2-4,19,brown , '▄▄▄  ▌ ▐ ▄▄█ ');
     textbackground(cyan);
     v_e_c(xbateau2-2,20,6,       '▀       ▀');
     textbackground(brown);
     v_e_c(xbateau2-1,20,black,'═.═.═.═ø');
     textbackground(cyan);
   end;

PROCEDURE bateau(xbateau1 : integer);
  begin
    textbackground(cyan);
    v_e_c(xbateau1,16,lightred,         '▐▄ ▐▄');
    v_e_c(xbateau1,17,lightred,         '▐█ ▐█');
    v_e_c(xbateau1,18,lightred,         '▐█ ▐█');
    v_e_c(xbateau1-3,19,brown,       '▄▄ ▐  ▐  ▄▄▄');
    v_e_c(xbateau1+6,20,6,                    '▀');
    textbackground(brown);
    v_e_c(xbateau1-2,20,black,'══ù═ù═ù═');
    textbackground(cyan);
  end;




PROCEDURE longuevue;

  begin
    clrscr;
    textbackground(black);
    clrscr;
    v_e_c(34, 6,cyan,       '▄▄██████████▄▄');
    v_e_c(31, 7,3,       '▄██████████████████▄');
    v_e_c(29, 8,3,     '▄██████████████████████▄');
    v_e_c(28, 9,3,    '▄████████████████████████▄');
    v_e_c(27,10,3,   '▐██████████████████████████▌');
    v_e_c(27,11,3,   '████████████████████████████');
    v_e_c(27,12,3,   '████████████████████████████');
    v_e_c(27,13,3,   '████████████████████████████');
    textbackground(cyan);
    v_e_c(28,14,blue, '▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄');
    textbackground(black);
    v_e_c(28,15,blue ,'▀████████████████████████▀');
    v_e_c(29,16,blue,  '▀██████████████████████▀');
    v_e_c(31,17,blue,    '▀██████████████████▀');
    v_e_c(34,18,blue,       '▀▀██████████▀▀');
  end;

PROCEDURE tempete;
  begin
    v_e_c(34, 6,lightgray,  '▄▄██████████▄▄');
    v_e_c(31, 7,7,       '▄██████████████████▄');
    v_e_c(29, 8,7,     '▄██████████████████████▄');
    v_e_c(28, 9,7,    '▄████████████████████████▄');
    v_e_c(27,10,7,   '▐██████████████████████████▌');
    v_e_c(27,11,7,   '████████████████████████████');
    v_e_c(27,12,7,   '████████████████████████████');
    v_e_c(27,13,7,   '████████████████████████████');
    v_e_c(27,14,7,   '▐██████████████████████████▌');
    textbackground(lightgray);
    v_e_c(38,10,8,'▄▄▄▄██▀');
    v_e_c(35,11,8,'▄▄▄▄');
    v_e_c(31,12,8,'▄▄████████▄▄     ▀');
    v_e_c(33,13,8,'▀▀▀▀▀▀█▀       ▄▄█▄');
    v_e_c(39,11,8,'▓▓▓▓▓▓▓▄');
    v_e_c(43,12,8,'▓▓▓▓▀');
    v_e_c(45,13,8,'▀');
     v_e_c(43,13,yellow+128,'▌');
     v_e_c(43,14,yellow+128,'▐');
    textbackground(7);
    v_e_c(41,12,8,'▓▓');
    textbackground(black);
  end;

PROCEDURE commerce;
 var
   coul, numero,x : byte;

 begin
   coul :=random (7)+8;
   numero := random(3);
   x := random(9)+29;
   if numero = 0
     then
       begin
         textbackground(cyan);
         v_e_c(x+7,10,coul,     '▄▌ ▄▌');
         v_e_c(x+7,11,coul,     '█▌ █▌');
         v_e_c(x+7,12,coul,     '█▌ █▌');
         v_e_c(x+3,13,brown,'▄▄▄  ▌ ▐ ▄▄');
         textbackground(blue);
         v_e_c(x+4,14,6,     '▀');
         textbackground(brown);
         v_e_c(x+5,14,black,'═ù═ù═ù══');
         textbackground(black);
       end;
   If numero = 1
     then
       begin
         textbackground(cyan);
         v_e_c(40,10,coul,  '▄▄');
         v_e_c(38,11,coul,'▐████▌');
         v_e_c(38,12,coul,'▐████▌');
         v_e_c(39,13,coul, '▀  ▀');
         v_e_c(40,13,brown, '▐▌');
         textbackground(blue);
         v_e_c(38,14,brown,'▀████▀');
         v_e_c(40,15,brown,'▀▀');
         textbackground(brown);
         v_e_c(40,14,black,'ðð');
         textbackground(black);
       end;
   If numero = 2
     then
       begin
         textbackground(cyan);
         v_e_c(x+6, 8,coul  , '▐█▌');
         v_e_c(x+5, 9,coul,  '▐███');
         v_e_c(x+5,10,coul,  '▐███ █▌');
         v_e_c(x+3,11,coul,'▐█▐███ █▌');
         v_e_c(x+3,12,coul,'██     █▌');
         v_e_c(x+7,12,brown,'▐▌');
         v_e_c(x,13,brown,'▀██▄█▄▄██▄█▄██');
         textbackground(blue);
         v_e_c(x+2,14,brown,'▀         ▀');
         textbackground(brown);
         v_e_c(x+3,14,black,'═ùù═ùù═ù═');
         v_e_c(x+4,13,black,'.');
         v_e_c(x+7,13,black,'..');
         v_e_c(x+10,13,black,'.');
         v_e_c(x+13,13,lightcyan,'ð');
         v_e_c(x+2,13,black,'ù');
         textbackground(black);
       end;
    end;
PROCEDURE pirate;
  VAR
    drap : integer;

  begin
    drap := random(4);
    v_e_c(31,3,4,'®BATEAU A L'' HORIZON¯');
    textbackground(cyan);
    v_e_c(39,10,white,      '▄▌ ▄▌');
    v_e_c(38,11,white,     '▐█▌▐█▌');
    v_e_c(39,12,white,      '█▌ █▌');
    v_e_c(35,13,brown , '▄▄▄  ▌ ▐ ▄▄█ ');
    textbackground(blue);
    v_e_c(37,14,6,       '▀       ▀');
    textbackground(brown);
    v_e_c(38,14,black,'═.═.═.═ø');
    readln;
    clrscr;
    textbackground(black);
    clrscr;
    v_e_c(34, 6,cyan,       '▄▄██████████▄▄');
    v_e_c(31, 7,3,       '▄██████████████████▄');
    v_e_c(29, 8,3,     '▄██████████████████████▄');
    v_e_c(28, 9,3,    '▄████████████████████████▄');
    v_e_c(27,10,3,   '▐██████████████████████████▌');
    v_e_c(27,11,3,   '████████████████████████████');
    v_e_c(27,12,3,   '████████████████████████████');
    v_e_c(27,13,3,   '████████████████████████████');
    v_e_c(27,14,3,   '▐██████████████████████████▌');
    v_e_c(28,15,3 ,   '▀████████████████████████▀');
    v_e_c(29,16,3,     '▀██████████████████████▀');
    v_e_c(31,17,3,       '▀██████████████████▀');
    v_e_c(34,18,3,          '▀▀██████████▀▀');
    v_e_c(32, 7,brown,'██');
    v_e_c(32, 8,brown,'██');
    v_e_c(32, 9,brown,'██');
    v_e_c(32,10,brown,'██');
    v_e_c(32,11,brown,'██');
    v_e_c(32,12,brown,'██');
    v_e_c(32,13,brown,'██');
    v_e_c(32,14,brown,'██');
    v_e_c(32,15,brown,'██');
    v_e_c(32,16,brown,'██');
    v_e_c(32,17,brown,'██');
    textbackground(cyan);
    v_e_c(34,8,black,'▐█▄▄         ▄▄▄███');
    v_e_c(34,9,0,    '▐██████▄▄▄█████████ ');
    v_e_c(34,10,0,   '▐');
    v_e_c(34,11,0,   '▐');
    v_e_c(34,12,0,   '▐');
    v_e_c(34,13,0,   '▐');
    v_e_c(34,14,0,   '▐');
    v_e_c(34,15,0,   '▐');
    textbackground(white);
    v_e_c(35,10,0,'████▀ ▄  ▄ ▀██████');
    v_e_c(35,11,0,'████▄      ▄██████');
    v_e_c(35,12,0,'██████ ▌▐ ████████');
    v_e_c(35,13,0,'████▀▀████▀▀██████');
    v_e_c(35,14,0,'█████▄ ▀▀ ▄███████');
    v_e_c(35,15,0,'████▀ ▄██▄ ▀█████');
    textbackground(cyan);
    v_e_c(52,15,0,'▀');
    v_e_c(36,16,0,     '▀▀█████████▀▀');
    v_e_c(40,17,0,         '▀▀▀▀▀');
    v_e_c(34,7,0,'´');
    v_e_c(34,16,0,'´');
    v_e_c(34,17,0,'│');
    IF drap = 2
      then
        begin
          textbackground(white);
          v_e_c(41,12,0,' ▄▄ ');
        end;

    IF drap = 0
      then
        begin
          textbackground(white);
          v_e_c(41,12,0,'▄▄▄▄');

      end;
    IF drap = 1
      then
        begin
          textbackground(white);
          v_e_c(41,12,0,'▄');

    end;
    textbackground(black);
  end;

PROCEDURE decors;
  VAR
    choix, x,y :integer;
  begin
    choix:= random(2);
    y := random(4)+8;
    x := random(15)+30;
    if choix =0
      then

  begin
    textbackground(cyan);
    v_e_c(x+3, y-1,white,  '▄▄ ');
    v_e_c(x, y,white,  '▄▄█████▄▄');
    v_e_c(x+2, y+1,white, '▀▀▀▀');
    textbackground(black);
  end;
    if choix =1
      then
       begin
         textbackground(cyan);
         v_e_c(x, y-1,yellow,'▄██▄');
         v_e_c(x+1, y,yellow, '▀▀');
         textbackground(black);
       end;

  end;
end.