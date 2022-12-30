#!/usr/bin/env python3
import sys
from pathlib import Path


def convert(src: Path):
    text = src.read_text(encoding="utf-8")

    extended_ascii = [
        #(0x82, ",", "é"),
        (0x83, "ƒ", "â"),
        (0x85, "…", "à"),
        (0x88, "ˆ", "ê"),
        (0x8a, "Š", "è"),
        (0x93, "“", "ô"),
        (0xb0, "°", "░"),
        (0xb1, "±", "▒"),
        (0xb2, "²", "▓"),
        (0xb3, "³", "│"),
        (0xb9, "¹", "╣"),
        (0xba, "º", "║"),
        (0xbb, "»", "╗"),
        (0xbc, "¼", "╝"),
        (0xbd, "½", "╜"),
        (0xbe, "¾", "╛"),
        (0xbf, "¿", "┐"),
        (0xc0, "À", "└"),
        (0xc1, "Á", "┴"),
        (0xc2, "Â", "┬"),
        (0xc3, "Ã", "├"),
        (0xc4, "Ä", "─"),
        (0xc5, "Å", "┼"),
        (0xc6, "Æ", "╞"),
        (0xc7, "Ç", "╟"),
        (0xc8, "È", "╚"),
        (0xc9, "É", "╔"),
        (0xca, "Ê", "╩"),
        (0xcb, "Ë", "╦"),
        (0xcc, "Ì", "╠"),
        (0xcd, "Í", "═"),
        (0xce, "Î", "╬"),
        (0xcf, "Ï", "╧"),
        (0xd0, "Ð", "╨"),
        (0xd1, "Ñ", "╤"),
        (0xd2, "Ò", "╥"),
        (0xd3, "Ó", "╙"),
        (0xd4, "Ô", "╘"),
        (0xd5, "Õ", "╒"),
        (0xd6, "Ö", "╓"),
        (0xd7, "×", "╫"),
        (0xd8, "Ø", "╪"),
        (0xd9, "Ù", "┘"),
        (0xda, "Ú", "┌"),
        (0xdb, "Û", "█"),
        (0xdc, "Ü", "▄"),
        (0xdd, "Ý", "▌"),
        (0xde, "Þ", "▐"),
        (0xdf, "ß", "▀"),
    ]

    for (_, old, new) in extended_ascii:
        text = text.replace(old, new)
    src.write_text(text, encoding="utf-8")


if __name__ == "__main__":
    convert(Path(sys.argv[1]))
