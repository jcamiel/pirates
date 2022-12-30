pub(crate) enum Color {
    Black,
    Blue,
    Brown,
    Cyan,
    DarkGray,
    Green,
    Magenta,
    LightGray,
    LightGreen,
    LightRed,
    Red,
    White,
    Yellow,
}

impl From<Color> for crossterm::style::Color {
    fn from(value: Color) -> Self {
        match value {
            Color::Black => crossterm::style::Color::AnsiValue(16),
            Color::Blue => crossterm::style::Color::AnsiValue(19),
            Color::Brown => crossterm::style::Color::AnsiValue(130),
            Color::Cyan => crossterm::style::Color::AnsiValue(30),
            Color::DarkGray => crossterm::style::Color::AnsiValue(240),
            Color::Green => crossterm::style::Color::AnsiValue(34),
            Color::Magenta => crossterm::style::Color::AnsiValue(91),
            Color::LightGray => crossterm::style::Color::AnsiValue(248),
            Color::LightGreen => crossterm::style::Color::AnsiValue(46),
            Color::LightRed => crossterm::style::Color::AnsiValue(204),
            Color::Red => crossterm::style::Color::AnsiValue(124),
            Color::White => crossterm::style::Color::AnsiValue(231),
            Color::Yellow => crossterm::style::Color::AnsiValue(226),
        }
    }
}
