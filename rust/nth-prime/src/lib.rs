pub fn nth(n: u32) -> u32 {
    // primes are numbers that are only divisble by one and itself
    let mut primes: Vec<u32> = Vec::new();
    let mut i = 2;
    let done = n as usize;
    while primes.len() < done {
        println!(
        if is_prime(i) {
            primes.push(i)
        }
        i = i + 1
    }
    primes[done]
}

fn is_prime(num: u32) -> bool {
    for i in 1..num {
        if num % i == 0 {
            return false;
        }
    }
    true
}
