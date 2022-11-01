//
//  OnboardingPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol IOnboardingPageRouter: AnyObject {
    func navigateToLoginPage()
}

class OnboardingPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> OnboardingPageViewController {
        let viewController = UIStoryboard.loadViewController() as OnboardingPageViewController
        let presenter = OnboardingPagePresenter()
        let router = OnboardingPageRouter()
        let interactor = OnboardingPageInteractor()

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

extension OnboardingPageRouter: IOnboardingPageRouter {
    func navigateToLoginPage() {
        let loginPage = LoginPageRouter.setupModule()
        loginPage.modalPresentationStyle = .fullScreen
        view?.present(loginPage, animated: true)
    }
}
