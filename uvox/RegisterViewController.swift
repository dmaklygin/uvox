//
//  RegisterViewController.swift
//  uvox
//
//  Created by Дмитрий on 02.08.14.
//  Copyright (c) 2014 Ruslan Syubaev. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var phoneTextField: UITextField!

    @IBAction func onNextButtonTap(sender: AnyObject) {
        
        if !self.checkPhone() {
            return
        }
        
        self.phoneSubmit()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.phoneTextField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        self.phoneTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
        
        var flexItem: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        var doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("phoneSubmit"))
//        doneButton.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: 1.5), forBarMetrics: UIBarMetrics.Default)
    
        var keyboardToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        
        keyboardToolbar.setItems([flexItem, doneButton], animated: false)

        self.phoneTextField.inputAccessoryView = keyboardToolbar
        
        return true
    }
    
    func phoneSubmit() {
        
        self.phoneTextField.resignFirstResponder()
        
//        var verification
//        
//        self.navigationController.pushViewController(<#viewController: UIViewController?#>, animated: <#Bool#>)
        self.performSegueWithIdentifier("showVerification", sender: self)
    }
    
    func checkPhone() -> Bool {
        
        var phone = self.phoneTextField.text

        if phone.utf16Count < 5 {
            return false
        }
        
        return true
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
