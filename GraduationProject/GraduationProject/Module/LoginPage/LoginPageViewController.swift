//
//  LoginPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol ILoginPageViewController: IBaseView {
    func showAlert(title: String, message: String)
}

class LoginPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    var presenter: ILoginPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func signInButtonClicked(_ sender: Any) {
        presenter?.loginProcess(userName: emailTextField.text ?? "",
                                password: passwordTextField.text ?? "")
    }

    @IBAction private func signUpButtonClicked(_ sender: Any) {
        presenter?.navigateRegister()
    }
}

extension LoginPageViewController: ILoginPageViewController {
    func showAlert(title: String, message: String) {
        makeAlert(title: title, message: message)
    }
}

extension LoginPageViewController {
    
}
