//
//  OnboardingPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation

protocol IOnboardingPagePresenter: AnyObject {
    func navigateLoginPage()
}

class OnboardingPagePresenter {
    weak var view: IOnboardingPageViewController?
    var router: IOnboardingPageRouter?
    var interactor: IOnboardingPageInteractor?

}

extension OnboardingPagePresenter: IOnboardingPagePresenter {
    func navigateLoginPage() {
        router?.navigateToLoginPage()
    }
}

extension OnboardingPagePresenter: IOnboardingPageInteractorToPresenter {

}
