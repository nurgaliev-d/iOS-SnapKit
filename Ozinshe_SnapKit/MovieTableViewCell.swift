//
//  MovieTableViewCell.swift
//  Ozinshe_SnapKit
//
//  Created by Диас Нургалиев on 08.04.2024.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    let posterImageView = {
        let iv = UIImageView()
        
        iv.image = UIImage(named: "preview1")
        iv.layer.cornerRadius = 8.0
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        
        return iv
    }()
    
    let titleLabel = {
        let label = UILabel()
        label.text = "Суперкөлік Самұрық"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        label.textColor = UIColor(red: 0.07, green: 0.09, blue: 0.15, alpha: 1)
        
        return label
    }()
    let subtitleLabel = {
        let label = UILabel()
        label.text = "2020 • Телехикая • Мультфильм"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        label.textColor = UIColor(red: 0.61, green: 0.64, blue: 0.69, alpha: 1)
        
        return label
    }()
    
    let playView = {
        let view = UIView()
        let imageView = UIImageView()
        let label = UILabel()
        
        view.backgroundColor = UIColor(red: 0.97, green: 0.93, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8.0
        view.clipsToBounds = true
        view.addSubview(imageView)
        view.addSubview(label)
        
        imageView.image = UIImage(named: "Play")
        label.text = "Қарау"
        label.textColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 12)
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.verticalEdges.equalToSuperview().inset(5)
            make.size.equalTo(16)
        }
        label.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.left.equalTo(imageView.snp.right).offset(4)
            make.right.equalToSuperview().inset(12)
            
        }
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(playView)
        
        posterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.left.equalToSuperview().inset(24)
            make.height.equalTo(104)
            make.width.equalTo(71)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(posterImageView.snp.right).offset(17)
            make.top.right.equalToSuperview().inset(24)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        playView.snp.makeConstraints { make in
            make.left.equalTo(subtitleLabel)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(24)
        }
    }
}
