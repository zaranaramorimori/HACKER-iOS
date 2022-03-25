//
//  SettingTableViewCell.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/25.
//

import UIKit

import SnapKit
import Then

class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    
    // MARK: - UI
    var backgroundImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "blackBox")
    }
        
    var titleLabel = UILabel().then {
        $0.textColor = .hackerWhite
        $0.font = .subtitleMedium16
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        addSubviews([backgroundImage,
                     titleLabel])
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundImage.snp.centerY)
            make.leading.equalToSuperview().inset(18)
        }
    }
}
