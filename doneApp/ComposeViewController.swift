//
//  ComposeViewController.swift
//  doneApp
//
//  Created by Yohei Fusayasu on 5/25/15.
//  Copyright (c) 2015 Yohei Fusayasu. All rights reserved.
//

import UIKit
import Parse

class ComposeViewController: UIViewController {

    @IBOutlet weak var doneTextView: UITextView? = UITextView()
    @IBOutlet weak var charRemainingLabel: UILabel? = UILabel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder?) {
        super.init(coder: aDecoder!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneTextView?.layer.borderColor = UIColor.blackColor().CGColor
        doneTextView?.layer.borderWidth = 0.5
        doneTextView?.layer.cornerRadius = 5
        
        doneTextView?.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendDone(sender: AnyObject) {
        
        var done:PFObject = PFObject(className: "dones")
        done["content"] = doneTextView?.text
        done["doner"] = PFUser.currentUser()
        
        done.saveInBackground()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    //Cancelボタンでmodalを閉じる
    @IBAction func backToTimeline(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
