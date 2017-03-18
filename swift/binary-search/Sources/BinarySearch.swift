enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch {
    enum Position {
        case middle
    }

    let list: [Int]

    var middle: Int {
        return list.count / 2
    }

    init(_ list: [Int]) throws {
        guard list == list.sorted() else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }

    func searchFor(_ query: Int) -> Int? {
        var searchPos = self.middle

        while true {
            if list[searchPos] == query { return searchPos }

            // this should be 0..<list.count imo, but that leads to an infinite loop
            // this "workaround" passes all but one test :/
            guard 1..<list.count ~= searchPos else { return nil }

            if query > list[searchPos] {
                searchPos += (list.count - searchPos) / 2
            } else {
                searchPos -= (list.count - searchPos) / 2
            }
        }
    }
}
