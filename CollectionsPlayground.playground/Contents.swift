//: Playground - noun: a place where people can play

import UIKit

// Arrays
var models = ["iPhone 5", "iPhone 5s", "iPhone 6s"]
models.dynamicType

models.insert("iPhone 6s Plus", atIndex: 0)

let firstItem = models[0]

models.removeLast()

models


let iPhones = ["iPhone 5", "iPhone 5s", "iPhone 6s", "iPhone 6s Plus"]
let iPads = ["iPad Air 2", "iPad mini"]

models = iPhones
models.appendContentsOf(iPads)
models.insertContentsOf(["iPod touch"], at: 4)
models

// Sets
var set = Set<String>()
set.insert("iPhone 6s")
set.insert("iPhone 6s")

// Initialize a set with array literal

var iPhoneSet : Set = ["iPhone 6s"]
var iPadSet : Set = ["iPad Air 2", "iPad mini", "iPad Pro"]

iPhoneSet.intersect(iPadSet)

iPadSet.insert("iPhone 6s Plus")
iPhoneSet.insert("iPhone 6s Plus")
iPhoneSet.intersect(iPadSet)
iPhoneSet.union(iPadSet)

// Dictionary
let sizeInMm = [
    "iPhone 6s": 138.1,
    "iPhone 6s Plus": 158.1,
    "iPad Air 2": 240.0,
    "iPad Pro": 305.7
]
sizeInMm.dynamicType

sizeInMm["iPhone 6s"]
sizeInMm["iPhone 6s Plus"].dynamicType


