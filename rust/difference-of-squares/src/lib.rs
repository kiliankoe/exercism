pub fn square_of_sum(num: u64) -> u64 {
    (1..num+1)
        .fold(0, |acc, num| acc + num)
        .pow(2)
}

pub fn sum_of_squares(num: u64) -> u64 {
    (1..num+1)
        .map(|num| num.pow(2))
        .fold(0, |acc, num| acc + num)
}

pub fn difference(num: u64) -> u64 {
    square_of_sum(num) - sum_of_squares(num)
}
