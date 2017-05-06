pub fn reply(phrase: &str) -> String {
    PhraseKind::from(phrase).reply()
}

enum PhraseKind {
    Normal,
    Shout,
    Question,
    Empty
}

impl PhraseKind {
    fn reply(self) -> String {
        match self {
            PhraseKind::Normal   => "Whatever.",
            PhraseKind::Shout    => "Whoa, chill out!",
            PhraseKind::Question => "Sure.",
            PhraseKind::Empty    => "Fine. Be that way!",
        }
        .to_string()
    }
}

impl<'a> From<&'a str> for PhraseKind {
    fn from(phrase: &str) -> PhraseKind {
        if phrase.is_empty() {
            return PhraseKind::Empty
        } else if phrase == phrase.to_uppercase() {
            return PhraseKind::Shout
        } else if phrase.to_string().pop() == Some('?') {
            return PhraseKind::Question
        }
        PhraseKind::Normal
    }
}
