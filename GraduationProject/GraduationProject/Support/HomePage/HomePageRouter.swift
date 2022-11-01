//
//  HomePageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//
//

import Foundation
import UIKit

protocol IHomePageRouter: AnyObject {
    func navigateToFoodDetailPage(foodID: String, foodName: String, foodImage: String, foodPrice: String)
}

class HomePageRouter {

    weak var view: UIViewController?

    static func setupModule() -> HomePageViewController {
        let viewController = UIStoryboard.loadViewController() as HomePageViewController
        let presenter = HomePagePresenter()
        let router = HomePageRouter()
        let interactor = HomePageInteractor()

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

extension HomePageRouter: IHomePageRouter {
    func navigateToFoodDetailPage(foodID: String, foodName: String, foodImage: String, foodPrice: String) {
        let detailPage = DetailPageRouter.setupModule(foodID: foodID,
                                                      foodName: foodName,
                                                      foodImage: foodImage,
                                                      foodPrice: foodPrice)
        view?.present(detailPage, animated: true)
    }
}
