pub fn reply(query: &str) -> &str {
    let kind = QueryKind::classify(query);
    match kind {
        QueryKind::Normal   => "Whatever.",
        QueryKind::Shout    => "Whoa, chill out!",
        QueryKind::Question => "Sure.",
        QueryKind::Empty    => "Fine. Be that way!",
    }
}

enum QueryKind {
    Normal,
    Shout,
    Question,
    Empty
}

impl QueryKind {
    fn classify(query: &str) -> QueryKind {
        if query.is_empty() {
            return QueryKind::Empty
        } else if query == query.to_uppercase() {
            return QueryKind::Shout
        } else if query.chars().last() == Some('?') {
            return QueryKind::Question
        }
        QueryKind::Normal
    }
}
