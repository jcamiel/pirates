UNIT present;

INTERFACE

USES
  crt, outils;

PROCEDURE present1;
PROCEDURE present2;
PROCEDURE present3;
PROCEDURE present4;


IMPLEMENTATION

  PROCEDURE present1;

    VAR
      y, I, compteur : INTEGER;

    BEGIN
      Clrscr;
      compteur := 0;
      Textbackground(black);
      Clrscr;
      Textcolor(red);
      v_e(20,  1,'                              ▄    ▄');
      v_e(20,  2,'  ▄▀▀▄   █  ▄▀▀▄     █   ▄▀▀█▀  ▄▀▀   ▄▀▀▀');
      v_e(20,  3,'  █▄▀   █   █▀█     █▄█    █   ▄▀▀     ▀▄');
      v_e(20,  4,'  █    █    █  ▀▄  █  █   █   █▄▄▄  ▀▄▄▀');
      v_e(20,  5,' ▀    ▀    ▀      ▀      ▀');
      Textcolor(white);
      v_e(31,  7,'    ▄▄▄█████▄▄▄');
      v_e(31,  8,'  ▄█████████████');
      v_e(31,  9,'  ███████████████');
      v_e(31, 10,' █Ý█████████████Þ█');
      v_e(31, 11,' █ █▀   ███   ▀█ █');
      v_e(31, 12,' ▄▄█   ▄█▀█▄   █▄');
      v_e(31, 13,'  ▀█████   █████▀');
      v_e(31, 14,'      ██▄█▄██');
      v_e(31, 15,'      █ █ █ ▀');
      REPEAT
        BEGIN
          FOR y := 14 TO 16 DO
            BEGIN
              Textcolor(white);
              FOR I := 0 TO 1 DO
                BEGIN
                  v_e(31,   y,'    ▄');
                  v_e(45,   y,'▄');
                  v_e(31, y+1,'    █');
                  v_e(45, y+1,'█');
                  v_e(31, y+2,'    ██ █ ▄ █ ██');
                  v_e(31, y+3,'     ▀███████▀');
                  v_e(31, y+4,'        ▀▀▀');
                  Textcolor(black);
                  IF I = 0 THEN Delay(100);
                END;
            END;
          FOR y := 16 DOWNTO 14 DO
            BEGIN
              Textcolor(white);
              FOR I := 0 TO 1 DO
                BEGIN
                  v_e(31,   y,'    ▄');
                  v_e(45,   y,'▄');
                  v_e(31, y+1,'    █');
                  v_e(45, y+1,'█');
                  v_e(31, y+2,'    ██ █ ▄ █ ██');
                  v_e(31, y+3,'     ▀███████▀');
                  v_e(31, y+4,'        ▀▀▀');
                  Textcolor(black);
                  IF I = 0 THEN Delay(100);
                END;
            END;
          INC(compteur);
        END;
      UNTIL compteur = 5;
      Textcolor(white);
      v_e(31,   y,'    ▄');
      v_e(45,   y,'▄');
      v_e(31, y+1,'    █');
      v_e(45, y+1,'█');
      v_e(22, y+2,' █▀██▄       ██ █ ▄ █ ██      ▄██▀█▄');
      v_e(22, y+3,'▄█▄▄▀██▄      ▀███████▀     ▄██▀▀█▄██');
      v_e(22, y+4,'  ▀▀█▄████▄▄            ▄▄▄█▀▄▄█▀▀▀█▀');
      v_e(22, y+5,'      ▀▀▀▀████▄▄ ▄ ▄▄███████▀▀');
      v_e(22, y+6,'            ▀▀▄▄█████▀▀▀');
      v_e(22, y+7,'▀██▄▄▄▄▄▄▄▄███▀▀    ▄▄█▄▄          ▄▄');
      v_e(22, y+8,' █ █▀▄▄▀▀▀▀▀▀        ▀▀████████▄█▀▀██▀');
      v_e(22, y+9,'▀██▀▀                        ▀▀▀▀██▄█▄');
      textcolor(lightgray);
      v_e(55, 24,'(c) Copyright CHAPROT Inc.');
    END;

  PROCEDURE present2;

    BEGIN
      Textbackground(RANDOM(7));
      Clrscr;
      v_e_al(33,  3, 'Programmeurs :');
      v_e_al(29,  4, 'Jean-Christophe Amiel');
      v_e_al(34,  5, 'Paul Crochet');
      v_e_al(33,  6, 'Vincent Dupin');
      v_e_al(33,  7, 'Nicolas Gomond');
      v_e_al(26,  8, 'Directeur de la production :');
      v_e_al(32,  9, 'JCA le sale roux');
      v_e_al(29, 10, 'Directeur artistique :');
      v_e_al(30, 11, 'PC alias village pop');
      v_e_al(26, 12, 'Directeur de la publicit‚ :');
      v_e_al(31, 13, 'NG ou ‚l‚phant man');
      v_e_al(11, 14, 'Directeur de quelque chose comme euh..., comme nous quoi!');
      v_e_al(33, 15, 'VD dit le nain');
      v_e_al(31, 16, 'Porteur de pizza :');
      v_e_al(33, 17, 'Tonio le Macho');
      v_e_al(35, 18, 'Facteur :');
      v_e_al(33, 19, 'Robert Dupont');
      v_e_al(35, 20, 'Sponsor :');
      v_e_al(29, 21, 'Bernard Tapie Finances');
    END;

  PROCEDURE present3;

    BEGIN
      Textbackground(black);
      clrscr;
      v_e_c(27 , 9,yellow,'Bref tout a été fait par :');
      v_e_c(29 ,11,  cyan,'Jean-Christophe Amiel');
      v_e_c(34 ,12,  cyan,'Paul Crochet');
      v_e_c(33 ,13,  cyan,'Vincent Dupin');
      v_e_c(33 ,14,  cyan,'Nicolas Gomond');
     {marseillaise;}
    END;

  PROCEDURE present4;
    BEGIN
      textbackground(black);
      Clrscr;
      V_e_c(1, 6, yellow, '█   █');
      v_e_c(1, 7, yellow, ' █ █');
      v_e_c(1, 8, yellow, '  █');
      textcolor(cyan);
      Gotoxy(6, 8);
      Writeln('oilà maintenant 20 ans que tu sillonnes les mers ',
      'et les oc‚ans. Après avoirv‚cu jusqu''à l''âge de 16 ans ',
      'comme petit mousse, à laver les ponts, à te faire  insulter ',
      'par tes sup‚rieurs, après avoir cotoy‚ les plus grands ',
      'flibustiers ;   ton rêve est maintenant de devenir leur ‚gal. ',
      'Mais la route est encore longue : Tu n''es qu''un vulgaire ',
      'blanc-bec, et pour atteindre le stade suprême de Pirate, ',
      'il te faudra affronter les pires dangers.');
      Writeln('  Après quelques grosses difficult‚s, tu as enfin ',
      'r‚ussi à r‚unir des amis et unmaigre butin : tu possèdes 300 ‚cus.');
      Writeln('  Tu es en ce moment amar‚ à l''Ile de la Tortue, ',
      'le fameux repère des plus      grands Frères de la côte. Ton but ',
      'est de faire fructifier ton pactole.Pour cela,tu possèdes ',
      'une caravelle à 1 mât avec laquelle tu peux commercer de ',
      'ports en   ports tout en recrutant des marins.');
      v_e_c(55, 22, yellow, 'BONNE CHANCE');
      v_e_c(55, 23, yellow, 'Moussaillon !!!');
    END;

{**********************FIN PRESENT4**********************************}


END.