//
//  WelcomeViewController.swift
//  UniChat
//
//  Created by Denzel Carter on 6/11/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit
import Parse

class WelcomeViewController: UIViewController {
    
    @IBOutlet var usernameTxt: UITextField!
    
    
    @IBOutlet var passwordTxt: UITextField!
    
    
    @IBAction func loginClick(sender: AnyObject) {
        var username = usernameTxt.text
        var password = passwordTxt.text
        
        if password.isEmpty || username.isEmpty {
            
        } else {
            
            PFUser.logInWithUsernameInBackground(username, password: password, block:
                { (user: PFUser?, error:NSError?) -> Void in
                    if user != nil {
                        self.performSegueWithIdentifier("LoginUser", sender: self)
                        
                    } else {
                        
                        
                    }
                
            })
        }
    }
    
    
    @IBAction func create_account_click(sender: AnyObject) {
        self.performSegueWithIdentifier("goSignUp", sender: self)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
