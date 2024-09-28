//
//  HomeViewController.swift
//  KeychainPractice
//
//  Created by Murtaza Mehmood on 28/09/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    var email: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pwd = try? KeychainManager.shared.getCredential(account: email ?? "") {
            lblText.text = "Username: \(email ?? ""),Password: \(pwd) "
        }
    }
}
