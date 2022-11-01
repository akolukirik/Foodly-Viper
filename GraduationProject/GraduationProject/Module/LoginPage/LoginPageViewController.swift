//
//  LoginPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit
import Firebase

protocol ILoginPageViewController: IBaseView { }

class LoginPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    var presenter: ILoginPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        if emailTextField.text?.isEmpty == false && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.presenter?.navigateHome()
                }
            }
        } else {
            makeAlert(title: "Error", message: "Username/Password issues..")
        }
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        presenter?.navigateRegister()
    }

}

extension LoginPageViewController: ILoginPageViewController {

}
