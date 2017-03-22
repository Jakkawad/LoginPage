//
//  HomeViewController.swift
//  LoginPage
//
//  Created by admin on 3/22/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class HomeViewController: UIViewController {

    @IBAction func btnLogout(_ sender: Any) {
        //let keychainResult = KeychainWrapper.removeObjectForKey(KEY_UID)
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: "id")//.remove(key: "id")
        print("ID removed from keychain \(keychainResult)")
        performSegue(withIdentifier: "LogoutSegue", sender: nil)
    }
    
    @IBAction func btnNextTabbar(_ sender: Any) {
        
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
