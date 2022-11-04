//
//  RegisterPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IRegisterPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IRegisterPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class RegisterPageInteractor {
    
    // MARK: Properties

    weak var output: IRegisterPageInteractorToPresenter?
}

extension RegisterPageInteractor: IRegisterPageInteractor {
    // TODO: Implement use case methods
}
