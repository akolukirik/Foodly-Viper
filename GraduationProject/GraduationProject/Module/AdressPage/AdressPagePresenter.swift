//
//  AdressPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol IAdressPagePresenter: AnyObject {
    func navigateCheckOutPage()
    func dismissPage()
}

class AdressPagePresenter {
    weak var view: IAdressPageViewController?
    var router: IAdressPageRouter?
    var interactor: IAdressPageInteractor?
}

extension AdressPagePresenter: IAdressPagePresenter {
    func dismissPage() {
        router?.dismissPage()
    }

    func navigateCheckOutPage() {
        router?.navigateToCheckOutPage()
    }
}

extension AdressPagePresenter: IAdressPageInteractorToPresenter {

}
