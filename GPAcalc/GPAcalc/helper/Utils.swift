//
//  Utils.swift
//  GPAcalc
//
//  Created by Surya on 17/01/23.
//

import Foundation
import UIKit
extension UIViewController {
    func tapTohideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
}
