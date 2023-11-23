//
//  ShowMoreButton.swift
//  iShowTime
//
//  Created by Mark Kovalchuk on 02/11/2023.
//  Copyright © 2023 Mark Kovalchuk. All rights reserved.
//

import UIKit

final class ShowMoreButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setTitle(Constants.Buttons.showMore, for: .normal)
        titleLabel?.font = Fonts.showMoreButton
        setTitleColor(.black, for: .normal)
        contentHorizontalAlignment = .left
        contentVerticalAlignment = .top
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
