//
//  LanguageTableViewCell.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 15.04.2024.
//

import UIKit
import SnapKit
import Localize_Swift

class LanguageTableViewCell: UITableViewCell {
    let languageLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        
        return label
    }()
    lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Check")
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(languageLabel)
        contentView.addSubview(checkImage)
        
        languageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().offset(24)
            make.bottom.equalToSuperview()
        }
        checkImage.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.centerY.equalTo(languageLabel)
            make.size.equalTo(24)
        }
    }
}
