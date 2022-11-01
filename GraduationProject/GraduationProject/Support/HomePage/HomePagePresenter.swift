//
//  HomePagePresenter.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 16.10.2022.
//
//

import Foundation

protocol IHomePagePresenter: AnyObject {
    var foodListCount: Int { get }

    func viewDidLoad()
    func getFood(index: Int) -> Yemekler?
    func didTappedFood(index: Int)
    func search(searchText:String)
}

class HomePagePresenter: IHomePagePresenter {

    weak var view: IHomePageViewController?
    var router: IHomePageRouter?
    var interactor: IHomePageInteractor?

    private var foodList: [Yemekler]?

    var foodListCount: Int {
        foodList?.count ?? 0
    }

    func viewDidLoad() {
        interactor?.fecthAllFoods()
    }

    func getFood(index: Int) -> Yemekler? {
        foodList?[safe: index]
    }

    func search(searchText: String) {
        interactor?.searchFood(searchText: searchText)
    }

    func didTappedFood(index: Int) {
        guard let index = getFood(index: index) else { return }
        router?.navigateToFoodDetailPage(foodID: index.yemek_id ?? "",
                                         foodName: index.yemek_adi ?? "",
                                         foodImage: index.yemek_resim_adi ?? "",
                                         foodPrice: index.yemek_fiyat ?? "")
    }

}

extension HomePagePresenter: IHomePageInteractorToPresenter {
    func sendSearchDataToPresenter(dataList: [Yemekler]?) {
        self.foodList = dataList
        view?.reloadTableView()
    }

    func sendDataToPresenter(dataList: [Yemekler]?) {
        self.foodList = dataList
        view?.reloadTableView()
    }
}
