//
//  RegisterPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import Firebase

protocol IRegisterPagePresenter: AnyObject {
    func registerProcess(userName: String, password: String)
}

class RegisterPagePresenter {
    weak var view: IRegisterPageViewController?
    var router: IRegisterPageRouter?
    var interactor: IRegisterPageInteractor?
}

extension RegisterPagePresenter: IRegisterPagePresenter {
    func registerProcess(userName: String, password: String) {
        if userName != "" && password != "" {
            Auth.auth().createUser(withEmail: userName, password: password) { [self] (authdata, error) in
                if error != nil {
                    view?.makeErrorAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    view?.makeAlertSuccesful()
                }
            }
        } else {
            view?.makeErrorAlert(title: "Error", message: "Username or Password not null.")
        }
    }
}

extension RegisterPagePresenter: IRegisterPageInteractorToPresenter {
   
}
