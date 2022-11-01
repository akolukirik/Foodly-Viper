//
//  OrderTrackPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol IOrderTrackPagePresenter: AnyObject {
    func navigateHomePage()
}

class OrderTrackPagePresenter {
    weak var view: IOrderTrackPageViewController?
    var router: IOrderTrackPageRouter?
    var interactor: IOrderTrackPageInteractor?
}

extension OrderTrackPagePresenter: IOrderTrackPagePresenter {
    func navigateHomePage() {
        router?.navigateToHomePage()
    }
}

extension OrderTrackPagePresenter: IOrderTrackPageInteractorToPresenter {

}
