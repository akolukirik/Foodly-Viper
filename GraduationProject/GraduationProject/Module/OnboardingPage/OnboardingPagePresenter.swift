//
//  OnboardingPagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol IOnboardingPagePresenter: AnyObject {
    var sliderCount : Int { get }
    var slides: [OnboardingSlide] { get }
    
    func navigateLoginPage()
    func getSliderInformation()
    func setTitle()
    func setSlider()
}

class OnboardingPagePresenter: IOnboardingPagePresenter {
    
    weak var view: IOnboardingPageViewController?
    var router: IOnboardingPageRouter?
    var interactor: IOnboardingPageInteractor?
    
    var slides: [OnboardingSlide] = []
    private var currentSlider = 0
    
    var sliderCount: Int {
        slides.count
    }
    
    func getSliderInformation() {
        slides = [
            OnboardingSlide(title: "Order Your Food", description: "Now you can order your food anytime from your mobile.", image: UIImage(named: "Slider1")!),
            OnboardingSlide(title: "Safe Food Transfer", description: "We maintain safety and cleanliness while preparing your food.", image: UIImage(named: "Slider2")!),
            OnboardingSlide(title: "Fast Delivery", description: "We deliver your food immediately", image: UIImage(named: "Slider3")!) ]
    }
    
    func setTitle() {
        if currentSlider == sliderCount - 1 {
            view?.setButtonTitle("Get Started")
        } else {
            view?.setButtonTitle("Skip")
        }
    }
    
    func setSlider() {
        if currentSlider == sliderCount - 1 {
            router?.navigateToLoginPage()
        } else {
            currentSlider += 1
            let indexPath = IndexPath(item: currentSlider, section: 0)
            view?.setSliderInfo(indexPath, currentPage: currentSlider)
        }
    }
    
    func navigateLoginPage() {
        router?.navigateToLoginPage()
    }
}

extension OnboardingPagePresenter: IOnboardingPageInteractorToPresenter {
    
}
