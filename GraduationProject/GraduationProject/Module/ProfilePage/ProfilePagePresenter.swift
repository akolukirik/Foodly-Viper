//
//  ProfilePagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IProfilePagePresenter: AnyObject {
    func navigateLogin()
}

class ProfilePagePresenter {
    weak var view: IProfilePageViewController?
    var router: IProfilePageRouter?
    var interactor: IProfilePageInteractor?
}

extension ProfilePagePresenter: IProfilePagePresenter {
    func navigateLogin() {
        router?.navigateToLoginPage()
    }
}

extension ProfilePagePresenter: IProfilePageInteractorToPresenter {

}
