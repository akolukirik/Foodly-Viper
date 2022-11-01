//
//  RegisterPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol IRegisterPageRouter: AnyObject {

}

class RegisterPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> RegisterPageViewController {
        let viewController = UIStoryboard.loadViewController() as RegisterPageViewController
        let presenter = RegisterPagePresenter()
        let router = RegisterPageRouter()
        let interactor = RegisterPageInteractor()

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .pageSheet

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension RegisterPageRouter: IRegisterPageRouter {
    
}
