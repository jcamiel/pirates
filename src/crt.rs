use crate::color::Color;
use crossterm::cursor::{Hide, MoveTo, Show};
use crossterm::event::KeyCode::Char;
use crossterm::event::{Event, KeyEvent, KeyEventKind, KeyEventState, KeyModifiers};
use crossterm::style::{Attribute, Print, SetAttribute, SetBackgroundColor, SetForegroundColor};
use crossterm::terminal::{Clear, ClearType};
use crossterm::{terminal, ExecutableCommand, QueueableCommand};
use std::io;
use std::io::{stdout, Write};

pub(crate) fn clear_screen() {
    let mut stdout = stdout();
    for i in 0..=23 {
        stdout
            .queue(MoveTo(0, i))
            .unwrap()
            .queue(Print(" ".repeat(80)))
            .unwrap();
    }
    stdout.flush().unwrap();

    //stdout().execute(Clear(ClearType::All)).unwrap();
}

pub(crate) fn set_background_color(color: Color) {
    stdout().execute(SetBackgroundColor(color.into())).unwrap();
}

pub(crate) fn set_foreground_color(color: Color) {
    stdout().execute(SetForegroundColor(color.into())).unwrap();
}

pub(crate) fn init_crt() {
    let mut stdout = stdout();
    stdout
        .queue(Clear(ClearType::All))
        .unwrap()
        .queue(Hide)
        .unwrap()
        .queue(SetAttribute(Attribute::Bold))
        .unwrap()
        .flush()
        .unwrap();
}

pub(crate) fn terminate_crt() {
    let mut stdout = stdout();
    stdout
        .queue(Show)
        .unwrap()
        .queue(SetForegroundColor(Color::White.into()))
        .unwrap()
        .queue(SetBackgroundColor(Color::Black.into()))
        .unwrap()
        .queue(SetAttribute(Attribute::Reset))
        .unwrap()
        .queue(Clear(ClearType::All))
        .unwrap()
        .queue(MoveTo(0, 0))
        .unwrap()
        .flush()
        .unwrap();
}

pub(crate) fn readln() -> String {
    let mut buffer = String::new();
    let stdin = io::stdin();
    stdin.read_line(&mut buffer).unwrap();
    buffer.trim_end().to_string()
}

pub(crate) fn read() -> char {
    terminal::enable_raw_mode().unwrap();
    loop {
        let c = crossterm::event::read();
        match c {
            Ok(Event::Key(KeyEvent {
                code: Char(c),
                modifiers: KeyModifiers::NONE,
                kind: KeyEventKind::Press,
                state: KeyEventState::NONE,
            })) => {
                terminal::disable_raw_mode().unwrap();
                return c;
            }
            Err(e) => {
                panic!("{}", e);
            }
            _ => {}
        }
    }
}

pub(crate) fn writeln(text: &str) {
    stdout().execute(Print(format!("{}\n", text))).unwrap();
}

pub(crate) fn goto_xy(x: u16, y: u16) {
    stdout().execute(MoveTo(x - 1, y - 1)).unwrap();
}
