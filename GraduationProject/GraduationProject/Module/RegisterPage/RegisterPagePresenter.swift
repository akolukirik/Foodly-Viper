//
//  RegisterPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IRegisterPagePresenter: AnyObject {

}

class RegisterPagePresenter {
    weak var view: IRegisterPageViewController?
    var router: IRegisterPageRouter?
    var interactor: IRegisterPageInteractor?
}

extension RegisterPagePresenter: IRegisterPagePresenter {

}

extension RegisterPagePresenter: IRegisterPageInteractorToPresenter {
   
}
