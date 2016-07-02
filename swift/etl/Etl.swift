class ETL {
    static func transform(_ old: [Int: [String]]) -> [String: Int] {
        var new = [String: Int]()
        old.forEach { (score, letters) in
            letters.forEach {
                new[$0.lowercased()] = score
            }
        }
        return new
    }
}
