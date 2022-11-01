//
//  CheckOutPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol ICheckOutPagePresenter: AnyObject {
    func navigateOrderTrack()
    func dismissPage()
}

class CheckOutPagePresenter {
    weak var view: ICheckOutPageViewController?
    var router: ICheckOutPageRouter?
    var interactor: ICheckOutPageInteractor?
}

extension CheckOutPagePresenter: ICheckOutPagePresenter {
    func dismissPage() {
        router?.dismissPage()
    }

    func navigateOrderTrack() {
        router?.navigeToOrderTrackPage()
    }
}

extension CheckOutPagePresenter: ICheckOutPageInteractorToPresenter {

}
