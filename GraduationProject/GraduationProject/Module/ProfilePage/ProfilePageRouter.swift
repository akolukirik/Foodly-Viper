//
//  ProfilePageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol IProfilePageRouter: AnyObject {
    func navigateToLoginPage()
}

class ProfilePageRouter {

    weak var view: UIViewController?

    static func setupModule() -> ProfilePageViewController {
        let viewController = UIStoryboard.loadViewController() as ProfilePageViewController
        let presenter = ProfilePagePresenter()
        let router = ProfilePageRouter()
        let interactor = ProfilePageInteractor()

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

extension ProfilePageRouter: IProfilePageRouter {
    func navigateToLoginPage() {
        let loginPage = LoginPageRouter.setupModule()
        view?.present(loginPage, animated: true)
    }
}
