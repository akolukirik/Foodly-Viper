//
//  CheckOutPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 26.10.2022.
//  
//

import Foundation

protocol ICheckOutPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol ICheckOutPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class CheckOutPageInteractor {

    // MARK: Properties

    weak var output: ICheckOutPageInteractorToPresenter?
}

extension CheckOutPageInteractor: ICheckOutPageInteractor {
    // TODO: Implement use case methods
}
