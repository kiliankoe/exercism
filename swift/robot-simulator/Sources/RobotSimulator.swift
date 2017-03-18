struct SimulatedRobot {

    enum Direction: Int {
        case north = 0, east, south, west
    }

    enum Instruction: Character {
        case TurnRight = "R"
        case TurnLeft = "L"
        case Advance = "A"
    }

    var bearing = Direction.north
    var location = (x: 0, y: 0)

    // I'm sticking with a tuple for internal use, since that feels cleaner and less prone to errors.
    var coordinates: [Int] {
        return [location.x, location.y]
    }

    mutating func orient(_ direction: Direction) {
        self.bearing = direction
    }

    mutating func turnRight() {
        bearing = Direction(rawValue: (bearing.rawValue + 1) % 4)!
    }

    mutating func turnLeft() {
        var newBearing = (bearing.rawValue - 1) % 4
        if newBearing < 0 {
            newBearing += 4
        }
        bearing = Direction(rawValue: newBearing)!
    }

    // This seems like it would make sense as a static method returning `SimulatedRobot`s?
    mutating func at(x: Int, y: Int) {
        self.location = (x: x, y: y)
    }


    mutating func place(x: Int, y: Int, direction: Direction) {
        self.location = (x: x, y: y)
        self.bearing = direction
    }

    mutating func advance() {
        switch self.bearing {
        case .north: location.y += 1
        case .east: location.x += 1
        case .south: location.y -= 1
        case .west: location.x -= 1
        }
    }

    // This would also make a lot more sense as a static method.
    func instructions(_ instr: String) -> [Instruction] {
        return instr
            .characters
            .flatMap { Instruction(rawValue: $0) }
    }

    mutating func evaluate(_ instr: String) {
        let instructions = self.instructions(instr)
        for instruction in instructions {
            switch instruction {
            case .TurnRight: turnRight()
            case .TurnLeft: turnLeft()
            case .Advance: advance()
            }
        }
    }
}
