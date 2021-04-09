//
//  GFAvatarImageView.swift
//  iOS_Github_Client
//
//  Created by Roger Navarro on 4/8/21.
//

import UIKit

class GFAvatarImageView: UIImageView {

  let placeHolderImage = UIImage(named: "avatar-placeholder")!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder: ) has not been implemented")
  }
  
  private func configure() {
    layer.cornerRadius = 10
    clipsToBounds = true // so the image also shows the corner radious of 10
    image = placeHolderImage
    translatesAutoresizingMaskIntoConstraints = false
  }

}
