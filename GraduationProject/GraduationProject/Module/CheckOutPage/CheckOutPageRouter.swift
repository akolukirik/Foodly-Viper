//
//  CheckOutPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

protocol ICheckOutPageRouter: AnyObject {
    func navigeToOrderTrackPage()
    func dismissPage()
}

class CheckOutPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> CheckOutPageViewController {
        let viewController = UIStoryboard.loadViewController() as CheckOutPageViewController
        let presenter = CheckOutPagePresenter()
        let router = CheckOutPageRouter()
        let interactor = CheckOutPageInteractor()

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

extension CheckOutPageRouter: ICheckOutPageRouter {
    func navigeToOrderTrackPage() {
        let orderTrackPage = OrderTrackPageRouter.setupModule()
        view?.present(orderTrackPage, animated: true)
    }
    func dismissPage() {
        view?.dismiss(animated: true)
    }
}
