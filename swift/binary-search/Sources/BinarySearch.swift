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
        var maxIdx = list.count - 1
        var minIdx = 0
        var searchPos: Int

        while maxIdx != minIdx {
            searchPos = (maxIdx + minIdx) / 2
            if query == list[searchPos] { return searchPos }

            if query > list[searchPos] {
                minIdx = searchPos + 1
            } else {
                maxIdx = searchPos - 1
            }
        }
        
        return nil
    }
}
