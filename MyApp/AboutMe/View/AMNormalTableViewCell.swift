//
//  AMNormalTableViewCell.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/21.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class AMNormalTableViewCell: UITableViewCell {

    let leftImageView = UIImageView()
    let titleLabel = UILabel()
    let arrowImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
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
        leftImageView.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
        leftImageView.backgroundColor = UIColor.green
        addSubview(leftImageView)
        
        titleLabel.frame = CGRect(x: 80, y: 10, width: 200, height: 30)
        addSubview(titleLabel)
        
        arrowImageView.frame = CGRect(x: SCREEN_WIDTH - 50, y: 15, width: 15, height: 20)
        arrowImageView.backgroundColor = UIColor.red
        addSubview(arrowImageView)
    }
    
    

}
