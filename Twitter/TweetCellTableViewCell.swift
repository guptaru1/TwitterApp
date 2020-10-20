//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Ruchika Gupta on 10/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView: UIImageView!
    
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    
    @IBOutlet weak var TweetContentLabel: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        //Opposite of current state
        let tobeFavorited = !favorited
        
        if (tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: {(error) in
                print("Favorite did not succeed")
                                                    })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                //No longer a favorite tweet
                self.setFavorite(false)
            }, failure: {(error) in
                print("Unfavorite did not succeed")
            })
            
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            //True if success so diaable button and shwos retweeted
            self.setRetweeted(true)
        }, failure: {(error) in
            print("Error in retweeting \(error)")
        })
        
    }
    
    func setRetweeted(_ isRetweeted: Bool){
        
        //If already retweet
        if (isRetweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    var favorited:Bool = false
    var tweetId:Int = -1
   
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
            
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
