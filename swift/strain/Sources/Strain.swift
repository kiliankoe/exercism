extension Collection {
    func keep(_ predicate: (Self.Iterator.Element) -> Bool) -> Array<Self.Iterator.Element> {
        // The following would also work, since it's basically the same idea, but that probably isn't the purpose of this exercism.
        // return self.filter(predicate)

        var new = Array<Self.Iterator.Element>()
        for e in self {
            if predicate(e) {
                new.append(e)
            }
        }
        return new
    }

    func discard(_ predicate: (Self.Iterator.Element) -> Bool) -> Array<Self.Iterator.Element> {
        var new = Array<Self.Iterator.Element>()
        for e in self {
            if !predicate(e) {
                new.append(e)
            }
        }
        return new
    }
}
