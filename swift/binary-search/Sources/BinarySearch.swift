enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch<T: Comparable> {
    enum Position {
        case middle
    }

    let list: [T]

    var middle: Int {
        return list.count / 2
    }

    init(_ list: [T]) throws {
        guard list == list.sorted() else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }

    func searchFor(_ query: T) -> Int? {
        return binarySearch(query: query, min: 0, max: list.count - 1)
    }

    private func binarySearch(query: T, min: Int, max: Int) -> Int? {
        guard max != min else { return nil }

        let middle = (max + min) / 2
        if query == list[middle] { return middle }

        if query > list[middle] {
            return binarySearch(query: query, min: middle + 1, max: max)
        } else {
            return binarySearch(query: query, min: min, max: middle - 1)
        }
    }
}
