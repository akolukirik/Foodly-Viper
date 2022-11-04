//
//  LoginPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol ILoginPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol ILoginPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class LoginPageInteractor {
    
    // MARK: Properties

    weak var output: ILoginPageInteractorToPresenter?
}

extension LoginPageInteractor: ILoginPageInteractor {
    // TODO: Implement use case methods
}
