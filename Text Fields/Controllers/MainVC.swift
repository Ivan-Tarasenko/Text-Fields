//
//  MainVC.swift
//  Text Fields
//
//  Created by Иван Тарасенко on 18.09.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var noDigitsView: CustomView!
    @IBOutlet weak var inputLimitView: CustomView!
    @IBOutlet weak var onlyCharactersView: CustomView!
    @IBOutlet weak var linkView: CustomView!
    @IBOutlet weak var validationRulesView: CustomView!

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var goTabBar: UIButton!

    //    let changeLanguage = ChangeLanguage()
    let localString = Localization()
    let customPassValid = CustomPassValid()
    let titleView = TitleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        noDigitsView.settingView(type: .noDigits)
        inputLimitView.settingView(type: .inputLimit)
        onlyCharactersView.settingView(type: .onlyCharacters)
        linkView.settingView(type: .link)
        validationRulesView.settingView(type: .validationRules)
        //        settingChangeLanguage()
        createAccesibilityIdentifiersMainVC()
        setTitle()
    }

    func setTitle() {
        titleView.title.textTitle = localString.titleLabelAll
        mainView.addSubview(titleView.title)
        titleView.title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(31)
            make.right.left.equalToSuperview().inset(16)
        }
//        titleView.setTitle()
    }
    //    func settingChangeLanguage() {
    //        let constraintX = 50
    //        view.addSubview(changeLanguage.englishButton)
    //        view.addSubview(changeLanguage.russianButton)
    //        view.addSubview(changeLanguage.spanishButton)
    //        view.addSubview(changeLanguage.ukrainianButton)
    //        view.addSubview(changeLanguage.chineseButton)
    //
    //        changeLanguage.englishButton.snp.makeConstraints { make in
    //            make.top.equalTo(validationRulesView).inset(170)
    //            make.left.equalToSuperview().inset(constraintX)
    //        }
    //        changeLanguage.russianButton.snp.makeConstraints { make in
    //            make.top.equalTo(validationRulesView).inset(170)
    //            make.left.equalTo(changeLanguage.englishButton).inset(constraintX)
    //        }
    //        changeLanguage.spanishButton.snp.makeConstraints { make in
    //            make.top.equalTo(validationRulesView).inset(170)
    //            make.left.equalTo(changeLanguage.russianButton).inset(constraintX)
    //        }
    //        changeLanguage.ukrainianButton.snp.makeConstraints { make in
    //            make.top.equalTo(validationRulesView).inset(170)
    //            make.left.equalTo(changeLanguage.spanishButton).inset(constraintX)
    //        }
    //        changeLanguage.chineseButton.snp.makeConstraints { make in
    //            make.top.equalTo(validationRulesView).inset(170)
    //            make.left.equalTo(changeLanguage.ukrainianButton).inset(constraintX)
    //        }
    //    }
    //
    //    // Restart button view.
    //    @IBAction func resetVC(_ sender: Any) {
    //        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "vc1") as! ViewController
    //        let appDlg = UIApplication.shared.delegate as? AppDelegate
    //        appDlg?.window?.rootViewController = vc1
    //        print("push reset")
    //    }
}
