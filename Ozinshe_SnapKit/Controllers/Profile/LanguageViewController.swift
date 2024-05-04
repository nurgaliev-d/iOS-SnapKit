//
//  LanguageViewController.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 15.04.2024.
//

import UIKit
import SnapKit
import Localize_Swift

protocol LanguageProtocol{
    func languageDidChange()
}

class LanguageViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var delegate : LanguageProtocol?
    
    var languageArray = [ ["Қазақша", "kk"], ["English", "en"], ["Русский", "ru"]]
    
    let holdView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.82, green: 0.84, blue: 0.86, alpha: 1.00)
        view.layer.cornerRadius = 2
        
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Тіл"
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.tableFooterView = UIView()
        
        return tableView
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 32
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemFill
        setupUI()
        setupConstraints()
        tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    @objc func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool{
        if (touch.view?.isDescendant(of: tableView))!{
            return false
        }
        else{
            return true}
    }

    
// MARK: Interface setup-
    func setupUI() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        view.addSubview(backgroundView)
        backgroundView.addSubview(tableView)
        backgroundView.addSubview(label)
        backgroundView.addSubview(holdView)
    }
    func setupConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(303)
        }
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(label.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        label.snp.makeConstraints { make in
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
    }
   
    // MARK: TableView-
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LanguageTableViewCell()
        cell.languageLabel.text = languageArray[indexPath.row][0]
        
        if Localize.currentLanguage() == languageArray[indexPath.row][1]{
            cell.checkImage.image = UIImage(named: "Check")
        }else{
            cell.checkImage.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(languageArray[indexPath.row][1])
        delegate?.languageDidChange()
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
    
    
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return languageArray.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            cell.textLabel?.text = languageArray[indexPath.row][0]
//
//            let checkImageView = UIImageView(image: UIImage(named: "Check"))
//            checkImageView.isHidden = Localize.currentLanguage() != languageArray[indexPath.row][1]
//            cell.accessoryView = checkImageView
//
//            return cell
//        }
//
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 65.0
//        }
//
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            Localize.setCurrentLanguage(languageArray[indexPath.row][1])
//            delegate?.languageDidChange()
//            dismiss(animated: true, completion: nil)
//        }
}
