//
//  ParsedTweetCell.swift
//  PragmaticTweets
//
//  Created by FRANCIS HUYNH on 5/6/16.
//  Copyright © 2016 Fhools. All rights reserved.
//

import Foundation
import UIKit
class ParsedTweetCell : UITableViewCell
{
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
}