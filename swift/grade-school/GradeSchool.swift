class GradeSchool {
    var roster = [Int: [String]]()

    var sortedRoster: [Int: [String]] {
        return roster.mapValues{ $0.sorted() }
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
    func mapValues<T>(transform: (Value) -> T) -> Dictionary<Key, T> {
        var newDict: [Key: T] = [:]
        for (k, v) in self {
            newDict[k] = transform(v)
        }
        return newDict
    }
}
