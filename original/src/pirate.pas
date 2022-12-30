
PROGRAM pirates;

USES
  Crt, present, carte, outils, ecr_jeux,combat;


TYPE
  ident = record
    tabsoute : ARRAY [1..17] of INTEGER;
    nom : STRING[12];
    test : INTEGER;
    grade : STRING[12];
    argent :LONGINT;
    arg_bank : LONGINT;
    homme : INTEGER;
    bateau : STRING[12];
    numebat : INTEGER;
    mat : INTEGER;
    soute : INTEGER;
    soutemax : INTEGER;
    canon : INTEGER;
    taboute: ARRAY [1..11] OF STRING;
    taboutva : ARRAY [1..11] OF STRING;
    tabnombre2 : ARRAY [1..17] OF INTEGER;
    Tabmarch_prix : ARRAY [1..17] OF INTEGER;
    arial : string;
    distance : REAL;
  END;
  fichier2 = file of ident;

  sauvegarde = record
     nom : string[12];
     grade : string[12];
     argent: longint;
     arg_bank : longint;
  end;
  fichier = file of sauvegarde; 

CONST
  tabvil : ARRAY[1..15, 1..11] OF STRING = (
{                                         **COORD**   *********MAISON*******    *STATUT*
       VILLE                PAYS           X     Y     1    2    3    4    5                     }
('1' , ' V‚racruz  ', 'Nlle Espagne    ', '12', '6' , '1', '2', '1', '1', '2', 'riche  '),
('2' , ' Campêche  ', 'Mexique         ', '17', '11', '1', '1', '2', '2', '1', 'pauvre '),
('3' , ' La Havane ', 'Cuba            ', '33', '9' , '1', '2', '2', '1', '2', 'modeste' ),
('4' , ' La Tortue ', 'Ile de la Tortue', '51', '10', '2', '1', '1', '2', '2', 'riche  '          ),
('5' , 'Porto Bello', 'Mexique         ', '37', '18', '2', '2', '1', '1', '1', 'modeste'           ),
('6' , '  Panama   ', 'Mexique         ', '34', '18', '1', '1', '1', '1', '1', 'riche  '           ),
('7' , ' Cartag‚na ', 'Nlle Grenade    ', '46', '18', '2', '1', '2', '1', '2', 'pauvre '           ),
('8' , 'Marguerite ', 'Iles Vierges    ', '65', '8' , '1', '2', '2', '2', '1', 'pauvre '           ),
('9' , ' St Thomas ', 'Ven‚zu‚la       ', '54', '20', '2', '1', '2', '1', '2', 'modeste'           ),
('10', '  Grenade  ', 'Iles Vierges    ', '75', '15', '1', '2', '1', '2', '1', 'modeste'           ),
('11', 'Port Royal ', 'Nlle Espagne    ', '25', '3' , '2', '2', '2', '2', '2', 'riche  '           ),
('12', ' Long Ben  ', 'Floride         ', '38', '3' , '1', '1', '2', '1', '1', 'riche  '           ),
('13', ' Acapulco  ', 'Nlle Espagne    ', '17', '18', '2', '2', '1', '2', '2', 'riche  '           ),
('14', 'St Domingue', 'Ha‹ti           ', '56', '13', '2', '1', '2', '2', '1', 'modeste'           ),
('15', 'Porto Rico ', 'Iles Vierges    ', '74', '10', '2', '1', '2', '1', '1', 'pauvre '           ));


  tabfrequence : ARRAY  [1..4,1..15] OF INTEGER =
{ ville      1   2   3   4   5   6   7   8   9   10   11   12   13   14   15}
{PIRATE} ((  10, 8,  7,  5,  6,  6,  8,  6,  9,   7,  10,  7,   7,   6,    6),
{COMMERCE}(   4, 6,  7,  9,  8,  8,  6,  8,  5,   6,  4,   7,   7,   8,    8),
{TEMPETE} ( 30, 30, 30, 20, 30, 30, 30, 20, 30, 20,  30,  20,  20,  20,  20),
{TRESOR}  (100,100,100,100,100,100,100,60,100,100,100,100, 60, 60, 100));



  tabbat : ARRAY[1..5, 1..5] OF INTEGER = (

{  BATEAU    NB MAT  SOUTE  VITESSE  CANON  HOMME }
{Caravelle}(   1   ,  65  ,   165  ,   6  ,  15),
{Flute    }(   3   ,  30  ,   250  ,  10  ,  20),
{Caravelle}(   2   , 100  ,   125  ,  11  ,  25),
{Galion   }(   3   , 180  ,   100  ,  25  ,  65),
{Galion   }(   4   , 250  ,   85   ,  36  , 100)
);

  tabbatprix : ARRAY[1..5] OF LONGINT =

{ Cara1    Flute   Cara2   Gali1   Gali2}
( 5000  ,  30000 , 15000 , 60000 , 100000);

  prix_march_min : ARRAY [1..15,1..17] OF INTEGER =
{FAR.   FRU. EAU VIA. POI. ALC.  BIJ. PIE. FOU. TIS. ARG. OR.  BOI. TAB. EPI. COR. HUI.}
(( 1,   24,   5,  35,  55, 150, 490,  350,  65,  45, 259, 210, 120,  15, 130, 155,   9),
 ( 6,   16,   5,  35,  49,  75, 460,  310,  85,  59, 298, 210, 102,  15, 110, 145,  12),
 (10,    8,   7,  35,  42,  25, 450,  270, 105,  74, 342, 210,  88,  15,  90, 137,  15),
 ( 7,   13,   6,  35,  45,  90, 460,  290,  95,  66, 320, 210,  94,  15, 100, 141,  14),
 ( 5,   21,   6,  35,  53, 100, 470,  330,  75,  52, 284, 210, 108,  15, 119, 150,  10),
 ( 2,   23,   4,  35,  60, 105, 490,  350,  65,  46, 264, 210, 120,  15, 132, 155,   8),
 ( 6,   15,   5,  35,  49, 120, 480,  310,  85,  58, 301, 210, 100,  15, 108, 145,  13),
 (16,    6,   8,  35,  35,  20, 450,  250, 115,  86, 365, 210,  80,  15,  85, 136,  18),
 ( 5,   19,   5,  35,  55, 103, 490,  330,  75,  52, 285, 210, 110,  15, 123, 152,  10),
 (11,    7,   7,  35,  42,  21, 460,  270, 105,  75, 336, 210,  92,  15,  94, 138,  17),
 ( 1,   24,   4,  35,  55, 100, 480,  350,  65,  48, 261, 210, 120,  15, 130, 156,   7),
 ( 8,   14,   6,  35,  46,  75, 470,  290,  95,  67, 321, 210,  94,  15,  98, 142,  14),
 ( 2,   25,   5,  35,  50, 180, 496,  350,  65,  44, 260, 210, 119,  15, 136, 154,   8),
 (10,    9,   7,  35,  40,  70, 455,  270, 105,  76, 340, 210,  90,  15,  94, 136,  15),
 (17,    5,   8,  35,  32,  40, 420,  250, 115,  84, 358, 210,  80,  15,  82, 134,  19));

  prix_march_max : ARRAY [1..15,1..17] OF INTEGER =
{FAR.  FRU.  EAU  VIA. POI. ALC.  BIJ.  PIE.  FOU.  TIS.  ARG.  OR.  BOI. TAB. EPI. COR. HUI.}
(( 7,   29,   6,  50,  64,  250,  570,  450,   75,   55,  343,  270, 141, 30,  170, 186,  12),
 (11,   20,   7,  50,  56,  150,  550,  410,   95,   70,  378,  270, 112, 30,  150, 174,  17),
 (15,   10,   8,  50,  65,  110,  530,  370,  115,   84,  422,  270, 110, 30,  130, 168,  20),
 (12,   16,   9,  50,  57,  210,  540,  390,  105,   76,  400,  270, 116, 30,  140, 171,  18),
 (10,   24,   7,  50,  62,  200,  560,  430,   85,   61,  460,  270, 126, 30,  159, 181,  13),
 ( 7,   28,   6,  50,  70,  305,  570,  450,   75,   55,  343,  270, 140, 30,  174, 184,  13),
 (10,   19,   7,  50,  55,  130,  540,  410,   95,   69,  382,  270, 122, 30,  147, 174,  16),
 (20,    9,  11,  50,  40,   70,  510,  350,  124,   95,  442,  270, 102, 30,  118, 164,  22),
 ( 9,   23,   7,  50,  60,  203,  550,  430,   85,   62,  365,  270, 128, 30,  157, 181,  14),
 (14,   13,   9,  50,  50,  150,  520,  370,  115,   84,  425,  270, 112, 30,  136, 167,  19),
 ( 6,   27,   5,  50,  65,  300,  560,  450,   75,   54,  348,  270, 140, 30,  172, 184,  12),
 (12,   17,   8,  50,  54,  125,  530,  390,  107,   76,  401,  270, 114, 30,  136, 170,  18),
 ( 6,   30,   6,  50,  70,  220,  555,  450,   67,   55,  342,  270, 139, 30,  176, 183,  12),
 (13,   11,   8,  50,  50,   80,  520,  370,  117,   85,  422,  270, 110, 30,  137, 168,  21),
 (19,    9,  11,  50,  38,   90,  505,  350,  126,   96,  443,  270, 100, 30,  122, 164,  22));

tabnombre : ARRAY [1..17] OF INTEGER =
 {FAR.  FRU.  EAU  VIA. POI. ALC.  BIJ.  PIE.  FOU.  TIS.  ARG.  OR.  BOI. TAB. EPI. COR. HUI.}
(99,   60,   99,  56,  70,  83,   20,   35,   45,   50,   29,   33,  40,  65,  15,  40,  70);



VAR
  i,j : INTEGER;
  sauve : fichier;
  contenu : sauvegarde;
  reponse: file of char;
  article  : char;
  fiche : fichier2;
  identite : ident;
  carac : CHAR;
  doop : char;

{******************************sauvegarde*********************************}
   PROCEDURE enregistr;
     BEGIN
       reset(fiche);
       write(fiche,identite);
       close(fiche);
     END;

PROCEDURE sauvegard(nom:string;grade:string;argent:longint;arg_bank:longint);

  begin
    assign (sauve,'savegame.dat');
    rewrite (sauve);
    with contenu do
      begin
        nom := nom;
        grade := grade;
        argent := argent;
        arg_bank := arg_bank;
      end;
    close(sauve);
  end;


{******************************TAVERNE************************************}

PROCEDURE taverne;

  VAR
    choix : CHAR;

  PROCEDURE moral;

    BEGIN
      readln;
    END;

  PROCEDURE discuter;

    BEGIN
      affich_tav_disc;
      choix := READKEY;
      IF UPCASE(choix) = 'A' THEN
        BEGIN
          textbackground(cyan);
          FOR i := 28 TO 69 DO
            BEGIN
              v_e_c(i, 7, 15, '─');
              v_e_c(i, 15, 15, '─');
              v_e_c(i, 17, 15, '─');
            END;
          v_e_c(27, 17, 15, '├');
          v_e_c(70, 17, 15, '´');
          v_e_c(48, 17, 15, '┬');
          v_e_c(48, 18, 15, '│');
          v_e_c(48, 19, 15, '┴');
          v_e_c(36, 18, blue, 'CHETER');
          v_e_c(57, 18, 1, 'ENDRE');
          textbackground(LIGHTGRAY);
          v_e_c(35, 18, 14, 'A');
          v_e_c(56, 18, 14, 'V');
        END;
      readln;
    END;


  BEGIN
    affich_taverne;
    REPEAT
      BEGIN
        choix := READKEY;
        CASE UPCASE(choix) OF
   {       'M' : moral;  }
          'D' : discuter;
    {      'U' : musique;  }
        END;
      END;
    UNTIL UPCASE(choix) = 'S';
    readln;
  END;

{***************************FIN TAVERNE**********************************}


{********************************BANQUE*************************************}

PROCEDURE banque;

  VAR
    choix : CHAR;
    depot,retrait : LONGINT;


  BEGIN
    affich_banque;
    REPEAT
    v_e_c(27, 9, 1,  'Tu possèdes     :       ');
    v_e_c(27, 11, 1, 'Tu as en banque :       ');
    v_e_c2(45, 9, black,identite.argent);
    v_e_c2(45, 11, 0, identite.arg_bank);
      BEGIN
        choix := READKEY;
        IF UPCASE(choix) = 'D' THEN
          BEGIN
            REPEAT
              BEGIN
                v_e_c(12, 17, blue, 'Combien d''argent veux tu d‚poser ?         ');
                gotoxy(47,17);
                Readln(depot);
              END;
            UNTIL ((depot >= 0) AND (depot <= identite.argent));
       identite.argent := identite.argent - depot;
       identite.arg_bank:= identite.arg_bank+depot;
          END;
        IF UPCASE(choix) = 'R' THEN
          BEGIN
            REPEAT
              BEGIN
                v_e_c(12, 17, blue, 'Combien d''argent veux tu retirer ?         ');
                gotoxy(47,17);
                Readln(retrait);
              END;
            UNTIL ((retrait >= 0) AND (retrait <= identite.arg_bank));
            identite.argent := identite.argent + retrait;
            identite.arg_bank:= identite.arg_bank-retrait;
          END;

      END;
    UNTIL ((UPCASE(choix) = 'S') OR (ord(choix)=27));
  END;

{**************************TIRAGE PRIX MARCHANDISES*********************}
PROCEDURE tirage_march;

VAR
  num_ville , error , i : integer;

BEGIN
  Randomize;
  Val ( identite.taboute[1], num_ville , error);
  For i := 1 TO 17 DO
    BEGIN
      identite.Tabmarch_prix[i] := (RANDOM(prix_march_max[num_ville,i]-prix_march_min[num_ville,i]))
      +prix_march_min[num_ville,i];
      identite.Tabnombre2 [i]:= (RANDOM(tabnombre[i]));

    END;
END;

{*********************FIN TIRAGE PRIX MARCH******************************}


{**********************PROCEDURE MARCHE***********************************}
PROCEDURE marche;

CONST
  tab_march : ARRAY [1..17,1..3] OF STRING=(('3','9','FARINE'),
                                            ('3','10','FRUIT'),
                                            ('3','11','EAU DOUCE'),
                                            ('3','12','VIANDE'),
                                            ('3','13','POISSON SECHE'),
                                            ('3','14','ALCOOL'),
                                            ('3','15','BIJOUX'),
                                            ('3','16','PIERRE RARE'),
                                            ('3','17','FOURRURE'),
                                            ('3','18','TISSU'),
                                            ('30','9','ARGENT'),
                                            ('30','10','OR'),
                                            ('30','11','BOIS PRECIEUX'),
                                            ('30','12','TABAC'),
                                            ('30','13','EPICES'),
                                            ('30','14','CORAIL'),
                                            ('30','15','HUILE'));

VAR
  curs,y ,i, incre,x, xerreur, yerreur, xx, yy :INTEGER;
  cursor : char;

BEGIN
  Randomize;
  if identite.test = 1 then
    begin
      identite.test:=0;
      tirage_march;
    end;
  affich_marche;
  curs:=1;
  FOR i := 1 TO 17 DO
    BEGIN
      VAL(tab_march [i,1],x, xerreur);
      VAL(tab_march [i,2],y, yerreur);
      v_e_c(x,y,black,tab_march[i,3]);
    END;
  For i := 1 TO 17 DO
    BEGIN
      VAL(tab_march [i,1],x, xerreur);
      VAL(tab_march [i,2],y, yerreur);
      v_e_c2(x+15,y,black,identite.tabmarch_prix[i]);
    END;
      v_e_c2(76,23,blue, tabbat[1,2]);
    REPEAT
      v_e_c  (76,22,cyan,'   ');
      v_e_c2 (76,22,blue,identite.soute);
      v_e_c  (58,22,blue,'Tu possèdes :');
      v_e_c  (70,23,blue,'‚cus.');
      v_e_c  (58,23,cyan,'            ');
      v_e_c2 (58,23,red,identite.argent);
      VAL(tab_march [curs,1],x, xerreur);
      VAL(tab_march [curs,2],y, yerreur);
      incre:=4;
      For i:=1 to 17 Do
        BEGIN
          VAL(tab_march [i,1],xx, xerreur);
          VAL(tab_march [i,2],yy, yerreur);
          v_e_c (xx+20,yy, cyan, '   ');
          v_e_c2 (xx+20, yy, black, identite.tabnombre2[i]);
          If identite.tabsoute[i]<>0
            Then
              BEGIN
                v_e_c(58, incre, black, tab_march[i,3]);
                v_e_c2(76, incre,black, identite.tabsoute[i]);
                incre:= incre +1;
              END;
        END;
        v_e_c(x-1,y, 4,'[');
        v_e_c(x,y, 4,tab_march[curs,3]);
        v_e_c(x+13,y, 4,']');
        v_e_c(40,3,3,'');
        cursor := readkey;
        IF cursor = #80 THEN
          BEGIN
            v_e_c(x-1,y, 0,' ');
            v_e_c(x,y, 0,tab_march[curs,3]);
            v_e_c(x+13,y, 0,' ');
            curs := curs+1;
            IF curs = 18 THEN curs := 1;
          END;
        IF cursor = #77
          Then
            BEGIN
              efface;
              IF (identite.tabnombre2 [curs]>0)  and (identite.argent>=identite.tabmarch_prix[curs]) and
               (identite.soute<tabbat[1,2])
               THEN
                  BEGIN
                    identite.tabnombre2[curs]:=identite.tabnombre2[curs]-1;
                    identite.argent:=identite.argent-identite.tabmarch_prix[curs];
                    identite.tabsoute[curs]:=identite.tabsoute[curs]+1;
                    identite.soute:=identite.soute+1;
                 END;
            END;
        IF cursor = #75
          Then
            BEGIN
              efface;
              IF (identite.tabsoute [curs]>0)
                THEN
                  BEGIN
                    identite.tabnombre2[curs]:=identite.tabnombre2[curs]+1;
                    identite.argent:=identite.argent+identite.tabmarch_prix[curs];
                    identite.tabsoute[curs]:=identite.tabsoute[curs]-1;
                    identite.soute:=identite.soute-1;
                 END;
            END;


        IF cursor = #72 THEN
          BEGIN
            v_e_c(x-1,y, 0,' ');
            v_e_c(x,y, 0,tab_march[curs,3]);
            v_e_c(x+13,y, 0,' ');
            curs := curs-1;
            IF curs = 0 THEN curs := 17;
         END;
     UNTIL ((cursor = 's') or (ord(cursor)=13));
END;


{**************************GESTION DU CHOIX POUR LA CARTE******************}

PROCEDURE gestion_carte;

  VAR
    xclign, yclign, x2clign, y2clign, choix_carte,
    quatre, xerreur, evenement, yerreur, xout, yout,hazard, x2erreur, y2erreur, villedep, villear, milieu : INTEGER;
    choix : CHAR;
    maxi : real;
  BEGIN
    REPEAT
      BEGIN
        REPEAT
          BEGIN
            v_e_c( 78, 2, white, identite.taboute[1]);
            VAL(identite.taboute[4], xout, x2erreur);
            VAL(identite.taboute[5], yout, y2erreur);
            Textbackground(blue);
            v_e_c(xout, yout, white+blink, identite.taboute[1]);
            v_e_c(3, 23, white, 'Choix de la ville de destination : ');
            Readln(choix_carte);
            IF (choix_carte < 1) OR (choix_carte > 15) THEN
              BEGIN
                v_e_c(38, 23, blue, '█████████');
              END;
          END;
        UNTIL (choix_carte > 0) AND (choix_carte < 16);
        v_e_c(xout, yout, white, identite.taboute[1]);
        FOR I := 1 TO 11 DO
          BEGIN
            identite.taboutva[I] := tabvil[choix_carte, I];
          END;
        VAL(identite.taboutva[4], xclign, xerreur);
        VAL(identite.taboutva[5], yclign, yerreur);
        Textbackground(blue);
        v_e_c(xclign, yclign, white+blink, identite.taboutva[1]);
        REPEAT
          BEGIN
            identite.distance :=(SQRT(SQR(xclign-xout)+SQR(yclign-yout)))*33;
            identite.distance := Int (identite.distance);
            Gotoxy(14, 22);
            textcolor(white);
            Write(identite.distance:4:0);
            Gotoxy(3, 23);
            Write('Destination : ', identite.taboutva[2], '  (', identite.taboutva[3], '),  Status : ',
             identite.taboutva[11], ' (O/N) ? ');
            Readln(choix);
            IF (UPCASE(choix) <> 'O') AND (UPCASE(choix) <> 'N') THEN
              BEGIN
                v_e_c(76, 23, blue, '████');
              END;
          END;
        UNTIL (UPCASE(choix) = 'O') OR (UPCASE(choix) = 'N');
        IF UPCASE(choix) = 'O' THEN
          BEGIN
            deplacement;
            maxi :=INT( identite.distance / 200);
            if maxi < 0 then maxi:=1;
            evenement := 0;
            REPEAT
                GOTOXY(75,2);
                TEXTCOLOR(red);
                TEXTBACKGROUND(cyan);
                Write(identite.distance:4:0);
                delay(10);
                identite.distance := identite.distance-1;
                      If Frac(identite.distance/100)=0
                        Then
                          BEGIN
                            val (identite.taboute[1],villedep,xerreur);
                            val (identite.taboutva[1],villear,xerreur);
                            quatre := 0;

{test pirates}
                            If  maxi > evenement
                              then
                                begin
                                  milieu :=(tabfrequence[1,villedep]+tabfrequence[1,villear]) DIV 2;
                                  hazard:=random (milieu);
                                  If hazard = 3
                                    then
                                      begin
                                        longuevue;
                                        pirate;
                                        v_e_c(31,3,4,'C''EST UN PIRATES !!!');
                                        readln;
                                        identite.arial := 'pirate';
                                        ecrancombat;
                                        textcolor(cyan);
                                        mcombat(identite.nom, identite.arial, identite.canon, identite.homme,
                                         identite.soutemax,
                                         identite.numebat);
                                        textcolor(cyan);
                                        readln;
                                        deplacement;
                                        evenement := evenement +1;
                                        quatre :=1;
                                      end;
                                end;

{test fantomes}             If  maxi > evenement
                              then
                                begin
                                  hazard:=random (500);
                                  If hazard = 3
                                    then
                                      begin
                                        longuevue;
                                        decors;
                                        v_e_c(31,3,4,'VAISSEAU FANTOME EN VUE !!!');
                                        readln;
                                        deplacement;
                                        evenement := evenement +1;
                                        quatre :=1;
                                      end;
                                end;



{test commerces}
                            If maxi > evenement
                              then
                                begin
                                  milieu :=(tabfrequence[2,villedep]+tabfrequence[2,villear]) DIV 2;
                                  hazard:=random (milieu);
                                  If (hazard =  2)  AND (quatre =0)
                                    then
                                      begin
                                        longuevue;
                                        decors;
                                        commerce;
                                        v_e_c(29,3,4,'BATEAU DROIT DEVANT !!!');
                                        readln;
                                        identite.arial := 'commerce';
                                        choix2;
                                        assign(reponse,'trans.dat');
                                        reset(reponse);
                                        read(reponse,article);
                                        if article = 'a' then
                                          begin
                                            ecrancombat;

                                           textcolor(cyan);
                                           mcombat(identite.nom, identite.arial, identite.canon, identite.homme,
                                            identite.soutemax,
                                           identite.numebat);
                                           textcolor(cyan);
                                           readln;
                                         end;
                                        close(reponse);
                                        deplacement;
                                        evenement := evenement +1;
                                        quatre :=1;
                                      end;
                                end;
{test tempetes}
                            If maxi > evenement
                              then
                                begin
                                  milieu :=(tabfrequence[3,villedep]+tabfrequence[3,villear]) DIV 2;
                                  hazard:=random (milieu);
                                  If (hazard = 1) AND (quatre =0)
                                    then
                                      begin
                                        longuevue;
                                        tempete;
                                        v_e_c(31,3,4,'TEMPETES A MIDI !!!');
                                        readln;
                                        deplacement;
                                        evenement := evenement +1;
                                      end;
                                end;
{test tr‚sors }
                            If maxi > evenement
                              then
                                begin
                                  milieu :=(tabfrequence[4,villedep]+tabfrequence[4,villear]) DIV 2;
                                  hazard:=random (milieu);
                                  If hazard =  33
                                    then
                                      begin
                                        longuevue;
                                        decors;
                                        v_e_c(36,3,4,'TERRE ???');
                                        readln;
                                        deplacement;
                                        evenement := evenement +1;
                                      end;
                                end;
                          end;
                 UNTIL identite.distance =0;


            FOR I := 1 TO 11 DO
              BEGIN
                identite.taboute[I] := identite.taboutva[i];
              END;
          END
        ELSE
          BEGIN
            v_e_c(xclign, yclign, white, identite.taboutva[1]);
            v_e_c(x2clign, y2clign, white+blink, identite.taboute[1]);
            FOR I := 2 TO 79 DO
              BEGIN
                v_e_c(I, 23, blue, '█');
              END;
            FOR I := 14 TO 17 DO
              BEGIN
                v_e_c(I, 22, blue,'█');
              END;
          END;
        v_e_c(73, 7, cyan, 'S ');
      END;
    UNTIL UPCASE(choix) = 'O';
 END;

{****************************FIN GESTION_CARTE*************************}


{*************************CHOIX DU MENU PRINCIPAL**************************}
PROCEDURE choix_menu;

  PROCEDURE ici;
    BEGIN
      identite.test:= 1;
      lacarte;
      gestion_carte;
    END;

  BEGIN
    carac := Readkey;
    CASE UPCASE(carac) OF
      'P' : ici;
      'C' : Compagnie;
      'E' : Writeln('Equipement');
      'M' : marche;
      'T' : taverne;
      'B' : Banque;
      'H' : Writeln('Chemin');
      'O' : enregistr;
     END;
  END;
{***********************FIN CHOIX_MENU**********************************}

{****************************GESTION_MAISON******************************}

PROCEDURE gestion_maison;

  BEGIN
    port;
    IF identite.taboute[6] = '1' THEN maison1_1 ELSE maison1_2;
    IF identite.taboute[7] = '1' THEN maison2_1 ELSE maison2_2;
    IF identite.taboute[8] = '1' THEN maison3_1 ELSE maison3_2;
    IF identite.taboute[9] = '1' THEN maison4_1 ELSE maison4_2;
    IF identite.taboute[10] = '1' THEN maison5_1 ELSE maison5_2;
    textbackground(brown);
    v_e_c(68, 13, white, identite.taboute[2]);
  END;

{**************************FIN GESTION_MAISON****************************}

{***************************IDENTIFICATION*****************************}

PROCEDURE identification;

  VAR
    longueur : integer;
    texte : string;
    carac : CHAR;

  BEGIN
    textbackground(black);
    clrscr;
    v_e_c(19, 10, yellow, 'Moussaillon, quel est ton nom ? (12 lettres)');
    textcolor(cyan);
    Gotoxy(35, 11);
    identite.nom := '';
    FOR j := 1 TO 12 DO
      BEGIN
        carac := READKEY;
        IF ORD(carac) = 13 THEN
        BEGIN
          FOR j := J TO 12 DO
            BEGIN
              carac := ' ';
            END;
        END;
        write(carac);
        identite.nom := identite.nom + carac;
      END;
    longueur := (80-(LENGTH(identite.nom) + 44)) DIV 2;
    texte := identite.nom + ', te voici par‚ pour une grande aventure...';
    v_e_c(longueur, 15, cyan, texte);
  END;

{**************************FIN IDENTIFICATION**************************}

{*************************VILLE********************************************}

PROCEDURE ville;

  BEGIN
    ecran_princ;
    gestion_maison;
    textbackground(cyan);
    v_e_c(67, 2, blue, identite.grade);
    v_e_c(67, 3, blue, identite.nom);
    v_e_c2(67, 5, blue, identite.argent);
    v_e_c2(69, 6, blue, identite.homme);
    v_e_c(69, 7, blue, identite.bateau);
    v_e_c2(70, 8, blue, identite.mat);
    v_e_c2(72, 9, blue, identite.soute);
    v_e_c2(76, 9, blue, identite.soutemax);
    v_e_c2(70,10, blue, identite.canon);
  END;


{**************************VARIABLES**************************************}

PROCEDURE variables;
  VAR
    i : INTEGER;
  BEGIN
    For i:= 1 to 17 do
      BEGIN
        identite.tabsoute[i]:=0;
      END;
    identite.test := 1;
    identite.grade := 'BLANC-BEC';
    identite.argent := 3000;
    identite.arg_bank := 0;
    identite.homme := 6;
    identite.bateau := 'E CARAVELLE';
    identite.numebat := 1;
    identite.mat := 1;
    identite.soute := 0;
    identite.soutemax := 65;
    identite.canon := 10;
    FOR i := 1 TO 10 DO
      BEGIN
        identite.taboute[i] := tabvil[4,i];
        identite.taboutva[i] := identite.taboute[i];
      END;
  END;

{*************************FIN VARIABLES************************************}
{*****************************PROGRAM PRINCIPAL*************************}

BEGIN
  assign(fiche,'SAVE001.dat');
  writeln('nouveau ?o/n');
  readln(doop);
  if doop = 'o'
  then
    begin
      rewrite(fiche);
      variables;
    { present1;
      readln;
      present2;
      readln;
      present3;
      readln;
      present4;
      readln;}
      identification;
      readln;
    end
  else
    begin
      reset(fiche);
      read(fiche,identite);
    end;
  RANDOMIZE;
  REPEAT
    ville;
    choix_menu;
  UNTIL ord(carac) = 27 ;
  clrscr;
END.