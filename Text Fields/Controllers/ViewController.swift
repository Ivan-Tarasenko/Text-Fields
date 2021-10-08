//
//  ViewController.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 18.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var noDigitsView: CustomView!
    @IBOutlet weak var inputLimitView: CustomView!
    @IBOutlet weak var onlyCharactersView: CustomView!
    @IBOutlet weak var linkView: CustomView!
    @IBOutlet weak var validationRulesView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsView.textField.delegate = self
        inputLimitView.textField.delegate = self
        onlyCharactersView.textField.delegate = self
        linkView.textField.delegate = self
        validationRulesView.textField.delegate = self

        setTitleForView()
        addsTapToScrollview()

    }

    func setTitleForView() {
        noDigitsView.textTitle = "NO Digits field"
        inputLimitView.textTitle = "Input limit"
        onlyCharactersView.textTitle = "Only characters"
        linkView.textTitle = "Link"
        validationRulesView.textTitle = "Validation rules"
    }

    // MARK: - Adds a tap on the scrollview to hide the keyboard outside the textfield
    func addsTapToScrollview() {
        self.view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self.view,
                action: #selector(UIView.endEditing(_:)))
        )
    }
}

extension ViewController: UITextFieldDelegate {

    // MARK: - Perform reverse by button "Return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    // MARK: - Input tracking
    func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.cornerRadius(value: 10, color: UIColor.systemBlue)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    textField.cornerRadius(value: 10, color: UIColor.systemGray6)
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String
    ) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
      }
}
