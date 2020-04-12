public struct Matrix {
    public let rows: [[Int]]

    public var columns: [[Int]] {
        rows[0].indices.map { idx in
            rows.compactMap { row in
                return row[idx]
            }
        }
    }

    public init(_ string: String) {
        self.rows = string
            .split(separator: "\n")
            .map {
                 $0.split(separator: " ")
                    .map(String.init)
                    .compactMap(Int.init)
            }
    }
}
