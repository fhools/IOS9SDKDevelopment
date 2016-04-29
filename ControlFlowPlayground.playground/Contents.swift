//: Playground - noun: a place where people can play

import UIKit

let models = ["iPhone 5", "iPhone 5s", "iPhone 6s", "iPhone 6s Plus"] + ["iPad Air 2", "iPad mini"]

// for in
for model in models {
    NSLog("model: \(model)")
}

// for in imitating traditional for
for i in 0..<models.count {
    NSLog("model by index: \(i) \(models[i])")
}

let sizeInMm = [
    "iPhone 6s": 138.1,
    "iPhone 6s Plus": 158.1,
    "iPad Air 2": 240.0,
    "iPad Pro": 305.7
]

let model = "iPhone 6s"
if sizeInMm[model] != nil {
    NSLog("size of \(model) is \(sizeInMm[model])")
} else {
    NSLog("couldn't find \(model)")
}

switch model {
    case "iPhone 6s Plus":
        NSLog("Thats what I want")
    case "iPhone 7":
        NSLog("Sorry it's not released yet!")
default:
    NSLog("Not my thing")
}

let size6 = sizeInMm["iPhone 6s"]
let size7 = sizeInMm["iPhone 7"]

if let size = size6 {
    size.dynamicType
}
// size7 is nil optional so body won't execute
if let size = size7 {
    size.dynamicType
}
// size6 is non-nil but size7 is so body again won't execute
if let size6 = size6, size7 = size7 {
    size6.dynamicType
    size7.dynamicType
}

// size6 pattern matching.
if let size6 = size6 where size6 > 100.0 {
    size6
}


