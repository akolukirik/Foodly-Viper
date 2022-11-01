//
//  LoginPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol ILoginPagePresenter: AnyObject {
    func navigateHome()
    func navigateRegister()
}

class LoginPagePresenter {
    weak var view: ILoginPageViewController?
    var router: ILoginPageRouter?
    var interactor: ILoginPageInteractor?
}

extension LoginPagePresenter: ILoginPagePresenter {
    func navigateRegister() {
        router?.navigateToRegisterPage()
    }

    func navigateHome() {
        router?.navigateToHomePage()
    }

}

extension LoginPagePresenter: ILoginPageInteractorToPresenter {

}
