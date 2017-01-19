//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Deekshitha Manjunath on 10/23/16.
//  Copyright © 2016 Deekshitha Manjunath. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var webOut: UIWebView!
    
    @IBOutlet var textOutput: UITextField!
    
    var urlAddress:String!
    
    @IBAction func go()
    {
        urlAddress = "https://" + textOutput.text!
        let request = NSURL(string: urlAddress)
        let requestPath = NSURLRequest(url: request as! URL)
        webOut!.loadRequest(requestPath as URLRequest)
        dismissKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let outsidePress: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(outsidePress)
        
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }

        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

