pub fn is_leap_year(year: u64) -> bool {
    if div_by(4, year) && !div_by(100, year) && !div_by(400, year) {
        true
    } else { div_by(4, year) && div_by(100, year) && div_by(400, year) }
}

fn div_by(num: u64, year: u64) -> bool {
    year % num == 0
}
