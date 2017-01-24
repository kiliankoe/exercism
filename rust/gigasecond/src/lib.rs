extern crate chrono;

use chrono::{DateTime, TimeZone, Duration};

const GIGASECOND: i64 = 1_000_000_000;

pub fn after<T: TimeZone>(datetime: DateTime<T>) -> DateTime<T> {
    datetime + Duration::seconds(GIGASECOND)
}
