//
//  TweetViewController.swift
//  Twitter
//
//  Created by Ruchika Gupta on 10/19/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Says i can take text in so keyboard displayed
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    //Outlet so you can referr to it
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBAction func cancel(_ sender: Any) {
        
        //completion nil since dont do anythign
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
            
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success:{ self.dismiss(animated: true, completion: nil)},
                                               failure: {(error) in
                                                print("Error posting tweet \(error)")
                                               })
        } else{
            
            //Text is empty use alert controller to dipslay an alert
            self.dismiss(animated: true, completion: nil)}
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


