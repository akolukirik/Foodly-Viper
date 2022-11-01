//
//  LoginPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol ILoginPageRouter: AnyObject {
    func navigateToHomePage()
    func navigateToRegisterPage()
}

class LoginPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> LoginPageViewController {
        let viewController = UIStoryboard.loadViewController() as LoginPageViewController
        let presenter = LoginPagePresenter()
        let router = LoginPageRouter()
        let interactor = LoginPageInteractor()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension LoginPageRouter: ILoginPageRouter {
    func navigateToRegisterPage() {
        let registerPage = RegisterPageRouter.setupModule()
        view?.present(registerPage, animated: true)
    }

    func navigateToHomePage() {
        let homePage = TabBar()
        homePage.modalPresentationStyle = .fullScreen
        view?.present(homePage, animated: true)
    }
}
