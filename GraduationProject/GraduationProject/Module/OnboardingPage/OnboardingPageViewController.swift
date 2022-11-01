//
//  OnboardingPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit

protocol IOnboardingPageViewController: IBaseView {

}

class OnboardingPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var onboardingCollectionView: UICollectionView!
    @IBOutlet private var onboardingPageController: UIPageControl!
    @IBOutlet private var skipButton: UIButton!

    var presenter: IOnboardingPagePresenter?

    var slides: [OnboardingSlide] = []

    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                skipButton.setTitle("Get Started", for: .normal)
            } else {
                skipButton.setTitle("Skip", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self

        onboardingCollectionView.registerCell(OnboardingPageCollectionViewCell.self)

        slides = [
            OnboardingSlide(title: "Order Your Food", description: "Now you can order your food anytime from your mobile.", image: UIImage(named: "Slider1")!),
            OnboardingSlide(title: "Safe Food Transfer", description: "We maintain safety and cleanliness while preparing your food.", image: UIImage(named: "Slider2")!),
            OnboardingSlide(title: "Fast Delivery", description: "We deliver your food immediately", image: UIImage(named: "Slider3")!) ]

    }

    @IBAction private func skipButtonClicked(_ sender: Any) {
        if currentPage == slides.count - 1 {
            presenter?.navigateLoginPage()
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            onboardingPageController.currentPage = currentPage
        }
    }
}

extension OnboardingPageViewController: IOnboardingPageViewController {

}

extension OnboardingPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingPageCollectionViewCell = onboardingCollectionView.dequeue(for: indexPath)
        guard let slide = slides[safe: indexPath.row] else { return cell }
        cell.configure(slide)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

}
