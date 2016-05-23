//
//  ViewController.swift
//  PragmaticTweets
//
//  Created by FRANCIS HUYNH on 4/30/16.
//  Copyright © 2016 Fhools. All rights reserved.
// 

import UIKit
import Social
import Accounts
let defaultAvatarURL = NSURL(string: "http://abs.twimg.com/sticky/default_profile_images/default_profile_6_200x200.png")


class ViewController: UITableViewController {

    var parsedTweets : [ParsedTweet] = [
        ParsedTweet(tweetText: "iOS 9 SDK Development now in print. Swift Programming FTW!",
        userName: "@pragprog",
        createdAt: "2016-05-05 8:00 PDT",
        userAvatarURL: defaultAvatarURL),
        
        ParsedTweet(tweetText: "But was that really such a good idea?",
            userName: "@redqueencoder",
            createdAt: "2016-05-05 9:00 PDT",
            userAvatarURL: defaultAvatarURL),
        
        ParsedTweet(tweetText: "Struct all the things!",
            userName: "@invalidname",
            createdAt: "2016-05-05 10:00 PDT",
            userAvatarURL: defaultAvatarURL)
    ]
    
        
    
    //@IBOutlet weak var twitterWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTweets()
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(ViewController.handleRefresh(_:)), forControlEvents: .ValueChanged)
        refreshControl = refresher
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handleShowMyTweetsTapped(sender: UIButton) {
        reloadTweets()
    }
    
    @IBAction func handleRefresh(sender: AnyObject) {
        NSLog("handleRefresh")
        parsedTweets.append(
            ParsedTweet(tweetText: "New row", userName: "@refresh", createdAt: NSDate().description, userAvatarURL:   defaultAvatarURL))
        reloadTweets()
        refreshControl?.endRefreshing()
        
    }
    
    private func handleTwitterData(data: NSData!, urlResponse: NSHTTPURLResponse!, error: NSError!) {
        guard let data = data else {
            NSLog("handleTwitterData() received no data")
            return
        }
        NSLog("handleTwitterData() got \(data.length) bytes")
        do {
            let jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions([]))
            NSLog("JSON is:\n\(jsonObject)")
        } catch let error as NSError {
            NSLog("JSON error: \(error)")
        }
    }
    
    func reloadTweets() {
        let accountStore = ACAccountStore()
        let twitterAccountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccountsWithType(twitterAccountType, options: nil, completion: {
            (granted: Bool, error: NSError!) -> Void in
            guard granted else {
                NSLog("account access not granted")
                return
            }
            let twitterAccounts = accountStore.accountsWithAccountType(twitterAccountType)
            guard twitterAccounts.count > 0  else {
                NSLog("no twitter accounts configured")
                return
            }
            
            let twitterParams = [ "count" : "100" ]
            let twitterAPIURL = NSURL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")
            let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, URL: twitterAPIURL, parameters: twitterParams)
            
            request.account = twitterAccounts.first as! ACAccount
            NSLog("Twitter account \(request.account.username)")
            request.performRequestWithHandler( {
                (data: NSData!, urlResponse: NSHTTPURLResponse!, error: NSError!) -> Void in
                    self.handleTwitterData(data, urlResponse: urlResponse, error: error)
            })
        })
        tableView.reloadData()
        
    }
    
    @IBAction func handleTweetButtonTapped(sender: UIButton) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let tweetVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetVC.setInitialText("I just finished the first project in iOS 9 SDK Development. #pragios9")
            self.presentViewController(tweetVC, animated: true, completion: nil)
        } else {
            NSLog("Can't send tweet")
        }
    }
    
    // MARK: UITableViewControllerDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parsedTweets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("CustomTweetCell") as! ParsedTweetCell
        let parsedTweet = parsedTweets[indexPath.row]
        cell.tweetTextLabel?.text = parsedTweet.tweetText
        cell.userNameLabel.text = parsedTweet.userName
        cell.createdAtLabel?.text = parsedTweet.createdAt
        if let url = parsedTweet.userAvatarURL, imageData = NSData(contentsOfURL: url) {
            cell.avatarImageView.image = UIImage(data: imageData)
        }
        return cell
    }
}

