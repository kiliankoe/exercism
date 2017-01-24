pub fn raindrops(num: usize) -> String {
    let factors = rain_factors(num);
    let mut rain = String::new();

    for factor in factors {
        match factor {
            3 => rain.push_str("Pling"),
            5 => rain.push_str("Plang"),
            7 => rain.push_str("Plong"),
            _ => continue,
        };
    }

    if rain.is_empty() {
        rain = format!("{}", num);
    }

    rain
}

fn rain_factors(num: usize) -> Vec<usize> {
    let mut factors = Vec::new();
    let candidates = vec![3, 5, 7];
    for cand in candidates {
        if num % cand == 0 {
            factors.push(cand);
        }
    }
    factors
}
