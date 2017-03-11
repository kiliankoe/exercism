typealias Position = (row: Int, col: Int)

struct Queens {
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }

    internal let _white: Position
    internal let _black: Position

    public var white: [Int] {
        return [_white.row, _white.col]
    }

    public var black: [Int] {
        return [_black.row, _black.col]
    }

    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white.count == 2 && black.count == 2 else { throw InitError.incorrectNumberOfCoordinates }

        // This kind of data really calls for being stored in tuples instead
        let white = (row: white[0], col: white[1])
        let black = (row: black[0], col: black[1])

        guard
            0...7 ~= white.row,
            0...7 ~= white.col,
            0...7 ~= black.row,
            0...7 ~= black.col
        else {
            throw InitError.invalidCoordinates
        }

        guard white != black else { throw InitError.sameSpace }

        self._white = white
        self._black = black
    }

    var canAttack: Bool {
        // same row or column
        if _white.0 == _black.0 || _white.1 == _black.1 { return true }

        // diagonal
        return
            search(towards: .NW) ||
            search(towards: .NE) ||
            search(towards: .SE) ||
            search(towards: .SW)
    }

    private func search(towards: DiagonalDirection) -> Bool {
        var searchPos = _white
        while 0...7 ~= searchPos.row && 0...7 ~= searchPos.col {
            if searchPos == _black { return true }
            move(pos: &searchPos, towards: towards)
        }
        return false
    }
}

extension Queens: CustomStringConvertible {
    var description: String {
        var rows = [String]()
        for row in 0..<8 {
            var rowData = [String]()
            for col in 0..<8 {
                switch (row, col) {
                case (_white.row, _white.col): rowData.append("W")
                case (_black.row, _black.col): rowData.append("B")
                default: rowData.append("_")
                }
            }
            rows.append(rowData.joined(separator: " "))
        }
        return rows.joined(separator: "\n")
    }
}

fileprivate enum DiagonalDirection {
    case NW, NE, SE, SW
}

fileprivate func move(pos: inout Position, towards direction: DiagonalDirection) {
    switch direction {
    case .NW:
        pos = (row: pos.row - 1, col: pos.col - 1)
    case .NE:
        pos = (row: pos.row - 1, col: pos.col + 1)
    case .SE:
        pos = (row: pos.row + 1, col: pos.col + 1)
    case .SW:
        pos = (row: pos.row + 1, col: pos.col - 1)
    }
}
