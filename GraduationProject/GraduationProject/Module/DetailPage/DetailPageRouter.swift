//
//  DetailPageRouter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import UIKit

protocol IDetailPageRouter: AnyObject {
    func dismissPage()
}

class DetailPageRouter {

    weak var view: UIViewController?

    static func setupModule(foodID: String, foodName: String, foodImage: String, foodPrice: String) -> DetailPageViewController {
        let viewController = UIStoryboard.loadViewController() as DetailPageViewController
        let presenter = DetailPagePresenter(foodID: foodID, foodName: foodName, foodImage: foodImage, foodPrice: foodPrice)
        let router = DetailPageRouter()
        let interactor = DetailPageInteractor()

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

extension DetailPageRouter: IDetailPageRouter {
    func dismissPage() {
        view?.dismiss(animated: true)
    }
}
