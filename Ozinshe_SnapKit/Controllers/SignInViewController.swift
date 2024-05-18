//
//  SingInViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 04.05.2024.
//

import UIKit
import SnapKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class SignInViewController: UIViewController{
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Сәлем"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        
        return label
    }()
    
    let loginAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Аккаунтқа кіріңіз"
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return label
    }()
    
        let emailLabel: UILabel = {
            let label = UILabel()
            label.text = "Email"
            label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
            label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
            
            return label
        }()
        
        lazy var emailTextField: TextFIeldWithPadding = {
            let textField = TextFIeldWithPadding()
            textField.autocapitalizationType = .none
            textField.placeholder = "Сіздің email"
            textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
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
            textField.font = UIFont(name: "SFProDisplay-Regular", size: 16)
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
        let emailImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "Email")
            
            return image
        }()
        lazy var showPasswordButton: UIButton = {
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
        let forgotPasswordLabel: UILabel = {
            let label = UILabel()
            label.text = "Құпия сөзді ұмыттыңыз ба?"
            label.textColor = UIColor(red: 0.70, green: 0.46, blue: 0.97, alpha: 1.00)
            label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
            label.textAlignment = .right
            
            
            return label
        }()
        let loginButton: UIButton = {
            let button = UIButton()
            button.setTitle("Кіру", for: .normal)
            button.backgroundColor = UIColor(red: 126/255, green: 45/255, blue: 252/255, alpha: 1)
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 12
            button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
            
            return button
        }()
    let createAccLabel: UILabel = {
        let label = UILabel()
        label.text = "Аккаунтыныз жоқ па?"
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        label.textAlignment = .right
        
        
        return label
    }()
    lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Тіркелу", for: .normal)
        button.setTitleColor(UIColor(red: 0.70, green: 0.46, blue: 0.97, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(createPage), for: .touchUpInside)
        
        return button
    }()
    let or: UILabel = {
        let label = UILabel()
        label.text = "Немесе?"
        label.textColor = UIColor(red: 0.42, green: 0.45, blue: 0.50, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textAlignment = .center
        
        return label
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
            emailTextField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
            }

        @objc func editingDidEnd(_ textField: TextFIeldWithPadding) {
            emailTextField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
            }
        @objc func showPassword() {
            passwordTextField.isSecureTextEntry.toggle()
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
            emailTextField.layer.borderColor = emailTextField.isEditing ? UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor : UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.0).cgColor
        }
    
    @objc func createPage() {
        let createPage = CreateAccountViewController()
        navigationController?.show(createPage, sender: self)
    }
    
    @objc func signIn() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
    
        if email.isEmpty || password.isEmpty {
            return
        }
    
    SVProgressHUD.show()
    
    let parameters = ["email": email,
                      "password": password]
    
    AF.request(Urls.SIGN_IN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { response in
        
        SVProgressHUD.dismiss()
        var resultString = ""
        if let data = response.data {
            resultString = String(data: data, encoding: .utf8)!
            print(resultString)
        }
        
        if response.response?.statusCode == 200 {
            let json = JSON(response.data!)
            print("JSON: \(json)")
            
            if let token = json["accessToken"].string {
                Storage.sharedInstance.accessToken = token
                UserDefaults.standard.set(token, forKey: "accessToken")
                self.startApp()
            } else {
                SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localized())
            }
        } else {
            var ErrorString = "CONNECTION_ERROR".localized()
            if let sCode = response.response?.statusCode {
                ErrorString = ErrorString + " \(sCode)"
            }
            ErrorString = ErrorString + " \(resultString)"
            SVProgressHUD.showError(withStatus: "\(ErrorString)")
        }
    }
}
    func startApp(){
        let tabViewController = TabBarController()
        if let window = view.window {
            UIView.transition(with: window, duration: 1.0, options: .transitionFlipFromLeft) {
                window.rootViewController = tabViewController
            }
        }
    }
    //MARK: SetpuUI -
        func setupUI() {
            view.addSubview(welcomeLabel)
            view.addSubview(loginAccountLabel)
            view.addSubview(emailLabel)
            view.addSubview(emailTextField)
            view.addSubview(emailImage)
            view.addSubview(passwordLabel)
            view.addSubview(passwordTextField)
            view.addSubview(showPasswordButton)
            view.addSubview(passwordImage)
            view.addSubview(forgotPasswordLabel)
            view.addSubview(loginButton)
            view.addSubview(createAccLabel)
            view.addSubview(createAccountButton)
            view.addSubview(or)
            loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        }

        // MARK: Constraints -
        func setupConstraints() {
            welcomeLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(124)
                make.horizontalEdges.equalTo(24)
            }
            loginAccountLabel.snp.makeConstraints { make in
                make.top.equalTo(welcomeLabel.snp.bottom)
                make.horizontalEdges.equalTo(24)
            }
            emailLabel.snp.makeConstraints { make in
                make.top.equalTo(loginAccountLabel.snp.bottom).offset(32)
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
                make.height.equalTo(20)
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
                make.height.equalTo(20)
            }
            passwordImage.snp.makeConstraints { make in
                make.left.equalTo(passwordTextField.snp.left).inset(16)
                make.centerY.equalTo(passwordTextField)
                make.height.equalTo(20)
            }
            forgotPasswordLabel.snp.makeConstraints { make in
                make.top.equalTo(passwordTextField.snp.bottom).offset(17)
                make.horizontalEdges.equalToSuperview().inset(24)
            }
            loginButton.snp.makeConstraints { make in
                make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(40)
                make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
                make.height.equalTo(56)
            }
            createAccLabel.snp.makeConstraints { make in
                make.top.equalTo(loginButton.snp.bottom).offset(24)
                make.left.equalToSuperview().offset(24)
                make.right.equalTo(createAccountButton.snp.left)
                make.height.equalTo(22)
                make.width.equalTo(270)
            }
            createAccountButton.snp.makeConstraints { make in
                make.top.equalTo(loginButton.snp.bottom).offset(24)
                make.left.equalTo(createAccLabel.snp.right)
                make.right.equalToSuperview().inset(24)
                make.height.equalTo(22)
                make.width.equalTo(121)
            }
            or.snp.makeConstraints { make in
                make.top.equalTo(createAccLabel.snp.bottom).offset(40)
                make.horizontalEdges.equalToSuperview().inset(24)
                make.height.equalTo(18)
                make.width.equalTo(327)
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

extension SignInViewController: UITextFieldDelegate {
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1.00).cgColor
        }

    internal func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(red: 0.90, green: 0.92, blue: 0.94, alpha: 1.00).cgColor
        }
}

