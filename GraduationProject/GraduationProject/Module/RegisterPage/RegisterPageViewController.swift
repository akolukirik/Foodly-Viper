//
//  RegisterPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit
import Firebase

protocol IRegisterPageViewController: IBaseView {

}

class RegisterPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    var presenter: IRegisterPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [self] (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    registerSuccesful()
                }
            }
        } else {
            makeAlert(title: "Error", message: "Username/Password not null")
        }
    }
}

extension RegisterPageViewController: IRegisterPageViewController {

}

extension RegisterPageViewController {
    func registerSuccesful() {
        let alert = UIAlertController(title: "Welcome", message: "", preferredStyle: .alert)

        let confirmAction = UIAlertAction(title: "Let me in", style: .default) { action in
            self.dismiss(animated: true)
        }
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
}
