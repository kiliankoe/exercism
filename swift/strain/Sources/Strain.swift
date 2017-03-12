extension Array {
    func keep(_ predicate: (Element) -> Bool) -> Array<Element> {
        // The following would also work, since it's basically the same idea, but that probably isn't the purpose of this exercism.
        // return self.filter(predicate)

        var new = Array<Element>()
        for e in self {
            if predicate(e) {
                new.append(e)
            }
        }
        return new

    }

    func discard(_ predicate: (Element) -> Bool) -> Array<Element> {
        var new = Array<Element>()
        for e in self {
            if !predicate(e) {
                new.append(e)
            }
        }
        return new
    }
}
