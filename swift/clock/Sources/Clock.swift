import Foundation

struct Clock {
    let hour: Int
    let minute: Int

    init(hours: Int = 0, minutes: Int = 0) {
        let minuteOverflow = Int(minutes / 60)
        var hour = (hours + minuteOverflow) %% 24
        let minute = minutes %% 60

        if minutes < 0 {
            hour -= 1
            hour = hour %% 24
        }

        self.hour = hour
        self.minute = minute
    }

    func add(minutes: Int) -> Clock {
        return Clock(hours: self.hour, minutes: self.minute + minutes)
    }

    func subtract(minutes: Int) -> Clock {
        return Clock(hours: self.hour, minutes: self.minute - minutes)
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        return String(format: "%02d:%02d", hour, minute)
    }
}

extension Clock: Equatable {}
func ==(lhs: Clock, rhs: Clock) -> Bool {
    return lhs.hour == rhs.hour && lhs.minute == rhs.minute
}

// Swift's built-in modulo is no actual modulo, since it can't handle negative values correctly 😕
infix operator %%
func %% (lhs: Int, rhs: UInt) -> Int {
    let r = lhs % Int(rhs)
    return r >= 0 ? r : r + Int(rhs)
}
