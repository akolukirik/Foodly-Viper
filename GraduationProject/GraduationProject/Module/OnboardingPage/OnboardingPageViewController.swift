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
    func setButtonTitle(_ text: String)
    func setSliderInfo(_ index: IndexPath, currentPage: Int)
}

class OnboardingPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var onboardingCollectionView: UICollectionView!
    @IBOutlet private var onboardingPageController: UIPageControl!
    @IBOutlet private var skipButton: UIButton!

    var presenter: IOnboardingPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.registerCell(OnboardingPageCollectionViewCell.self)

        presenter?.getSliderInformation()
    }

    @IBAction private func skipButtonClicked(_ sender: Any) {
        presenter?.setSlider()
        presenter?.setTitle()
    }
}

extension OnboardingPageViewController: IOnboardingPageViewController {

    func setSliderInfo(_ index: IndexPath, currentPage: Int) {
        onboardingCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        onboardingPageController.currentPage = currentPage
    }

    func setButtonTitle(_ text: String) {
        skipButton.setTitle(text, for: .normal)
    }
}

extension OnboardingPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.sliderCount ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingPageCollectionViewCell = onboardingCollectionView.dequeue(for: indexPath)
        guard let slide = presenter?.slides[safe: indexPath.row] else { return cell }
        cell.configure(slide)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
