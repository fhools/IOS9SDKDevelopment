//: Playground - noun: a place where people can play

import UIKit

// Swift enums are very powerful. They are similar to discriminated unions
// Each enum case can have associated values specified as tuple

enum ScreenType {
    case None
    case Retina (screenHeight: Double, screenWidth: Double)
}

struct IOSDevice {
    var name : String
    var screenType : ScreenType
}

let iPhone6 = IOSDevice(name: "iPhone 6", screenType: .Retina(screenHeight: 138.1, screenWidth: 67.0))
let appleTV3rdGen = IOSDevice(name: "Apple TV (3rd Gen)", screenType: .None)

// When working with enum value switch case must be used, and the cases must be exhaustive, i.e. cover
// all the possible enum cases

extension IOSDevice : CustomStringConvertible {
    var description : String {
        var screenDescription: String
        switch screenType {
        case .None:
            screenDescription = "No screen"
        case .Retina (let screenHeight, let screenWidth):
            screenDescription = "Retina screen " +
                "\(screenHeight) x \(screenWidth)"
        }
        return "\(name) \(screenDescription)"
    }
}



