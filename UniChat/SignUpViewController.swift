//
//  SignUpViewController.swift
//  UniChat
//
//  Created by Denzel Carter on 6/11/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class SignUpViewController: UIViewController {
    
    @IBOutlet var usernameTxt: UITextField!
    
    @IBOutlet var emailTxt: UITextField!
    
    @IBOutlet var passwordTxt: UITextField!
    
    
    @IBAction func signUpClick(sender: AnyObject) {
        var username = usernameTxt.text
        var email = emailTxt.text
        var password = passwordTxt.text
        
        if username.isEmpty || password.isEmpty || email.isEmpty{
    
            
        } else {
            var user = PFUser()
            user.username = username
            user.email = email
            user.password = password
            user.signUpInBackgroundWithBlock({ (succeeded, signUpError) -> Void in
                if signUpError == nil {
                    self.performSegueWithIdentifier("SignUpUser", sender: self)
                    
                    println("Great")
                } else {
                    
                    println(signUpError)
                }
                
            })
            
       }
    }
    
    
    @IBAction func cancelClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
