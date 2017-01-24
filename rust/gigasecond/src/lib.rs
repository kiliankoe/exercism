extern crate chrono;

use chrono::datetime::DateTime;
use chrono::offset::utc::UTC;
use chrono::duration::Duration;

const GIGASECOND: i64 = 1_000_000_000;

pub fn after(datetime: DateTime<UTC>) -> DateTime<UTC> {
    datetime + Duration::seconds(GIGASECOND)
}
