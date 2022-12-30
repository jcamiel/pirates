use crate::color::Color;
use crate::color::Color::{LightGreen, Magenta, Red};
use crate::crt::{clear_screen, set_background_color};
use crate::outils::v_e_c;
use rand::Rng;
use Color::{Black, Blue, Brown, Cyan, DarkGray, Green, LightGray, White, Yellow};

pub(crate) fn ecran_princ() {
    set_background_color(Black);
    clear_screen();

    let mut rng = rand::thread_rng();

    for _ in 1..=40 {
        let x = rng.gen_range(0..79) + 1;
        let y = rng.gen_range(0..13) + 1;
        v_e_c(x, y, Yellow, ".");
    }
    set_background_color(Cyan);
    v_e_c(1, 1, White, "┌────────────┐");
    v_e_c(1, 2, White, "│            │");
    v_e_c(1, 3, White, "│            │");
    v_e_c(1, 4, White, "└────────────┘");
    v_e_c(65, 1, White, "┌──────────────┐");
    v_e_c(65, 2, White, "│              │");
    v_e_c(65, 3, White, "│              │");
    v_e_c(65, 4, White, "│              │");
    v_e_c(65, 5, White, "│              │");
    v_e_c(65, 6, White, "│              │");
    v_e_c(65, 7, White, "│              │");
    v_e_c(65, 8, White, "│              │");
    v_e_c(65, 9, White, "│              │");
    v_e_c(65, 10, White, "│              │");
    v_e_c(65, 11, White, "└──────────────┘");
    v_e_c(
        1,
        22,
        White,
        "╔══════╦═══════════╦════════════╦════════╦═════════╦════════╦════════╦═════════╗",
    );
    v_e_c(
        1,
        23,
        White,
        "║      ║           ║            ║        ║         ║        ║        ║         ║",
    );
    v_e_c(
        1,
        24,
        White,
        "╚══════╩═══════════╩════════════╩════════╩═════════╩════════╩════════╩═════════╝",
    );
    v_e_c(6, 2, Blue, "ANNEES");
    v_e_c(7, 3, Blue, "JOURS");
    v_e_c(67, 4, Blue, "TU POSSEDES:");
    v_e_c(75, 5, Blue, "ECUS");
    v_e_c(73, 6, Blue, "HOMMES");
    v_e_c(67, 7, Blue, "UN");
    v_e_c(67, 8, Blue, "A");
    v_e_c(72, 8, Blue, "MATS");
    v_e_c(67, 9, Blue, "AVEC");
    v_e_c(75, 9, Blue, "/");
    v_e_c(67, 10, Blue, "ET");
    v_e_c(73, 10, Blue, "CANONS");
    v_e_c(4, 23, Blue, "ORT");
    v_e_c(11, 23, Blue, "OMPAGNIE");
    v_e_c(23, 23, Blue, "QUIPEMENT");
    v_e_c(36, 23, Blue, "ARCHE");
    v_e_c(45, 23, Blue, "AVERNE");
    v_e_c(55, 23, Blue, "ANQUE");
    v_e_c(63, 23, Blue, "C EMIN");
    v_e_c(73, 23, Blue, "PTIONS");
    set_background_color(LightGray);
    v_e_c(3, 23, Yellow, "P");
    v_e_c(10, 23, Yellow, "C");
    v_e_c(22, 23, Yellow, "E");
    v_e_c(35, 23, Yellow, "M");
    v_e_c(44, 23, Yellow, "T");
    v_e_c(54, 23, Yellow, "B");
    v_e_c(64, 23, Yellow, "H");
    v_e_c(72, 23, Yellow, "O");
}

pub(crate) fn port() {
    set_background_color(Black);
    v_e_c(2, 11, Green, "▄");
    v_e_c(2, 12, Green, "▄█▄▄");
    v_e_c(1, 13, Green, "▀  ▀▄▀");
    v_e_c(1, 16, Green, "███");
    v_e_c(3, 13, Brown, "█");
    v_e_c(2, 14, Brown, "█");
    v_e_c(1, 15, Brown, "█");
    v_e_c(2, 15, Yellow, "▄▄▄");
    v_e_c(5, 15, Blue, "▄▄▄▄▄▄");
    set_background_color(Blue);
    v_e_c(1, 17, Yellow, "██████████");
    v_e_c(4, 16, Yellow, "███▄▄▄▄");
    for x in 15..=64 {
        set_background_color(Black);
        v_e_c(x, 15, Blue, "▄");
        set_background_color(Blue);
        v_e_c(x, 16, Yellow, "▄");
        v_e_c(x, 17, Yellow, "█");
    }
    for x in 64..=80 {
        for y in 15..=21 {
            v_e_c(x, y, Green, "█");
        }
    }
    set_background_color(LightGray);
    for x in 1..=72 {
        for y in 18..=20 {
            v_e_c(x, y, DarkGray, " ");
        }
    }
    v_e_c(76, 15, DarkGray, "  ");
    v_e_c(74, 16, DarkGray, "    ");
    v_e_c(72, 17, DarkGray, "     ");
    v_e_c(71, 18, DarkGray, "      ");
    v_e_c(71, 19, DarkGray, "     ");
    v_e_c(71, 20, DarkGray, "   ");
    for x in 1..=60 {
        v_e_c(x, 18, Yellow, "▀");
    }
    for x in 61..=65 {
        v_e_c(x, 18, Green, "▀");
    }
    set_background_color(Brown);
    v_e_c(60, 21, Yellow, "▄▀▀     ");
    v_e_c(68, 21, Green, "▄▄");
    for x in 1..=59 {
        v_e_c(x, 21, Yellow, "█");
    }
    v_e_c(67, 13, Brown, "             ");
    v_e_c(73, 14, Brown, "█");
    v_e_c(73, 15, Brown, "█");
    set_background_color(Green);
    v_e_c(72, 15, Cyan, "▄");
    v_e_c(74, 15, Cyan, "▀▄");
    v_e_c(71, 16, Cyan, "▀█▀▀");
    set_background_color(LightGray);
    v_e_c(5, 19, DarkGray, "▄     ▄▄          ▄▌    ▀█");
    v_e_c(44, 19, DarkGray, "▄▄▀▀          ▄▄     ▀");
    v_e_c(7, 20, DarkGray, "▄█       ▀▀▄        ▌");
    v_e_c(50, 20, DarkGray, "▀▄");
    v_e_c(70, 20, DarkGray, "▀▀");
    set_background_color(Cyan);
    v_e_c(38, 18, Yellow, "▀");
    set_background_color(LightGray);
    v_e_c(36, 19, Cyan, "▄█▄");
    v_e_c(35, 20, Cyan, "▀ ▀█▀");
    v_e_c(76, 16, DarkGray, "▄");
    v_e_c(74, 17, DarkGray, "▄");
    v_e_c(73, 18, DarkGray, "▄▀");
}

pub(crate) fn maison1_1() {
    set_background_color(Black);
    v_e_c(15, 6, Red, "▄▄");
    v_e_c(13, 7, Red, "██████");
    v_e_c(12, 8, Red, "████████");
    set_background_color(White);
    v_e_c(11, 9, Red, "█▀██▀██▀██");
    v_e_c(11, 10, Brown, " ▄▄▄  ▄▄▄ ");
    v_e_c(11, 11, Brown, "          ");
    v_e_c(11, 12, Brown, " ▀▀▀  ▀▀▀ ");
    v_e_c(11, 14, Brown, " ▀  ▀ ▄█▄ ");
    v_e_c(11, 15, Brown, " ╔══╗     ");
    v_e_c(11, 16, Brown, " ║██║ ▀▀▀ ");
    v_e_c(11, 17, Brown, " ║██║     ");
    v_e_c(12, 11, Green, "▐");
    v_e_c(14, 11, Green, "▌");
    v_e_c(17, 11, Green, "▐");
    v_e_c(19, 11, Green, "▌");
    v_e_c(11, 13, Green, "▄▄▄▄▄▄▄▄▄▄");
    v_e_c(17, 15, Green, "▐");
    v_e_c(19, 15, Green, "▌");
    set_background_color(Cyan);
    v_e_c(13, 11, Brown, "┼");
    v_e_c(18, 11, Brown, "┼");
    v_e_c(18, 15, Brown, "┼");
}

pub(crate) fn maison1_2() {
    set_background_color(Black);
    v_e_c(13, 9, Red, "▄████▄");
    v_e_c(11, 10, Red, "▄████████▄");
    set_background_color(LightGray);
    v_e_c(11, 12, Red, "          ");
    v_e_c(11, 13, Red, "          ");
    v_e_c(11, 12, Red, "   ▄  ▄   ");
    v_e_c(11, 14, Red, "   ╔══╗   ");
    v_e_c(15, 12, Black, "▄▄");
    v_e_c(11, 15, Yellow, "   ▀  ▀   ");
    v_e_c(11, 16, Yellow, " ░░    ░░ ");
    v_e_c(11, 17, Yellow, "          ");
    v_e_c(11, 11, Brown, " ▀  ▀  ▀  ");
    set_background_color(Brown);
    v_e_c(15, 16, Brown, "  ");
    v_e_c(15, 17, Brown, "  ");
    v_e_c(13, 13, Brown, "▀");
    v_e_c(18, 13, Brown, "▀");
    v_e_c(14, 13, Red, "▀");
    v_e_c(17, 13, Red, "▀");
    v_e_c(15, 13, Black, "▀▀");
}

pub(crate) fn maison2_1() {
    let x = 21;
    set_background_color(Black);
    v_e_c(x + 1, 6, LightGray, "█ ▄");
    v_e_c(x + 1, 7, LightGray, "▀█▀▄▀▄");
    v_e_c(x + 2, 8, LightGray, "▀█");
    v_e_c(x + 3, 9, DarkGray, "█");
    v_e_c(x + 2, 10, Brown, "▄██████▄");
    v_e_c(x + 1, 11, Brown, "██████████");
    set_background_color(Brown);
    v_e_c(x + 1, 12, Green, "███▄  ▄███");
    v_e_c(x + 1, 15, White, "█   ██   █");
    v_e_c(x + 1, 16, White, "██████████");
    set_background_color(Green);
    v_e_c(x + 1, 13, Brown, "╦═╦═╦═╦═╦═");
    v_e_c(x + 1, 14, Brown, "╩═╩═╩═╩═╩═");
    v_e_c(x + 5, 12, Yellow, "██");
    v_e_c(x + 1, 17, White, "██  ██████");
    set_background_color(LightGray);
    v_e_c(x + 3, 17, Black, "▄▄");
    set_background_color(Cyan);
    v_e_c(x + 3, 15, Brown, "┼");
    v_e_c(x + 8, 15, Brown, "┼");
}

pub(crate) fn maison2_2() {
    let x = 21;
    set_background_color(Black);
    v_e_c(x + 4, 9, Red, "▄▄▄▄");
    v_e_c(x + 1, 10, Red, "▄████████▄");
    set_background_color(Red);
    v_e_c(x + 1, 11, DarkGray, "███▄▄▄▄███");
    for i in (x + 1)..=(x + 10) {
        for j in 12..=17 {
            v_e_c(i, j, DarkGray, "█");
        }
    }
    set_background_color(LightGray);
    v_e_c(x + 2, 12, Magenta, "█ █");
    v_e_c(x + 7, 12, Magenta, "█ █");
    v_e_c(x + 4, 14, Magenta, "█  █");
    v_e_c(x + 3, 15, Brown, "┌────┐");
    v_e_c(x + 3, 16, Brown, "│    │");
    v_e_c(x + 3, 17, Brown, "│  ██│");
    set_background_color(Blue);
    v_e_c(x + 3, 12, Brown, "┼");
    v_e_c(x + 8, 12, Brown, "┼");
    v_e_c(x + 5, 14, Brown, "┼┼");
    v_e_c(x + 4, 16, Black, "████");
    v_e_c(x + 4, 17, Black, "██");
}

pub(crate) fn maison3_1() {
    let x = 32;
    set_background_color(Black);
    for i in (x + 3)..=(x + 8) {
        for j in 6..=11 {
            v_e_c(i, j, LightGray, "█");
        }
    }
    for i in (x + 1)..=(x + 10) {
        for j in 12..=17 {
            v_e_c(i, j, LightGray, "█");
        }
    }
    v_e_c(x + 5, 2, Magenta, "▐▌");
    v_e_c(x + 4, 3, Magenta, "▄██▄");
    v_e_c(x + 3, 4, Magenta, "▐█▌▐█▌");
    v_e_c(x + 3, 5, Magenta, "█▀  ▀█");
    v_e_c(x + 5, 6, LightGray, "▄▄");
    v_e_c(x + 1, 13, LightGray, "▌");
    v_e_c(x + 10, 13, LightGray, "▐");
    v_e_c(x + 1, 14, LightGray, "▌");
    v_e_c(x + 10, 14, LightGray, "▐");
    v_e_c(x + 2, 10, LightGray, "▐");
    v_e_c(x + 9, 10, LightGray, "▌");
    v_e_c(x + 1, 11, LightGray, "▄█");
    v_e_c(x + 9, 11, LightGray, "█▄");
    set_background_color(LightGray);
    v_e_c(x + 4, 12, DarkGray, "┼  ┼");
    v_e_c(x + 5, 13, DarkGray, "▄▄");
    v_e_c(x + 2, 16, DarkGray, "▐      ▌");
    set_background_color(Black);
    v_e_c(x + 4, 14, DarkGray, "█  █");
    v_e_c(x + 3, 15, DarkGray, "█    █");
    v_e_c(x + 2, 17, DarkGray, "█      █");
    v_e_c(x + 3, 16, DarkGray, "      ");
    v_e_c(x + 4, 16, Brown, "▐██▌");
    v_e_c(x + 4, 17, Brown, "▐██▌");
    set_background_color(Blue);
    v_e_c(x + 5, 8, LightGreen, "▒▒");
    v_e_c(x + 4, 9, LightGreen, "▒▒▒▒");
    v_e_c(x + 5, 10, LightGreen, "▒▒");
}

pub(crate) fn maison3_2() {
    let x = 32;
    set_background_color(Black);
    for i in (x + 1)..=(x + 3) {
        for j in 7..=17 {
            v_e_c(i, j, White, "█");
        }
    }
    for i in (x + 4)..=(x + 10) {
        for j in 14..=17 {
            v_e_c(i, j, White, "█");
        }
    }
    v_e_c(x + 1, 7, White, "▌");
    v_e_c(x + 3, 7, White, "▐");
    v_e_c(x + 2, 13, White, "▌");
    v_e_c(x + 2, 15, White, "▌");
    v_e_c(x + 1, 6, Magenta, "▄█▄");
    v_e_c(x + 4, 13, Magenta, "██████▄");
    set_background_color(Brown);
    v_e_c(x + 1, 9, White, "▀ ▀");
    v_e_c(x + 1, 10, White, "█ █");
    v_e_c(x + 5, 16, White, "   ");
    v_e_c(x + 5, 17, White, "   ");
    set_background_color(LightGray);
    v_e_c(x + 6, 15, Brown, "▄");
    v_e_c(x + 6, 14, White, "▀");
    v_e_c(x + 4, 15, White, "▀ ");
    v_e_c(x + 4, 16, White, " ");
    v_e_c(x + 4, 17, White, " ");
    v_e_c(x + 7, 15, White, " ▀");
    v_e_c(x + 8, 16, White, " ");
    v_e_c(x + 8, 17, White, " ");
}

pub(crate) fn maison4_1() {
    let x = 43;
    set_background_color(Black);
    v_e_c(x + 3, 11, LightGray, "▄▄██▄▄");
    v_e_c(x + 1, 12, LightGray, "▄████████▄");
    set_background_color(LightGray);
    v_e_c(x + 1, 13, DarkGray, " ██ ██ ██ ");
    v_e_c(x + 1, 14, DarkGray, " ██ ██ ██ ");
    v_e_c(x + 1, 15, DarkGray, " ██ ██ ██ ");
    v_e_c(x + 1, 16, DarkGray, " ▀▀    ▀▀ ");
    v_e_c(x + 1, 17, DarkGray, "▀▀▀▀▀▀▀▀▀▀");
    v_e_c(x + 5, 14, Black, "██ ");
    v_e_c(x + 5, 15, Black, "██ ");
    v_e_c(x + 5, 16, Black, "▀▀");
}

pub(crate) fn maison4_2() {
    let x = 43;
    set_background_color(Red);
    for i in (x + 2)..=(x + 9) {
        for j in 10..=13 {
            v_e_c(i, j, Yellow, "▒");
        }
    }
    set_background_color(Black);
    v_e_c(x + 3, 12, Black, "█");
    v_e_c(x + 6, 12, Black, "█");
    v_e_c(x + 1, 10, Brown, "▄▄▄▄▄▄▄▄▄▄");
    set_background_color(White);
    v_e_c(x + 1, 14, Brown, "▀▀▀▀▀▀▀▀▀▀");
    for i in (x + 2)..=(x + 9) {
        for j in 15..=17 {
            v_e_c(i, j, Yellow, " ");
        }
    }
    v_e_c(x + 3, 15, Red, "BANQUE");
    set_background_color(LightGray);
    v_e_c(x + 3, 16, Black, "║║║║║║");
    v_e_c(x + 3, 17, Black, "║║║║║║");
}

pub(crate) fn maison5_1() {
    let x = 54;
    set_background_color(Black);
    for i in (x + 1)..=(x + 10) {
        for j in 7..=17 {
            v_e_c(i, j, White, "█");
        }
    }
    v_e_c(x + 2, 5, Blue, "▄██  ██▄");
    v_e_c(x + 4, 4, Blue, "▄██▄");
    set_background_color(Blue);
    v_e_c(x + 1, 6, White, "  ▄████▄  ");
    v_e_c(x + 5, 5, White, "▄▄");
    set_background_color(Red);
    v_e_c(x + 2, 8, White, "▌ ▐▌ ▐");
    v_e_c(x + 5, 10, White, "▌ ▐");
    v_e_c(x + 2, 12, White, "▌ ▐▌ ▐▌ ▐");
    v_e_c(x + 1, 14, Brown, " ▄ ▄ ▄ ▄ ▄");
    v_e_c(x + 3, 8, Black, "│");
    v_e_c(x + 9, 8, Black, "│");
    v_e_c(x + 3, 10, Black, "│");
    v_e_c(x + 9, 10, Black, "│");
    set_background_color(Brown);
    v_e_c(x + 5, 6, White, "▀▀");
    v_e_c(x + 2, 15, Red, "╦");
    v_e_c(x + 9, 15, Red, "╦");
    v_e_c(x + 5, 15, White, "▀▀");
    v_e_c(x + 2, 16, Yellow, "█");
    v_e_c(x + 9, 16, Yellow, "█");
    v_e_c(x + 4, 16, Black, "┼┼┼┼");
    v_e_c(x + 4, 17, Black, "┼┼┼┼");
    set_background_color(Cyan);
    v_e_c(x + 3, 8, Brown, "╬");
    v_e_c(x + 6, 8, Brown, "╬");
    v_e_c(x + 6, 10, Brown, "╬");
    v_e_c(x + 3, 12, Brown, "╬");
    v_e_c(x + 6, 12, Brown, "╬");
    v_e_c(x + 9, 12, Brown, "╬");
    // set_background_color(Green);
    // v_e_c_b(x+2, 13, White, "CHEZ  JC");
}

pub(crate) fn maison5_2() {
    let x = 54;
    set_background_color(LightGray);
    for i in (x + 1)..=(x + 10) {
        for j in 4..=17 {
            v_e_c(i, j, LightGray, "█");
        }
    }
    v_e_c(x + 2, 5, LightGreen, "▐  ▌▐  ▌");
    v_e_c(x + 2, 7, LightGreen, "▐  ▌▐  ▌");
    v_e_c(x + 7, 15, LightGreen, "▐  ▌");
    v_e_c(x + 7, 16, LightGreen, "▐  ▌");
    v_e_c(x + 3, 14, Brown, "▐ ▌");
    v_e_c(x + 2, 17, Brown, "▐█ █▌");
    v_e_c(x + 1, 13, Red, "▀ ▀ ▀ ▀ ▀");
    set_background_color(Black);
    v_e_c(x + 5, 1, Red, "▄▄");
    v_e_c(x + 3, 2, Red, "▄████▄");
    v_e_c(x + 1, 3, Red, "▄████████▄");
    set_background_color(Red);
    v_e_c(x + 5, 2, Yellow, "▄▄");
    v_e_c(x + 5, 3, Yellow, "▀▀");
    v_e_c(x + 1, 11, Yellow, "║ ║ ║ ║ ║ ");
    v_e_c(x + 1, 12, Yellow, "║ ║ ║ ║ ║ ");
    // v_e_c_b(x + 1, 9, White, "CHEZ  PAUL");
    set_background_color(Cyan);
    v_e_c(x + 3, 5, Black, "┼┼");
    v_e_c(x + 7, 5, Black, "┼┼");
    v_e_c(x + 3, 7, Black, "┼┼");
    v_e_c(x + 7, 7, Black, "┼┼");
    v_e_c(x + 8, 15, Black, "┼┼");
    v_e_c(x + 8, 16, Black, "┼┼");
    set_background_color(Brown);
    v_e_c(x + 4, 14, Black, "│");
    v_e_c(x + 4, 15, Black, "│");
    v_e_c(x + 3, 16, Black, "┌│┐");
    v_e_c(x + 4, 17, Black, "│");
}
