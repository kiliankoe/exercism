package leap

const testVersion = 2

// IsLeapYear returns if the given year is a leap year or not.
func IsLeapYear(year int) bool {
	return year%4 == 0 && year%100 != 0 || year%400 == 0
}
