//
//  SearchViewController.swift
//  iOS_Github_Client
//
//  Created by Roger Navarro on 4/3/21.
//

import UIKit

class SearchVC: UIViewController {
  
  let logoImageView = UIImageView()
  let usernameTextField = GFTextField()
  let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
  
  
  var isUserNameEntered: Bool { !usernameTextField.text!.isEmpty }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    usernameTextField.delegate = self
    view.backgroundColor = .systemBackground
    configureLogoImageView()
    configureTextField()
    configureCallToActionButtom()
    createDismissKeyboardTapGesture()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true
  }
  
  func configureLogoImageView() {
    view.addSubview(logoImageView)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.image = UIImage(named: "gh-logo")!
    
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  func configureTextField() {
    view.addSubview(usernameTextField)
    
    NSLayoutConstraint.activate([
      usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
      usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      usernameTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  func configureCallToActionButtom() {
    view.addSubview(callToActionButton)
    callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside )
    NSLayoutConstraint.activate([
      callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  func createDismissKeyboardTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
  @objc func pushFollowerListVC() {
    guard isUserNameEntered else { return }
    let followerListVC = FollowerListVC()
    followerListVC.username = usernameTextField.text
    followerListVC.title = usernameTextField.text
    navigationController?.pushViewController(followerListVC, animated: true)
  }
}

extension SearchVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    pushFollowerListVC()
    return true
  }
}
