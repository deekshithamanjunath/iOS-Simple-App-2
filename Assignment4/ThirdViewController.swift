//
//  ThirdViewController.swift
//  Assignment4
//
//  Created by Deekshitha Manjunath on 10/23/16.
//  Copyright © 2016 Deekshitha Manjunath. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextViewDelegate, UIPopoverPresentationControllerDelegate {

    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var progressView: UIView!
    @IBOutlet var textView: UIView!
    @IBOutlet var alertView: UIView!
    
    @IBAction func segment(_ sender: AnyObject)
    {
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.progressView.isHidden = false
            self.alertView.isHidden = true
            self.textView.isHidden = true
            break
        case 1:
            self.progressView.isHidden = true
            self.alertView.isHidden = true
            self.textView.isHidden = false
            break
        case 2:
            self.progressView.isHidden = true
            self.alertView.isHidden = false
            self.textView.isHidden = true
            break
        default:
            break
        }
        dismissKeyboard()
    }
    
    @IBOutlet var switchOut: UISwitch!
    @IBOutlet var activityOut: UIActivityIndicatorView!
    
    @IBAction func switchControl(_ sender: UISwitch)
    {
        if sender.isOn
        {
            activityOut.startAnimating()
        }
        else
        {
            activityOut.stopAnimating()
        }

    }
    
    @IBOutlet var textOut: UITextView!
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText inputText: String) -> Bool
    {
        if(inputText == "\n")
        {
            view.endEditing(true)
            return false
        }
        else
        {
            return true
        }
    }

    @IBAction func popUp()
    {
        let controller = UIAlertController(title: "Alert!!!",message: "Do you like the Iphone?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes",style: .cancel, handler:nil)
        
        controller.addAction(yesAction)
        
        self.present(controller, animated: true,completion: {print("Done")})
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        switchOut.isOn = false
        
        textOut.delegate = self
        
        let outsidePress: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(outsidePress)
        
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
