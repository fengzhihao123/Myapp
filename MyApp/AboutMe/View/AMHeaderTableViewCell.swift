//
//  AMHeaderTableViewCell.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/20.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class AMHeaderTableViewCell: UITableViewCell {

    let headerImageView = UIImageView()
    let levelImageView = UIImageView()
    let userNameLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        //取消选中状态
        awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSubViews()
    }
    
    func setupSubViews() {
        headerImageView.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        headerImageView.backgroundColor = UIColor.blue
        addSubview(headerImageView)
        
        let leftMargin = headerImageView.x + headerImageView.width + 10
        userNameLabel.frame = CGRect(x: leftMargin, y: 35, width: SCREEN_WIDTH - leftMargin, height: 0)
        userNameLabel.numberOfLines = 0
        addSubview(userNameLabel)
        
        levelImageView.backgroundColor = UIColor.red
        addSubview(levelImageView)
    }
    
    override func layoutSubviews() {
        userNameLabel.sizeToFit()
        
        let levelLeftMargin = userNameLabel.x + userNameLabel.width + 5
        levelImageView.frame = CGRect(x: levelLeftMargin, y: 35, width: 10, height: 10)
    }

}
