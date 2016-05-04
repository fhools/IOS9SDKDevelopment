//
//  WebViewTest.swift
//  PragmaticTweets
//
//  Created by FRANCIS HUYNH on 5/2/16.
//  Copyright © 2016 Fhools. All rights reserved.
//

import XCTest
@testable import PragmaticTweets

class WebViewTest: XCTestCase, UIWebViewDelegate {
    
    var loadWebViewExpectation: XCTestExpectation?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAutomaticWebLoad() {
        guard let viewController = UIApplication.sharedApplication().windows[0].rootViewController as? ViewController else {
            XCTFail("Couldn't get root view controller")
            return
        }
        
        viewController.twitterWebView.delegate = self
        loadWebViewExpectation = expectationWithDescription("web view auto-load test")
        waitForExpectationsWithTimeout(20.0, handler: nil)
    }
    
    // MARK: UIWebViewDelegate
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        XCTFail("web view load failed")
        loadWebViewExpectation?.fulfill()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        if let webViewContents = webView.stringByEvaluatingJavaScriptFromString(
            "document.documentElement.textContent") where webViewContents != "" {
            print(webViewContents)
                loadWebViewExpectation?.fulfill()
        } else {
            print("Couldn't get webviewcontents")
        }

    }
}
