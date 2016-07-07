import Foundation

struct SpaceAge {
    let seconds: Int

    private enum PlanetFactor: Double {
        case mercury = 0.2408467
        case venus = 0.61519726
        case mars = 1.8808158
        case jupiter = 11.862615
        case saturn = 29.447498
        case uranus = 84.016846
        case neptune = 164.79132
    }

    init(_ seconds: Int) {
        self.seconds = seconds
    }

    private var earthAge: Double {
        return (Double(seconds) / 31557600)
    }

    var onEarth: Double {
        return earthAge.roundTo(2)
    }

    var onMercury: Double {
        return (earthAge / PlanetFactor.mercury.rawValue).roundTo(2)
    }

    var onVenus: Double {
        return (earthAge / PlanetFactor.venus.rawValue).roundTo(2)
    }

    var onMars: Double {
        return (earthAge / PlanetFactor.mars.rawValue).roundTo(2)
    }

    var onJupiter: Double {
        return (earthAge / PlanetFactor.jupiter.rawValue).roundTo(2)
    }

    var onSaturn: Double {
        return (earthAge / PlanetFactor.saturn.rawValue).roundTo(2)
    }

    var onUranus: Double {
        return (earthAge / PlanetFactor.uranus.rawValue).roundTo(2)
    }

    var onNeptune: Double {
        return (earthAge / PlanetFactor.neptune.rawValue).roundTo(2)
    }
}

extension Double {
    func roundTo(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}
