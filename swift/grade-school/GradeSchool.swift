class GradeSchool {
    var roster = [Int: [String]]()

    var sortedRoster: [Int: [String]] {

        // Swift offers no way of mapping directly over a dictionary.
        // An option for this could be the following:
        //
        // var sortedRoster = roster
        // for grade in sortedRoster.keys {
        //     sortedRoster[grade] = sortedRoster[grade]!.sorted()
        // }
        // return sortedRoster
        //
        // But since that's kinda boring, I wrote the two extensions
        // at the bottom of the file so that the following now works:

        return roster.mapValues { (key, value) in
           (key, value.sorted())
        }

        // This is still far from ideal. Looking to improve on this
        // with further iterations. Especially `toDictionary` as it
        // will crash when being called on non-tuple-sequences.
    }

    func addStudent(_ student: String, grade: Int) {
        var gradeStudents = roster[grade] ?? []
        gradeStudents.append(student)
        roster[grade] = gradeStudents
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade] ?? []
    }
}

extension Dictionary {
    func mapValues<T: Hashable, U>(_ elementClosure: ((key: T, value: U) -> (T, U))) -> Dictionary<T, U> {
        return self.map { (tuple) in
            return elementClosure(key: tuple.0 as! T, value: tuple.1 as! U)
        }.toDictionary()
    }
}

extension Sequence {
    func toDictionary<T: Hashable, U>() -> Dictionary<T, U> {
        var returnDict = [T : U]()
        for i in self {
            let tuple = i as! (T, U)
            returnDict[tuple.0] = tuple.1
        }
        return returnDict
    }
}
