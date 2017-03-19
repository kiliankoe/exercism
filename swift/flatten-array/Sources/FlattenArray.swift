func flattenArray<T, U>(_ arr: [T]) -> [U] {
    var tail = arr
    guard tail.count > 0 else { return [] }
    let head = tail.removeFirst()

    if let head = head as? U {
        return [head] + flattenArray(tail)
    } else if let head = head as? [T] {
        return flattenArray(head) + flattenArray(tail)
    } else {
        return flattenArray(tail)
    }
}
