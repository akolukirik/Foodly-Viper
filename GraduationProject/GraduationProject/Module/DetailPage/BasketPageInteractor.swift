//
//  BasketPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation

protocol IBasketPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IBasketPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class BasketPageInteractor {

    // MARK: Properties

    weak var output: IBasketPageInteractorToPresenter?
}

extension BasketPageInteractor: IBasketPageInteractor {
    // TODO: Implement use case methods
}
