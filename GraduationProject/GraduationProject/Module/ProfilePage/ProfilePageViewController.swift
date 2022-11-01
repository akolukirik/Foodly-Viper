//
//  ProfilePageViewController.swift
//  GraduationProject
//
//  Created by Ali Kolukirik on 19.10.2022.
//  
//

import Foundation
import UIKit
import Firebase

protocol IProfilePageViewController: IBaseView {

}

class ProfilePageViewController: BaseViewController, StoryboardLoadable {

    var presenter: IProfilePagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        createNavBar()
    }

    @IBAction private func signOutButtonClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            signOut()
        } catch {
            print("error")
        }
    }
}

extension ProfilePageViewController: IProfilePageViewController {

}

extension ProfilePageViewController {
    private func signOut() {
        let alert = UIAlertController(title: "Want to log out..", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alert.addAction(cancelAction)

        let confirmAction = UIAlertAction(title: "Yes", style: .destructive) { action in
            self.presenter?.navigateLogin()
        }

        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
}

extension ProfilePageViewController {
    func createNavBar() {
        let apperance = UINavigationBarAppearance()
        self.navigationItem.title = "Profile"
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor(named: "Background")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "Background")
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
    }
}
