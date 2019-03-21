//
//  ViewController.swift
//  LOGINPAGE
//
//  Created by Vedant Batra on 11/03/19.
//  Copyright © 2019 Vedant Batra. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Signin(_ sender: UIButton) {
        let Email = email.text
        let Pass = pass.text
        Auth.auth().signIn(withEmail: Email!, password: Pass!,completion : { user, error in
            if let firebaseError = error{
                print(firebaseError.localizedDescription)
                let alert = UIAlertController(title: "Authentication failed", message: "Please try agian",preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true,completion: nil)
                return
                
            }
            let homeview = self.storyboard?.instantiateViewController(withIdentifier: "newViewController") as! newViewController
            self.present(homeview,animated: true, completion: nil)
            print("success!")
        })
    
    }
    
}

