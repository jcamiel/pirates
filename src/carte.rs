use crate::color::Color::{Blue, Brown, Cyan, Green, LightGreen, LightRed, White, Yellow};
use crate::crt::{clear_screen, set_background_color};
use crate::outils::v_e_c;

pub(crate) fn lacarte() {
    // ***********************LE JAUNE FOND BLEU********************************
    set_background_color(Blue);
    clear_screen();
    v_e_c(38, 1, Yellow, "██");
    v_e_c(21, 2, Yellow, "██▀████  ███    ██");
    v_e_c(13, 3, Yellow, "██▀▀▀██ █  ▀  █▀▀█ ▀██ █");
    v_e_c(12, 4, Yellow, "██     ▀█▀            ▀███");
    v_e_c(11, 5, Yellow, "█▀                     ▀█  █");
    v_e_c(9, 6, Yellow, "██                       ██  █");
    v_e_c(9, 7, Yellow, "█                         ▀█▀");
    v_e_c(8, 8, Yellow, "██");
    v_e_c(8, 9, Yellow, "█");
    v_e_c(7, 10, Yellow, "██           ▄▄▄");
    v_e_c(6, 11, Yellow, "█▀           █▀▀██");
    v_e_c(6, 12, Yellow, "█▄        ▄█▀▀▄█▀");
    v_e_c(9, 13, Yellow, "██▄   ▄█ █▀▀");
    v_e_c(1, 14, Yellow, "▀█             ██▄  ▄███▄");
    v_e_c(2, 15, Yellow, "▀███   ███▀█            █▀");
    v_e_c(6, 16, Yellow, "▀██▀     ██         ██");
    v_e_c(16, 17, Yellow, "▀███      █");
    v_e_c(20, 18, Yellow, "████    █▄  ▄");
    v_e_c(23, 19, Yellow, "▀▀▀▀█▄██▀▀█");
    v_e_c(28, 20, Yellow, "▀▀");
    v_e_c(62, 3, Yellow, "▄▄");
    v_e_c(59, 4, Yellow, "▄▄█ ▄▌");
    v_e_c(42, 5, Yellow, "▄▄");
    v_e_c(59, 5, Yellow, "▐   █");
    v_e_c(42, 6, Yellow, "▀▀");
    v_e_c(59, 6, Yellow, "▐ ▄▀▄▀▄");
    v_e_c(48, 7, Yellow, "▄           █▀ █▄▄▌");
    v_e_c(48, 8, Yellow, "▀ ▐▄            ▀");
    v_e_c(52, 9, Yellow, "▄");
    v_e_c(29, 10, Yellow, "▄██▀ ▄▄█▄▄▄");
    v_e_c(61, 10, Yellow, "▄       ▄▀▀▀▄");
    v_e_c(29, 11, Yellow, "▀ ▀▀█▄▀▄▄▄███▄▄▄");
    v_e_c(61, 11, Yellow, "▀█       ▀▄  ▌");
    v_e_c(38, 12, Yellow, "▀   ▀▀██▄  █▄▄▄");
    v_e_c(72, 12, Yellow, "▀▀");
    v_e_c(40, 13, Yellow, "▄█▄▄ ▀   ▄▀  ▀█▄");
    v_e_c(41, 14, Yellow, "▀▀       ▀▀▄▀ ▀▀  ▄▄▄");
    v_e_c(58, 15, Yellow, "▀▀▀");
    v_e_c(80, 13, Yellow, "▄");
    v_e_c(79, 14, Yellow, "▐");
    v_e_c(77, 15, Yellow, "▄▄▀▄");
    v_e_c(65, 16, Yellow, "▀");
    v_e_c(77, 16, Yellow, "█▄▀");
    v_e_c(49, 17, Yellow, "▄▄██▄");
    v_e_c(48, 18, Yellow, "██  █  ▄▄██▄  ▄▄▄");
    v_e_c(
        23,
        19,
        Yellow,
        "▀▀▀▀█▄██▀▀█  ▀█▄     ▄███    █ ██    ███ ███▄   ▄",
    );
    v_e_c(
        28,
        20,
        Yellow,
        "▀▀        ▀▀█▄▄█        ▌  ▐          ▀▀▀▀███▄  ▄",
    );
    v_e_c(40, 21, Yellow, "█           █▄ █                 █████▄▄▄");

    // ******************************** VILLE **********************************
    v_e_c(24, 3, LightRed, "▀");
    v_e_c(37, 3, LightRed, "▀");
    v_e_c(11, 6, LightRed, "▀");
    v_e_c(64, 8, LightRed, "▀");
    v_e_c(33, 10, LightRed, "▄");
    v_e_c(50, 10, LightRed, "▄");
    v_e_c(73, 10, LightRed, "▄");
    v_e_c(18, 11, LightRed, "▄");
    v_e_c(56, 14, LightRed, "▀");
    v_e_c(77, 15, LightRed, "▄");
    v_e_c(19, 18, LightRed, "▀");
    v_e_c(36, 18, LightRed, "▄");
    v_e_c(47, 18, LightRed, "▄");
    v_e_c(34, 19, LightRed, "▀");
    v_e_c(54, 21, LightRed, "▄");
    v_e_c(25, 3, White, "11");
    v_e_c(38, 3, White, "12");
    v_e_c(12, 6, White, "1");
    v_e_c(65, 8, White, "8");
    v_e_c(51, 10, White, "4");
    v_e_c(74, 10, White, "15");
    v_e_c(17, 11, White, "2");
    v_e_c(56, 13, White, "14");
    v_e_c(75, 15, White, "10");
    v_e_c(17, 18, White, "13");
    v_e_c(37, 18, White, "5");
    v_e_c(46, 18, White, "7");
    v_e_c(34, 18, White, "6");
    v_e_c(33, 9, White, "3");
    v_e_c(54, 20, White, "9");

    // ****************************VERT CLAIR FOND VERT FONCE********************
    set_background_color(Green);
    v_e_c(16, 1, LightGreen, "▒▒    ▒▒▒     ▒      ▒");
    v_e_c(13, 2, LightGreen, "▒▒▒▒▒▒▒▒");
    v_e_c(28, 2, LightGreen, "▒▒");
    v_e_c(33, 2, LightGreen, "▒  ▒");
    v_e_c(7, 3, LightGreen, "▒    ▒");
    v_e_c(20, 3, LightGreen, "▒");
    v_e_c(35, 3, LightGreen, "▒");
    v_e_c(7, 4, LightGreen, "▒▒  ▒");
    v_e_c(8, 5, LightGreen, "▒▒▒");
    v_e_c(36, 5, LightGreen, "▒▒");
    v_e_c(7, 6, LightGreen, "▒▒");
    v_e_c(36, 6, LightGreen, "▒▒");
    v_e_c(7, 7, LightGreen, "▒▒");
    v_e_c(6, 8, LightGreen, "▒▒");
    v_e_c(4, 9, LightGreen, "▒ ▒▒");
    v_e_c(3, 10, LightGreen, "▒▒▒▒");
    v_e_c(4, 11, LightGreen, "▒▒");
    v_e_c(5, 12, LightGreen, "▒");
    v_e_c(4, 13, LightGreen, "▒▒▒");
    v_e_c(3, 14, LightGreen, "▒▒");
    v_e_c(9, 14, LightGreen, "▒▒");
    v_e_c(17, 13, LightGreen, "▒");
    v_e_c(16, 14, LightGreen, "▒▒");
    v_e_c(7, 15, LightGreen, "▒▒");
    v_e_c(16, 15, LightGreen, "▒▒▒▒");
    v_e_c(24, 15, LightGreen, "▒▒");
    v_e_c(17, 16, LightGreen, "▒▒▒");
    v_e_c(24, 16, LightGreen, "▒▒");
    v_e_c(20, 17, LightGreen, "▒▒▒▒▒▒▒");
    v_e_c(24, 18, LightGreen, "▒▒");
    v_e_c(50, 18, LightGreen, "▒▒");
    v_e_c(48, 19, LightGreen, "▒  ▒");
    v_e_c(56, 19, LightGreen, "▒▒▒▒");
    v_e_c(63, 19, LightGreen, "▒");
    v_e_c(44, 20, LightGreen, "▒  ▒▒ ▒▒");
    v_e_c(56, 20, LightGreen, "▒▒  ▒▒▒▒▒▒▒");
    v_e_c(41, 21, LightGreen, "▒");
    v_e_c(48, 21, LightGreen, "▒  ▒");
    v_e_c(56, 21, LightGreen, "▒▒      ▒     ▒▒▒");
    v_e_c(42, 21, LightGreen, "▀▀▀ ");
    v_e_c(62, 20, LightGreen, "▀▀▒▀");

    // *****************************jaune fond vert fonc‚**************************
    set_background_color(Green);
    v_e_c(6, 1, Yellow, "          ");
    v_e_c(4, 2, Yellow, "         ");
    v_e_c(2, 3, Yellow, "     ");
    v_e_c(1, 4, Yellow, "      ");
    v_e_c(62, 4, Yellow, " ▄");
    v_e_c(3, 5, Yellow, "     ");
    v_e_c(60, 5, Yellow, "   ");
    v_e_c(3, 6, Yellow, "    ");
    v_e_c(60, 6, Yellow, "▄▄█▄▀");
    v_e_c(1, 7, Yellow, "      ");
    v_e_c(64, 7, Yellow, "▄▄");
    v_e_c(1, 8, Yellow, "   ");
    v_e_c(5, 8, Yellow, " ");
    v_e_c(1, 9, Yellow, " ");
    v_e_c(5, 9, Yellow, " ");
    v_e_c(2, 12, Yellow, "   ");
    v_e_c(36, 11, Yellow, "▄▄▄");
    v_e_c(70, 10, Yellow, "▀▀▀");
    v_e_c(71, 11, Yellow, "▄  ");
    v_e_c(1, 13, Yellow, "   ");
    v_e_c(50, 13, Yellow, "▀  ▀");
    v_e_c(52, 14, Yellow, "▄");
    v_e_c(80, 14, Yellow, " ");
    v_e_c(20, 15, Yellow, "▀▀▀▀");
    v_e_c(79, 15, Yellow, "▀▄");
    v_e_c(20, 16, Yellow, "    ");
    v_e_c(78, 16, Yellow, "▄");
    v_e_c(49, 19, Yellow, "  ");
    v_e_c(45, 20, Yellow, "  ");
    v_e_c(49, 20, Yellow, " ");
    v_e_c(58, 20, Yellow, "  ");
    v_e_c(67, 20, Yellow, "▀▀▀");
    v_e_c(45, 21, Yellow, " ");
    v_e_c(49, 21, Yellow, "  ");
    v_e_c(58, 21, Yellow, "      ");
    v_e_c(65, 21, Yellow, "     ");

    // ****************************vert fonc‚ fond marron***********************

    set_background_color(Brown);
    v_e_c(3, 1, Green, "  ▄");
    v_e_c(1, 2, Green, "   ");
    v_e_c(1, 3, Green, " █▄");
    v_e_c(1, 5, Green, " ▀");
    v_e_c(1, 6, Green, " ▄");
    v_e_c(4, 8, Green, " ");
    v_e_c(2, 9, Green, "▀ ");
    v_e_c(1, 10, Green, "  ");
    v_e_c(1, 11, Green, " ▄ ");
    v_e_c(1, 12, Green, " ");
    v_e_c(5, 14, Green, "    ");
    v_e_c(11, 19, Green, "▄ ");
    v_e_c(46, 21, Green, " ▀");

    // *******************JAUNE FOND MARRON***************************************
    set_background_color(Brown);
    v_e_c(32, 10, Yellow, "▀");
    v_e_c(20, 11, Yellow, "▀▀");
    v_e_c(18, 12, Yellow, "▀▀▄");
    v_e_c(7, 13, Yellow, "▀▀");
    v_e_c(11, 14, Yellow, "▀▀▀▀▀");
    v_e_c(14, 15, Yellow, "▄▄");
    v_e_c(26, 18, Yellow, "▀▀");
    v_e_c(28, 19, Yellow, "▄");
    v_e_c(6, 15, Yellow, "▄");

    //**********************BLEU FOND MARRON*************************************}
    v_e_c(48, 10, Blue, "▀▀");
    v_e_c(49, 11, Blue, "▄▄");
    v_e_c(47, 14, Blue, "▄▄");
    v_e_c(67, 16, Blue, "▀");
    v_e_c(68, 18, Blue, "▄ ");

    // ********************** BLANC FOND MARRON ************************************
    v_e_c(1, 1, White, "█▀ ");
    // ************************* FIN DE LA CARTE ***********************************

    // ********************************** CADRES ************************************
    set_background_color(Blue);
    v_e_c(1, 21, White, "╔════════════════════╗");
    v_e_c(
        1,
        22,
        White,
        "║ Distance :      Km ╚═════════════════════════════════════════════════════════╗",
    );
    v_e_c(
        1,
        23,
        White,
        "║                                                                              ║",
    );
    v_e_c(
        1,
        24,
        White,
        "╚══════════════════════════════════════════════════════════════════════════════╝",
    );
    v_e_c(77, 1, White, "╔══╗");
    v_e_c(77, 2, White, "║  ║");
    v_e_c(77, 3, White, "╚══╝");

    // *******************************ROSE DES VENTS*******************************
    v_e_c(73, 3, Cyan, "N");
    v_e_c(73, 4, Cyan, "│");
    v_e_c(70, 5, Cyan, "O<─┼─>E");
    v_e_c(73, 6, Cyan, "│");
    v_e_c(73, 7, Cyan, "S");
}
