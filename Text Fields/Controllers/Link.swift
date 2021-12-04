//
//  Link.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 02.12.2021.
//

import UIKit

class Link: UIViewController {

    @IBOutlet weak var customViewLink: CustomView!
    override func viewDidLoad() {
        super.viewDidLoad()

        customViewLink.settingView(type: .link)
    }
}
