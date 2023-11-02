//
//  ShowMoreButton.swift
//  iShowTime
//
//  Created by user on 02/11/2023.
//

import UIKit

class ShowMoreButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setTitle("Show more ...", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        setTitleColor(.black, for: .normal)
        contentHorizontalAlignment = .left
        contentVerticalAlignment = .top
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
