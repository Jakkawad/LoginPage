//
//  RegisterViewController.swift
//  LoginPage
//
//  Created by admin on 3/23/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepassword: UITextField!
    
    @IBAction func btnRegister(_ sender: Any) {
        if txtUsername.text == "" || txtPassword.text == "" || txtRepassword.text == "" {
//            print("all nil")
            if txtUsername.text == "" {
                txtUsername.wrongInput()
            } else {
                txtUsername.correctInput()
            }
            if txtPassword.text == "" {
                txtPassword.wrongInput()
            } else {
                txtPassword.correctInput()
            }
            if txtRepassword.text == "" {
                txtRepassword.wrongInput()
            } else {
                txtRepassword.correctInput()
            }
            
        } else {
            print("not nil")
        }
    }
    
    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnClear(_ sender: Any) {
//        txtUsername.text = ""
//        txtPassword.text = ""
//        txtRepassword.text = ""
        register()
    }
    
    // MARK: Register 
    func register() {
        print("register process")
        alertMessage(message: "Register Done", title: "Register")
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
