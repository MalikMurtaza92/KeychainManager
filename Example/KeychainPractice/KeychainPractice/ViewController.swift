//
//  ViewController.swift
//  KeychainPractice
//
//  Created by Murtaza Mehmood on 27/09/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var paswordTxt: UITextField!
    @IBOutlet weak var rememberMeSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.emailTxt.resignFirstResponder()
        self.paswordTxt.resignFirstResponder()
        
        guard let email = emailTxt.text,
              let password = paswordTxt.text,
            email != "" && password != "" else {
            showAlert(title: "Emtpy Fields", message: "Please enter email and password")
            return
        }
        
        
        if rememberMeSwitch.isOn {
            do {
                try KeychainManager.shared.storeCredentialsIntoKeychain(account: email,
                                                                        password: password)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        if let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            vc.email = email
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alert, animated: true)
    }
}
