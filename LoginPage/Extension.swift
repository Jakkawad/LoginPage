//
//  Extension.swift
//  LoginPage
//
//  Created by admin on 3/27/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit

// MARK: UITextField
extension UITextField {
    // Shake
    func shake(duration: Double, repeatCount: Float, autoReverses: Bool) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.autoreverses = autoReverses
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    // Border green
    func normalInput() {
        self.layer.borderColor = UIColor.clear.cgColor
    }
    // Border red
    func wrongInput() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.red.cgColor
    }
    // Border clear
    func correctInput() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.green.cgColor
    }
}

// MARK: UIViewController
extension UIViewController {
    // Alert
    func alertMessage(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
