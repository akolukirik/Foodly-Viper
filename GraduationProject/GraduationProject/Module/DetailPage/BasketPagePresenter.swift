//
//  BasketPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation

protocol IBasketPagePresenter: AnyObject {
    // TODO: Declare presentation methods
}

class BasketPagePresenter {

    // MARK: Properties

    weak var view: IBasketPageViewController?
    var router: IBasketPageRouter?
    var interactor: IBasketPageInteractor?
}

extension BasketPagePresenter: IBasketPagePresenter {
    // TODO: implement presentation methods
}

extension BasketPagePresenter: IBasketPageInteractorToPresenter {
    // TODO: implement interactor output methods
}
