extension Array {
    func accumulate<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for value in self {
            result.append(transform(value))
        }
        return result
    }
}
