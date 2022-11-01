//
//  BasketPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import UIKit

protocol IBasketPageRouter: AnyObject {
    func navigateToPaymentMethodPage()
}

class BasketPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> BasketPageViewController {
        let viewController = UIStoryboard.loadViewController() as BasketPageViewController
        let presenter = BasketPagePresenter()
        let router = BasketPageRouter()
        let interactor = BasketPageInteractor()

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

extension BasketPageRouter: IBasketPageRouter {
    func navigateToPaymentMethodPage() {
        let paymentMethodPage = PaymentMethodPageRouter.setupModule()
        view?.present(paymentMethodPage, animated: true)
    }
}
