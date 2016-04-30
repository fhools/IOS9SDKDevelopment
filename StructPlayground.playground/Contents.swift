//: Playground - noun: a place where people can play

import UIKit

// Structs are value type this means they are copied on assignment, as oppose to classes which
// the iassignment copies the reference.
// They also have these differences:
// - init is automatically generated.

struct IOSDevice {
    var name: String
    var screenHeight: Double
    var screenWidth: Double
}

// extensions can be attached to a type after its been defined.
extension IOSDevice {
    var screenArea : Double {
        return screenWidth * screenHeight
    }
}

// extensions can even be defined for primitive types
extension Int {
    func addOne() -> Int {
        return self + 1
    }
}

// extensions can be declared to conform to protocols

extension IOSDevice : CustomStringConvertible {
    var description: String {
        return "\(name), \(screenHeight)x\(screenWidth)"
    }
}

var iphone6 = IOSDevice(name: "iPhone 6", screenHeight: 158.1, screenWidth: 69.0)

