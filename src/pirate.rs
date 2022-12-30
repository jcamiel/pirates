use crate::carte::lacarte;
use crate::color::Color::{Blue, Brown, Cyan, White};
use crate::crt::{
    goto_xy, init_crt, read, readln, set_background_color, set_foreground_color, terminate_crt,
    writeln,
};
use crate::ecr_jeux::{
    ecran_princ, maison1_1, maison1_2, maison2_1, maison2_2, maison3_1, maison3_2, maison4_1,
    maison4_2, maison5_1, maison5_2, port,
};
use crate::outils::{v_e_c, v_e_c2, v_e_c_b};
use crate::present::{present_1, present_2, present_3, present_4};

struct Ident {
    tabsoute: [i32; 17],
    nom: String,
    test: i32,
    grade: String,
    argent: i32,
    arg_bank: i32,
    homme: i32,
    bateau: String,
    numebat: i32,
    mat: i32,
    soute: i32,
    soutemax: i32,
    canon: i32,
    taboute: [&'static str; 11],
    taboutva: [&'static str; 11],
    tabnombre2: [i32; 17],
    tabmarch_prix: [i32; 17],
    arial: String,
    distance: f32,
}

// **COORD**   *********MAISON*******    *STATUT*
// VILLE                PAYS           X     Y     1    2    3    4    5
#[rustfmt::skip]
const TABVIL: [[&str; 11]; 15] = [
    ["1",  " Véracruz  ", "Nlle Espagne    ", "12", "6",  "1", "2", "1", "1", "2", "riche  "],
    ["2",  " Campêche  ", "Mexique         ", "17", "11", "1", "1", "2", "2", "1", "pauvre "],
    ["3",  " La Havane ", "Cuba            ", "33", "9",  "1", "2", "2", "1", "2", "modeste"],
    ["4",  " La Tortue ", "Ile de la Tortue", "51", "10", "2", "1", "1", "2", "2", "riche  "],
    ["5",  "Porto Bello", "Mexique         ", "37", "18", "2", "2", "1", "1", "1", "modeste"],
    ["6",  "  Panama   ", "Mexique         ", "34", "18", "1", "1", "1", "1", "1", "riche  "],
    ["7",  " Cartagéna ", "Nlle Grenade    ", "46", "18", "2", "1", "2", "1", "2", "pauvre "],
    ["8",  "Marguerite ", "Iles Vierges    ", "65", "8",  "1", "2", "2", "2", "1", "pauvre "],
    ["9",  " St Thomas ", "Venézuéla       ", "54", "20", "2", "1", "2", "1", "2", "modeste"],
    ["10", "  Grenade  ", "Iles Vierges    ", "75", "15", "1", "2", "1", "2", "1", "modeste"],
    ["11", "Port Royal ", "Nlle Espagne    ", "25", "3",  "2", "2", "2", "2", "2", "riche  "],
    ["12", " Long Ben  ", "Floride         ", "38", "3",  "1", "1", "2", "1", "1", "riche  "],
    ["13", " Acapulco  ", "Nlle Espagne    ", "17", "18", "2", "2", "1", "2", "2", "riche  "],
    ["14", "St Domingue", "Haïti           ", "56", "13", "2", "1", "2", "2", "1", "modeste"],
    ["15", "Porto Rico ", "Iles Vierges    ", "74", "10", "2", "1", "2", "1", "1", "pauvre "],
];

fn gestion_carte(identite: &mut Ident) {
    loop {
        let mut choix_carte = 0;
        let mut xout;
        let mut yout;
        let mut choix;

        loop {
            v_e_c(78, 2, White, identite.taboute[0]);
            xout = identite.taboute[3].parse::<u16>().unwrap();
            yout = identite.taboute[4].parse::<u16>().unwrap();
            set_background_color(Blue);
            v_e_c_b(xout, yout, White, identite.taboute[0]);
            v_e_c(3, 23, White, "Choix de la ville de destination : ");
            if let Ok(n) = readln().parse::<u8>() {
                choix_carte = n;
            }
            if !(1..=15).contains(&choix_carte) {
                v_e_c(38, 23, Blue, "█████████");
                continue;
            }
            break;
        }

        v_e_c(xout, yout, White, identite.taboute[0]);
        identite.taboutva = TABVIL[(choix_carte - 1) as usize];
        let xclign = identite.taboutva[3].parse::<u16>().unwrap();
        let yclign = identite.taboutva[4].parse::<u16>().unwrap();
        set_background_color(Blue);
        v_e_c_b(xclign, yclign, White, identite.taboutva[0]);

        loop {
            let distance = ((xclign as f32 - xout as f32).powi(2)
                + (yclign as f32 - yout as f32).powi(2))
            .sqrt()
                * 33.0;
            identite.distance = distance.floor();
            goto_xy(14, 22);
            set_foreground_color(White);
            writeln(format!("{}", identite.distance as u32).as_str());
            goto_xy(3, 23);
            writeln(
                format!(
                    "Destination : {}  ({}),  Status : {} (O/N) ? ",
                    identite.taboutva[1], identite.taboutva[2], identite.taboutva[10]
                )
                .as_str(),
            );
            choix = read();
            if upcase(choix) != 'O' && upcase(choix) != 'N' {
                v_e_c(76, 23, Blue, "████");
                continue;
            }
            break;
        }

        if upcase(choix) == 'O' {
            break;
        }
    }
    identite.taboute = identite.taboutva;
}

fn upcase(c: char) -> char {
    c.to_uppercase().to_string().chars().next().unwrap()
}

fn ici(identite: &mut Ident) {
    lacarte();
    gestion_carte(identite);
}

fn choix_menu(identite: &mut Ident) -> char {
    let c = read();
    match upcase(c) {
        'P' => {
            ici(identite);
        }
        _ => {}
    }
    c
}

fn gestion_maison(identite: &Ident) {
    port();
    if identite.taboute[5] == "1" {
        maison1_1();
    } else {
        maison1_2();
    }
    if identite.taboute[6] == "1" {
        maison2_1();
    } else {
        maison2_2();
    }
    if identite.taboute[7] == "1" {
        maison3_1();
    } else {
        maison3_2();
    }
    if identite.taboute[8] == "1" {
        maison4_1();
    } else {
        maison4_2();
    }
    if identite.taboute[9] == "1" {
        maison5_1();
    } else {
        maison5_2();
    }

    set_background_color(Brown);
    v_e_c(68, 13, White, identite.taboute[1]);
}

fn ville(identite: &mut Ident) {
    ecran_princ();
    gestion_maison(identite);
    set_background_color(Cyan);
    v_e_c(67, 2, Blue, &identite.grade);
    v_e_c(67, 3, Blue, &identite.nom);
    v_e_c2(67, 5, Blue, identite.argent);
    v_e_c2(69, 6, Blue, identite.homme);
    v_e_c(69, 7, Blue, &identite.bateau);
    v_e_c2(70, 8, Blue, identite.mat);
    v_e_c2(72, 9, Blue, identite.soute);
    v_e_c2(76, 9, Blue, identite.soutemax);
    v_e_c2(70, 10, Blue, identite.canon);
}

fn variables() -> Ident {
    Ident {
        tabsoute: [0; 17],
        nom: "Toto".to_string(),
        test: 1,
        grade: "BLANC-BEC".to_string(),
        argent: 3000,
        arg_bank: 0,
        homme: 6,
        bateau: "E CARAVELLE".to_string(),
        numebat: 1,
        mat: 1,
        soute: 0,
        soutemax: 65,
        canon: 10,
        taboute: TABVIL[3],
        taboutva: TABVIL[3],
        tabnombre2: [0; 17],
        tabmarch_prix: [0; 17],
        arial: "".to_string(),
        distance: 0.0,
    }
}

pub(crate) fn run() {
    init_crt();

    let mut identite = variables();
    present_1();
    readln();
    present_2();
    readln();
    present_3();
    readln();
    present_4();
    readln();

    loop {
        ville(&mut identite);
        let carac = choix_menu(&mut identite);
        if upcase(carac) == 'Q' {
            break;
        }
    }

    terminate_crt();
}
