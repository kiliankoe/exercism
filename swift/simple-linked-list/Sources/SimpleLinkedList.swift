class Element<Value> {
    let value: Value?
    var next: Element?

    init(_ value: Value?, _ next: Element?) {
        self.value = value
        self.next = next
    }

    convenience init() {
        self.init(nil, nil)
    }

    static func fromArray(_ array: [Value]) -> Element<Value> {
        guard array.count > 0 else { return Element() }
        guard array.count > 1 else { return Element(array[0], nil) }
        var array = array
        let first = array.removeFirst()
        return Element(first, Element.fromArray(array))
    }

    func toArray() -> [Value] {
        guard let value = self.value else { return [] }
        guard let next = self.next else { return [value] }
        return [value] + next.toArray()
    }

    func reverseElements(previous: Element? = nil) -> Element {
        defer { self.next = previous }
        guard let next = self.next else { return self }
        return next.reverseElements(previous: self)
    }
}
