//
//  RegisterPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol IRegisterPageViewController: IBaseView {
    func makeAlertSuccesful()
    func makeErrorAlert(title: String, message: String)
}

class RegisterPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    var presenter: IRegisterPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func signUpButtonClicked(_ sender: Any) {
        presenter?.registerProcess(userName: emailTextField.text ?? "",
                                   password: passwordTextField.text ?? "")
    }
}

extension RegisterPageViewController: IRegisterPageViewController {
    func makeErrorAlert(title: String, message: String) {
        makeAlert(title: title, message: message)
    }

    func makeAlertSuccesful() {
        registerSuccesful()
    }
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
