//
//  ScreenTitle.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 10.12.2021.
//

import UIKit
import SnapKit

class ScreenTitle: UILabel {

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = R.font.sfProDisplayBold(size: 34)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    func setTitle() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(142)
            make.left.right.equalToSuperview().inset(16)
        }
    }
}
