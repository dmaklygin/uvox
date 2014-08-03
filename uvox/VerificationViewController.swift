//
//  VerificationViewController.swift
//  uvox
//
//  Created by Дмитрий on 03.08.14.
//  Copyright (c) 2014 Ruslan Syubaev. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {

    @IBOutlet var codeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDoneButtonTap(sender: AnyObject) {
        var code = self.codeTextField.text
        if self.checkCode(code) {
            UserSettings.sharedInstance.userId = code
        }
    }
    
    func checkCode(code: String) -> Bool {
        
        if code == "0" {
            return true
        }
        
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
