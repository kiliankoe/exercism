pub fn verse(num: u8) -> String {
    match num {
        0 => "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n".to_string(),
        1 => "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n".to_string(),
        2 => "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n".to_string(),
        _ => format!("{} bottles of beer on the wall, {} bottles of beer.\nTake one down and pass it around, {} bottles of beer on the wall.\n", num, num, num - 1),
    }
}

pub fn sing(begin: u8, end: u8) -> String {
    let mut verses = Vec::<String>::new();
    for verse_num in (end..begin+1).rev() {
        verses.push(verse(verse_num));
    }

    verses.join("\n")
}
