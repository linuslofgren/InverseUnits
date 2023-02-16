import Foundation

func / (lhs: Measurement<UnitLength>, rhs: Measurement<UnitDuration>) -> Measurement<UnitSpeed> {
    let value = lhs.converted(to: .meters).value / rhs.converted(to: .seconds).value
    let unit = UnitSpeed.metersPerSecond
    return Measurement(value: value, unit: unit)
}

class UnitConverterInverse: UnitConverter {
    var coefficient: Double
    
    init(coefficient: Double) {
        self.coefficient = coefficient
    }
    
    override func baseUnitValue(fromValue value: Double) -> Double {
        return coefficient/value
    }
    
    override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
        return coefficient/baseUnitValue
    }
}

extension UnitSpeed {
    static let minutesPerKilometer = UnitSpeed(symbol: "min/km", converter: UnitConverterInverse(coefficient: 1000.0/60.0))
}
