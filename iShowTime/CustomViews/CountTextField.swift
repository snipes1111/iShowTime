//
//  CountTextField.swift
//  iShowTime
//
//  Created by user on 20/10/2023.
//

import UIKit

class CountTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setWidth(60)
        setupTextfield()
        createDoneButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextfield() {
        borderStyle = .none
        keyboardType = .numberPad
        textAlignment = .center
        layer.borderColor = UIColor.black.withAlphaComponent(0.7).cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 12
    }

    func createDoneButton() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(doneButtonTapped))
        doneButton.tintColor = .black
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexSpace, doneButton]
        toolbar.sizeToFit()
        inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() {
        resignFirstResponder()
    }
}
