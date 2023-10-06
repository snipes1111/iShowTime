//
//  SeriesImageView.swift
//  iShowTime
//
//  Created by user on 06/10/2023.
//

import UIKit

class SeriesImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        image = UIImage(named: SearchModuleConstants.stubSeriesPoster)
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
