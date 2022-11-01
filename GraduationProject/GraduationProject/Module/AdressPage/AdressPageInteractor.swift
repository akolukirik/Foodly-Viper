//
//  AdressPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol IAdressPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IAdressPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class AdressPageInteractor {

    // MARK: Properties

    weak var output: IAdressPageInteractorToPresenter?
}

extension AdressPageInteractor: IAdressPageInteractor {
    // TODO: Implement use case methods
}
