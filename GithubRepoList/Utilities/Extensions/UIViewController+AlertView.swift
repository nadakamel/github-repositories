//
//  UIViewController+AlertView.swift
//  GithubRepoList
//
//  Created by Nada Kamel on 10/06/2021.
//

import UIKit

extension UIViewController {
    
    func showAlertView(withTitle title: String?, andMessage message: String?, shouldDismissView: Bool) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
            if shouldDismissView {
                self.dismiss(animated: true, completion: nil)
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
