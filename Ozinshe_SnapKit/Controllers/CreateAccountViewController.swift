//
//  CreateAccountViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 18.05.2024.
//

import UIKit
import SnapKit
import Alamofire

class CreateAccountViewController: UIViewController{
    let account: UILabel = {
        let label = UILabel()
        label.text = "Тіркелу"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)

        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)

        return label
    }()
    let emailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Email")

        return image
    }()
    lazy var emailTextField: TextFIeldWithPadding = {
        let textField = TextFIeldWithPadding()
        textField.autocapitalizationType = .none
        textField.placeholder = "Сіздің email"
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.textContentType = .emailAddress
        textField.textAlignment = .natural
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
        textField.delegate = self
        return textField
    }()

    lazy var passwordTextField: TextFIeldWithPadding = {
        let textField = TextFIeldWithPadding()
        textField.autocapitalizationType = .none
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.textAlignment = .natural
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
        textField.delegate = self
        return textField
    }()


    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөз"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)

        return label
    }()
    lazy var showPasswordButton: UIButton = {
        let button  = UIButton(type: .system)
        button.isSelected = false
        button.setImage(UIImage(named: "Showpassword"), for: .normal)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        button.contentMode = .scaleAspectFill

        return button
    }()

    let passwordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Password")
        image.tintColor = .gray

        return image
    }()
    let confPassImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Password")
        image.tintColor = .gray

        return image
    }()
    let confPassLabel: UILabel = {
        let label = UILabel()
        label.text = "Құпия сөзді қайталаңыз"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        return label
    }()

    lazy var confPassTextField: TextFIeldWithPadding = {
        let textField = TextFIeldWithPadding()
        textField.placeholder = "Сіздің құпия сөзіңіз"
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = 1.0
        textField.textContentType = .password
        textField.textAlignment = .natural
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
        textField.delegate = self
        return textField
    }()
    lazy var showConfPasswordButton: UIButton = {
        let button  = UIButton(type: .system)
        button.isSelected = false
        button.setImage(UIImage(named: "Showpassword"), for: .normal)
        button.addTarget(self, action: #selector(showConfPassword), for: .touchUpInside)
        button.contentMode = .scaleAspectFill

        return button
    }()
    let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
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
    @objc func showPassword() {
        passwordTextField.isSecureTextEntry.toggle()
    }
    @objc func showConfPassword() {
        confPassTextField.isSecureTextEntry.toggle()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        hideKeyboardWhenTappedAround()
    }

    @objc func create() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confPass = confPassTextField.text!

        if email.isEmpty || password.isEmpty || confPass.isEmpty {
            showError(message: "Please fill all fields.")
            return
        }

        let parameters = [
            "email": email,
            "password": password,
            "confirm_Pass": confPass
        ]

        AF.request(
            "https://api.mironovayouragency.com/register",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        )
        .responseDecodable(of: AuthResponse.self) { [weak self] response in
                switch response.result {
                case .success(let authResponse):
                    if let token = authResponse.token {
                        
                        Storage.sharedInstance.accessToken = token
                        self?.startApp()
                    } else {
                        self?.showError(message: authResponse.message ?? "Invalid response format.")
                    }
                case .failure(let error):
                    self?.showError(message: error.localizedDescription)
                }
            }
        }

    func startApp(){
        let tabBarController = TabBarController()
        tabBarController.modalPresentationStyle = .fullScreen
        if let window = view.window {
            UIView.transition(with: window, duration: 1.0, options: .transitionFlipFromRight) {
                window.rootViewController = tabBarController
            }
        }
    }

    func showError(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    func showAlert(title: String) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    //MARK: SetpuUI -
    func setupUI() {
        view.addSubview(account)
        view.addSubview(confPassLabel)
        view.addSubview(confPassTextField)
        view.addSubview(confPassImage)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailImage)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(passwordImage)
        view.addSubview(showConfPasswordButton)
        view.addSubview(createButton)
        createButton.addTarget(self, action: #selector(create), for: .touchUpInside)
    }

    // MARK: Constraints -
    func setupConstraints() {
        account.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(124)
            make.horizontalEdges.equalTo(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(account.snp.bottom).offset(64)
            make.horizontalEdges.equalToSuperview().offset(24)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        emailImage.snp.makeConstraints { make in
            make.left.equalTo(emailTextField.snp.left).inset(16)
            make.centerY.equalTo(emailTextField)
            make.size.equalTo(20)
        }
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(21)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        showPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.right.equalTo(passwordTextField.snp.right).inset(16)
            make.size.equalTo(30)
        }
        passwordImage.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField.snp.left).inset(16)
            make.centerY.equalTo(passwordTextField)
            make.size.equalTo(20)
        }
        confPassLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().offset(24)
        }
        confPassTextField.snp.makeConstraints { make in
            make.top.equalTo(confPassLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        confPassImage.snp.makeConstraints { make in
            make.left.equalTo(confPassTextField.snp.left).inset(16)
            make.centerY.equalTo(confPassTextField)
            make.size.equalTo(20)
        }
        showConfPasswordButton.snp.makeConstraints { make in
            make.centerY.equalTo(confPassTextField)
            make.right.equalTo(confPassTextField.snp.right).inset(16)
            make.size.equalTo(30)
        }
        createButton.snp.makeConstraints { make in
            make.top.equalTo(confPassTextField.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(56)
        }
    }
}

extension CreateAccountViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
    }
}
