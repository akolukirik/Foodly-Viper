//
//  HomePageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//
//

import Foundation
import UIKit

extension HomePageViewController {
    private enum Constants {
        static let spacing: CGFloat = 10
    }
}

protocol IHomePageViewController: IBaseView {
    func reloadTableView()
}

class HomePageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var searchBar: UISearchBar!

    var presenter: IHomePagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        createNavBar()
        presenter?.viewDidLoad()

        searchBar.delegate = self

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(HomePageCollectionViewCell.self)
        
        configureCollectionView()
    }
}

extension HomePageViewController: IHomePageViewController {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.foodListCount ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomePageCollectionViewCell = collectionView.dequeue(for: indexPath)

        guard let model = presenter?.getFood(index: indexPath.row) else { return UICollectionViewCell() }

        cell.configure(foodNameLabel: model.yemek_adi ?? "",
                       foodPriceLabel: model.yemek_fiyat ?? "",
                       foodImageView: model.yemek_resim_adi ?? "",
                       index: indexPath.row,
                       delegate: self)

        return cell
    }
}

extension HomePageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            presenter?.search(searchText: searchText)
            collectionView.reloadData()
        } else {
            presenter?.viewDidLoad()
        }
    }
}

extension HomePageViewController: FoodTableViewCellDelegate {
    func didTappedFood(rowIndex: Int) {
        presenter?.didTappedFood(index: rowIndex)
    }
}

extension HomePageViewController {
    func configureCollectionView() {
        let desingCollectionView = UICollectionViewFlowLayout()
        desingCollectionView.sectionInset = UIEdgeInsets(top: Constants.spacing,
                                                         left: Constants.spacing,
                                                         bottom: Constants.spacing,
                                                         right: Constants.spacing)
        desingCollectionView.minimumLineSpacing = Constants.spacing
        desingCollectionView.minimumInteritemSpacing = Constants.spacing

        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = (screenWidth - 30) / 2

        desingCollectionView.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.2)

        collectionView.collectionViewLayout = desingCollectionView
    }

    func createNavBar() {
        let apperance = UINavigationBarAppearance()
        self.navigationItem.title = "Foodly"
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor(named: "Background")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Background")
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
    }
}
