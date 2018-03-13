//
//  loginViewController.swift
//  ParseChat
//
//  Created by Sijin Wang on 3/13/18.
//  Copyright © 2018 Sijin Wang. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        let alertController = UIAlertController(title: "Field Required", message: "Username/Password is required", preferredStyle: .alert)
        
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        if (newUser.username?.isEmpty)! || (newUser.password?.isEmpty)! {
            present(alertController, animated: true, completion: {
                return
            })
        }
        else {
            newUser.signUpInBackground { (success, error: Error?) in
                if let error = error {
                    alertController.message = error.localizedDescription
                    alertController.title = String(format: "Error: %d", error._code)
                    self.present(alertController, animated: true, completion: {
                        return
                    })
                }
                else {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        }
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        let alertController = UIAlertController(title: "Field Required", message: "Username/Password is required", preferredStyle: .alert)
        
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                alertController.message = error.localizedDescription
                alertController.title = String(format: "Error: %d", error._code)
                self.present(alertController, animated: true, completion: {
                    return
                })
            }
            else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
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
