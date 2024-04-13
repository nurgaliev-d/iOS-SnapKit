//
//  PersonalDataViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 13.04.2024.
//

import UIKit
import SnapKit

class PersonalDataViewController: UIViewController {

    let namePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Сіздің атыңыз"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Айдар"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return label
    }()
    
    let divider = SeparatorView()
    
    let emailPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "ali@gmail.com"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return label
    }()
    
    let divider1 = SeparatorView()
    
    let phonePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Телефон"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "+7 702 732-10-31"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return label
    }()
    
    let divider2 = SeparatorView()
    
    let birthDatePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Туылған күні"
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        
        return label
    }()
    let birthDateLabel: UILabel = {
        let label = UILabel()
        label.text = "19 Қыркүйек 2004"
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1.00)
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return label
    }()
    
    let divider3 = SeparatorView()
    let divider4 = SeparatorView()
    
    let saveChanges: UIButton = {
        let button = UIButton()
        button.setTitle("Өзгерістерді сақтау", for: .normal)
        button.backgroundColor = UIColor(red: 126/255, green: 45/255, blue: 252/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    

    func setupUI() {
        navigationItem.title = "Жеке деректер"
        view.addSubview(divider4)
        view.addSubview(namePlaceHolder)
        view.addSubview(nameLabel)
        view.addSubview(divider)
        view.addSubview(emailPlaceHolder)
        view.addSubview(emailLabel)
        view.addSubview(divider1)
        view.addSubview(phonePlaceHolder)
        view.addSubview(phoneLabel)
        view.addSubview(divider2)
        view.addSubview(birthDatePlaceHolder)
        view.addSubview(birthDateLabel)
        view.addSubview(divider3)
        view.addSubview(saveChanges)
    }
    
    func setupConstraints() {
        
        divider4.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.horizontalEdges.equalToSuperview()
        }
        
        namePlaceHolder.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.horizontalEdges.equalTo(24)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(namePlaceHolder.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(24)
        }
        divider.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        emailPlaceHolder.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(24)
            make.horizontalEdges.equalTo(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(emailPlaceHolder.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(24)
        }
        divider1.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        phonePlaceHolder.snp.makeConstraints { make in
            make.top.equalTo(divider1.snp.bottom).offset(24)
            make.horizontalEdges.equalTo(24)
        }
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(phonePlaceHolder.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(24)
        }
        divider2.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        birthDatePlaceHolder.snp.makeConstraints { make in
            make.top.equalTo(divider2.snp.bottom).offset(24)
            make.horizontalEdges.equalTo(24)
        }
        birthDateLabel.snp.makeConstraints { make in
            make.top.equalTo(birthDatePlaceHolder.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(24)
        }
        divider3.snp.makeConstraints { make in
            make.top.equalTo(birthDateLabel.snp.bottom).offset(12)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
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
