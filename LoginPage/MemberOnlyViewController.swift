//
//  MemberOnlyViewController.swift
//  LoginPage
//
//  Created by admin on 3/22/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class MemberOnlyViewController: UIViewController {


    override func viewDidAppear(_ animated: Bool) {
        
//        print("member viewDidAppear")
        if let _ = KeychainWrapper.standard.string(forKey: "id"){
            print("ID found in keychain")
            
        } else {
            print("ID not found in keychain")
            performSegue(withIdentifier: "LoginSegue", sender: nil)
            tabBarController?.selectedIndex = 0
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSegue" {
            let loginViewController = segue.destination as? LoginViewController
            loginViewController?.isMember = true
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
