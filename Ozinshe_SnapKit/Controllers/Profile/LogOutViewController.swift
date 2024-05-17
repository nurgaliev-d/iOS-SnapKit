//
//  LogOutViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 15.04.2024.
//

import UIKit
import SnapKit

class LogOutViewController: UIViewController, UIGestureRecognizerDelegate {
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Жоқ", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 0.33, green: 0.08, blue: 0.78, alpha: 1.00), for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return button
    }()
    let exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Иә, шығу", for: .normal)
        button.backgroundColor = UIColor(red: 126/255, green: 45/255, blue: 252/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return button
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 32
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    let holdView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1.00)
        view.layer.cornerRadius = 2
        
        return view
    }()
    
    let exitLabel: UILabel = {
        let label = UILabel()
        label.text = "Шығу"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        
        return label
    }()
    let areYouSureLabel: UILabel = {
        let label = UILabel()
        label.text = "Сіз шынымен аккаунтыныздан"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        
        return label
    }()
    
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemFill
        setupUI()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    
    func setupUI() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(exitLabel)
        backgroundView.addSubview(holdView)
        backgroundView.addSubview(areYouSureLabel)
        backgroundView.addSubview(exitButton)
        backgroundView.addSubview(cancelButton)
        
        exitButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
        @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.backgroundView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 100 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.backgroundView.transform = .identity
                })
            }else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func logout(_ sender: Any) {
            UserDefaults.standard.removeObject(forKey: "accessToken")
            let rootVC = SignInViewController()
            let navigationVC = UINavigationController(rootViewController: rootVC)
        if let window = view.window {
            UIView.transition(with: window, duration: 1.0, options: .transitionFlipFromLeft) {
                window.rootViewController = navigationVC
            }
        }
    }
    @objc func cancel(_ sender: Any) {
        dismissView()
    }
    //MARK: Constraints -
    func setupConstraints() {
            backgroundView.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview()
                make.bottom.equalToSuperview()
                make.height.equalTo(303)
            }
        exitLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.horizontalEdges.equalToSuperview().offset(24)
            make.height.equalTo(29)
        }
        holdView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(21)
            make.height.equalTo(5)
            make.width.equalTo(64)
        }
        areYouSureLabel.snp.makeConstraints { make in
            make.top.equalTo(exitLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(areYouSureLabel.snp.bottom).offset(32)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(56)
        }
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(exitButton.snp.bottom).offset(8)
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
