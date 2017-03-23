//
//  LoginViewController.swift
//  LoginPage
//
//  Created by admin on 3/22/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper

class LoginViewController: UIViewController {

    var user: User!
    var users = [User]()
    
    var isMember: Bool = false
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblWarnning: UILabel!
    
    @IBAction func btnLogin(_ sender: Any) {
//        print("txtUsername: \(txtUsername.text!)")
        if txtUsername.text == "" && txtPassword.text == "" {
//            print("nil")
            loginFail(status: true)
        } else {
//            print("not nil")
            login(username: txtUsername.text!, password: txtPassword.text!)
        }
//        login(username: txtUsername.text!, password: txtPassword.text!)
    }
    
    @IBAction func dismissLogin(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        if isMember {
//            print("TRUE")
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func loginFail(status: Bool) {
        if status {
            txtUsername.layer.borderWidth = 1.0
            txtUsername.layer.borderColor = UIColor.red.cgColor
            txtPassword.layer.borderWidth = 1.0
            txtPassword.layer.borderColor = UIColor.red.cgColor
            lblWarnning.isHidden = false
            // Shake
//            let animation = CABasicAnimation(keyPath: "position")
//            animation.duration = 0.07
//            animation.repeatCount = 4
//            animation.autoreverses = true
//            animation.fromValue = NSValue(CGPoint: CGPointMake(txtField.center.x - 10, txtField.center.y))
//            animation.toValue = NSValue(CGPoint: CGPointMake(txtField.center.x + 10, txtField.center.y))
//            txtField.layer.addAnimation(animation, forKey: "position")
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: txtUsername.center.x - 10, y: txtUsername.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: txtUsername.center.x + 10, y: txtUsername.center.y))
            txtUsername.layer.add(animation, forKey: "position")
            
        } else {
            txtUsername.layer.borderColor = UIColor.clear.cgColor
            txtPassword.layer.borderColor = UIColor.clear.cgColor
            lblWarnning.isHidden = true
            // Dismiss
            dismiss(animated: true, completion: nil)
        }
    }
    
    func login(username: String, password: String) {
        Alamofire.request("http://a2b.mul.pw/api/v2/user_acc/?where=username;eq;\(username);and;password_nat;eq;\(password)").responseJSON { response in
            if let result = response.result.value as? Dictionary<String, AnyObject> {
//                print("result: \(result)")
                if let userDictionary = result["user_acc"] as? [Dictionary<String, AnyObject>] {
                    self.loginFail(status: false)
//                    print("user: \(user)")
                    for object in userDictionary {
                        let userObject = User(userDictionary: object)
                        self.users.append(userObject)
                    }
                    self.user = self.users[0]
//                    print("user[0]: \(self.user.id)")
                    // MARK: SwiftKeychainWrapper
//                    let keychainResult = KeychainWrapper.defaultKeychainWrapper.set(self.user.id, forKey: "id")
                    let keychainResult = KeychainWrapper.standard.set(self.user.id, forKey: "id")
//                    let keychainResult = KeychainWrapper.standard.set("Some String", forKey: "myKey", withAccessibility: .AfterFirstUnlock)
//                    let saveSuccessful: Bool = customKeychainWrapperInstance.set("Some String", forKey: "myKey")
                    print("Data saved to keychain \(keychainResult)")
                } else {
//                    print("Login Fail")
                    self.loginFail(status: true)
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Warnning
        lblWarnning.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    

}

