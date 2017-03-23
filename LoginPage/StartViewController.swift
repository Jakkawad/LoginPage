//
//  StartViewController.swift
//  LoginPage
//
//  Created by admin on 3/22/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class StartViewController: UIViewController {

    @IBAction func btnLogin(_ sender: Any) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        performSegue(withIdentifier: "RegisterSegue", sender: nil)
    }
    
    @IBAction func btnSkip(_ sender: Any) {
        performSegue(withIdentifier: "StartSegue", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        performSegue(withIdentifier: "StartSegue", sender: nil)
        if let _ = KeychainWrapper.standard.string(forKey: "id"){
            print("ID found in keychain")
            performSegue(withIdentifier: "StartSegue", sender: nil)
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
