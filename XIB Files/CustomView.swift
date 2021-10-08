//
//  NoDigetsField.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 19.09.2021.
//

import UIKit

class CustomView: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textField: UITextField!

    var textTitle: String {
        get {
            return title.text!
        }
        set(textTitle) {
            title.text = textTitle
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }

    func configureView() {
        guard let view = self.loadViewFromNib(nidName: "CustomView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
}
