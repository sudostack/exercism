pub fn raindrops(n: u32) -> String {
    let is_factor = |factor: u32| n % factor == 0;
    let mut result = String::new();
    if is_factor(3) {
        result += "Pling"
    }
    if n % 5 == 0 {
        result += "Plang"
    }
    if n % 7 == 0 {
        result += "Plong"
    }
    if !(n % 3 == 0 || n % 5 == 0 || n % 7 == 0) {
        result += &n.to_string()
    }
    result
}
