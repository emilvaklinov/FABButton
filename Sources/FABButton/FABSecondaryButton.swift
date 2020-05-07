//
//  FABSecondaryButton.swift
//  
//
//  Created by Emil Vaklinov on 07/05/2020.
//
import UIKit

class FABSecondaryView: UIStackView {
    
 private var secondaryButton = UIButton(frame: .zero)
 private var buttonLabel = FABInsetLabel(frame: .zero)
 private var labelView = UIView(frame: .zero)
     
 override init(frame: CGRect) {
     super.init(frame: .zero)
     configure()
 }
  
  
 required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
 }
     
     
 private func configure() {
     configureSecondaryButton()
     configureLabel()
     configureLayoutUI()
 }
     
     
 private func configureSecondaryButton() {
     secondaryButton.translatesAutoresizingMaskIntoConstraints = false
     secondaryButton.setImage(<IMAGE>, for: .normal)
     secondaryButton.backgroundColor = UIColor.white
     secondaryButton.layer.cornerRadius = 17
     secondaryButton.addTarget(self, action: #selector(secondaryButtonAction), for: .touchUpInside)
         
     dropShadowToView(secondaryButton)
 }
     
     
 @objc private func secondaryButtonAction() {
  
 }
     
     
 private func configureLabel() {
     labelView.backgroundColor = .white
     labelView.translatesAutoresizingMaskIntoConstraints = false
     labelView.layer.cornerRadius = 4
     dropShadowToView(labelView)
         
     buttonLabel.translatesAutoresizingMaskIntoConstraints = false
     buttonLabel.font = .systemFont(ofSize: 11)
     buttonLabel.textAlignment = .center
     buttonLabel.text = <TITLE>
     buttonLabel.textColor = .gray
     buttonLabel.contentInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
 }
  
     
 private func configureLayoutUI() {
     translatesAutoresizingMaskIntoConstraints = false
     addSubview(labelView)
     labelView.addSubview(buttonLabel)
     addSubview(secondaryButton)
         
     NSLayoutConstraint.activate([
         secondaryButton.centerYAnchor.constraint(equalTo: centerYAnchor),
         secondaryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
         secondaryButton.widthAnchor.constraint(equalToConstant: 34),
         secondaryButton.heightAnchor.constraint(equalToConstant: 34),
             
         labelView.centerYAnchor.constraint(equalTo: centerYAnchor),
         labelView.leadingAnchor.constraint(equalTo: buttonLabel.leadingAnchor),
         labelView.trailingAnchor.constraint(equalTo: secondaryButton.leadingAnchor, constant: -12),
         labelView.heightAnchor.constraint(equalToConstant: 27),
             
         buttonLabel.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
         buttonLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
         buttonLabel.bottomAnchor.constraint(equalTo: labelView.bottomAnchor),
     ])
 }
     
     
 private func dropShadowToView(_ view: UIView) {
     view.layer.shadowColor = UIColor.gray.cgColor
     view.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
     view.layer.shadowRadius = 4.0
     view.layer.shadowOpacity = 0.4
 }
 
}
