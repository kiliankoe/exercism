enum ListKind {
    case equal, unequal, sublist, superlist
}

// This actually breaks the very first test `testEmptyLists` since the type of two empty
// lists can't be inferred to be `[Equatable]`. It's fine with an explicit type, so I'm 
// going to leave this generic.
func classifier<T: Equatable>(listOne: [T], listTwo: [T]) -> ListKind {
    if listOne == listTwo {
        return .equal
    } else if listOne.isSublist(of: listTwo) {
        return .sublist
    } else if listTwo.isSublist(of: listOne) {
        return .superlist
    }
    return .unequal
}

extension Array where Element: Equatable {
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
