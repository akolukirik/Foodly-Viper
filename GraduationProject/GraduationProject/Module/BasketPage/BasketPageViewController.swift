//
//  BasketPageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 17.10.2022.
//  
//

import Foundation
import UIKit

extension BasketPageViewController {
    private enum Constants {
        static let cellHeight: Float = 139
    }
}

protocol IBasketPageViewController: IBaseView {
    func reloadTableView()
}

class BasketPageViewController: BaseViewController, StoryboardLoadable {

    @IBOutlet var basketTableView: UITableView!
    @IBOutlet var basketTotalPriceLabel: UILabel!

    var presenter: IBasketPagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        createNavBar()
        basketTableView.delegate = self
        basketTableView.dataSource = self
        basketTableView.register(UINib(nibName: BasketPageTableViewCell.nameOfClass,
                                       bundle: nil),
                                 forCellReuseIdentifier: BasketPageTableViewCell.nameOfClass)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
        basketTableView.reloadData()
        basketTotalPriceLabel.text = "\(presenter?.calculate() ?? 0) TL"
    }

    @IBAction func submitButtonClicked(_ sender: Any) {
        presenter?.navigatePaymentMethod()
        BasketHandler.shared.totalPrice = self.presenter?.calculate() ?? 0
        self.presenter?.deleteAllInBasket()
    }

    @IBAction func deleteButtonClicked(_ sender: Any) {

        let alert = UIAlertController(title: "Delete all foods !!", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alert.addAction(cancelAction)

        let confirmAction = UIAlertAction(title: "Yes", style: .destructive) { action in
            self.presenter?.deleteAllInBasket()
            self.makeAlert(title: "Unfortunately", message: "All foods have been deleted")
        }
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }

}

extension BasketPageViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.basketFoodList.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.cellHeight)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketPageTableViewCell.nameOfClass, for: indexPath) as? BasketPageTableViewCell else { return UITableViewCell() }

        guard let model = presenter?.getFood(index: indexPath.row) else { return UITableViewCell() }

        cell.configure(basketFoodName: model.yemek_adi ?? "",
                       basketFoodCount: model.yemek_siparis_adet ?? "",
                       basketImageView: model.yemek_resim_adi ?? "",
                       basketFoodPrice: model.yemek_fiyat ?? "",
                       index: model.sepet_yemek_id ?? "",
                       delegate: self)

        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction,view,bool) in

            let food = self.presenter?.basketFoodList[indexPath.row]

            let alert = UIAlertController(title: "\(food?.yemek_adi ?? "") will delete..", message: "", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
            alert.addAction(cancelAction)

            let confirmAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                self.presenter?.deleteOrder(sepet_yemek_id: food?.sepet_yemek_id ?? "", kullanici_adi: "akolukirik")
            }
            alert.addAction(confirmAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension BasketPageViewController: IBasketPageViewController {
    func reloadTableView() {
            self.basketTableView.reloadData()
            self.basketTotalPriceLabel.text = "\(self.presenter?.calculate() ?? 0) TL"
    }
}

extension BasketPageViewController {
    func createNavBar() {
        let apperance = UINavigationBarAppearance()
        self.navigationItem.title = "Cart"
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor(named: "Background")
    }
}

extension BasketPageViewController: BasketPageCellDelegate {
    func increaseButtonClicked(foodCount: Int, index: Int, foodName yemek_adi: String, foodImage yemek_resim_adi: String, foodPrice yemek_fiyat: String) {

        let count = String(foodCount)
        let index = String(index)

        presenter?.updateOrder(sepet_yemek_id: index,
                               yemek_siparis_adet: count,
                               kullanici_adi: "akolukirik",
                               yemek_adi: yemek_adi,
                               yemek_resim_adi: yemek_resim_adi,
                               yemek_fiyat: yemek_fiyat)

        presenter?.viewDidLoad()
        reloadTableView()
    }

    func decreaseButtonClicked(foodCount: Int, index: Int, foodName yemek_adi: String, foodImage yemek_resim_adi: String, foodPrice yemek_fiyat: String) {

        let count = String(foodCount)
        let index = String(index)
        
        presenter?.updateOrder(sepet_yemek_id: index,
                               yemek_siparis_adet: count,
                               kullanici_adi: "akolukirik",
                               yemek_adi: yemek_adi,
                               yemek_resim_adi: yemek_resim_adi,
                               yemek_fiyat: yemek_fiyat)

        presenter?.viewDidLoad()
        reloadTableView()
    }
}
