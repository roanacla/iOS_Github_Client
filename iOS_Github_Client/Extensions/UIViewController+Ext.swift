//
//  UIViewController+Ext.swift
//  iOS_Github_Client
//
//  Created by Roger Navarro on 4/5/21.
//

import UIKit

extension UIViewController {
  func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
      alertVC.modalPresentationStyle = .overFullScreen
      alertVC.modalTransitionStyle = .crossDissolve
      self.present(alertVC, animated: true, completion: nil)
    }
  }
}
