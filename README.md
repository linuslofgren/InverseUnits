# InverseUnits

Extends Foundation's Measurement framework with inverse units such as `min/km` commonly used in running.

## Example

```swift
let duration = Measurement(value: 60*22, unit: UnitDuration.seconds)
let distance = Measurement(value: 5.4, unit: UnitLength.kilometers)
let speed = distance / duration
speed.converted(to: .minutesPerKilometer)
```
