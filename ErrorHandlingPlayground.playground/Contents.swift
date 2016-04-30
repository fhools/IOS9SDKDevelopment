//: Playground - noun: a place where people can play

import UIKit

// Swift error handling is similar in syntax to exceptions in C++, but the mechanics 
// are very different.
// They have their roots in Objective-C error handling convention.
// functions that take a in-out **NSError parameter can be handled via Swift 2.0 error handling.
// 1. Any function that is declared as throws must be
// 2. wrapped in a do catch block.
// 3. Any methods that throw errors must prefixed with try.
// 4. the try cause captures the error

if let myURL = NSURL(string: "http://pragprog.com") {
    do {
        let myData = try NSData( contentsOfURL: myURL, options: [])
        let myString = NSString(data: myData, encoding: NSUTF8StringEncoding)
    } catch let error as NSError {
        NSLog("NSError: \(error)")
    } catch {
        NSLog("No idea what happened here")
    }
}

