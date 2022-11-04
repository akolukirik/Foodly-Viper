//
//  LoginPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import Firebase

protocol ILoginPagePresenter: AnyObject {
    func navigateRegister()
    func loginProcess(userName: String, password: String)
}

class LoginPagePresenter: ILoginPagePresenter {

    weak var view: ILoginPageViewController?
    var router: ILoginPageRouter?
    var interactor: ILoginPageInteractor?

    func navigateRegister() {
        router?.navigateToRegisterPage()
    }

    func loginProcess(userName: String, password: String) {
        if userName.isEmpty == false, password != "" {
            Auth.auth().signIn(withEmail: userName, password: password) { (authdata, error) in
                if error != nil {
                    self.view?.showAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.router?.navigateToHomePage()
                }
            }
        } else {
            view?.showAlert(title: "Error", message: "Username or Password not null.")
        }
    }
}

extension LoginPagePresenter: ILoginPageInteractorToPresenter {

}
