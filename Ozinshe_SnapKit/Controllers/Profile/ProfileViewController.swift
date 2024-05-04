//
//  ProfileViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 08.04.2024.
//

import UIKit
import SnapKit
import Localize_Swift

class ProfileViewController: UIViewController, LanguageProtocol {

    let divider4 = SeparatorView()
    let settingVIew = UIView()
    let image = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let divider = SeparatorView()
    let data = UIButton()
    let changePassword = UIButton()
    let divider1 = SeparatorView()
    let language = UIButton()
    let divider2 = SeparatorView()
    let notifications = UIButton()
    let divider3 = SeparatorView()
    let darkMode = UIButton()
    let dataArrow = Arrow(frame: CGRect())
    let passwordArrow = Arrow(frame: CGRect())
    let languageArrow = Arrow(frame: CGRect())
    let notificationSwitch = UISwitch()
    let darkModeSwitch = UISwitch()
    let dataLabel = UILabel()
    let languageLabel = UILabel()
    let logOutButton:UIButton = {
        let logout = UIButton()
        logout.setImage(UIImage(named: "logout"), for: .normal)
        logout.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        
        return logout
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        setupElem()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViews()
    }
    func setupElem() {
        
        image.image = UIImage(named: "Avatar")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        settingVIew.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        
        nameLabel.text = "Менің профилім"
        nameLabel.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        nameLabel.textAlignment = .center
        
        emailLabel.text = "ali@gmail.com"
        emailLabel.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        emailLabel.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        emailLabel.textAlignment = .center
        
        data.setTitleColor(UIColor(red: 0.11, green: 0.14, blue: 0.19, alpha: 1.00), for: .normal)
        data.setTitle("Жеке деректер", for: .normal)
        data.contentHorizontalAlignment = .leading
        data.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        changePassword.setTitleColor(UIColor(red: 0.11, green: 0.14, blue: 0.19, alpha: 1.00), for: .normal)
        changePassword.setTitle("Құпия сөзді өзгерту", for: .normal)
        changePassword.contentHorizontalAlignment = .leading
        changePassword.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        language.setTitleColor(UIColor(red: 0.11, green: 0.14, blue: 0.19, alpha: 1.00), for: .normal)
        language.setTitle("Тіл", for: .normal)
        language.contentHorizontalAlignment = .leading
        language.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        notifications.setTitleColor(UIColor(red: 0.11, green: 0.14, blue: 0.19, alpha: 1.00), for: .normal)
        notifications.setTitle("Хабарландырулар", for: .normal)
        notifications.contentHorizontalAlignment = .leading
        notifications.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        darkMode.setTitleColor(UIColor(red: 0.11, green: 0.14, blue: 0.19, alpha: 1.00), for: .normal)
        darkMode.setTitle("Қараңғы режим", for: .normal)
        darkMode.contentHorizontalAlignment = .leading
        darkMode.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
//        notificationSwitch.isOn = false
//        darkModeSwitch.isOn = false
        
        dataLabel.text = "Өңдеу"
        dataLabel.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        dataLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        
        languageLabel.text = "Қазақша"
        languageLabel.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        languageLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
    }
    
    func setupUI() {
        self.navigationItem.title = "Профиль"
        view.addSubview(divider4)
        view.addSubview(settingVIew)
        view.addSubview(image)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(logOutButton)
        settingVIew.addSubview(data)
        settingVIew.addSubview(divider)
        settingVIew.addSubview(changePassword)
        settingVIew.addSubview(divider1)
        settingVIew.addSubview(language)
        settingVIew.addSubview(divider2)
        settingVIew.addSubview(notifications)
        settingVIew.addSubview(divider3)
        settingVIew.addSubview(darkMode)
        settingVIew.addSubview(dataArrow)
        settingVIew.addSubview(passwordArrow)
        settingVIew.addSubview(languageArrow)
        settingVIew.addSubview(notificationSwitch)
        settingVIew.addSubview(darkModeSwitch)
        settingVIew.addSubview(dataLabel)
        settingVIew.addSubview(languageLabel)
        
        darkModeSwitch.addTarget(self, action: #selector(updateInterfaceStyle), for: .valueChanged)
        data.addTarget(self, action: #selector(goToPersonalData), for: .touchUpInside)
        changePassword.addTarget(self, action: #selector(changePasswordPage), for: .touchUpInside)
        language.addTarget(self, action: #selector(goToLanguagePage), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    }
    
    func configureViews(){
        nameLabel.text = "MY_PROFILE".localized()
        data.setTitle("INFO".localized(), for: .normal)
        dataLabel.text = "EDIT".localized()
        changePassword.setTitle("PASSWORD".localized(), for: .normal)
        darkMode.setTitle("SWITCH".localized(), for: .normal)
        language.setTitle("LANGUAGE".localized(), for: .normal)
        
        if Localize.currentLanguage() == "en"{
            languageLabel.text = "English"
        }
        if Localize.currentLanguage() == "kk"{
            languageLabel.text = "Қазақша"
        }
        if Localize.currentLanguage() == "ru"{
            languageLabel.text = "Русский"
        }
    }
    
    
    func languageDidChange() {
        configureViews()
    }
    @objc func logOut() {
       let onboardingVC = OnboardingViewController()
        navigationController?.show(onboardingVC, sender: self)
    }
    
    @objc func goToLanguagePage() {
        let languageVC = LanguageViewController()
        languageVC.modalPresentationStyle = .overFullScreen
        languageVC.delegate = self
        present(languageVC, animated: true, completion: nil)
    }
    
    @objc func goToPersonalData() {
        let personalDataVC = PersonalDataViewController()
        navigationController?.show(personalDataVC, sender: self)
    }
    
    @objc func changePasswordPage() {
        let changePasswordVC = ChangePasswordViewController()
        navigationController?.show(changePasswordVC, sender: self)
    }
    func setupConstraints() {
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(divider4.snp.top).offset(-8)
            make.right.equalToSuperview().inset(24)
        }
        
        divider4.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.horizontalEdges.equalToSuperview()
        }
        image.snp.makeConstraints { make in
            make.size.equalTo(104)
            make.top.equalToSuperview().inset(135)
            make.centerX.equalToSuperview()
        }
        
        settingVIew.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(29)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(22)
        }
        divider.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(data.snp.bottom).offset(0)
            
        }
        data.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(64)
            make.horizontalEdges.equalTo(24)
        }
        dataLabel.snp.makeConstraints { make in
            make.centerY.equalTo(data)
            make.right.equalTo(dataArrow.snp.left).offset(0)
        }
        dataArrow.snp.makeConstraints { make in
            make.centerY.equalTo(data)
            make.right.equalToSuperview().inset(24)
        }
        changePassword.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(0)
            make.height.equalTo(64)
            make.horizontalEdges.equalTo(24)
        }
        passwordArrow.snp.makeConstraints { make in
            make.centerY.equalTo(changePassword)
            make.right.equalToSuperview().inset(24)
        }
        divider1.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(changePassword.snp.bottom).offset(0)
        }
        language.snp.makeConstraints { make in
            make.top.equalTo(divider1.snp.bottom).offset(0)
            make.height.equalTo(64)
            make.horizontalEdges.equalTo(24)
        }
        languageLabel.snp.makeConstraints { make in
            make.centerY.equalTo(language)
            make.right.equalTo(languageArrow.snp.left).offset(0)
        }
        languageArrow.snp.makeConstraints { make in
            make.centerY.equalTo(language)
            make.right.equalToSuperview().inset(24)
        }
        divider2.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(language.snp.bottom).offset(0)
        }
        notifications.snp.makeConstraints { make in
            make.top.equalTo(divider2.snp.bottom).offset(0)
            make.height.equalTo(64)
            make.horizontalEdges.equalTo(24)
        }
        notificationSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(notifications)
            make.right.equalToSuperview().inset(24)
        }
        divider3.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(24)
            make.top.equalTo(notifications.snp.bottom).offset(0)
        }
        darkMode.snp.makeConstraints { make in
            make.top.equalTo(divider3.snp.bottom).offset(0)
            make.height.equalTo(64)
            make.horizontalEdges.equalTo(24)
        }
        darkModeSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(darkMode)
            make.right.equalToSuperview().inset(24)
        }
    }
    
    @objc private func updateInterfaceStyle() {
        view.window?.overrideUserInterfaceStyle = darkModeSwitch.isOn ? .dark : .light
        settingVIew.backgroundColor = darkModeSwitch.isOn ? .black : UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    }

    
}


class SeparatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
       
        backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1.00)
        self.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
}

class Arrow: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        image = UIImage(named: "arrow")
        contentMode = .scaleAspectFill
        snp.makeConstraints { make in
            make.size.equalTo(16)
        }
    }
}

