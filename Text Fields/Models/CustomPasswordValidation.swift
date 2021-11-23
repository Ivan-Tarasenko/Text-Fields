//
//  CustomPasswordValidation.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 22.11.2021.
//

import UIKit
import SnapKit

class CustomPassValid {

    var minLengthChar = UILabel()
    var minOneDigit = UILabel()
    var minOneLowercase = UILabel()
    var minCapitalRequired = UILabel()

    var progressView = UIProgressView()

    var minLengthCharText = "- Min length 8 characters."
    var minOneDigitText = "- Min 1 digit."
    var minOneLowercaseText = "- Min 1 lowercase."
    var minCapitalRequiredText = "- Min 1 capital required."

    var switchForMinChar: Bool = false {
        didSet {
            if switchForMinChar {
                progressView.progress += 0.25
                minLengthChar.textColor = .systemGreen
                minLengthChar.textTitle =
                minLengthCharText.replacingOccurrences(of: "-", with: "✓")
            } else {
                minLengthChar.textColor = .black
                minLengthChar.textTitle =
                minLengthCharText.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var switchForMinOneDigit: Bool = false {
        didSet {
            if switchForMinOneDigit {
                progressView.progress += 0.25
                minOneDigit.textColor = .systemGreen
                minOneDigit.textTitle =
                minOneDigitText.replacingOccurrences(of: "-", with: "✓")
            } else {
                minOneDigit.textColor = .black
                minOneDigit.textTitle =
                minOneDigitText.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var switchForMinOneLowercase: Bool = false {
        didSet {
            if switchForMinOneLowercase {
                progressView.progress += 0.25
                minOneLowercase.textColor = .systemGreen
                minOneLowercase.textTitle =
                minOneLowercaseText.replacingOccurrences(of: "-", with: "✓")
            } else {
                minOneLowercase.textColor = .black
                minOneLowercase.textTitle =
                minOneLowercaseText.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var switchForMinCapitalRequired: Bool = false {
        didSet {
            if switchForMinCapitalRequired {
                progressView.progress += 0.25
                minCapitalRequired.textColor = .systemGreen
                minCapitalRequired.textTitle =
                minCapitalRequiredText.replacingOccurrences(of: "-", with: "✓")
            } else {
                minCapitalRequired.textColor = .black
                minCapitalRequired.textTitle =
                minCapitalRequiredText.replacingOccurrences(of: "✓", with: "-")
            }
        }
    }

    var showLabelForPasswordValidetion: Bool = true {
        didSet {
            if showLabelForPasswordValidetion {
                minLengthChar.isHidden = true
                minOneDigit.isHidden = true
                minOneLowercase.isHidden = true
                minCapitalRequired.isHidden = true
            } else {
                minLengthChar.isHidden = false
                minOneDigit.isHidden = false
                minOneLowercase.isHidden = false
                minCapitalRequired.isHidden = false
            }
        }
    }

    func setProgressView() {
        progressView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(2)
            maker.right.equalToSuperview().inset(2)
            maker.bottom.equalToSuperview().inset(0)
        }
    }

    func setLabelPasswordValidation () {
        let constraintX = 10
        let constraintY = 22
        let labelFont = UIFont(name: "SF Pro Display Regular", size: 13)

        minLengthChar.font = labelFont
        minLengthChar.textTitle = minLengthCharText
        minLengthChar.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(constraintX)
            make.top.equalToSuperview().inset(85)
        }

        minOneDigit.font = labelFont
        minOneDigit.textTitle = minOneDigitText
        minOneDigit.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(constraintX)
            make.top.equalTo(minLengthChar).inset(constraintY)
        }

        minOneLowercase.font = labelFont
        minOneLowercase.textTitle = minOneLowercaseText
        minOneLowercase.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(constraintX)
            make.top.equalTo(minOneDigit).inset(constraintY)
        }

        minCapitalRequired.font = labelFont
        minCapitalRequired.textTitle = minCapitalRequiredText
        minCapitalRequired.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(constraintX)
            make.top.equalTo(minOneLowercase).inset(constraintY)
        }
    }

    func testValid() {
        
    }
}
