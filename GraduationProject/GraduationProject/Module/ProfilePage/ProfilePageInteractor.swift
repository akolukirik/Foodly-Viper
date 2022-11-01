//
//  ProfilePageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IProfilePageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IProfilePageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class ProfilePageInteractor {

    // MARK: Properties

    weak var output: IProfilePageInteractorToPresenter?
}

extension ProfilePageInteractor: IProfilePageInteractor {
    // TODO: Implement use case methods
}
