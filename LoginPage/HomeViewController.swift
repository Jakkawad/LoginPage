//
//  HomeViewController.swift
//  LoginPage
//
//  Created by admin on 3/22/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper

class HomeViewController: UIViewController {

    var user: User!
    var users = [User]()
    
    var inputPassword: String = ""
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBAction func btnFind(_ sender: Any) {
//        print("username: \(txtUsername.text!)")
        findUser(username: txtUsername.text!)
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: "id")//.remove(key: "id")
        print("ID removed from keychain \(keychainResult)")
        performSegue(withIdentifier: "LogoutSegue", sender: nil)
    }
    
    @IBAction func btnNextTabbar(_ sender: Any) {
        
    }
    
    func findUser(username: String) {
        Alamofire.request("http://a2b.mul.pw/api/v2/user_acc/?where=username;eq;\(username)").responseJSON() { response in
             if let result = response.result.value as? Dictionary<String, AnyObject> {
//                print("result: \(result)")
                if let userDictionary = result["user_acc"] as? [Dictionary<String, AnyObject>] {
                    print(userDictionary)
                    for object in userDictionary {
                        let userObject = User(userDictionary: object)
                        self.users.append(userObject)
                    }
                    self.user = self.users[0]
                    print("user[0]: \(self.user.password)")
                    
                } else {
                    print("user not found")
                }
             }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
