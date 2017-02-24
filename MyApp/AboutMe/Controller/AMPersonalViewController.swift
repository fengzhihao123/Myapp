//
//  AMPersonalViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/24.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class AMPersonalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
    }
    
    //MARK: attribute
    func setupAttribute() {
        view.backgroundColor = UIColor.white
    }
    
    //MARK: setupUI
    func setupUI() {
        tableView = UITableView().then({ (tableView) in
            tableView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            tableView.delegate = self
            tableView.dataSource = self
        })
        view.addSubview(tableView)
    }

    //MARK: tableview delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    //MARK: tableview datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        tableViewCell.textLabel?.text = "cell"
        return tableViewCell
    }
}
