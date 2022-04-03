//
//  UIView+NibLoading.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 23.09.2021.
//

import UIKit

extension UIView {

    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
