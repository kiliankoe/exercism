enum ListKind {
    case equal, unequal, sublist, superlist
}

// This rather stupid implementation has obvious flaws. It breaks if a sublist has other 
// values shoved in between, something the readme doesn't make clear as a requirement :/
// But that's good enough for 14/17 tests, so an ok first try I guess? ¯\_(ツ)_/¯

func classifier(listOne: [Int], listTwo: [Int]) -> ListKind {
    if listOne == listTwo { return .equal }
    if listOne.isEmpty && !listTwo.isEmpty { return .sublist }
    if listTwo.isEmpty && !listOne.isEmpty { return .superlist }

    if listTwo.count >= listOne.count {
        guard let firstIdx = listTwo.index(of: listOne[0]) else { return .unequal }
        for (idx, el) in listOne.enumerated() {
            guard idx > firstIdx else { continue }
            guard el == listTwo[idx] else { return .unequal }
        }
        return .sublist
    } else {
        guard let firstIdx = listOne.index(of: listTwo[0]) else { return .unequal }
        for (idx, el) in listTwo.enumerated() {
            guard idx > firstIdx else { continue }
            guard el == listOne[idx] else { return .unequal }
        }
        return .superlist
    }
}
