//
//  UIViewControllerExtension.swift
//  PeopleApp
//
//  Created by Megha Uppin 09/11/2022.
//

import UIKit

extension UIViewController {
    
    func presentNetworkErrorAlert(error: NetworkError) {
        let alert = UIAlertController(title: "Uh-Oh, Something went wrong", message: error.errorDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
}


