//
//  HomeRootViewController.swift
//  MyApp
//
//  Created by 冯志浩 on 2017/2/22.
//  Copyright © 2017年 FZH. All rights reserved.
//

import UIKit

class HomeRootViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupUI()
    }

    //MARK:Attribute
    func setupAttribute() {
        navigationItem.title = "首页"
        navigationController?.navigationBar.accessibilityIdentifier = "home"
        view.backgroundColor = UIColor.white
        
    }
    
    //MARK: setupUI
    func setupUI() {
        let writeButton = UIBarButtonItem().then { (barButton) in
            barButton.title = "写作"
            barButton.target = self
            barButton.action = #selector(writeButtonDidTouch)
        }
        navigationItem.rightBarButtonItem = writeButton
        
        tableView = UITableView().then({ (tableView) in
            tableView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            tableView.delegate = self
            tableView.dataSource = self
        })
        
    }
    
    //MARK: event
    func writeButtonDidTouch() {
        UserDefaults.standard.removeObject(forKey: "UserToken")
        chooseRootVC()
//        present(HomeWriteViewController(), animated: true, completion: nil)
    }
    
    //MARK: tableView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //MARK: tableView datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell(style: .default, reuseIdentifier: "tableviewcell")
        tableViewCell.textLabel?.text = "tableview"
        return tableViewCell
    }
    
    

}
