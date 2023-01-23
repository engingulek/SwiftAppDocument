//
//  ViewController.swift
//  SnapKitTest
//
//  Created by engin gülek on 8.01.2023.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customView = CustomView()
        customView.floatingText = "User Name"
        customView.placeHolder = "Enter User Name"
        customView.backgroundColor = UIColor.init(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1)
        self.view.addSubview(customView)
        
        customView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(100)
        }
    }


}

