use crate::color::Color;
use crate::crt::{clear_screen, goto_xy, set_background_color, set_foreground_color, writeln};
use crate::outils::{v_e, v_e_al, v_e_c};
use std::thread;
use std::time::Duration;

pub(crate) fn present_1() {
    clear_screen();
    set_background_color(Color::Black);
    set_foreground_color(Color::Red);
    v_e(20, 1, "                              ▄    ▄");
    v_e(20, 2, "  ▄▀▀▄   █  ▄▀▀▄     █   ▄▀▀█▀  ▄▀▀   ▄▀▀▀");
    v_e(20, 3, "  █▄▀   █   █▀█     █▄█    █   ▄▀▀     ▀▄");
    v_e(20, 4, "  █    █    █  ▀▄  █  █   █   █▄▄▄  ▀▄▄▀");
    v_e(20, 5, " ▀    ▀    ▀      ▀      ▀");
    set_foreground_color(Color::White);
    v_e(31, 7, "    ▄▄▄█████▄▄▄");
    v_e(31, 8, "  ▄█████████████");
    v_e(31, 9, "  ███████████████");
    v_e(31, 10, " █▌█████████████▐█");
    v_e(31, 11, " █ █▀   ███   ▀█ █");
    v_e(31, 12, " ▄▄█   ▄█▀█▄   █▄");
    v_e(31, 13, "  ▀█████   █████▀");
    v_e(31, 14, "      ██▄█▄██");
    v_e(31, 15, "      █ █ █ ▀");
    for _ in 0..5 {
        for y in 14..=16 {
            set_foreground_color(Color::White);
            for i in 0..=1 {
                v_e(31, y, "    ▄");
                v_e(45, y, "▄");
                v_e(31, y + 1, "    █");
                v_e(45, y + 1, "█");
                v_e(31, y + 2, "    ██ █ ▄ █ ██");
                v_e(31, y + 3, "     ▀███████▀");
                v_e(31, y + 4, "        ▀▀▀");
                set_foreground_color(Color::Black);
                if i == 0 {
                    thread::sleep(Duration::from_millis(100));
                }
            }
        }
        for y in (14..=16).rev() {
            set_foreground_color(Color::White);
            for i in 0..=1 {
                v_e(31, y, "    ▄");
                v_e(45, y, "▄");
                v_e(31, y + 1, "    █");
                v_e(45, y + 1, "█");
                v_e(31, y + 2, "    ██ █ ▄ █ ██");
                v_e(31, y + 3, "     ▀███████▀");
                v_e(31, y + 4, "        ▀▀▀");
                set_foreground_color(Color::Black);
                if i == 0 {
                    thread::sleep(Duration::from_millis(100));
                }
            }
        }
    }
    set_foreground_color(Color::White);
    let y = 14;
    v_e(31, y, "    ▄");
    v_e(45, y, "▄");
    v_e(31, y + 1, "    █");
    v_e(45, y + 1, "█");
    v_e(22, y + 2, " █▀██▄       ██ █ ▄ █ ██      ▄██▀█▄");
    v_e(22, y + 3, "▄█▄▄▀██▄      ▀███████▀     ▄██▀▀█▄██");
    v_e(22, y + 4, "  ▀▀█▄████▄▄            ▄▄▄█▀▄▄█▀▀▀█▀");
    v_e(22, y + 5, "      ▀▀▀▀████▄▄ ▄ ▄▄███████▀▀");
    v_e(22, y + 6, "            ▀▀▄▄█████▀▀▀");
    v_e(22, y + 7, "▀██▄▄▄▄▄▄▄▄███▀▀    ▄▄█▄▄          ▄▄");
    v_e(22, y + 8, " █ █▀▄▄▀▀▀▀▀▀        ▀▀████████▄█▀▀██▀");
    v_e(22, y + 9, "▀██▀▀                        ▀▀▀▀██▄█▄");
    set_foreground_color(Color::LightGray);
    v_e(55, 24, "(c) Copyright CHAPROT Inc.");
}

pub(crate) fn present_2() {
    // FIXME: manage random color
    // let mut rng = rand::thread_rng();
    // let index = rng.gen_range(0..7);
    // set_background_color(Color::from(Color::AnsiValue(index)));
    set_background_color(Color::Black);
    clear_screen();

    v_e_al(33, 3, "Programmeurs :");
    v_e_al(29, 4, "Jean-Christophe Amiel");
    v_e_al(34, 5, "Paul Crochet");
    v_e_al(33, 6, "Vincent Dupin");
    v_e_al(33, 7, "Nicolas Gomond");
    v_e_al(26, 8, "Directeur de la production :");
    v_e_al(32, 9, "JCA le sale roux");
    v_e_al(29, 10, "Directeur artistique :");
    v_e_al(30, 11, "PC alias village pop");
    v_e_al(26, 12, "Directeur de la publicité :");
    v_e_al(31, 13, "NG ou éléphant man");
    v_e_al(
        11,
        14,
        "Directeur de quelque chose comme euh..., comme nous quoi!",
    );
    v_e_al(33, 15, "VD dit le nain");
    v_e_al(31, 16, "Porteur de pizza :");
    v_e_al(33, 17, "Tonio le Macho");
    v_e_al(35, 18, "Facteur :");
    v_e_al(33, 19, "Robert Dupont");
    v_e_al(35, 20, "Sponsor :");
    v_e_al(29, 21, "Bernard Tapie Finances");
}

pub(crate) fn present_3() {
    set_background_color(Color::Black);
    clear_screen();
    v_e_c(27, 9, Color::Yellow, "Bref tout a été fait par :");
    v_e_c(29, 11, Color::Cyan, "Jean-Christophe Amiel");
    v_e_c(34, 12, Color::Cyan, "Paul Crochet");
    v_e_c(33, 13, Color::Cyan, "Vincent Dupin");
    v_e_c(33, 14, Color::Cyan, "Nicolas Gomond");
}

pub(crate) fn present_4() {
    set_background_color(Color::Black);
    clear_screen();
    v_e_c(1, 6, Color::Yellow, "█   █");
    v_e_c(1, 7, Color::Yellow, " █ █");
    v_e_c(1, 8, Color::Yellow, "  █");

    set_foreground_color(Color::Cyan);
    goto_xy(6, 8);
    writeln("oilà maintenant 20 ans que tu sillonnes les mers");
    writeln("et les océans. Après avoir vécu jusqu'à l'àge de 16 ans");
    writeln("comme petit mousse, à laver les ponts, à te faire insulter");
    writeln("par tes supérieurs, après avoir cotoyé les plus grands");
    writeln("flibustiers; ton rêve est maintenant de devenir leur égal.");
    writeln("Mais la route est encore longue : Tu n'es qu'un vulgaire");
    writeln("blanc-bec, et pour atteindre le stade suprême de Pirate,");
    writeln("il te faudra affronter les pires dangers.");
    writeln("  Après quelques grosses difficultés, tu as enfin");
    writeln("réussi à réunir des amis et un maigre butin : tu possèdes 300 écus.");
    writeln("  Tu es en ce moment amaré à l'Ile de la Tortue,");
    writeln("le fameux repère des plus grands Frères de la côte. Ton but");
    writeln("est de faire fructifier ton pactole. Pour cela, tu possèdes");
    writeln("une caravelle à 1 mât avec laquelle tu peux commercer de");
    writeln("ports en ports tout en recrutant des marins.");
}
