//
//  PaymentMethodPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

protocol IPaymentMethodPageRouter: AnyObject {
    func navigateToAdressPage()
    func dismissPage()
}

class PaymentMethodPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> PaymentMethodPageViewController {
        let viewController = UIStoryboard.loadViewController() as PaymentMethodPageViewController
        let presenter = PaymentMethodPagePresenter()
        let router = PaymentMethodPageRouter()
        let interactor = PaymentMethodPageInteractor()

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

extension PaymentMethodPageRouter: IPaymentMethodPageRouter {
    func navigateToAdressPage() {
        let adressPage = AdressPageRouter.setupModule()
        view?.present(adressPage, animated: true)
    }
    func dismissPage() {
        view?.dismiss(animated: true)
    }
}
