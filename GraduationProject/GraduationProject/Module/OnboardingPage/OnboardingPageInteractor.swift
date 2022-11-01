//
//  OnboardingPageInteractor.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IOnboardingPageInteractor: AnyObject {
    // TODO: Declare use case methods
}

protocol IOnboardingPageInteractorToPresenter: AnyObject {
    // TODO: Declare interactor output methods
}

class OnboardingPageInteractor {

    // MARK: Properties

    weak var output: IOnboardingPageInteractorToPresenter?
}

extension OnboardingPageInteractor: IOnboardingPageInteractor {
    // TODO: Implement use case methods
}
