//
//  OrderTrackPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation
import UIKit

protocol IOrderTrackPageRouter: AnyObject {
    func navigateToHomePage()
}

class OrderTrackPageRouter {

    weak var view: UIViewController?

    static func setupModule() -> OrderTrackPageViewController {
        let viewController = UIStoryboard.loadViewController() as OrderTrackPageViewController
        let presenter = OrderTrackPagePresenter()
        let router = OrderTrackPageRouter()
        let interactor = OrderTrackPageInteractor()

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

extension OrderTrackPageRouter: IOrderTrackPageRouter {
    func navigateToHomePage() {
        let homePage = TabBar()
        homePage.modalPresentationStyle = .fullScreen
        view?.present(homePage, animated: true)
      //  AppRouter.shared.window.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
