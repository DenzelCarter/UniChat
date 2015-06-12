//
//  StatusDetailedViewController.swift
//  UniChat
//
//  Created by Denzel Carter on 6/12/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class StatusDetailedViewController: UIViewController {
    
    @IBOutlet var detailedTxt: UILabel!
    
    var status: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        detailedTxt.text = status
        detailedTxt.numberOfLines = 2
        detailedTxt.sizeToFit()

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
