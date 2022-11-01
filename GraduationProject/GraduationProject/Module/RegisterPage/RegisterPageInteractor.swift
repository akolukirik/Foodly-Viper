//
//  RegisterPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IRegisterPageInteractor: AnyObject {
    
}

protocol IRegisterPageInteractorToPresenter: AnyObject {

}

class RegisterPageInteractor {
    weak var output: IRegisterPageInteractorToPresenter?
}

extension RegisterPageInteractor: IRegisterPageInteractor {

}
