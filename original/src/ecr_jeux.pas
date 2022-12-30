UNIT ecr_jeux;

INTERFACE

USES
  crt, outils;

PROCEDURE deplacement;
PROCEDURE ecran_princ;
PROCEDURE port;
PROCEDURE maison1_1;
PROCEDURE maison1_2;
PROCEDURE maison2_1;
PROCEDURE maison2_2;
PROCEDURE maison3_1;
PROCEDURE maison3_2;
PROCEDURE maison4_1;
PROCEDURE maison4_2;
PROCEDURE maison5_1;
PROCEDURE maison5_2;
PROCEDURE affich_marche;
PROCEDURE affich_taverne;
PROCEDURE affich_banque;
PROCEDURE affich_tav_cadre;
PROCEDURE affich_tav_disc;


IMPLEMENTATION

PROCEDURE affich_tav_cadre;

  VAR
    i, j : INTEGER;

  BEGIN
    textbackground(cyan);
    FOR i := 10 TO 71 DO
      BEGIN
        FOR j := 4 TO 20 DO
          BEGIN
            v_e_c(i, j, cyan, '█');
          END;
      END;
    FOR i := 10 TO 71 DO
      BEGIN
        v_e_c(i, 4, white, '═');
        v_e_c(i, 20, 15, '═');
      END;
    FOR j := 4 TO 20 DO
      BEGIN
        v_e_c(10, j, white, '║');
        v_e_c(71, j, 15, '║');
      END;
    v_e_c(10, 4, 15, '╔');
    v_e_c(10, 20, 15, '╚');
    v_e_c(71, 4, 15, '╗');
    v_e_c(71, 20, 15, '╝');
    v_e_c(10, 6, 15, '╠═══════════════╝');
    v_e_c(26, 4, 15, '╦');
    v_e_c(26, 5, 15, '║');
  END;

PROCEDURE affich_tav_disc;

  VAR
    i, j : INTEGER;

  BEGIN
    affich_tav_cadre;
    v_e_c(15, 5, blue, 'DISCUTER');
    FOR i := 11 TO 26 DO
      BEGIN
        v_e_c(i, 7, white, '─');
        v_e_c(i, 19, 15, '─');
      END;
    FOR j := 7 TO 19 DO
      BEGIN
        v_e_c(11, j, white, '│');
        v_e_c(26, j, 15, '│');
      END;
    v_e_c(11, 11, 15, '├──────────────´');
    v_e_c(11, 15, 15, '├──────────────´');
    FOR i := 27 TO 70 DO
      BEGIN
        v_e_c(i, 5, white, '─');
        v_e_c(i, 19, 15, '─');
      END;
    FOR j := 5 TO 19 DO
      BEGIN
        v_e_c(27, j, white, '│');
        v_e_c(70, j, 15, '│');
      END;
    v_e_c(11, 7, 15, '┌');
    v_e_c(26, 7, 15, '┐');
    v_e_c(11, 19, 15, '└');
    v_e_c(26, 19, 15, '┘');
    v_e_c(27, 5, 15, '┌');
    v_e_c(70, 5, 15, '┐');
    v_e_c(27, 19, 15, '└');
    v_e_c(70, 19, 15, '┘');
    v_e_c(15, 8, blue, 'EMANDER');
    v_e_c(17, 9, 1, 'DES');
    v_e_c(12, 10, 1, 'RENSEIGNEMENTS');
    v_e_c(15, 12, 1, 'ARCHANDISES');
    v_e_c(15, 14, 1, 'ILLEGALES');
    v_e_c(16, 16, 1, 'ECRUTER');
    v_e_c(17, 17, 1, 'DES');
    v_e_c(16, 18, 1, 'HOMMES');
    textbackground(lightgray);
    v_e_c(14, 8, yellow, 'D');
    v_e_c(14, 12, 14, 'M');
    v_e_c(15, 16, 14, 'R');
  END;



PROCEDURE ecran_princ;
  VAR
    carac : CHAR;
    i, x, y : INTEGER;

  BEGIN
     Randomize;
     Textbackground (0);
     clrscr;
     For i:=1 to 40 Do
       Begin
         x:=random(79)+1;
         y:=random(13)+1;
         v_e_c(x, y, yellow, '.');
       End;
    textbackground(cyan);
    v_e_c(1, 1, white,'┌────────────┐');
    v_e_c(1, 2, white,'│            │');
    v_e_c(1, 3, white,'│            │');
    v_e_c(1, 4, white,'└────────────┘');
    v_e_c(65, 1, white,'┌──────────────┐');
    v_e_c(65, 2, white,'│              │');
    v_e_c(65, 3, white,'│              │');
    v_e_c(65, 4, white,'│              │');
    v_e_c(65, 5, white,'│              │');
    v_e_c(65, 6, white,'│              │');
    v_e_c(65, 7, white,'│              │');
    v_e_c(65, 8, white,'│              │');
    v_e_c(65, 9, white,'│              │');
    v_e_c(65,10, white,'│              │');
    v_e_c(65,11, white,'└──────────────┘');
    v_e_c( 1,22, white,'╔══════╦═══════════╦════════════╦════════╦═════════╦════════╦════════╦═════════╗');
    v_e_c( 1,23, white,'║      ║           ║            ║        ║         ║        ║        ║         ║');
    v_e_c( 1,24, white,'╚══════╩═══════════╩════════════╩════════╩═════════╩════════╩════════╩═════════╝');
    v_e_c(6, 2, blue,'ANNEES');
    v_e_c(7, 3, blue,'JOURS');
    v_e_c(67, 4, blue,'TU POSSEDES:');
    v_e_c(75, 5, blue,'ECUS');
    v_e_c(73, 6, blue,'HOMMES');
    v_e_c(67, 7, blue,'UN');
    v_e_c(67, 8, blue,'A');
    v_e_c(72, 8, blue,'MATS');
    v_e_c(67, 9, blue,'AVEC');
    v_e_c(75, 9, blue,'/');
    v_e_c(67, 10, blue,'ET');
    v_e_c(73, 10, blue,'CANONS');
    v_e_c(4, 23, blue,'ORT');
    v_e_c(11, 23, 1,  'OMPAGNIE');
    v_e_c(23, 23, 1, 'QUIPEMENT');
    v_e_c(36, 23, 1, 'ARCHE');
    v_e_c(45, 23, 1, 'AVERNE');
    v_e_c(55, 23, 1, 'ANQUE');
    v_e_c(63, 23, 1, 'C EMIN');
    v_e_c(73, 23, 1, 'PTIONS');
    Textbackground (White);
    v_e_c(3, 23, 14, 'P');
    v_e_c(10, 23,14, 'C');
    v_e_c(22, 23,14, 'E');
    v_e_c(35, 23,14, 'M');
    v_e_c(44, 23,14, 'T');
    v_e_c(54, 23,14, 'B');
    v_e_c(64, 23,14, 'H');
    v_e_c(72, 23,14, 'O');

    {********************************FIN DU DESSIN MENU*****************************}
  END;

{*****************************FIN ECRAN PRINCIPAL************************}

{***************************AFFICHE TAVERNE*********************************}
PROCEDURE affich_taverne;

  VAR
    I , J : INTEGER;

  BEGIN
    textbackground(black);
    clrscr;
    FOR I := 1 TO 80 DO
      BEGIN
        FOR J := 1 TO 21 DO
          BEGIN
            v_e_c(I, J, lightgray, '█');
          END;
      END;
    FOR I := 1 TO 42 DO
      BEGIN
        FOR J := 14 TO 21 DO
          BEGIN
            v_e_c(I, J, brown, '█');
          END;
      END;
    FOR i := 1 TO 45 DO
      BEGIN
        v_e_c(i, 13, brown, '▓');
      END;
    FOR I := 2 TO 41 DO
      BEGIN
        FOR J := 2 TO 10 DO
          BEGIN
            v_e_c(I, J, brown, '█');
          END;
      END;
    FOR I := 3 TO 40 DO
      BEGIN
        FOR J := 3 TO 9 DO
          BEGIN
            v_e_c(I, J, cyan, '█');
          END;
      END;
{BOUTEILLE}
    v_e_c(4, 6, red, '█');
    v_e_c(3, 7, green, '███');
    v_e_c(2, 8, 2, '█████');
    v_e_c(2, 9, 2, '█████');
    textbackground(green);
    v_e_c(2, 10, white, '█▄▄▄█');
    v_e_c(2, 11, 15, '▀███▀');
    v_e_c(2, 12, green, '█████');
{CHOPE GAUCHE}
    textbackground(brown);
    v_e_c(8, 10, white, '▄ ▄▄█▄');
    textbackground(lightgray);
    v_e_c(13, 11, darkgray, '▄');
    v_e_c(13, 12, 8, '▀');
    textbackground(white);
    v_e_c(9, 11, darkgray, '░░░░');
    v_e_c(9, 12, 14, '████');
{FEMME}
    textbackground(cyan);
    v_e_c(19, 6, black, '▄  ▄');
    v_e_c(17, 8, 0, '▐      ▌');
    textbackground(brown);
    v_e_c(17, 10, blue, '▄      ▄');
    textbackground(black);
    v_e_c(20, 6, lightred, '▄▄');
    v_e_c(18, 7, 12, ' ████ ');
    v_e_c(18, 8, 12, ' ▀██▀ ');
    v_e_c(17, 9, 12, '   ▐▌   ');
    textbackground(blue);
    v_e_c(18, 10, lightred, ' ▀██▀ ');
    v_e_c(16, 11, blue, '          ');
    v_e_c(16, 12, 12, '█▌      ▐█');
{HOMME}
    textbackground(cyan);
    v_e_c(32, 6, black, ' ▄████▄');
    v_e_c(32, 7, 0, '▐██████▌');
    v_e_c(33, 8, 0, '▀████▀');
    v_e_c(35, 9, lightred, '██');
    textbackground(brown);
    v_e_c(31, 10, lightred, '▄████████▄');
    v_e_c(33, 10, white, '█');
    v_e_c(38, 10, 15, '█');
    v_e_c(33, 13, 15, '▐████▌');
    textbackground(lightgray);
    v_e_c(30, 11, 12, '▐██████████▌');
    v_e_c(33, 11, 15, '██');
    v_e_c(37, 11, 15, '██');
    v_e_c(30, 12, 12, ' ██      ██ ');
    v_e_c(33, 12, 15, '▐████▌');
    textbackground(blue);
    v_e_c(33, 14, 15, ' ▀▀▀▀ ');
    v_e_c(32, 15, black, '████████');
    v_e_c(33, 16, brown, '▌    ▐');
    v_e_c(34, 16, 0, '▌▐▌▐');
    v_e_c(33, 17, brown, '▌    ▐');
    v_e_c(34, 17, 0, '▌▐▌▐');
    v_e_c(33, 18, brown, '▌    ▐');
    v_e_c(34, 18, 0, '████');
    textbackground(brown);
    v_e_c(33, 20, red, '▐    ▌');
    textbackground(black);
    v_e_c(34, 19, 12, '▐▌▐▌');
    v_e_c(34, 20, red, '▐▌▐▌');
    v_e_c(34, 21, brown, '▐▌▐▌');
{TABOURET GAUCHE}
    textbackground(brown);
    v_e_c(10, 15, black, '████████');
    v_e_c(12, 16, 0    ,   '▌▐▌▐');
    v_e_c(12, 17, 0    ,   '▌▐▌▐');
    v_e_c(12, 18, 0    ,   '████');
    v_e_c(12, 19, 0    ,   '▌▐▌▐');
    v_e_c(12, 20, 0    ,   '▌▐▌▐');
    v_e_c(12, 21, 0    ,   '▌▐▌▐');
{PORTE}
    FOR I := 49 TO 61 DO
      BEGIN
        FOR J := 4 TO 19 DO
          BEGIN
            v_e_c(I, J, black, '█');
          END;
      END;
    FOR I := 49 TO 60 DO
      BEGIN
        FOR J := 5 TO 19 DO
          BEGIN
            v_e_c(I, J, brown, '█');
          END;
      END;
    FOR I := 43 TO 80 DO
      BEGIN
        FOR J := 20 TO 21 DO
          BEGIN
            v_e_c(I, J, white, '█');
          END;
      END;
    textbackground(black);
    v_e_c(49, 4, brown, '████▄▄▄▄');
    textbackground(brown);
    v_e_c(53, 20, 15, '▄▄▄▄    ');
    v_e_c(57, 13, black, '▀█');
    Textbackground(red);
    v_e_c(53, 3, white, 'PRIVE');
{TABOURET PIANO}
    textbackground(lightgray);
    v_e_c(66, 18, brown, '▄▄▄▄');
    v_e_c(67, 19, black, '▐▌');
    textbackground(black);
    v_e_c(67, 20, white, '▌▐');
    textbackground(brown);
    v_e_c(66, 21, white, '▀  ▀');
{PIANO}
    FOR I := 75 TO 80 DO
      BEGIN
        FOR J := 12 TO 20 DO
          BEGIN
            v_e_c(I, J, black, '█');
          END;
      END;
    textbackground(lightgray);
    v_e_c(74, 12, black, '▀');
    v_e_c(71, 16, 0, '▄');
    textbackground(0);
    v_e_c(72, 16, white, '▀▀▀');
    v_e_c(71, 17, black, '    ');
    v_e_c(72, 18, 0, ' ');
    v_e_c(72, 19, 0, ' ');
    v_e_c(72, 20, 0, ' ');
    v_e_c(71, 21, white, '▌ ▐█▄ ▄▄ ▄');
{CHOPE DROITE}
    textbackground(lightgray);
    v_e_c(75, 9, white, '▄ ▄▄█▄');
    textbackground(lightgray);
    v_e_c(75, 10, darkgray, '▄');
    v_e_c(75, 11, 8, '▀');
    textbackground(white);
    v_e_c(76, 10, darkgray, '░░░░');
    v_e_c(76, 11, 14, '████');
{MENU}
    FOR I := 1 TO 80 DO
      BEGIN
        FOR J := 22 TO 24 DO
          BEGIN
            v_e_c(I, J, cyan, '█');
          END;
      END;
    textbackground(cyan);
    FOR I := 2 TO 79 DO
      BEGIN
        v_e_c(I, 22, white, '═');
        v_e_c(I, 24, white, '═');
      END;
    v_e_c(1, 22, 15, '╔');
    v_e_c(1, 23, 15, '║');
    v_e_c(1, 24, 15, '╚');
    v_e_c(80, 22, 15, '╗');
    v_e_c(80, 23, 15, '║');
    v_e_c(80, 24, 15, '╝');
    v_e_c(20, 22, 15, '╦');
    v_e_c(20, 23, 15, '║');
    v_e_c(20, 24, 15, '╩');
    v_e_c(40, 22, 15, '╦');
    v_e_c(40, 23, 15, '║');
    v_e_c(40, 24, 15, '╩');
    v_e_c(60, 22, 15, '╦');
    v_e_c(60, 23, 15, '║');
    v_e_c(60, 24, 15, '╩');
    v_e_c(9, 23, blue, 'ORAL');
    v_e_c(27, 23, blue, 'ISCUTER');
    v_e_c(46, 23, blue, 'MUSIQUE');
    v_e_c(69, 23, blue, 'ORTIE');
    textbackground(lightgray);
    v_e_c(8, 23, 14, 'M');
    v_e_c(26, 23, 14, 'D');
    v_e_c(47, 23, 14, 'U');
    v_e_c(68, 23, 14, 'S');
  END;

{*************************FIN AFFICHE TAVERNE*******************************}

{*********************** Début port *************************************}

  PROCEDURE port;

  VAR
    x,y,i : INTEGER;

    BEGIN

     x:= 21;
     Textbackground(black);
     v_e_c (2, 11, green, '▄');
     v_e_c (2, 12, 2, '▄█▄▄');
     v_e_c (1, 13, 2, '▀  ▀▄▀');
     v_e_c (1, 16, 2, '███');
     v_e_c (3, 13, brown, '█');
     v_e_c (2, 14, 6,'█');
     v_e_c (1, 15, 6, '█');
     v_e_c (2, 15, 14, '▄▄▄');
     v_e_c (5, 15, 1, '▄▄▄▄▄▄');
     Textbackground(blue);
     v_e_c (1, 17, yellow, '██████████');
     v_e_c (4, 16, 14, '███▄▄▄▄');
     FOR x :=15 to 64 DO
       BEGIN
         textbackground(black);
         v_e_c(x,15,1, '▄');
         textbackground(blue);
         v_e_c(x,16,14, '▄');
         v_e_c(x,17,14, '█');
       END;
     FOR x:= 64 TO 80 DO
       BEGIN
        FOR y := 15 TO 21 DO
          BEGIN
            v_e_c(x,y,green,'█');
          END;
       END;
     Textbackground(lightgray);
     FOR x := 1 to 72 DO
       BEGIN
         FOR y := 18 TO 20 DO
           BEGIN
           v_e_c(x,y,darkgray,' ');
           END;
       END;
     v_e_c(76,15,8,'  ');
     v_e_c(74,16,8,'    ');
     v_e_c(72,17,8,'     ');
     v_e_c(71,18,8,'      ');
     v_e_c(71,19,8,'     ');
     v_e_c(71,20,8,'   ');
     FOR x:= 1 TO 60 DO
       BEGIN
         v_e_c(x, 18, yellow,'▀');
       END;
     FOR x:= 61 to 65 DO
       BEGIN
         v_e_c(x,18,green,'▀');
       END;
     textbackground(brown);
     v_e_c(60,21,yellow,'▄▀▀     ');
     v_e_c(68,21,green,'▄▄');
     FOR x := 1 TO 59 DO
       BEGIN
         v_e_c(x,21,yellow,'█');
       END;
     v_e_c(67,13,6,'             ');
     v_e_c(73,14,6,'█');
     v_e_c(73,15,6,'█');
     textbackground(green);
     v_e_c(72,15,3,'▄');
     v_e_c(74,15,3,'▀▄');
     v_e_c(71,16,3,'▀█▀▀');
     textbackground(lightgray);
     v_e_c(5,19,darkgray,'▄     ▄▄          ▄▌    ▀█');
     v_e_c(44,19,8,'▄▄▀▀          ▄▄     ▀');
     v_e_c(7,20,8,'▄█       ▀▀▄        ▌');
     v_e_c(50,20,8,'▀▄');
     v_e_c(70,20,8,'▀▀');
     textbackground(cyan);
     v_e_c(38,18,yellow,'▀');
     textbackground(lightgray);
     v_e_c(36,19,cyan,'▄█▄');
     v_e_c(35,20,3,'▀ ▀█▀');
     v_e_c(76,16,8,'▄');
     v_e_c(74,17,8,'▄');
     v_e_c(73,18,8,'▄▀');
    END;

{*********************** Fin port ********************************}
{*********************** D‚but maison 1,1 ********************************}

  PROCEDURE maison1_1;

    BEGIN
      textbackground (black);
      v_e_c (15, 6, red, '▄▄');
      v_e_c (13, 7, 4, '██████');
      v_e_c (12, 8, 4, '████████');
      textbackground (white);
      v_e_c (11, 9, 4,'█▀██▀██▀██');
      v_e_c (11, 10,brown,' ▄▄▄  ▄▄▄ ');
      v_e_c (11,11,6,'          ');
      v_e_c (11,12,6,' ▀▀▀  ▀▀▀ ');
      v_e_c (11,14,6,' ▀  ▀ ▄█▄ ');
      v_e_c (11,15,6,' ╔══╗     ');
      v_e_c (11,16,6,' ║██║ ▀▀▀ ');
      v_e_c (11,17,6,' ║██║     ');
      v_e_c (12,11,green,'▐');
      v_e_c (14,11,2,'▌');
      v_e_c (17,11,2,'▐');
      v_e_c (19,11,2,'▌');
      v_e_c (11,13,2,'▄▄▄▄▄▄▄▄▄▄');
      v_e_c (17,15,2,'▐');
      v_e_c (19,15,2,'▌');
      textbackground(cyan);
      v_e_c(13,11,brown,'┼');
      v_e_c(18,11,6,'┼');
      v_e_c(18,15,6,'┼');
    END;

{*********************** Fin maison 1,1 ********************************}

{*********************** D‚but maison 1,2 ********************************}

  PROCEDURE maison1_2;

    BEGIN
      Textbackground (black);
      v_e_c (13, 9, red,  '▄████▄');
      v_e_c (11, 10, 4, '▄████████▄');
      textbackground (Lightgray);
      v_e_c (11, 12, 4, '          ');
      v_e_c (11, 13, 4, '          ');
      v_e_c (11, 12, 4, '   ▄  ▄   ');
      v_e_c (11, 14, 4, '   ╔══╗   ');
      v_e_c (15, 12, black, '▄▄');
      v_e_c (11, 15, yellow, '   ▀  ▀   ');
      v_e_c (11, 16, 14, ' ░░    ░░ ');
      v_e_c (11, 17, 14, '          ');
      v_e_c (11, 11, brown, ' ▀  ▀  ▀  ');
      Textbackground (brown);
      v_e_c (15, 16, 7, '  ');
      v_e_c (15, 17, 7, '  ');
      v_e_c (13, 13, 7, '▀');
      v_e_c (18, 13, 7, '▀');
      v_e_c (14, 13, red, '▀');
      v_e_c (17, 13, red, '▀');
      v_e_c (15, 13, black, '▀▀');
    END;

{*********************** Fin maison 1,2 ********************************}

{***************************MAISON3_2***********************************}

  PROCEDURE maison3_2;

    VAR I, J, x : INTEGER;

    BEGIN
      x := 32;
      textbackground(black);
      FOR I := x+1 TO x+3 DO
        BEGIN
          FOR J := 7 TO 17 DO
            BEGIN
              v_e_c(I, J, white, '█');
            END;
        END;
      FOR I := x+4 TO x+10 DO
        BEGIN
          FOR J := 14 TO 17 DO
            BEGIN
              v_e_c(I, J, white, '█');
            END;
        END;
      v_e_c(x+1, 7, white, '▌');
      v_e_c(x+3, 7, white, '▐');
      v_e_c(x+2, 13, white, '▌');
      v_e_c(x+2, 15, white, '▌');
      v_e_c(x+1, 6, magenta, '▄█▄');
      v_e_c(x+4, 13, 5, '██████▄');
      textbackground(brown);
      v_e_c(x+1, 9, white, '▀ ▀');
      v_e_c(x+1, 10, 15, '█ █');
      v_e_c(x+5, 16, 15, '   ');
      v_e_c(x+5, 17, 15, '   ');
      textbackground(lightgray);
      v_e_c(x+6, 15, brown, '▄');
      v_e_c(x+6, 14, white, '▀');
      v_e_c(x+4, 15, 15, '▀ ');
      v_e_c(x+4, 16, 15,' ');
      v_e_c(x+4, 17, 15, ' ');
      v_e_c(x+7, 15, 15, ' ▀');
      v_e_c(x+8, 16, 15, ' ');
      v_e_c(x+8, 17, 15, ' ');
    END;

{****************************FIN MAISON3_2*****************************}

{******************************MAISON2_1*********************************}

  PROCEDURE maison2_1;

    VAR x : INTEGER;
                   
    BEGIN
      x := 21;
      textbackground(black);
      v_e_c(x+1, 6, lightgray, '█ ▄');
      v_e_c(x+1, 7, 7, '▀█▀▄▀▄');
      v_e_c(x+2, 8, 7, '▀█');
      v_e_c(x+3, 9, darkgray, '█');
      v_e_c(x+2, 10, brown, '▄██████▄');
      v_e_c(x+1, 11, 6, '██████████');
      textbackground(brown);
      v_e_c(x+1, 12, green, '███▄  ▄███');
      v_e_c(x+1, 15, white, '█   ██   █');
      v_e_c(x+1, 16, white, '██████████');
      textbackground(green);
      v_e_c(x+1, 13, brown, '╦═╦═╦═╦═╦═');
      v_e_c(x+1, 14, 6, '╩═╩═╩═╩═╩═');
      v_e_c(x+5, 12, yellow, '██');
      v_e_c(x+1, 17, white, '██  ██████');
      textbackground(lightgray);
      v_e_c(x+3, 17, black, '▄▄');
      textbackground(cyan);
      v_e_c(x+3, 15, brown, '┼');
      v_e_c(x+8, 15, brown, '┼');
    END;

{*****************************FIN MAISON2_1******************************}

{******************************MAISON3_1**********************************}
 
  PROCEDURE maison3_1;

    VAR I, J, x : INTEGER;

    BEGIN
      x := 32;
      Textbackground(black);
      FOR I := x+3 TO x+8 DO
        BEGIN
          FOR J := 6 TO 11 DO
            BEGIN
              v_e_c(I, J, lightgray ,'█');
            END;
        END;
      FOR I := x+1 TO x+10 DO
        BEGIN
          FOR J := 12 TO 17 DO
            BEGIN
              v_e_c(I, J, lightgray ,'█');
            END;
        END;
      v_e_c(x+5, 2, magenta, '▐▌');
      v_e_c(x+4, 3, 5, '▄██▄');
      v_e_c(x+3, 4, 5, '▐█▌▐█▌');
      v_e_c(x+3, 5, 5, '█▀  ▀█');
      v_e_c(x+5, 6, lightgray, '▄▄');
      v_e_c(x+1, 13, 7, '▌');
      v_e_c(x+10, 13, 7, '▐');
      v_e_c(x+1, 14, 7, '▌');
      v_e_c(x+10, 14, 7, '▐');
      v_e_c(x+2, 10, 7, '▐');
      v_e_c(x+9, 10, 7, '▌');
      v_e_c(x+1, 11, 7, '▄█');
      v_e_c(x+9, 11, 7, '█▄');
      Textbackground(lightgray);
      v_e_c(x+4, 12, darkgray, '┼  ┼');
      v_e_c(x+5, 13, 8, '▄▄');
      v_e_c(x+2, 16, 8, '▐      ▌');
      textbackground(black);
      v_e_c(x+4, 14, 8, '█  █');
      v_e_c(x+3, 15, 8, '█    █');
      v_e_c(x+2, 17, 8, '█      █');
      v_e_c(x+3, 16, 8, '      ');
      v_e_c(x+4, 16, brown, '▐██▌');
      v_e_c(x+4, 17, 6, '▐██▌');
      textbackground(blue);
      v_e_c(x+5, 8, lightgreen, '▒▒');
      v_e_c(x+4, 9, 10, '▒▒▒▒');
      v_e_c(x+5, 10, 10, '▒▒');
    END;

{*********************************FIN MAISON3_1************************}

{*********************************MAISON4_1************************}
PROCEDURE maison4_1;

VAR
  x : INTEGER;

BEGIN
  x:= 43;
  textbackground(black);
  v_e_c(x+3,11,lightgray, '▄▄██▄▄');
  v_e_c(x+1,12,7, '▄████████▄');
  textbackground(7);
  v_e_c(x+1,13,8, ' ██ ██ ██ ');
  v_e_c(x+1,14,8, ' ██ ██ ██ ');
  v_e_c(x+1,15,8, ' ██ ██ ██ ');
  v_e_c(x+1,16,8, ' ▀▀    ▀▀ ');
  v_e_c(x+1,17,8, '▀▀▀▀▀▀▀▀▀▀');
  v_e_c(x+5,14,0, '██ ');
  v_e_c(x+5,15,0, '██ ');
  v_e_c(x+5,16,0, '▀▀');
END;

{****************************FIN MAISON 4_1*******************************}

{******************************MAISON4_2**********************************}

  PROCEDURE maison4_2;

    VAR I, J, x : INTEGER;

    BEGIN
      x := 43;
      Textbackground(red);
      FOR I := x+2 TO x+9 DO
        BEGIN
          FOR J := 10 TO 13 DO
            BEGIN
              v_e_c(I, J, yellow, '▒');
            END;
        END;
      textbackground(black);
      v_e_c(x+3, 12, 0, '█');
      v_e_c(x+6, 12, 0, '█');
      v_e_c(x+1, 10, brown, '▄▄▄▄▄▄▄▄▄▄');
      textbackground(white);
      v_e_c(x+1, 14, 6, '▀▀▀▀▀▀▀▀▀▀');
      FOR I := x+2 TO x+9 DO
        BEGIN
          FOR J := 15 TO 17 DO
            BEGIN
              v_e_c(I, J, yellow, ' ');
            END;
        END;
      v_e_c(x+3, 15, red, 'BANQUE');
      textbackground(lightgray);
      v_e_c(x+3, 16, black, '║║║║║║');
      v_e_c(x+3, 17, 0, '║║║║║║');
    END;

{****************************FIN MAISON4_2******************************}

{***************************MAISON5_1***********************************}

  PROCEDURE maison5_1;

    VAR I, J, x : INTEGER;

    BEGIN
      x := 54;
      textbackground(black);
      FOR I := x+1 TO x+10 DO
        BEGIN
          FOR J := 7 TO 17 DO
            BEGIN
              v_e_c(I, J, white, '█');
            END;
        END;
      v_e_c(x+2, 5, blue, '▄██  ██▄');
      v_e_c(x+4, 4, 1, '▄██▄');
      textbackground(blue);
      v_e_c(x+1, 6, white, '  ▄████▄  ');
      v_e_c(x+5, 5, 15, '▄▄');
      textbackground(red);
      v_e_c(x+2, 8, white, '▌ ▐▌ ▐');
      v_e_c(x+5, 10, 15, '▌ ▐');
      v_e_c(x+2, 12, 15, '▌ ▐▌ ▐▌ ▐');
      v_e_c(x+1, 14, brown, ' ▄ ▄ ▄ ▄ ▄');
      v_e_c(x+3, 8, black, '│');
      v_e_c(x+9, 8, 0, '│');
      v_e_c(x+3, 10, 0, '│');
      v_e_c(x+9, 10, 0, '│');
      textbackground(brown);
      v_e_c(x+5, 6, white, '▀▀');
      v_e_c(x+2, 15, red, '╦');
      v_e_c(x+9, 15, 4, '╦');
      v_e_c(x+5, 15, white, '▀▀');
      v_e_c(x+2, 16, yellow, '█');
      v_e_c(x+9, 16, 14, '█');
      v_e_c(x+4, 16, black, '┼┼┼┼');
      v_e_c(x+4, 17, 0, '┼┼┼┼');
      textbackground(cyan);
      v_e_c(x+3, 8, brown, '╬');
      v_e_c(x+6, 8, 6, '╬');
      v_e_c(x+6, 10, 6, '╬');
      v_e_c(x+3, 12, 6, '╬');
      v_e_c(x+6, 12, 6, '╬');
      v_e_c(x+9, 12, 6, '╬');
     {textbackground(green);
      v_e_c(x+2, 13, white+blink, 'CHEZ  JC');}
    END;

{*************************FIN MAISON 5_1 ********************************}

{****************************MAISON 2_2 *********************************}
PROCEDURE maison2_2;

  VAR x,i, j : INTEGER;

  BEGIN
    x:= 21;
    textbackground(black);
    v_e_c(x+4, 9 , red, '▄▄▄▄');
    v_e_c(x+1, 10, 4, '▄████████▄');
    textbackground(red);
    v_e_c(x+1, 11, darkgray, '███▄▄▄▄███');
    FOR I := x+1 TO x+10 DO
      BEGIN
        FOR J := 12 TO 17 DO
          BEGIN
            v_e_c(I, J, 8, '█');
          END;
      END;
    Textbackground(lightgray);
    v_e_c(x+2, 12, magenta, '█ █');
    v_e_c(x+7, 12, magenta, '█ █');
    v_e_c(x+4, 14, magenta, '█  █');
    v_e_c(x+3, 15, brown, '┌────┐');
    v_e_c(x+3, 16, 6, '│    │');
    v_e_c(x+3, 17, 6, '│  ██│');
    textbackground(blue);
    v_e_c(x+3, 12, 6, '┼');
    v_e_c(x+8, 12, 6, '┼');
    v_e_c(x+5, 14, 6, '┼┼');
    v_e_c(x+4, 16, black, '████');
    v_e_c(x+4, 17, black, '██');
  END;

{*************************FIN MAISON 2_2 ********************************}

{****************************MAISON 5_2 *********************************}


PROCEDURE maison5_2;

  VAR x,I, J : integer;

  BEGIN
    x := 54;
    Textbackground(lightgray);
    FOR I := x+1 TO x+10 DO
      BEGIN
        FOR J := 4 TO 17 DO
          BEGIN
            v_e_c(I, J, 7, '█');
          END;
      END;
    v_e_c(x+2, 5, lightgreen, '▐  ▌▐  ▌');
    v_e_c(x+2, 7, lightgreen, '▐  ▌▐  ▌');
    v_e_c(x+7, 15, lightgreen, '▐  ▌');
    v_e_c(x+7, 16, lightgreen, '▐  ▌');
    v_e_c(x+3, 14, brown, '▐ ▌');
    v_e_c(x+2, 17, 6, '▐█ █▌');
    v_e_c(x+1, 13, red, '▀ ▀ ▀ ▀ ▀');
    textbackground(black );
    v_e_c(x+5, 1, 4, '▄▄');
    v_e_c(x+3, 2, 4, '▄████▄');
    v_e_c(x+1, 3, 4, '▄████████▄');
    textbackground(red);
    v_e_c(x+5, 2, yellow, '▄▄');
    v_e_c(x+5, 3, yellow, '▀▀');
    v_e_c(x+1, 11, 14, '║ ║ ║ ║ ║ ');
    v_e_c(x+1, 12, 14, '║ ║ ║ ║ ║ ');
 {  v_e_c(x+1, 9, 14+128, 'CHEZ  PAUL');}
    textbackground(cyan);
    v_e_c(x+3, 5, black, '┼┼');
    v_e_c(x+7, 5, black, '┼┼');
    v_e_c(x+3, 7, black, '┼┼');
    v_e_c(x+7, 7, black, '┼┼');
    v_e_c(x+8, 15, black, '┼┼');
    v_e_c(x+8, 16, black, '┼┼');
    textbackground(brown);
    v_e_c(x+4, 14, 0, '│');
    v_e_c(x+4, 15, 0, '│');
    v_e_c(x+3, 16, 0, '┌│┐');
    v_e_c(x+4, 17, 0, '│');
  END;

{*************************FIN MAISON 5_2 *********************************}
  
{********************DEBUT DEPLACEMENT**********************************}
PROCEDURE deplacement;

VAR
x,y : INTEGER;

BEGIN
  TEXTBACKGROUND(black);
  clrscr;
  TEXTBACKGROUND(cyan);
  FOR x := 1 TO 80 DO
  BEGIN
    FOR y := 1 TO 6 DO
    BEGIN
      v_e_c (x, y, 3, ' ');
    END;
  END;
  FOR x := 1 TO 80 DO
  BEGIN
    v_e_c(x,9,white,'▓');
  END;
  FOR x := 1 TO 80 DO
  BEGIN
    v_e_c(x,8,white,'▒');
  END;
  FOR x := 1 TO 80 DO
  BEGIN
    v_e_c(x,7,white,'░');
  END;
  
  FOR x := 1 TO 80 DO
  BEGIN
    FOR y := 10 TO 24 DO
    BEGIN
      v_e_c (x, y, blue, '█');
    END;
  END;
  y :=4;
  v_e_c(31,Y+2,red    ,'▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄');
  v_e_c(25,Y+3,4,'██████████████  ██████████████');
  v_e_c(26,Y+4,4, '█████████████  █████████████');
  v_e_c(39,Y,6,'▐▌');
  v_e_c(39,Y+1,6,'▐▌');
  v_e_c(39,Y+2,6,'▐▌');
  TEXTBACKGROUND(blue);
  v_e_c(28,Y+6,4,'▐');
  v_e_c(51,Y+6,4,'▌');
  v_e_c(29,Y+8,4,'▐');
  v_e_c(29,Y+9,4,'▐');
  v_e_c(50,Y+8,4,'▌');
  v_e_c(50,Y+9,4,'▌');
  v_e_c(28,Y+12,4,'▐');
  v_e_c(51,Y+12,4,'▌');
  v_e_c(26,Y+14,4,'▄████▀▀▀▀▀        ▀▀▀▀▀████▄');
  TEXTBACKGROUND(brown);
  v_e_c(27,Y+5,4  ,'▀▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀▀');
  v_e_c(29,Y+6,4   ,'██████████  ██████████');
  v_e_c(29,Y+7,4   ,'██████████  ██████████');
  v_e_c(30,Y+8,4    ,'█████████  █████████');
  v_e_c(30,Y+9,4    ,'█████████  █████████');
  v_e_c(29,Y+10,4   ,'▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄');
  v_e_c(29,Y+11,4   ,'██████████  ██████████');
  v_e_c(29,Y+12,4   ,'██████████  ██████████');
  v_e_c(28,Y+13,4  ,'██████████    ██████████');
  v_e_c(24,Y+10,1,'▄▄▄▄▄');
  v_e_c(51,Y+10,1,'▄▄▄▄▄');
  v_e_c(38,Y+13,1,'▌  ▐');
  v_e_c(39,Y+3,1,'  ');
  v_e_c(39,Y+4,0,'══');
  v_e_c(39,Y+6,0,'══');
  v_e_c(39,Y+7,0,'ðð');
  v_e_c(39,Y+11,0,'ðð');
  v_e_c(38,Y+14,0,'▌  ▐');
  v_e_c(38,Y+15,0,'▌  ▐');
  v_e_c(37,Y+16,0,'█ðððð█');
  v_e_c(37,Y+17,0,'█ðððð█');
  v_e_c(31,Y+20,0,'  ██    ██    ██  ');
  v_e_c(33,Y+15,1,'▀');
  v_e_c(46,Y+15,1,'▀');
  v_e_c(31,Y+16,1,'▀ ');
  v_e_c(47,Y+16,1,' ▀');
  v_e_c(30,Y+17,1,' ');
  v_e_c(49,Y+17,1,' ');
  v_e_c(28,Y+18,1,'▀ ');
  v_e_c(50,Y+18,1,' ▀');
  v_e_c(27,Y+19,1,' ');
  v_e_c(26,Y+20,1,' ');
  v_e_c(52,Y+19,1,' ');
  v_e_c(53,Y+20,1,' ');
  v_e_c(33,Y+16,0,'▓▓▓▓');
  v_e_c(43,Y+16,0,'▓▓▓▓');
  v_e_c(31,Y+17,0,'▓▓▓▓▓▓');
  v_e_c(43,Y+17,0,'▓▓▓▓▓▓');
  v_e_c(30,Y+18,0,'▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓');
  v_e_c(28,Y+19,0,'▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓');
  v_e_c(27,Y+20,0,'▓▓▓▓');
  v_e_c(49,Y+20,0,'▓▓▓▓');
  TEXTBACKGROUND(blue);
  v_e_c(37,Y+14,0,'▄');
  v_e_c(42,Y+14,0,'▄');
  v_e_c(34,Y+15,0,'▄███');
  v_e_c(42,Y+15,0,'███▄');
  TEXTBACKGROUND(cyan);
  v_e_c(66,2,4,'DISTANCE:');
  
END;
{*********************FIN DEPLACEMENT***************************************}

{*********************AFFICHE MARCHE****************************************}
PROCEDURE affich_marche;

VAR
  y : integer;

BEGIN
  textbackground (cyan);
  clrscr;
  v_e_c(1, 1, white, '┌────────────────────────────────────────────────────┐ ┌──────────────────┬────┐');
  v_e_c(1,2,15,      '│                                                    │ │                  │    │');
  v_e_c(1,3,15,      '│                                                    │ ├──────────────────┼────´');
  v_e_c(1,4,15,      '│                                                    │ │                  │    │');
  v_e_c(1,5,15,      '└────────────────────────────────────────────────────┘ │                  │    │');
  v_e_c(1,6,15,      '┌───────────────┬────┬────┐┌───────────────┬────┬────┐ │                  │    │');
  v_e_c(1,7,15,      '│               │    │    ││               │    │    │ │                  │    │');
  v_e_c(1,8,15,      '├───────────────┼────┼────´├───────────────┼────┼────´ │                  │    │');
  FOR Y:=9 to 20 DO
    BEGIN
      v_e_c(1,Y,15,  '│               │    │    ││               │    │    │ │                  │    │');
    END;
  v_e_c(1,21,15,     '└───────────────┴────┴────┘└───────────────┴────┴────┘ ├──────────────────┼────´');
  v_e_c(1,22,15,     '╔════════════════════════════════════════════════════╗ │                  │    │');
  v_e_c(1,23,15,     '║                                                    ║ │                  │    │');
  v_e_c(1,24,15,     '╚════════════════════════════════════════════════════╝ └──────────────────┴────┘');
  v_e_c(61,2,1,'CARGAISON:');
  v_e_c(76,2,1,'NBRE');
  v_e_c(3,7,blue,'MARCHANDISES:');
  v_e_c(30,7,blue,'MARCHANDISES:');
  v_e_c(18,7,1,'PRIX');
  v_e_c(45,7,1,'PRIX');
  v_e_c(23,7,1,'NBRE');
  v_e_c(50,7,1,'NBRE');
  v_e_c(11,2,1,'  █ █     █   ▄▀▄ ▄▀▀  █ █▀  ▄▀ ');
  v_e_c(11,3,1,' █▀▄▀█   █▄█  █▄▀ █    █▄█  ▀▄▄ ');
  v_e_c(11,4,1,'█    ▀▄ ▄▀ █ ▄▀ █  ▀▄ ▄▀ █  █▄▄ ');
  v_e_c(26,23,1,'ORTIE');
  textbackground(lightgray);
  v_e_c(25,23,14,'S');
  textbackground(cyan);

END;
{**************************FIN AFFICHE MARCHE*******************************}

{****************************AFFICHE BANQUE****************************************}
PROCEDURE affich_banque; 

    VAR
      i : INTEGER;

    BEGIN

      textbackground(cyan);
      Clrscr;
      v_e_c( 1,22, white,'╔═════════════════════════╦══════════════════════════╦═════════════════════════╗');
      v_e_c( 1,23, white,'║                         ║                          ║                         ║');
      v_e_c( 1,24, white,'╚═════════════════════════╩══════════════════════════╩═════════════════════════╝');
      v_e_c(65, 23,blue,'ORTIE');
      v_e_c(13, 23,1, 'EPOT');
      v_e_c(39, 23,1, 'ETRAIT');
      textbackground(lightgray);
      v_e_c(64,23,yellow,'S');
      v_e_c(12, 23, 14, 'D');
      v_e_c(38, 23, 14, 'R');
      textbackground(cyan);
      FOR i := 1 TO 80 DO
        BEGIN
          v_e_c(i, 1, white,'─');
          v_e_c(i, 5, 15,'─');
        END;
      FOR i := 1 TO 5 DO
        BEGIN
          v_e_c(1, i, 15,'│');
          v_e_c(80, i, 15,'│');
        END;
      v_e_c(1, 1, 15,'┌');
      v_e_c(1, 5, 15,'└');
      v_e_c(80, 1, 15,'┐');
      v_e_c(80, 5, 15,'┘');
      v_e_c(24, 2, blue, '▀█▀▀▄   █   █▄ ▄▀  ▄▀▄  █  ▄▀  ▄▀');
      v_e_c(24, 3, 1   , ' █▀█▄  █▄█  █ ▀▄  █   █ █  █  ▀▄▄');
      v_e_c(24, 4, 1   , '▄▀▄▄█ ▄▀ █ ▄▀  █   ▀▄▀▄  █▄▀  █▄▄');
      FOR i := 25 TO 53 DO
        BEGIN
          v_e_c(i, 8, white,'─');
          v_e_c(i, 12, 15,'─');
          v_e_c(i, 10, 15, '─');
        END;
      FOR i := 8 TO 12 DO
        BEGIN
          v_e_c(25, i, 15,'│');
          v_e_c(53, i, 15,'│');
        END;
      v_e_c(25, 8, 15,'┌');
      v_e_c(25, 12, 15,'└');
      v_e_c(53, 8, 15,'┐');
      v_e_c(53, 12, 15,'┘');
      v_e_c(25, 10, 15, '├');
      v_e_c(53, 10, 15, '´');
      FOR i := 11 TO 69 DO
        BEGIN
          v_e_c(i, 16, white,'─');
          v_e_c(i, 19, 15,'─');
        END;
      FOR i := 16 TO 19 DO
        BEGIN
          v_e_c(11, i, 15,'│');
          v_e_c(69, i, 15,'│');
        END;
      v_e_c(11, 16, 15,'┌');
      v_e_c(11, 19, 15,'└');
      v_e_c(69, 16, 15,'┐');
      v_e_c(69, 19, 15,'┘');

END;




end.