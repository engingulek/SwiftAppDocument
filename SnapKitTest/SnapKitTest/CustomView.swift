//
//  CustomView.swift
//  SnapKitTest
//
//  Created by engin gülek on 8.01.2023.
//

import Foundation
import UIKit
import SnapKit
class CustomView: UIView {

   var floatingText: String = "" {
        didSet {
            self.floatingLabel.text = floatingText
        }
    }

    var placeHolder: String = "" {
        didSet {
            self.textField.placeholder = placeHolder
        }
    }

    var leftViewColor: UIColor = UIColor.init(red: 138 / 255, green: 15 / 255, blue: 116 / 255, alpha: 1) {
        didSet {
            self.setupProps()
        }
    }

    var leftIcon: UIImage = UIImage(named: "icon_user")! {
        didSet {
            self.setupProps()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setupView() {
        self.setupViewParentTextField()
        self.setupFloatingLabel()
        self.setupProps()
    }

    func setupProps() {
        self.leftView.backgroundColor = leftViewColor

        self.leftImageView.image = leftIcon
        self.leftImageView.image = self.leftImageView.image?.withRenderingMode(.alwaysTemplate)
        self.leftImageView.tintColor = .white
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }

    // Floating Label
    let floatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 138 / 255, green: 15 / 255, blue: 116 / 255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    // Parent View for Input+Icon
    let parentTextField: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    // Left View (Circle Background)
    let leftView: UIView = {
        let view = UIView()

        return view
    }()

    // Left Icon
    let leftImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    // TextField
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = UITextField.BorderStyle.none
        textField.font = UIFont.systemFont(ofSize: 14)
        return textField
    }()
    
    

    
    
   
}


extension CustomView {

    func setupViewParentTextField() {
        self.addSubview(self.parentTextField)
        self.parentTextField.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.leading.equalToSuperview().offset(16)
            maker.trailing.equalToSuperview().offset(-16)
            maker.height.equalTo(50)
        }

        // Setup Left View
        self.setupLeftView()
    }

    func setupLeftView() {
        self.parentTextField.addSubview(self.leftView)
        self.leftView.snp.makeConstraints { (maker) in
            maker.centerY.equalToSuperview()
            maker.leading.equalToSuperview().offset(8)
            maker.width.height.equalTo(32)
        }

        self.leftView.layer.cornerRadius = 16 // WidthHeight -> 32 / 2 = 16
        self.clipsToBounds = true

        // Setup Left Icon
        self.setupLeftIcon()
        // Setup TextField
        self.setupTextField()
    }

    func setupLeftIcon() {
        self.leftView.addSubview(self.leftImageView)
        self.leftImageView.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.height.equalTo(20)
        }
    }

    func setupTextField() {
        self.parentTextField.addSubview(self.textField)
        self.textField.snp.makeConstraints { (maker) in
            maker.leading.equalTo(self.leftView.snp.trailing).offset(12)
            maker.trailing.equalToSuperview().offset(12)
            maker.centerY.equalToSuperview()
        }
    }

    func setupFloatingLabel() {
        self.addSubview(self.floatingLabel)
        self.floatingLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.parentTextField.snp.top).offset(-8)
            maker.leading.equalTo(self.parentTextField.snp.leading)
        }
    }
}
