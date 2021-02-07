//
//  ViewController.swift
//  HW4_1
//
//  Created by Nikita Zharinov on 06/02/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var account = getAccount()
    
    private var authorizedUser = ""
    private var authorizedPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        tabBarController.viewControllers = [UserInfoViewController(),
                                            WorkViewController(),
                                            HobbyViewController()]
        
        for viewController in tabBarController.viewControllers! {
            if let userVC = viewController as? UserInfoViewController {
                userVC.person = account.person
            }
        }
    
    //            if let navVC = viewController as? UINavigationController {
    //                let userInfoVC = navVC.topViewController as! UserInfoViewController {
    ////                    welcomeVC = navVC.topViewController as! UserInfoViewController {
    //                    userInfoVC.person = account.person
    //                }
    
    //            else if let navVC = viewController as? UINavigationController {
    //                let workVC = navVC.topViewController as! WorkViewController
    //                workVC.account = account
    //            }
    //            else if let navVC = viewController as? UINavigationController {
    //                let hobbyVC = navVC.topViewController as! HobbyViewController
    ////                hobbyV
    //            }
    
    //        let vc = tabBarController.viewControllers?.first as! UserInfoViewController
    //        vc.account = account
}

    @IBAction func unwindSeguetoLoginScreen(segue: UIStoryboardSegue) {
       userNameTextField.text = nil
       passwordTextField.text = nil
   }

    @IBAction func loginButtonPressed() {
        authorizedUser = account.loginName
        authorizedPassword = account.password
        
        if userNameTextField.text != authorizedUser ||
            passwordTextField.text != authorizedPassword {
            forgotAlert(
                with: "Invalid login or password!",
                and: "Please, enter correct login and password"
            )
            passwordTextField.text = nil
            return
        }
        performSegue(withIdentifier: "userInfoSegue", sender: nil)
    }
    
    @IBAction func forgotAlertButton(_ sender: UIButton) {
        switch sender.tag {
        case 0: forgotAlert(with: "No Problem!", and: "Your username is \(authorizedUser)")
        case 1: forgotAlert(with: "No Problem!", and: "Your password is \(authorizedPassword)")
        default: break
        }
    }
}

extension ViewController {

// MARK: - Alert Controler
    private func forgotAlert(with alertTitle: String, and alertMessage: String) {
        let alertView = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle: .alert
        )
        let okAlertButton = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(okAlertButton)
        present(alertView, animated: true)
    }
    
// MARK: - Keyboard
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == userNameTextField {
                passwordTextField.becomeFirstResponder()
            } else {
                loginButtonPressed()
            }
            return true
        }
}
