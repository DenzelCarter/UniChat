//
//  StatusUpdateViewController.swift
//  UniChat
//
//  Created by Denzel Carter on 6/11/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class StatusUpdateViewController: UIViewController {
    
    
    @IBOutlet var statusUpdateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back_button(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func update_Btn_click(sender: AnyObject) {
        var status = statusUpdateTextField.text
        if status.isEmpty {
            //status update
            
            
        } else {
           //store status in parse
            var statusUpdate = PFObject(className: "Status")
            statusUpdate["newStatus"] = status
            statusUpdate["user"] = PFUser.currentUser()?.username
            statusUpdate.saveInBackgroundWithBlock({ (isSuccesful:Bool, error:NSError?) -> Void in
                
                if error == nil {
                    println("Posted")
                    self.dismissViewControllerAnimated(true, completion: nil)
                    
                } else {
                    println("Something went wrong")
                    
                }
                
            })
            
        }
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
