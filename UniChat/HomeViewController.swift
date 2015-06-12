//
//  HomeViewController.swift
//  UniChat
//
//  Created by Denzel Carter on 6/11/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var resultsTable: UITableView!
    
    var mObjects = [AnyObject]()
    var userNames = [String]()
    var userStatuses = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var queryStatus = PFQuery(className: "Status")
        queryStatus.orderByDescending("createdAt")
        queryStatus.findObjectsInBackgroundWithBlock { (objects:[AnyObject]?, error:NSError?) -> Void in
            
            if error == nil {
                // found objects
                println(objects!.count)
                self.mObjects = objects!
                for object in self.mObjects {
                    self.userNames.append(object["user"] as! String)
                    self.userStatuses.append(object["newStatus"] as! String)
                    self.resultsTable.reloadData()
                    
                }
                
            } else {
                
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update_click(sender: AnyObject) {
        self.performSegueWithIdentifier("postStatus", sender: self)
    }
    
    @IBAction func logout_click(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("logout", sender: self)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mObjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var mycell:MainViewCell = tableView.dequeueReusableCellWithIdentifier("mainCell") as! MainViewCell
        
        mycell.usernameTxt.text = userNames[indexPath.row]
        mycell.messageTxt.text = userStatuses[indexPath.row]
        
        return mycell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let viewController: StatusDetailedViewController = self.storyboard?.instantiateViewControllerWithIdentifier("statusDetailViewStory") as! StatusDetailedViewController
        viewController.status = userStatuses[indexPath.row]
        self.presentViewController(viewController, animated: true, completion: nil)
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
