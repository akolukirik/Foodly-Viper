//
//  AdressPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

protocol IAdressPageRouter: AnyObject {
    func navigateToCheckOutPage()
    func dismissPage()
}

class AdressPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> AdressPageViewController {
        let viewController = UIStoryboard.loadViewController() as AdressPageViewController
        let presenter = AdressPagePresenter()
        let router = AdressPageRouter()
        let interactor = AdressPageInteractor()

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

extension AdressPageRouter: IAdressPageRouter {
    func navigateToCheckOutPage() {
        let checkOutPage = CheckOutPageRouter.setupModule()
        view?.present(checkOutPage, animated: true)
    }

    func dismissPage() {
        view?.dismiss(animated: true)
    }
}
