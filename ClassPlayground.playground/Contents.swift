//: Playground - noun: a place where people can play

import UIKit
import AVFoundation
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

class IODevice : CustomStringConvertible {
    var name : String
    var screenHeight : Double
    var screenWidth : Double

    private var audioPlayer : AVPlayer?
    
    
    var screenArea : Double {
        //get {
            return screenHeight * screenWidth
        //}
    }
    
    var description: String {
        return "\(name) \(screenWidth)x\(screenHeight)"
    }
    
    var screenHeightAndWidth : (height: Double, width: Double) {
        return (screenHeight, screenWidth)
    }
    
    init(name: String, screenHeight: Double, screenWidth: Double) {
        self.name = name
        self.screenHeight = screenHeight
        self.screenWidth = screenWidth
    }
    
    func playAudioWithURL(url: NSURL) {
        audioPlayer = AVPlayer(URL: url)
        if let audioPlayer = audioPlayer {
            audioPlayer.play()
        }
    }
    
    func stopAudio() {
        if let audioPlayer = audioPlayer {
            audioPlayer.pause()
        }
        audioPlayer = nil
    }
    
}

let iPhone6 = IODevice(name: "iPhone 6", screenHeight: 138.1, screenWidth: 67.0)
let iPhone6Plus = IODevice(name: "iPhone 6 Plus", screenHeight: 158.1, screenWidth: 77.8)
let iPhone5s = IODevice(name: "iPhone 5s", screenHeight: 123.8, screenWidth: 58.6)
let iPhones = [iPhone5s, iPhone6, iPhone6Plus]

iPhone6.screenArea
iPhone6.screenHeightAndWidth
iPhone6.screenHeightAndWidth.0
iPhone6.screenHeightAndWidth.width

//iPhone.playAudioWithURL(NSURL(string: "http://uk1.internet-radio.com:15614/listen.pls")!)
//sleep(10000)
//iPhone.stopAudio()

for (index, phone) in iPhones.enumerate() {
    NSLog("\(index): \(phone)")
}
