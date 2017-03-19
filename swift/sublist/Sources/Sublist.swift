enum ListKind {
    case equal, unequal, sublist, superlist
}

func classifier(listOne: [Int], listTwo: [Int]) -> ListKind {
    if listOne == listTwo {
        return .equal
    } else if listOne.isSublist(of: listTwo) {
        return .sublist
    } else if listTwo.isSublist(of: listOne) {
        return .superlist
    }
    return .unequal
}

extension Array where Element: Comparable {
    func isSublist(of other: [Element]) -> Bool {
        guard self.count < other.count else { return false }

        var idx = 0
        var selfIdx = 0
        var otherIdx = 0
        while otherIdx <= other.count - self.count {
            while selfIdx < self.count && self[selfIdx] == other[otherIdx] {
                selfIdx += 1
                otherIdx += 1
            }
            if selfIdx == self.count {
                return true
            }

            idx += 1
            selfIdx = 0
            otherIdx = idx
        }

        return false
    }
}
