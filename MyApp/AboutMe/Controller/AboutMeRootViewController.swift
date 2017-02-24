//
//  AboutMeRootViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/16.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class AboutMeRootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    let titleArray = ["123","234","456","567","789","901"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
    }
    
    //MARK:setup Attribute
    func setupAttribute() {
        navigationItem.title = "我的"
        view.backgroundColor = UIColor.white
    }
    
    //MARK: setupUI
    func setupUI() -> Void {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    //MARK: table view delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 100
        }
        return 50
    }
    
    //MARK: table datasource 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
           let tableViewCell = AMHeaderTableViewCell(style: .default, reuseIdentifier: "tableViewCell")
            tableViewCell.userNameLabel.text = "fzh"
            return tableViewCell
        }else {
            let tableViewCell = AMNormalTableViewCell(style: .default, reuseIdentifier: "tableViewCell")
            tableViewCell.titleLabel.text = titleArray[indexPath.row]
            return tableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(AMPersonalViewController(), animated: true)
        }
    }
}
