use crate::color::Color;
use crossterm::cursor::MoveTo;
use crossterm::style::{Attribute, Print, SetAttribute, SetForegroundColor};
use crossterm::{ExecutableCommand, QueueableCommand};
use rand::Rng;
use std::io::{stdout, Write};

pub(crate) fn v_e(x: u16, y: u16, text: &str) {
    let mut stdout = stdout();
    stdout
        .execute(MoveTo(x - 1, y - 1))
        .unwrap()
        .execute(Print(text))
        .unwrap()
        .flush()
        .unwrap();
}

pub(crate) fn v_e_al(x: u16, y: u16, text: &str) {
    let mut stdout = stdout();

    // FIXME: change color managment
    let mut rng = rand::thread_rng();
    let index = rng.gen_range(0..7) + 8;
    stdout
        .queue(MoveTo(x - 1, y - 1))
        .unwrap()
        .queue(SetForegroundColor(crossterm::style::Color::AnsiValue(
            index,
        )))
        .unwrap()
        .queue(Print(text))
        .unwrap()
        .flush()
        .unwrap();
}

pub(crate) fn v_e_c(x: u16, y: u16, color: Color, text: &str) {
    let mut stdout = stdout();
    stdout
        .queue(MoveTo(x - 1, y - 1))
        .unwrap()
        .queue(SetForegroundColor(crossterm::style::Color::from(color)))
        .unwrap()
        .queue(Print(text))
        .unwrap()
        .flush()
        .unwrap();
}

pub(crate) fn v_e_c_b(x: u16, y: u16, color: Color, text: &str) {
    let mut stdout = stdout();
    stdout
        .queue(MoveTo(x - 1, y - 1))
        .unwrap()
        .queue(SetAttribute(Attribute::SlowBlink))
        .unwrap()
        .queue(SetForegroundColor(crossterm::style::Color::from(color)))
        .unwrap()
        .queue(Print(text))
        .unwrap()
        .queue(SetAttribute(Attribute::NoBlink))
        .unwrap()
        .flush()
        .unwrap();
}

pub(crate) fn v_e_c2(x: u16, y: u16, color: Color, number: i32) {
    let mut stdout = stdout();
    stdout
        .queue(MoveTo(x - 1, y - 1))
        .unwrap()
        .queue(SetForegroundColor(crossterm::style::Color::from(color)))
        .unwrap()
        .queue(Print(number.to_string()))
        .unwrap()
        .flush()
        .unwrap();
}
