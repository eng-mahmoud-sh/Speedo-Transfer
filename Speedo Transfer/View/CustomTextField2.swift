//
//  CustomTextField2.swift
//  Speedo Transfer
//

import Foundation
import UIKit

class CustomTextField2: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(named: "TextFieldBorderColor")?.cgColor
        self.layer.backgroundColor = UIColor(named: "backGroundtxtField")?.cgColor
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
    }
}
