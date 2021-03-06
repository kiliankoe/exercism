import Foundation

struct Gigasecond {
    private let date: Date

    private static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        df.timeZone = TimeZone(abbreviation: "UTC")
        return df
    }()

    init?(from dateString: String) {
        guard let date = Gigasecond.dateFormatter.date(from: dateString) else {
            return nil
        }
        self.date = date
    }

    var gigasecondBirthday: Date {
        return date.addingTimeInterval(pow(10, 9))
    }
}

extension Gigasecond: CustomStringConvertible {
    var description: String {
        return Gigasecond.dateFormatter.string(from: gigasecondBirthday)
    }
}
