//
//  ChangePasswordViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 13.04.2024.
//

import UIKit
import SnapKit

class ChangePasswordViewController: UIViewController {
// MARK: ELEMENTS -
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    let divider = SeparatorView()
    
    let passwordTextField: TextFIeldWithPadding = {
        let textField = TextFIeldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.textAlignment = .natural
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
        textField.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        
        
        
        return textField
    }()
    
    let rePasswordTextField: TextFIeldWithPadding = {
        let textField = TextFIeldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.textAlignment = .natural
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
        textField.addTarget(self, action: #selector(reEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(reEditingDidEnd), for: .editingDidEnd)
        
        
        
        return textField
    }()
    
    let rePasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайталаңыз"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    
    let showPasswordButton: UIButton = {
        let button  = UIButton(type: .system)
        button.isSelected = false
        button.setImage(UIImage(named: "Showpassword"), for: .normal)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        
        return button
    }()
    
    let passwordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Password")
        
        return image
    }()
    let reShowPasswordButton: UIButton = {
        let button  = UIButton(type: .system)
        button.isSelected = false
        button.setImage(UIImage(named: "Showpassword"), for: .normal)
        button.addTarget(self, action: #selector(reShowPassword), for: .touchUpInside)
        
        return button
    }()
    
    let rePasswordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Password")
        
        return image
    }()
    let saveChanges: UIButton = {
        let button = UIButton()
        button.setTitle("Өзгерістерді сақтау", for: .normal)
        button.backgroundColor = UIColor(red: 126/255, green: 45/255, blue: 252/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return button
    }()
    
    
    // MARK: Functions -
    func hideKeyboardWhenTappedAround(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func editingDidBegin(_ textField: TextFIeldWithPadding) {
        passwordTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        }

    @objc func editingDidEnd(_ textField: TextFIeldWithPadding) {
            passwordTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        }
    @objc func showPassword() {
        passwordTextField.isSecureTextEntry.toggle()
        }
    @objc func reEditingDidBegin(_ textField: TextFIeldWithPadding) {
        rePasswordTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        }

    @objc func reEditingDidEnd(_ textField: TextFIeldWithPadding) {
        rePasswordTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        }
    @objc func reShowPassword() {
        rePasswordTextField.isSecureTextEntry.toggle()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        passwordTextField.layer.borderColor = passwordTextField.isEditing ? UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor : UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
    }
    func setupUI() {
        navigationItem.title = "Құпия сөзді өзгерту"
        view.addSubview(passwordLabel)
        view.addSubview(divider)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(passwordImage)
        view.addSubview(rePasswordLabel)
        view.addSubview(rePasswordTextField)
        view.addSubview(reShowPasswordButton)
        view.addSubview(rePasswordImage)
        view.addSubview(saveChanges)
    }

    // MARK: Constraints -
    func setupConstraints() {
        divider.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.horizontalEdges.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(divider).offset(21)
            make.horizontalEdges.equalToSuperview().offset(24)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField.snp.right).inset(16)
            make.height.equalTo(20)
        }
        passwordImage.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField.snp.left).inset(16)
            make.centerY.equalTo(passwordTextField)
            make.height.equalTo(20)
        }
        rePasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(21)
        }
        rePasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(rePasswordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        reShowPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(rePasswordTextField)
            make.right.equalTo(rePasswordTextField.snp.right).inset(16)
            make.height.equalTo(20)
        }
        rePasswordImage.snp.makeConstraints { make in
            make.left.equalTo(rePasswordTextField.snp.left).inset(16)
            make.centerY.equalTo(rePasswordTextField)
            make.height.equalTo(20)
        }
        saveChanges.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(56)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
