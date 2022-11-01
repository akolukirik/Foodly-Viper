//
//  LoginPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol ILoginPageInteractor: AnyObject {

}

protocol ILoginPageInteractorToPresenter: AnyObject {

}

class LoginPageInteractor {

    weak var output: ILoginPageInteractorToPresenter?
}

extension LoginPageInteractor: ILoginPageInteractor {

}
