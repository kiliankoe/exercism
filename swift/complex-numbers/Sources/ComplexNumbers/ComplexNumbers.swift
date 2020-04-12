import Foundation

public struct Complex {
    let real: Double
    let imaginary: Double

    init(_ real: Double, _ imaginary: Double) {
        self.real = real
        self.imaginary = imaginary
    }

    var conj: Complex {
        Complex(real, -imaginary)
    }

    var abs: Double {
        sqrt(pow(real, 2) + pow(imaginary, 2))
    }

    var exp: Complex {
        Complex(Foundation.exp(real) * cos(imaginary),
                Foundation.exp(real) * sin(imaginary))
    }
}

public func +(lhs: Complex, rhs: Complex) -> Complex {
    Complex(lhs.real + rhs.real,
            lhs.imaginary + rhs.imaginary)
}

public func -(lhs: Complex, rhs: Complex) -> Complex {
    Complex(lhs.real - rhs.real,
            lhs.imaginary - rhs.imaginary)
}

public func *(lhs: Complex, rhs: Complex) -> Complex {
    Complex(lhs.real * rhs.real - lhs.imaginary * rhs.imaginary,
            lhs.real * rhs.imaginary + rhs.real * lhs.imaginary)
}

public func /(lhs: Complex, rhs: Complex) -> Complex {
    Complex((lhs.real * rhs.real + lhs.imaginary * rhs.imaginary) / (pow(rhs.real, 2) + pow(rhs.imaginary, 2)),
            (lhs.imaginary * rhs.real - lhs.real * rhs.imaginary) / (pow(rhs.real, 2) + pow(rhs.imaginary, 2)))
}

// MARK: Expected Test-API
// I find this to be rather non-idiomatic :/
typealias ComplexNumber = Complex
extension ComplexNumber {
    init(realComponent: Double, imaginaryComponent: Double) {
        real = realComponent
        imaginary = imaginaryComponent
    }

    var realComponent: Double {
        real
    }

    var imaginaryComponent: Double {
        imaginary
    }

    func getRealComponent() -> Double {
        real
    }

    func getImaginaryComponent() -> Double {
        imaginary
    }

    func add(complexNumber: ComplexNumber) -> ComplexNumber {
        self + complexNumber
    }

    func subtract(complexNumber: ComplexNumber) -> ComplexNumber {
        self - complexNumber
    }

    func multiply(complexNumber: ComplexNumber) -> ComplexNumber {
        self * complexNumber
    }

    func divide(complexNumber: ComplexNumber) -> ComplexNumber {
        self / complexNumber
    }

    func absolute() -> Double {
        abs
    }

    func conjugate() -> ComplexNumber {
        conj
    }

    func exponent() -> ComplexNumber {
        exp
    }
}
