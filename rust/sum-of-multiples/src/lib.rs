pub fn sum_of_multiples(bound: u64, factors: &Vec<u64>) -> u64 {
    let mut sum = 0;

    for i in 1..bound {
        for factor in factors {
            if i % factor == 0 {
                sum += i;
                break;
            }
        }
    }

    sum
}
