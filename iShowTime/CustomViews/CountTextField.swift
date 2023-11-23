//
//  CountTextField.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 20/10/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class CountTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setWidth(60)
        setupTextField()
        createDoneButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextField() {
        borderStyle = .none
        keyboardType = .numberPad
        textAlignment = .center
        layer.borderColor = Colors.countButton.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 12
    }
}

extension CountTextField {
    func createDoneButton() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = Colors.countButton
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexSpace, doneButton]
        toolbar.sizeToFit()
        inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() {
        resignFirstResponder()
    }
}
