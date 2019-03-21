//
//  NEW2ViewController.swift
//  LOGINPAGE
//
//  Created by Vedant Batra on 11/03/19.
//  Copyright © 2019 Vedant Batra. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class NEW2ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signup(_ sender: UIButton) {
        let Email = username.text
        let Pass = password.text
        Auth.auth().createUser(withEmail: Email!, password: Pass!, completion : { user, error in
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

